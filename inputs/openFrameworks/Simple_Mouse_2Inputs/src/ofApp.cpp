#include "ofApp.h"
#include "ofxOsc.h"


//--------------------------------------------------------------
void ofApp::setup(){
    sender.setup(HOST, PORT);
}

//--------------------------------------------------------------
void ofApp::update(){
    
}

//--------------------------------------------------------------
void ofApp::draw(){
    string buf = "Sending message " + string(MESSAGE) + " to " + string(HOST) + " on port " + ofToString(PORT);
    ofDrawBitmapString(buf, 10, 20);
    buf = "X=" + ofToString(mouseX) + ", Y=" + ofToString(mouseY);
    ofDrawBitmapString(buf, 10, 50);
    
    
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){
    
}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){
    
}

void ofApp::mouseMoved(int x, int y){
    mouseX = x;
    mouseY = y;
    ofxOscMessage m;
    m.setAddress(string(MESSAGE));
    m.addFloatArg((float)x);
    m.addFloatArg((float)y);
    sender.sendMessage(m, false);
}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){
    
}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){
    
}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){
    
}

//--------------------------------------------------------------
void ofApp::mouseEntered(int x, int y){
    
}

//--------------------------------------------------------------
void ofApp::mouseExited(int x, int y){
    
}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){
    
}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){
    
}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){
    
}
