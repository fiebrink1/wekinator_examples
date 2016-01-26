// Created by Rebecca Fiebrink 2015


public class Example {
   int x;
   float y;
   int a;
   int r = 0, g=255, b=0;
   boolean isTesting;
   
   public Example(int x, float y, boolean isTesting) {
      this.x = x;
      this.y = y;
      this.isTesting = isTesting;
      
      a = (isTesting ? 150 : 255);
      
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
