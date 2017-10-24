//Simple plotting class by Rebecca Fiebrink, 24 October 2017
// Please share only with attribution

import java.util.LinkedList;

class Plot {
   //The points to plot
   protected LinkedList<Float> points;
   
   //Determines how plot is shown on screen
   protected int pHeight = 100;
   protected int totalWidth = 200;
   protected int labelWidth = 50;
   protected int plotWidth = totalWidth - labelWidth;
   protected int numPointsToPlot = 100;
   protected int x = 0;
   protected int y = 0;
   protected float min = 0.0001;
   protected float max = 0.; 
   protected double horizontalScale = 1;
   
   //Store string versions of axis labels so we don't have to recompute each frame
   String sMin = "0.0001";
   String sMax = "0.0";
   
   //Store last point so we can draw lines between subsequent points
   float lastPointX;
   float lastPointY;

   //Constructor
   public Plot(int plotWidth, int plotHeight, int numPoints, int x, int y) {
      this.pHeight = plotHeight;
      this.totalWidth = plotWidth;
      this.plotWidth = totalWidth - labelWidth;
      this.numPointsToPlot = numPoints;
      this.x = x;
      this.y = y;
      points = new LinkedList<Float>();
   }
   
   //Resize plot after it's been created
   public void resize(int newWidth, int newHeight, int newX, int newY) {
     this.pHeight = newHeight;
      this.totalWidth = newWidth;
      this.plotWidth = totalWidth - labelWidth;
      this.x = newX;
      this.y = newY;  
      rescale();
   }  
   
   //Add a new point to the data series we're plotting
   public void addPoint(float p) {
     if (points.size() == 0) {
       min = p - 0.0001;
       max = p + 0.0001;
       rescale();
     }
     
     if (p < min) {
       min = p;
       rescale();
     }
     if (p > max) {
       max = p;
       rescale();
     }
     
     //Use synchronized so we don't read from and edit linkedlist simultaneously
     synchronized(this) {
       points.add(p);
       while (points.size() > numPointsToPlot) {
         points.removeFirst();
       }
     }
   }
   
   //Plots the current set of points for the chosen graph position and size
   public void plotPoints() {
     //Plot area
     stroke(153);
     fill(255);
     rect(x + labelWidth, y, plotWidth, pHeight);
     
     //Plot labels
     putLabels();
     
     //Data points
     stroke(255, 0, 0);
     int n = 0;
     synchronized(this) {
       for (Float f : points) {
         float thisX = labelWidth + (float)(n * horizontalScale) + x;
         n++;
         float thisY = y + pHeight - ((f - min)/(max - min)) * pHeight;
       
         if (n == 1) {
           //It's the first point
           lastPointX = (float)thisX;
           lastPointY = (float)thisY;
         } else {
           //Draw a line from the last point to this point
           line(lastPointX, lastPointY, thisX, thisY);
           lastPointX = thisX;
           lastPointY = thisY;
         }
       }
     }
   }
   
   //Draw axis bounds
   protected void putLabels() {
     fill(0);
     textSize(8);
     textAlign(RIGHT);
     text(sMin, x + labelWidth, y + pHeight); 
     text(sMax, x + labelWidth, y + 10);
   }
   
   //Call when min, max, width, or number of points to plot changes
   protected void rescale() {
     horizontalScale = (double)plotWidth/numPointsToPlot;
     sMin = Float.toString(min);
     sMax = Float.toString(max);
   }
}