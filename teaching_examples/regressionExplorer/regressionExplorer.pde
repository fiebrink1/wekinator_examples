// Created by Rebecca Fiebrink 2015

import controlP5.*;
import oscP5.*;
import netP5.*;
import java.util.List;
import java.util.Collections;
import java.util.Iterator;

OscP5 oscP5;
NetAddress dest;
WekinatorProxy wp;

String errMsg = "";

//Recording training examples, or generating test examples?
boolean isRecording = true;

//For drawing modeled curve:
boolean isWaitingSingle = false;
boolean readyForNextDecisionLine = false;
int lastSingleX = 0;
int lastSingleY = 0;
int spacing = 5;
int lastYLine = 0;
boolean isDrawingBoundaries = false;

//fast/accurate drawing
boolean isFast = true;

PFont f, f2;
ControlP5 cp5;

int wekinatorReceivePort = 6448;
int processingReceivePort = 12000;
   
int areaTopX = 140;
int areaTopY = 50;
int areaWidth = 450;
int areaHeight = 280;
int vertGap = 10;
int testHeight = 40;

List<Example> trainingExamples = Collections.synchronizedList(new ArrayList<Example>());
List<Example> testExamples = Collections.synchronizedList(new ArrayList<Example>());

void setup() {
  size(600, 400);
  background(0);
  
  //Create the font
  f = createFont("Courier", 16);
  textFont(f);
  textAlign(LEFT, TOP);
  f2 = createFont("Courier", 12);

  //Set up OSC for communication to/from Wekinator
  oscP5 = new OscP5(this,processingReceivePort);
  dest = new NetAddress("127.0.0.1",wekinatorReceivePort);
  wp = new WekinatorProxy(oscP5);
  
  createControls();
  updateButtonVisibility(true);
}

void draw() {
   background(0); 
   smooth();
   drawText();

   if (! isRecording){
     drawTestExamples();
   }
   drawTrainingExamples();
   drawClassifierArea();
  drawTestingArea();

   //Drawing line?
    if (isDrawingBoundaries && !isFast) {
       getNextBoundaryTester(); 
    }
}

void createControls() {
  cp5 = new ControlP5(this);
  
  cp5.addToggle("isRecording")
     .setPosition(10,20)
     .setSize(75,20)
     .setValue(true)
     .setCaptionLabel("record/run")
     .setMode(ControlP5.SWITCH)
     ;
  
   cp5.addButton("buttonClearTrain")
     .setValue(0)
     .setCaptionLabel("Clear training examples")
     .setPosition(10,90)
     .setSize(120,19)
     ;
     
    cp5.addButton("buttonTrain")
     .setValue(0)
     .setCaptionLabel("Train on these examples")
     .setPosition(10,60)
     .setSize(120,19)
     ;
     
   cp5.addButton("buttonClearTest")
     .setValue(0)
     .setCaptionLabel("Clear test examples")
     .setPosition(10,150)
     .setSize(120,19)
     ;
     
   cp5.addButton("drawDecision")
     .setBroadcast(false)
     .setValue(0)
     .setCaptionLabel("Draw regression line")
     .setPosition(10,120)
     .setSize(120,19)
     .setBroadcast(true)
     ;
    
}

void drawText() {
  fill(255);

if (isRecording) {
    text("Recording (Run with 1 input, 1 continuous output)", 90, 20);
  } else {
    text("Testing", 90, 20); 
    textFont(f2);
    text("Click here to make", 10, height - 50);
    text("      test points:", 10, height - 35);

  }
  
  textFont(f2);
  text("Current position:", 10, height-120);
  textFont(f);
  if (inTestBounds(mouseX, mouseY)) {
    text("Input=" + mouseX, 10, height-100);
    text(errMsg, 20, height-30);
  } else {
    text("Input=" + mouseX + "\nOutput=" + mouseY, 10, height-100);
    text(errMsg, 20, height-30);
  }
  
}

void drawClassifierArea() {
  stroke(255);
  noFill();
  rect(areaTopX, areaTopY, areaWidth, areaHeight, 7);
}

void drawTestingArea() {
  stroke(255);
  noFill();
  rect(areaTopX, areaTopY + areaHeight + vertGap, areaWidth, testHeight, 7);
}

void mouseClicked() {
  if (isDrawingBoundaries) {
    return;
  }
  if (isRecording && inBounds(mouseX, mouseY)) {
    createTrainingExample(mouseX, mouseY);
  } else if (!isRecording && inTestBounds(mouseX, mouseY)) {
    wp.startRunning();
    sendSingleExample(mouseX);
  } /*else {
    println("Outside bounds");
  } */
}

void keyPressed() {
  int keyIndex = -1;
  if (key == 'x' || key == 'X') {
    isWaitingSingle = false;
    errMsg = "";
  }
}

boolean inBounds(int x, int y) {
 if (x < areaTopX || y < areaTopY) {
    return false;
 }
 if (x > areaTopX + areaWidth || y > areaTopY + areaHeight) {
    return false;
 } 
 return true;
}

boolean inTestBounds(int x, int y) {
  if (x < areaTopX || y < areaTopY + areaHeight + vertGap) {
    return false;
   }
  if (x > areaTopX + areaWidth || y > areaTopY + areaHeight + vertGap + testHeight) {
    return false;
  } 
  return true;
  
}

void drawTestExamples() {
   synchronized(testExamples) {
    Iterator<Example> iterator = testExamples.iterator();
      while (iterator.hasNext()) {
        iterator.next().draw();
      }
   }
}


void drawTrainingExamples() {
  synchronized(trainingExamples) {
    Iterator<Example> iterator = trainingExamples.iterator();
      while (iterator.hasNext()) {
        iterator.next().draw();
      }
   }
}


void buttonClearTest() {
   testExamples.clear();
}

void buttonClearTrain() {
   wp.deleteTraining();
   trainingExamples.clear();
}

void sendSingleExample(int x) {
    if (! isWaitingSingle) {
      isWaitingSingle = true;
      lastSingleX = x;
      OscMessage msg = new OscMessage("/wek/inputs");
      msg.add((float)x); 
      oscP5.send(msg, dest);  
    } else {
      println("Error; Tried to send new message but haven't received last response yet");
      errMsg = "Communication error with Wekinator; type X to reset";

    }
}

void createTrainingExample(int x, int y) {
   wp.startRecording();
   wp.setOutput(y);
   trainingExamples.add(new Example(x, y, false));
   wp.sendInputs(x);
}


void addTestExample(int x, float y) {
  testExamples.add(new Example(x, y, true)); //for display
}
  
void oscEvent(OscMessage theOscMessage) {
 // synchronized(locking) {
  float f = getOutputValue(theOscMessage); 

  if (isWaitingSingle) {
         addTestExample(lastSingleX, f);
         isWaitingSingle = false;
         
         if (isDrawingBoundaries && isFast) {
           getNextBoundaryTester();
         }
    } else {
      //This does get called, due to some duplicate OSC messages
      
     // println("RECEIVED BUT NOT WAITING");
    }  
  //} 
}

public float getOutputValue(OscMessage theOscMessage) {
      return wp.getOutputValue(theOscMessage);
} 

void drawDecision() {
    isWaitingSingle = false;
    errMsg = "";
    isDrawingBoundaries = true;
    wp.startRunning();
    sendSingleExample(areaTopX);
}

void getNextBoundaryTester() {
   int nextX = lastSingleX + spacing;
   if (nextX > areaTopX + areaWidth) {
       isDrawingBoundaries = false;
   } else {
     sendSingleExample(nextX);
   }
}

void buttonTrain() {
      isWaitingSingle = false;
    errMsg = "";
   wp.train(); 
}

void updateButtonVisibility(boolean rec) {
  if (rec) {
    try {
      cp5.getController("drawDecision").setVisible(false);
      cp5.getController("buttonClearTest").setVisible(false);
      cp5.getController("buttonClearTrain").setVisible(true);
     // cp5.getController("buttonTrain").setVisible(true);
    } catch (Exception ex) {
    }
  } else {
    try {
      cp5.getController("drawDecision").setVisible(true);
      cp5.getController("buttonClearTest").setVisible(true);
      cp5.getController("buttonClearTrain").setVisible(false);
      //cp5.getController("buttonTrain").setVisible(false);
    } catch (Exception ex) {
    }
  }
}

void isRecording(boolean rValue) {
  isWaitingSingle = false;
  errMsg = "";
  isRecording = rValue;
  updateButtonVisibility(rValue);
}