#pragma once

#include "ofMain.h"
#include "ofxAssimpModelLoader.h"
#include "ofxOsc.h"

// listen on port 12000
#define PORT 12000
#define NUM_MSG_STRINGS 20

class ofApp : public ofBaseApp{
    
public:
    
    void setup();
    void update();
    void draw();
    
    void keyPressed(int key);
    void keyReleased(int key);
    void mouseMoved(int x, int y );
    void mouseDragged(int x, int y, int button);
    void mousePressed(int x, int y, int button);
    void mouseReleased(int x, int y, int button);
    void windowResized(int w, int h);
    void dragEvent(ofDragInfo dragInfo);
    void gotMessage(ofMessage msg);
    
    ofxAssimpModelLoader squirrelModel;
    
    ofxOscReceiver receiver;
    float vx, vy;
    
    
};

