//Receives 2 continuous outputs from Wekinator: pitch (0-127) and velocity (0-127)
//Sends these on as MIDI messages

import themidibus.*;
import oscP5.*;
import netP5.*;
import controlP5.*;

OscP5 oscP5;
NetAddress dest;

ControlP5 cp5;
PFont f, f2;

float alpha = 255;
int lastNote = 0;
boolean isNotSnapToScale = true;
int[] notesInOctave = new int[] {0, 2, 4, 5, 7, 9, 11}; //Choose your notes here if snapping to note

MidiBus myBus; 

void setup() {
  
  
  oscP5 = new OscP5(this,12000); //listen for OSC messages on port 12000 (Wekinator default)
  dest = new NetAddress("127.0.0.1",6448); //send messages back to Wekinator on port 6448, localhost (this machine) (default)
  
  //Create the font
  f2 = createFont("Arial", 10);
  f = createFont("Courier", 16);
  textFont(f);
  textAlign(LEFT, TOP);
  
  size(200, 200);
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
  
   createControls();
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
  text("Receiving 2 continuous OSC values:", 10, 10);
  text("Pitch (0-127), Velocity (0-127)", 10, 22);
  text("Listening for /wek/outputs on 12000", 10, 34);
  text("Sending noteOn to default MIDI device", 10, 150);

  textFont(f);
  text("Sending MIDI:", 10, 110);
}

void createControls() {
  cp5 = new ControlP5(this);
  
  cp5.addToggle("isNotSnapToScale")
     .setPosition(10,70)
     .setSize(75,20)
     .setValue(true)
     .setCaptionLabel("Snap to scale?")
     .setMode(ControlP5.SWITCH)
     ;
}

void sendNote(int pitch, int velocity) {
  if (velocity > 0) {
    myBus.sendNoteOff(0, lastNote, velocity); //turn off last note!
    lastNote = pitch;
    myBus.sendNoteOn(0, pitch, velocity); // Send a Midi noteOn
  } else {
    myBus.sendNoteOff(0, pitch, velocity);
  }
}

void noteOn(int channel, int pitch, int velocity) {
 
}

void noteOff(int channel, int pitch, int velocity) {

}

void controllerChange(int channel, int number, int value) {

}

void delay(int time) {
  int current = millis();
  while (millis () < current+time) Thread.yield();
}

//This is called automatically when OSC message is received
void oscEvent(OscMessage theOscMessage) {
 if (theOscMessage.checkAddrPattern("/wek/outputs")==true) {
     if(theOscMessage.checkTypetag("ff")) { //Now looking for 2 parameters
        float pitch = theOscMessage.get(0).floatValue(); //get this parameter
        float velocity = theOscMessage.get(1).floatValue(); //get 2nd parameter

         if (pitch < 0 ) {
           pitch = 0;
         } else if (pitch > 127) {
           pitch = 127;
         }
         
         if (velocity < 0) {
            velocity = 0;
         } else if (velocity > 127) {
            velocity = 127;
         } 

        sendNote(snapToScale(pitch), (int)velocity);
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

int snapToScale(float p) {
  if (!isNotSnapToScale) {
   int numOct = ((int)p)/12;
   float noteInOctave = p - 12 * numOct;
   float whereInOctave = noteInOctave / 12; //[0, 1)
   int noteIndex = (int)(whereInOctave * (notesInOctave.length));
   
   return numOct * 12 + notesInOctave[noteIndex];
  } else {
    return (int)p;
  }
}
