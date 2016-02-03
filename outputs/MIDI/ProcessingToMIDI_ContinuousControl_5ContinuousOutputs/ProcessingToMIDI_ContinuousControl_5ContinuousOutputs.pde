//Receives 5 continuous outputs from Wekinator: continuous control value messages for control numbers 0-4, on channel 1
//Sends these on as MIDI messages

import themidibus.*;
import oscP5.*;
import netP5.*;

int channel = 1; //You may want to change this!

OscP5 oscP5;
NetAddress dest;

PFont f, f2;

float alpha = 255;


MidiBus myBus; 
int[] myVals = new int[5];

void setup() {
  
  
  oscP5 = new OscP5(this,12000); //listen for OSC messages on port 12000 (Wekinator default)
  dest = new NetAddress("127.0.0.1",6448); //send messages back to Wekinator on port 6448, localhost (this machine) (default)
  
  //Create the font
  f2 = createFont("Arial", 10);
  f = createFont("Courier", 16);
  textFont(f);
  textAlign(LEFT, TOP);
  
  size(220, 200);
  background(0);

  MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.

  // Either you can
  //                   Parent In Out
  //                     |    |  |
  //myBus = new MidiBus(this, 0, 1); // Create a new MidiBus using the device index to select the Midi input and output devices respectively.

  // or you can ...
  //                   Parent         In                   Out
  //                     |            |                     |
  //myBus = new MidiBus(this, "IncomingDeviceName", "OutgoingDeviceName"); // Create a new MidiBus using the device names to select the Midi input and output devices respectively.

  // or for testing you could ...
  //                 Parent  In        Out
  //                   |     |          |
  myBus = new MidiBus(this, -1, 1); // Create a new MidiBus with no input device and the default Java Sound Synthesizer as the output device.
  
   frameRate(10);
}



void draw() {
  background(0);  
  drawText();
  drawCircle();
}

void drawText() {
  fill(255);
  textFont(f2);
  text("Receiving 5 continuous OSC values:", 10, 10);
  text("Control values for control# 0-5, channel 1", 10, 22);
  text("Listening for /wek/outputs on 12000", 10, 34);
  text("Sending control chg to default MIDI device:", 10, 140);
  text("Control: ", 10, 160);
  text("Value:", 10, 175);
  for (int i= 0; i < myVals.length; i++) {
     text("" + i + ":", 10+30*i+70, 160);
     text(myVals[i], 10+30*i+70, 175); 
  }

  textFont(f);
  text("Sending MIDI:", 10, 110);
}

void sendValue(int number, int value) {
    myBus.sendControllerChange(channel, number, value);
}

//This is called automatically when OSC message is received
void oscEvent(OscMessage theOscMessage) {
 if (theOscMessage.checkAddrPattern("/wek/outputs")==true) {
     if(theOscMessage.checkTypetag("fffff")) { //Now looking for 5 parameters
        myVals[0] = (int)theOscMessage.get(0).floatValue(); //get this parameter
        myVals[1] = (int)theOscMessage.get(1).floatValue(); //get this parameter
        myVals[2] = (int)theOscMessage.get(2).floatValue(); //get this parameter
        myVals[3] = (int)theOscMessage.get(3).floatValue(); //get this parameter
        myVals[4] = (int)theOscMessage.get(4).floatValue(); //get this parameter

        for (int i= 0; i < myVals.length; i++)  {
           if (myVals[i] < 0) {
             myVals[i] = 0;
           } else if (myVals[i] > 127) {
             myVals[i] = 127;
           }
           sendValue(i, myVals[i]);
        }

        alpha = 255;
        
      } else {
        println("Error: unexpected params type tag received by Processing");
      }
    }
}

void drawCircle() {
    alpha = 0.9 * alpha;
     fill(0, 255, 0, alpha);
    ellipse(150, 120, 25, 25); 
}
