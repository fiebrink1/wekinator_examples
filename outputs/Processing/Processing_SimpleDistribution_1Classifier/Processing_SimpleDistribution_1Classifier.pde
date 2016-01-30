//This demo shows probability distribution coming from Wekinator
// Works with 1 output 
// Set number of classes below (default 5) and osc message name (default /outputs-1)

//Necessary for OSC communication with Wekinator:
import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress dest;

//TODO: SET THESE VALUES!
int numClasses = 5;
String messageName = "/outputs-1";
String typeTag = "f"; 

//no need to edit below:
float[] dist = new float[numClasses];

PFont myFont;
final int myHeight = 400;
final int myWidth = 400;
int frameNum = 0;

void setup() {
  //typeTag = "ffffff";
  String t = "f";
  for (int i = 0; i < numClasses; i++) {
     t = t + "f";
  } 
  typeTag = t;
  
  
  //Initialize OSC communication
  oscP5 = new OscP5(this,12000); //listen for OSC messages on port 12000 (Wekinator default)
  dest = new NetAddress("127.0.0.1",6448); //send messages back to Wekinator on port 6448, localhost (this machine) (default)
  
  colorMode(HSB);
  size(myWidth,myHeight, P3D);
  smooth();
  background(255);
  
 /* String typeTag = "f";
  for (int i = 0; i < numClasses; i++) {
    typeTag += "f";
  } */
  myFont = createFont("Arial", 14);
}

void draw() {
  frameRate(30);
  background(0);
  drawText();
  drawDist();

}

//This is called automatically when OSC message is received
void oscEvent(OscMessage theOscMessage) {
 // println("received message");
 if (theOscMessage.checkAddrPattern("/outputs-1")==true) {
     if(theOscMessage.checkTypetag(typeTag)) { // looking for numClasses values
        for (int i = 0; i < numClasses; i++) {
           dist[i] = theOscMessage.get(i+1).floatValue(); 
        }
      } else {
        println("Error: unexpected OSC message received by Processing: ");
        theOscMessage.print();
      }
 }
}


//Write instructions to screen.
void drawText() {
    stroke(0);
    textFont(myFont);
    textAlign(LEFT, TOP); 
    fill(0, 0, 255);

    text("Receives probability distribution from Wekinator", 10, 10);
   // String s= 
   text("Listening for " + numClasses + " classes, OSC message " + messageName, 10, 30);
   text("(Edit code to change)", 10, 50); 
}

void drawDist() {
  int rectWidth = myWidth / numClasses;
  for (int i = 0 ; i < numClasses; i++) {
   println("dist[i] for i=" + i + "," + dist[i]);
     float thisHeight = map(dist[i], 0, 1, 0, (myHeight - 40));
     stroke(0, 255, 255);
     fill(255, 255, 255);
     rect(rectWidth * (i), myHeight-thisHeight, rectWidth, thisHeight);

  }
   
}

