//This demo allows wekinator to control x, y, size, hue, and rotation of an object
//All are continuous values between 0 and 1

//Necessary for OSC communication with Wekinator:
import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress dest;

//Parameters of sketch
float myX, myY, mySize, myHue, myRot;
PFont myFont;

void setup() {
  //Initialize OSC communication
  oscP5 = new OscP5(this,12000); //listen for OSC messages on port 12000 (Wekinator default)
  dest = new NetAddress("127.0.0.1",6448); //send messages back to Wekinator on port 6448, localhost (this machine) (default)
  
  colorMode(HSB);
  size(400,400, P3D);
  smooth();
  background(255);

  //Initialize appearance
  myX = 200;
  myY = 200;
  mySize = 50;
  myHue = 255;
  myRot = 0;
  sendOscNames();
  myFont = createFont("Arial", 14);
}

void draw() {
  background(0);
  noStroke();
  fill(myHue, 255, 255);
  pushMatrix();
  translate(myX+mySize/2,myY+mySize/2);
  rotate(myRot);
  rect(-mySize/2, -mySize/2, mySize, mySize);
  popMatrix();
  drawtext();
}


//Update x, y position according to mouse click, send new parameters to wekinator
/*void mouseClicked() {
  myX= (float) mouseX;
  myY = (float) mouseY;
  sendOsc();
} */

//This is called automatically when OSC message is received
void oscEvent(OscMessage theOscMessage) {
 if (theOscMessage.checkAddrPattern("/wek/outputs")==true) {
     if(theOscMessage.checkTypetag("fffff")) { // looking for 5 parameters
        float receivedX = theOscMessage.get(0).floatValue();
        float receivedY = theOscMessage.get(1).floatValue();
        float receivedSize = theOscMessage.get(2).floatValue();
        float receivedHue = theOscMessage.get(3).floatValue();
        float receivedRot = theOscMessage.get(4).floatValue();
        myX = map(receivedX, 0, 1, -mySize/2, width-mySize/2);
        myY = map(receivedY, 0, 1, -mySize/2, height-mySize/2);
        mySize = map(receivedSize, 0, 1, 0, 400);
        myHue = map(receivedHue, 0, 1, 0, 255);
        myRot = map(receivedRot, 0, 1, 0, TWO_PI); 
        
       // println("Received new output values from Wekinator");  
      } else {
        println("Error: unexpected OSC message received by Processing: ");
        theOscMessage.print();
      }
 }
}

//Sends current parameter (hue) to Wekinator
void sendOscNames() {
  OscMessage msg = new OscMessage("/wekinator/control/setOutputNames");
  msg.add("X"); //Now send all 5 names
  msg.add("Y");
  msg.add("Size");
  msg.add("Hue");
  msg.add("Rotation");
  oscP5.send(msg, dest);
}

//Write instructions to screen.
void drawtext() {
    stroke(0);
    textFont(myFont);
    textAlign(LEFT, TOP); 
    fill(0, 0, 255);

    text("5 continuous parameters, all in range 0 to 1:", 10, 10);
    text("   x, y, size, hue, rotation" , 10, 25);
}

