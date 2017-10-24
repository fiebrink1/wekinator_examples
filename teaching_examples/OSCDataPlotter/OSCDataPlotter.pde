// Code by Rebecca Fiebrink, 24 October 2017
// Please share only with attribution
// Plots incoming OSC data
// Adapts to number of channels and scale of each channel
// By default this listens on port 6448 but you can change that below

//Necessary for OSC communication with Wekinator:
import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress dest;

//Number of datapoints per row to display: You may want to adjust this
int pointsPerRow = 100;

//Vertical gap between plots
int vertGap = 10;

//Store a list of all plot rows, and adapt size according to incoming OSC messages
ArrayList<Plot> plots = new ArrayList<Plot>(1);

void setup()  {
  size(600, 400);
  
  //Initialize OSC communication
  oscP5 = new OscP5(this,6448); //listen for OSC messages on port 6448 (Wekinator output default)
  dest = new NetAddress("127.0.0.1",9000); //This line doesn't matter (we're not sending any OSC)

  //Create a single plot for starters
  Plot p = new Plot(width-20, height-20, pointsPerRow, 10, 10);
  plots.add(p);
}

void draw() {
  stroke(0);
  background(255);
  
  //Synchronized keeps us from changing and reading the ArrayList at the same time in separate threads
  synchronized(this) {
    for (Plot p : plots) {
      p.plotPoints();
    }
  }
}

//This is called automatically when OSC message is received
void oscEvent(OscMessage theOscMessage) {
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
    int totalPlotHeight = height / plots.size();
    int num = 0;
    synchronized(this) {
      for (Plot p : plots) {
       p.resize(width - 10, totalPlotHeight-vertGap, 0, num*totalPlotHeight);
       num++;
      }
    }
}