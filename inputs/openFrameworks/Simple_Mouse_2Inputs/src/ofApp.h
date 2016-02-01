#pragma once

#include "ofMain.h"
#include "ofxOsc.h"

//Defaults for OSC:
#define HOST "localhost"
#define PORT 6448
#define MESSAGE "/wek/inputs"

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
    void mouseEntered(int x, int y);
    void mouseExited(int x, int y);
    void windowResized(int w, int h);
    void dragEvent(ofDragInfo dragInfo);
    void gotMessage(ofMessage msg);
    
    ofTrueTypeFont font;
    
    //OSC sender:
    ofxOscSender sender;
    
    int mouseX = 0;
    int mouseY = 0;
    
};
