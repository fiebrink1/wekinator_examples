// Created by Rebecca Fiebrink 2015


public class Example {
   int x, y;
   int r, g, b, a;
   boolean isTesting;
   
   public Example(int x, int y, int c, boolean isTesting) {
      this.x = x;
      this.y = y;
      this.isTesting = isTesting;
      
      a = (isTesting ? 130 : 255);
      
     //Set color according to class
     if (c == 1) {
       r = 255;
       g = 0;
       b = 0;
     } else if (c == 2) {
       r = 0;
       g = 164;
       b = 255;
     } else if (c == 3) {
       r = 0;
       g = 232;
       b = 124;
     } else if (c ==4) {
       r = 232;
       g = 224;
       b = 0;
     } else if (c ==5) {
       r= 232;
       g = 0;
       b= 200;
     } else if (c ==6) {
       r= 37;
       g= 3;
       b=  232;
     } else if (c ==7) {
       r = 255;
       g = 148;
       b = 3;
     } else if (c ==8) {
       r = 255;
       g = 255;
       b = 255;
     } else {
       r = 235;
       g = 255;
       b = 136;
     } 
   }
   
   public void draw() {
       noStroke();
       fill(r,g,b,a);
       if (isTesting) {
         ellipse(x, y, 5, 5);
       } else {
         ellipse(x, y, 10, 10);

       }
   }
}