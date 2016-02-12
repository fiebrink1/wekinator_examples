#include "FaceOsc.h"

FaceOsc::FaceOsc() {
    address = DEFAULT_OSC_ADDRESS;
}

void FaceOsc::sendFaceOsc(ofxFaceTracker& tracker) {
    
    if(tracker.getFound()) {
        
        msg.clear();
        msg.setAddress(address);
        
        if(bIncludePose) {
            ofVec2f position = tracker.getPosition();
            addMessage(position);
            addMessage(tracker.getScale());
            ofVec3f orientation = tracker.getOrientation();
            addMessage(orientation);
        }
        
        if (bIncludeGestures) {
            addMessage(tracker.getGesture(ofxFaceTracker::MOUTH_WIDTH));
            addMessage(tracker.getGesture(ofxFaceTracker::MOUTH_HEIGHT));
            addMessage(tracker.getGesture(ofxFaceTracker::LEFT_EYEBROW_HEIGHT));
            addMessage(tracker.getGesture(ofxFaceTracker::RIGHT_EYEBROW_HEIGHT));
            addMessage(tracker.getGesture(ofxFaceTracker::LEFT_EYE_OPENNESS));
            addMessage(tracker.getGesture(ofxFaceTracker::RIGHT_EYE_OPENNESS));
            addMessage(tracker.getGesture(ofxFaceTracker::JAW_OPENNESS));
            addMessage(tracker.getGesture(ofxFaceTracker::NOSTRIL_FLARE));
        }

        if(bIncludeAllVertices){
            ofVec2f center = tracker.getPosition();
            vector<ofVec2f> imagePoints = tracker.getImagePoints();
            for(int i = 0; i < imagePoints.size(); i++){
                ofVec2f p = imagePoints.at(i);
                msg.addFloatArg((p.x - center.x)/tracker.getScale());
                msg.addFloatArg((p.y - center.y)/tracker.getScale());
            }
        }
        
        osc.sendMessage(msg);
        
    } else {
        // not found
    }
}

void FaceOsc::addMessage(ofVec3f data) {
    msg.addFloatArg(data.x);
    msg.addFloatArg(data.y);
    msg.addFloatArg(data.z);
}

void FaceOsc::addMessage(ofVec2f data) {
    msg.addFloatArg(data.x);
    msg.addFloatArg(data.y);
}

void FaceOsc::addMessage(float data) {
    msg.addFloatArg(data);
}

void FaceOsc::addMessage(int data) {
    msg.setAddress(address);
    msg.addIntArg(data);
}
