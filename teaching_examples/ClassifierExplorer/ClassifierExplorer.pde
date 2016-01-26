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
int currentClass = 1; //Class of any new training examples

//For synchronization:
Integer locking = new Integer(4);

//For drawing decision boundaries:
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
int areaHeight = 340;

List<Example> trainingExamples = Collections.synchronizedList(new ArrayList<Example>());
List<Example> testExamples = Collections.synchronizedList(new ArrayList<Example>());

void setup() {
  size(600, 400, P3D);
  background(0);
  ellipseMode(CENTER);
  
  //Create the font
  f = createFont("Courier", 16);
  textFont(f);
  f2 = createFont("Courier", 12);
  textAlign(LEFT, TOP);

  //Set up OSC for communication to/from Wekinator
  oscP5 = new OscP5(this,processingReceivePort);
  dest = new NetAddress("127.0.0.1",wekinatorReceivePort);
  wp = new WekinatorProxy(oscP5);
  
  createControls();
  updateButtonVisibility(true);
  frameRate(120);
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


   //Drawing decision boundaries?
   //Draw one line of test points at a time to minimize accumulation of errors
   if (readyForNextDecisionLine && !isWaitingSingle) {
      drawDecision();
    } else if (isDrawingBoundaries && !isFast) {
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
     .setCaptionLabel("Draw decision boundaries")
     .setPosition(10,120)
     .setSize(120,19)
     .setBroadcast(true)
     ;
    
}

void drawText() {
  fill(255);

  textFont(f2);

  if (isRecording) {
    text("Recording w/ class=" + currentClass, 140, 15);
    text("(Press number key to change)", 140, 28);
  } else {
    text("Testing", 140, 20);    
  }
  
  textFont(f2);
  text("Run with 2 inputs,", 430, 15);
  text("1 classifier output", 430, 28);
  
  
  text("Current position:", 10, height-100);
  textFont(f);
  text("(" + mouseX + "," + mouseY + ")", 10, height-80);
  text(errMsg, 20, height-30);
  
}

void drawClassifierArea() {
  stroke(255);
  noFill();
  rect(areaTopX, areaTopY, areaWidth, areaHeight, 7);
}

void mouseClicked() {
  if (isDrawingBoundaries || !inBounds(mouseX, mouseY)) {
    return;
  }
  if (isRecording) {
    createTrainingExample(mouseX, mouseY, currentClass);
  } else {
    wp.startRunning();
    sendSingleExample(mouseX, mouseY);
  }
}

void keyPressed() {
  int keyIndex = -1;
  if (key >= '1' && key <= '9') {
    currentClass = key - '1' + 1;
  } else if (key == 'x' || key == 'X') {
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
   lastYLine = 0;
}

void buttonClearTrain() {
   wp.deleteTraining();
   trainingExamples.clear();
   lastYLine = 0;
}

void sendSingleExample(int x, int y) {
  synchronized(locking) {
    if (! isWaitingSingle) {
      isWaitingSingle = true;
      lastSingleX = x;
      lastSingleY = y;
      OscMessage msg = new OscMessage("/wek/inputs");
      msg.add((float)x); 
      msg.add((float)y);
      oscP5.send(msg, dest);  
    } else {
      println("Error; Tried to send new message but haven't received last response yet");
      errMsg = "Communication error with Wekinator; type X to reset";
    }
  }
}

void createTrainingExample(int x, int y, int c) {
   wp.startRecording();
   wp.setClass(c);
   trainingExamples.add(new Example(x, y, c, false));
   wp.sendInputs(x, y);
}


void addTestExample(int x, int y, int c) {
  testExamples.add(new Example(x, y, c, true)); //for display
}
  
void oscEvent(OscMessage theOscMessage) {
 synchronized(locking) {
  int c = getClassValue(theOscMessage); 

  if (isWaitingSingle) {
         addTestExample(lastSingleX, lastSingleY, c);
         isWaitingSingle = false;
         //println("Received: " + lastSingleX + "," + lastSingleY + ": " + c);
         if (isDrawingBoundaries && isFast) {
           getNextBoundaryTester();
         }
    } else {
      //This does get called, due to some duplicate OSC messages
      
      println("RECEIVED BUT NOT WAITING: " + c);
    }  
 } 
}

public int getClassValue(OscMessage theOscMessage) {
      return wp.getClassValue(theOscMessage);
} 

void drawDecision() {
      isWaitingSingle = false;
      errMsg = "";
  
    //println("DRAWING DECISION");
    readyForNextDecisionLine = false;
    lastYLine += spacing;
    isDrawingBoundaries = true;
    wp.startRunning();
    sendSingleExample(areaTopX, areaTopY+lastYLine);
}

void getNextBoundaryTester() {
   int nextX = lastSingleX + spacing;
   if (nextX > areaTopX + areaWidth) {
     if (lastSingleY >= areaTopY + areaHeight) {
       isDrawingBoundaries = false;
     } else {
          readyForNextDecisionLine = true;
     }
   } else {
     sendSingleExample(nextX, lastSingleY);
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
     // cp5.getController("buttonTrain").setVisible(false);
    } catch (Exception ex) {
    }
  }
}

void isRecording(boolean rValue) {
  isWaitingSingle = false;
  errMsg = "";
  isRecording = rValue;
  if (rValue) {
     isDrawingBoundaries = false; 
  }
  updateButtonVisibility(rValue);
}
