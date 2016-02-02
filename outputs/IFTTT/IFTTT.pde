//Use with IFTTT to trigger events
//See https://ifttt.com/maker for more info
// Paste your tigger URL below in mouseClicked() 

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
   String lines[] = loadStrings("https://maker.ifttt.com/trigger/YOUR_URL_INFO_HERE");
   println("there are " + lines.length + " lines");
   for (int i = 0 ; i < lines.length; i++) {
      println(lines[i]);
    }
}