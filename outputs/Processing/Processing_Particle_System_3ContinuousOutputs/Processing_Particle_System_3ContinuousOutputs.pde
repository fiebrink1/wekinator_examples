// Adapted from example Exercise 4.10 in
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
// Released under LGPL 2.1 license: http://creativecommons.org/licenses/LGPL/2.1/
// Modified by Rebecca Fiebrink to accept control data from Wekinator
// Receives 3 continuous (regression) values, in range 0-1
// Listens on port 12000

// Array of Images for particle textures

ParticleSystem ps;

PImage[] imgs;

float p1 = 0.5;
float p2 = 0.5;
float p3 = 0.5;

//Necessary for OSC communication with Wekinator:
import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress dest;

void setup() {
  size(640, 360, P2D);
  
    //Initialize OSC communication
  oscP5 = new OscP5(this,12000); //listen for OSC messages on port 12000 (Wekinator default)
  dest = new NetAddress("127.0.0.1",6448); //send messages back to Wekinator on port 6448, localhost (this machine) (default)
  

  imgs = new PImage[5];
  imgs[0] = loadImage("corona.png");
  imgs[1] = loadImage("emitter.png");
  imgs[2] = loadImage("particle.png");
  imgs[3] = loadImage("texture.png");
  imgs[4] = loadImage("reflection.png");

  ps = new ParticleSystem(imgs, new PVector(width/2, 50));
}

void draw() {

  // Additive blending!
  blendMode(ADD);

  background(0);
  
  //PVector up = new PVector(0,-0.2);
  
  PVector up = new PVector(0, -0.5 * (p3-0.5));
  
  ps.applyForce(up);
  
  ps.run();
  for (int i = 0; i < 5; i++) {
    //ps.addParticle(mouseX,mouseY);
    ps.addParticle(p1 * width, p2 * height);
    
  }
  
  fill(0, 255, 0);
  text( "Use 3 continuous Wekinator outputs between 0 and 1", 5, 15 );
  text( "Listening for /wek/outputs on port 12000", 5, 30 );

}

//This is called automatically when OSC message is received
void oscEvent(OscMessage theOscMessage) {
 if (theOscMessage.checkAddrPattern("/wek/outputs")==true) {
     if(theOscMessage.checkTypetag("fff")) { //Now looking for 2 parameters
        p1 = theOscMessage.get(0).floatValue(); //get this parameter
        p2 = theOscMessage.get(1).floatValue(); //get 2nd parameter
        p3 = theOscMessage.get(2).floatValue(); //get third parameters
        println("Received new params value from Wekinator");  
      } else {
        println("Error: unexpected params type tag received by Processing");
      }
 }
}
