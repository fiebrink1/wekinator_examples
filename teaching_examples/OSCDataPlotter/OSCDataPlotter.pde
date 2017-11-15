// Code by Rebecca Fiebrink, updated 15 November 2017
// Please share only with attribution
// Plots incoming OSC data
// Adapts to number of channels and scale of each channel
// Optionally also sends the received OSC messages on to another port.
// By default this listens on port 6448 and sends to port 6449, but you can change that below
// You will need to add the oscP5 and controlP5 libraries to Processing if you haven't already


//For the GUI elements
import controlP5.*;

//Necessary for OSC communication with Wekinator:
import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress dest;

//******Change the following variables to alter OSC and drawing behaviour: **********//

int receiveDataOnOSCPort = 6448; 
//If you want to use this to monitor features usually sento to Wekinator, receiveDataOnOSCPort should be 6448
//Or, if you want to use this to monitor output from Wekinator, receiveDataOnOSCPort should be 12000

boolean sendReceivedFeaturesToAnotherPort = true; //True if you want to forward on your features somewhere else (e.g., to Wekinator)
int sendReceivedDataToPort = 6449; // Port to forward messages to

//Number of datapoints per row to display: You may want to adjust this
int pointsPerRow = 100;


//******Probably no need to edit below this line **********//

//Gap at top of screen
int topGap = 30;

//Vertical gap between plots
int vertGap = 10;

//Store a list of all plot rows, and adapt size according to incoming OSC messages
ArrayList<Plot> plots = new ArrayList<Plot>(1);

//GUI:
ControlP5 cp5;

//Pause:
boolean isPaused = false;

void setup()  {
  size(600, 400);
  
  //Initialize OSC communication
  oscP5 = new OscP5(this,receiveDataOnOSCPort); //listen for incoming OSC messages
  dest = new NetAddress("127.0.0.1",sendReceivedDataToPort); //Set up sender to send to desired port

  //Add toggle for sending OSC data out
  cp5 = new ControlP5(this);
  cp5.addToggle("sendReceivedFeaturesToAnotherPort")
     .setPosition(385,10)
     .setSize(15,15)
     .setValue(true)
     .setLabel("")
     .setColorActive( color(0, 255, 0)) 
     ;
     
   cp5.addToggle("isPaused")
     .setPosition(210,10)
     .setSize(15,15)
     .setValue(false)
     .setLabel("")
     .setColorActive( color(255, 0, 0)) 
     ;

  //Create a single plot for starters
  Plot p = new Plot(width-20, height-topGap - 10, pointsPerRow, 10, topGap);
  plots.add(p);
}

void draw() {
  stroke(0);
  background(255);
  writeText();
  
  //Synchronized keeps us from changing and reading the ArrayList at the same time in separate threads
  synchronized(this) {
    for (Plot p : plots) {
      p.plotPoints();
    }
  }
}

//This is called automatically when OSC message is received
void oscEvent(OscMessage theOscMessage) {
     
     if (sendReceivedFeaturesToAnotherPort) {
       resendOsc(theOscMessage);
     }
     
     if (isPaused) {
       return;
     }
  
     Object[] arguments = theOscMessage.arguments();
     
     //Has our number of data channels changed? If so, add/remove plots.
     while (arguments.length < plots.size()) {
       synchronized(this) {
         plots.remove(plots.size()-1);
       }
       resizePlots();
     }
     while (arguments.length > plots.size()) {
       Plot p = new Plot(100, 200, 100, 10, 10);
       synchronized(this) {
       plots.add(p);
       }
       resizePlots();
     }

    //Grab the data and store it in the appropriate plot for each channel
     for (int i = 0; i < arguments.length; i++) {
       float nextFloat = theOscMessage.get(i).floatValue();
       plots.get(i).addPoint(nextFloat); 
     }

}

void resizePlots() {
    int totalPlotHeight = (height - topGap) / plots.size();
    int num = 0;
    synchronized(this) {
      for (Plot p : plots) {
       p.resize(width - 10, totalPlotHeight-vertGap, 0, topGap + num*totalPlotHeight);
       num++;
      }
    }
}

//Resends OSC message elsewhere
void resendOsc(OscMessage theMessage) {
  OscMessage msg = new OscMessage(theMessage.addrPattern(), theMessage.arguments());
  oscP5.send(msg, dest);
}

void writeText() {
  fill(0);
  textSize(10);
  textAlign(RIGHT);
  text("RE-SEND OSC:", 380, 20);
  text("PAUSE:", 205, 20);
  
  textAlign(LEFT);
  text("Receiving OSC on port " + receiveDataOnOSCPort, 20, 20);
  if (sendReceivedFeaturesToAnotherPort) {
       text("re-sending to port " + sendReceivedDataToPort, 410, 20);

  }
}