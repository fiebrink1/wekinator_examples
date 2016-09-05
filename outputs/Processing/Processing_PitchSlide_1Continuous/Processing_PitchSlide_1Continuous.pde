// This demo changes the pitch of the sound played and the screen color
// Works with 1 continuous output, range 0-1 for octave C4-C5
// Rebecca Fiebrink, 2016

//Necessary for OSC communication with Wekinator:
import oscP5.*;
import netP5.*;
import ddf.minim.*;
import ddf.minim.ugens.*;
OscP5 oscP5;
NetAddress dest;

//No need to edit:
PFont myFont, myBigFont;
int frameNum = 0;
int currentHue = 100;
int currentTextHue = 255;
String currentMessage = "Waiting...";

//For sound:
Minim       minim;
AudioOutput out;
Oscil       wave;

void setup() {
  size(400,400, P3D);
  colorMode(HSB);
  smooth();
  
  //Set up sound:
  minim = new Minim(this);
  out = minim.getLineOut();
  wave = new Oscil( 440, 0.5f, Waves.SINE );
  wave.setAmplitude(0.0);
  // patch the Oscil to the output
  wave.patch( out );
  
  //Initialize OSC communication
  oscP5 = new OscP5(this,12000); //listen for OSC messages on port 12000 (Wekinator default)
  dest = new NetAddress("127.0.0.1",6448); //send messages back to Wekinator on port 6448, localhost (this machine) (default)
  
  //Set up fonts
  myFont = createFont("Arial", 14);
  myBigFont = createFont("Arial", 60);
}

void draw() {
  frameRate(30);
  background(currentHue, 255, 255);
  drawText();
}

//This is called automatically when OSC message is received
void oscEvent(OscMessage theOscMessage) {
 //println("received message");
  if (theOscMessage.checkAddrPattern("/wek/outputs") == true) {
    if(theOscMessage.checkTypetag("f")) {
      float f = theOscMessage.get(0).floatValue();
      println("received1");
      showMessage(f);
    }
  }
  
}

void showMessage(float i) {
    currentHue = (int)(i * 255);
    currentTextHue = currentHue + 128;
    if (currentTextHue > 255) {
      currentTextHue -= 255;
    }
    currentMessage = Float.toString(i);
   
    wave.setFrequency(Frequency.ofMidiNote(60 + 12*i).asHz());

    wave.setAmplitude(0.5);

}

//Write instructions to screen.
void drawText() {
    stroke(0);
    textFont(myFont);
    textAlign(LEFT, TOP); 
    fill(currentTextHue, 255, 255);

    text("Receives 1 continuous output message from wekinator", 10, 10);
    text("Listening for OSC message /wek/outputs, port 12000", 10, 30);
    
    textFont(myBigFont);
    text(currentMessage, 190, 180);
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