import processing.net.*;

Client c;
String data;
String myserver = "maker.ifttt.com";

void setup() {
   size(200, 200);
   background(50);
   fill(200);
}

void draw() { 
} 

void mouseClicked() {
   println("HI");
   String lines[] = loadStrings("https://maker.ifttt.com/trigger/wekinator1/with/key/cEFbkp_LMv6kHzszA0VRg3");
   println("there are " + lines.length + " lines");
   for (int i = 0 ; i < lines.length; i++) {
      println(lines[i]);
    }
}
