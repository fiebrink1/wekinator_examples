//adapted from https://github.com/nok/leap-motion-processing/blob/master/examples/e1_basic/e1_basic.pde
//Sends 15 features ((x,y,z) tip of each finger) to Wekinator
// sends to port 6448 using /wek/inputs message

import de.voidplus.leapmotion.*;

import oscP5.*;
import netP5.*;

int num=0;
OscP5 oscP5;
NetAddress dest;
LeapMotion leap;
int numFound = 0;

float[] features = new float[15];

void setup() {
  size(800, 500, OPENGL);
  background(255);
  // ...

  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,9000);
  dest = new NetAddress("127.0.0.1",6448);

  leap = new LeapMotion(this);
  sendInputNames();
  
}

void draw() {
  background(255);
  // ...
  int fps = leap.getFrameRate();


  // ========= HANDS =========
numFound = 0;
  for (Hand hand : leap.getHands ()) {
      numFound++;

    // ----- BASICS -----

    int     hand_id          = hand.getId();
    PVector hand_position    = hand.getPosition();
    PVector hand_stabilized  = hand.getStabilizedPosition();
    PVector hand_direction   = hand.getDirection();
    PVector hand_dynamics    = hand.getDynamics();
    float   hand_roll        = hand.getRoll();
    float   hand_pitch       = hand.getPitch();
    float   hand_yaw         = hand.getYaw();
    boolean hand_is_left     = hand.isLeft();
    boolean hand_is_right    = hand.isRight();
    float   hand_grab        = hand.getGrabStrength();
    float   hand_pinch       = hand.getPinchStrength();
    float   hand_time        = hand.getTimeVisible();
    PVector sphere_position  = hand.getSpherePosition();
    float   sphere_radius    = hand.getSphereRadius();


    // ----- SPECIFIC FINGER -----

    Finger  finger_thumb     = hand.getThumb();
    // or                      hand.getFinger("thumb");
    // or                      hand.getFinger(0);

    Finger  finger_index     = hand.getIndexFinger();
    // or                      hand.getFinger("index");
    // or                      hand.getFinger(1);

    Finger  finger_middle    = hand.getMiddleFinger();
    // or                      hand.getFinger("middle");
    // or                      hand.getFinger(2);

    Finger  finger_ring      = hand.getRingFinger();
    // or                      hand.getFinger("ring");
    // or                      hand.getFinger(3);

    Finger  finger_pink      = hand.getPinkyFinger();
    // or                      hand.getFinger("pinky");
    // or                      hand.getFinger(4);        


    // ----- DRAWING -----

    hand.draw();
    // hand.drawSphere();


    // ========= ARM =========

    if (hand.hasArm()) {
      Arm     arm               = hand.getArm();
      float   arm_width         = arm.getWidth();
      PVector arm_wrist_pos     = arm.getWristPosition();
      PVector arm_elbow_pos     = arm.getElbowPosition();
    }


    // ========= FINGERS =========

    for (Finger finger : hand.getFingers()) {
      // Alternatives:
      // hand.getOutstrechtedFingers();
      // hand.getOutstrechtedFingersByAngle();

      // ----- BASICS -----

      int     finger_id         = finger.getId();
      PVector finger_position   = finger.getPosition();
      PVector finger_stabilized = finger.getStabilizedPosition();
      PVector finger_velocity   = finger.getVelocity();
      PVector finger_direction  = finger.getDirection();
      float   finger_time       = finger.getTimeVisible();


      // ----- SPECIFIC FINGER -----

      switch(finger.getType()) {
      case 0:
        // System.out.println("thumb");
        PVector pos = finger.getPosition();
        features[0] = pos.x;
        features[1] = pos.y;
        features[2] = pos.z;
        
        break;
      case 1:
        // System.out.println("index");
                pos = finger.getPosition();
        features[3] = pos.x;
        features[4] = pos.y;
        features[5] = pos.z;
        break;
      case 2:
        // System.out.println("middle");
                pos = finger.getPosition();
        features[6] = pos.x;
        features[7] = pos.y;
        features[8] = pos.z;
        break;
      case 3:
        // System.out.println("ring");
         pos = finger.getPosition();
        features[9] = pos.x;
        features[10] = pos.y;
        features[11] = pos.z;
        break;
      case 4:
        // System.out.println("pinky");
         pos = finger.getPosition();
        features[12] = pos.x;
        features[13] = pos.y;
        features[14] = pos.z;
        break;
      }


      // ----- SPECIFIC BONE -----

      Bone    bone_distal       = finger.getDistalBone();
      // or                       finger.get("distal");
      // or                       finger.getBone(0);

      Bone    bone_intermediate = finger.getIntermediateBone();
      // or                       finger.get("intermediate");
      // or                       finger.getBone(1);

      Bone    bone_proximal     = finger.getProximalBone();
      // or                       finger.get("proximal");
      // or                       finger.getBone(2);

      Bone    bone_metacarpal   = finger.getMetacarpalBone();
      // or                       finger.get("metacarpal");
      // or                       finger.getBone(3);


      // ----- DRAWING -----

      // finger.draw(); // = drawLines()+drawJoints()
      // finger.drawLines();
      // finger.drawJoints();


      // ----- TOUCH EMULATION -----

      int     touch_zone        = finger.getTouchZone();
      float   touch_distance    = finger.getTouchDistance();

      switch(touch_zone) {
      case -1: // None
        break;
      case 0: // Hovering
        // println("Hovering (#"+finger_id+"): "+touch_distance);
        break;
      case 1: // Touching
        // println("Touching (#"+finger_id+")");
        break;
      }
    }


    // ========= TOOLS =========

    for (Tool tool : hand.getTools ()) {


      // ----- BASICS -----

      int     tool_id           = tool.getId();
      PVector tool_position     = tool.getPosition();
      PVector tool_stabilized   = tool.getStabilizedPosition();
      PVector tool_velocity     = tool.getVelocity();
      PVector tool_direction    = tool.getDirection();
      float   tool_time         = tool.getTimeVisible();


      // ----- DRAWING -----

      // tool.draw();


      // ----- TOUCH EMULATION -----

      int     touch_zone        = tool.getTouchZone();
      float   touch_distance    = tool.getTouchDistance();

      switch(touch_zone) {
      case -1: // None
        break;
      case 0: // Hovering
        // println("Hovering (#"+tool_id+"): "+touch_distance);
        break;
      case 1: // Touching
        // println("Touching (#"+tool_id+")");
        break;
      }
    }
  }


  // ========= DEVICES =========

  for (Device device : leap.getDevices ()) {
    float device_horizontal_view_angle = device.getHorizontalViewAngle();
    float device_verical_view_angle = device.getVerticalViewAngle();
    float device_range = device.getRange();
  }
  
  // =========== OSC ============
  if (num % 3 == 0) {
     sendOsc();
  }
  num++;
}



// ========= CALLBACKS =========

void leapOnInit() {
  // println("Leap Motion Init");
}
void leapOnConnect() {
  // println("Leap Motion Connect");
}
void leapOnFrame() {
  // println("Leap Motion Frame");
}
void leapOnDisconnect() {
  // println("Leap Motion Disconnect");
}
void leapOnExit() {
  // println("Leap Motion Exit");
}

//====== OSC SEND ======
void sendOsc() {
  OscMessage msg = new OscMessage("/wek/inputs");
  if (numFound > 0) {
    for (int i = 0; i < features.length; i++) {
      msg.add(features[i]);
    }
  } else {
    for (int i = 0; i < features.length; i++) {
      msg.add(0.);
    }
  }
  oscP5.send(msg, dest);
}

void sendInputNames() {
   OscMessage msg = new OscMessage("/wekinator/control/setInputNames");
   String[] fingerNames = {"thumb", "index", "middle", "ring", "pinky"};
   String coordinates[] = {"_x", "_y", "_z"};
   int n = 0;
   for (int i = 0; i < fingerNames.length; i++) {
     for (int j = 0; j< coordinates.length; j++) {
        msg.add(fingerNames[i] + coordinates[j]); 
        n++;
     }
   }
  oscP5.send(msg, dest); 
  println("Sent finger names" + n);
}

