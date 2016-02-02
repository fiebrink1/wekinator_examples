//This demo triggers a text display with each new message
// Works with DTW
//Set number of DTW gestures and their namesBelow

//Necessary for OSC communication with Wekinator:
import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress dest;

//TODO: SET THESE VALUES!
String[] messageNames = {"/output_1", "/output_2", "/outputs_3", "/outputs_4", "/outputs_5"}; //message names for each DTW gesture type

//No need to edit:
PFont myFont, myBigFont;
final int myHeight = 400;
final int myWidth = 400;
int frameNum = 0;
int[] hues;
int[] textHues;
int numClasses;
int currentHue = 100;
int currentTextHue = 255;
String currentMessage = "Waiting...";

void setup() {
  colorMode(HSB);
  size(myWidth,myHeight, P3D);
  smooth();
  numClasses = messageNames.length;
  hues = new int[numClasses];
  textHues = new int[numClasses];
  for (int i = 0; i < numClasses; i++) {
     hues[i] = (int)generateColor(i); 
     textHues[i] = (int)generateColor(i+1);
  }
  
  
  //Initialize OSC communication
  oscP5 = new OscP5(this,12000); //listen for OSC messages on port 12000 (Wekinator default)
  dest = new NetAddress("127.0.0.1",6448); //send messages back to Wekinator on port 6448, localhost (this machine) (default)
    
  String typeTag = "f";
  for (int i = 1; i < numClasses; i++) {
    typeTag += "f";
  }
  //myFont = loadFont("SansSerif-14.vlw");
  myFont = createFont("Arial", 14);
  myBigFont = createFont("Arial", 60);
  println("*******");
}

void draw() {
  frameRate(30);
  background(currentHue, 255, 255);
  drawText();
}

//This is called automatically when OSC message is received
void oscEvent(OscMessage theOscMessage) {
 //println("received message");
 for (int i = 0; i < numClasses; i++) {
    if (theOscMessage.checkAddrPattern(messageNames[i]) == true) {
       showMessage(i);
    }
 }
}

void showMessage(int i) {
    currentHue = hues[i];
    currentTextHue = textHues[i];
    currentMessage = messageNames[i];
}

//Write instructions to screen.
void drawText() {
    stroke(0);
    textFont(myFont);
    textAlign(LEFT, TOP); 
    fill(currentTextHue, 255, 255);

    text("Receives DTW messages from wekinator on port 12000", 10, 10);
    text("Listening for " + numClasses + " DTW triggers:", 10, 30);
    for (int i= 0; i < messageNames.length; i++) {
       text("     " + messageNames[i], 10, 47+17*i); 
    }
    
    textFont(myBigFont);
    text(currentMessage, 20, 180);
}


float generateColor(int which) {
  float f = 100; 
  int i = which;
  if (i <= 0) {
     return 100;
  } 
  else {
     return (generateColor(which-1) + 1.61*255) %255; 
  }
}
