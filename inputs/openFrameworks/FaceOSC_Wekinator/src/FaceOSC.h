#pragma once

#include "ofxFaceTracker.h"
#include "ofxOsc.h"

#define DEFAULT_OSC_ADDRESS "/wek/inputs"

class FaceOsc {
public:
    FaceOsc();
    void addMessage(ofVec3f data);
    void addMessage(ofVec2f data);
    void addMessage(float data);
    void addMessage(int data);
    void sendBundle();
    
    void sendFaceOsc(ofxFaceTracker& tracker);
    
    string host;
    int port;
    ofxOscSender osc;
    ofxOscMessage msg;
    string address;
    
    ofParameter<bool> bIncludePose;
    ofParameter<bool> bIncludeGestures;
    ofParameter<bool> bIncludeAllVertices;
};