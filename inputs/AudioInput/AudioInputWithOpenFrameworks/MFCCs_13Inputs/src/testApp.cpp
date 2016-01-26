/* MFCC to Wekinator example by Rebecca Fiebrink, 2016
 
 Adapted from Maximilian example code
 
 */


#include "testApp.h"
#include "maximilian.h"/* include the lib */
#include "time.h"

//-------------------------------------------------------------
testApp::~testApp() {
    
}


//--------------------------------------------------------------
void testApp::setup(){
    
    sender.setup(HOST, PORT);
    
    //Load font
    myfont.loadFont("Arial.ttf", 10);
    
    /* some standard setup stuff*/
    ofEnableAlphaBlending();
    ofSetupScreen();
    ofBackground(0, 0, 0);
    ofSetFrameRate(60);
    
    /* This is stuff you always need when you use Maximilian. Don't change it.*/
    sampleRate 			= 44100; /* Sampling Rate */
    initialBufferSize	= 512;	/* Buffer Size. you have to fill this buffer with sound*/
    lAudioOut			= new float[initialBufferSize];/* outputs */
    rAudioOut			= new float[initialBufferSize];
    lAudioIn			= new float[initialBufferSize];/* inputs */
    rAudioIn			= new float[initialBufferSize];
    
    
    /* This is a nice safe piece of code */
    memset(lAudioOut, 0, initialBufferSize * sizeof(float));
    memset(rAudioOut, 0, initialBufferSize * sizeof(float));
    memset(lAudioIn, 0, initialBufferSize * sizeof(float));
    memset(rAudioIn, 0, initialBufferSize * sizeof(float));
    
    /* Now you can put anything you would normally put in maximilian's 'setup' method in here. */
    
    mfft.setup(fftSize, 512, 256); //just a forward FFT
    oct.setup(sampleRate, fftSize/2, nAverages);
    mfccs = (double*) malloc(sizeof(double) * 13);
    
    //512 bins, 42 filters, 13 coeffs, min/max freq 20/20000
    mfcc.setup(512, 42, 13, 20, 20000, sampleRate);
    
    ofxMaxiSettings::setup(sampleRate, 2, initialBufferSize);
    ofSoundStreamSetup(2,2, this, sampleRate, initialBufferSize, 4);/* Call this last ! */
    


    ofSetVerticalSync(true);
}

//--------------------------------------------------------------
void testApp::update(){
}

//--------------------------------------------------------------
void testApp::draw(){
    
    ofSetColor(255, 255, 255,255);
    
    ofSetColor(0, 255, 0, 255);
    myfont.drawString("Sending 13 inputs to port 6448\nUsing message /wek/inputs", 8, 10);
    
    //Draw MFCC values:
    ofSetColor(0, 255, 0,255);
    float xinc = 190.0 / 13;
    for(int i=0; i < 13; i++) {
        float height = mfccs[i] * 200.0;
        ofRect(10 + (i*xinc),200 - height,10, height);
    }
    
    //Send OSC:
    ofxOscMessage m;
    m.setAddress("/wek/inputs");
    for (int i = 0; i < 13; i++) {
        m.addFloatArg(mfccs[i]);
    }
    sender.sendMessage(m);
}

//--------------------------------------------------------------
void testApp::audioRequested 	(float * output, int bufferSize, int nChannels){
    //	static double tm;
    for (int i = 0; i < bufferSize; i++){
        wave = lAudioIn[i];
        
        //Calculate the mfccs
        if (mfft.process(wave)) { //is the window buffer full?
            mfft.magsToDB();
            oct.calculate(mfft.magnitudesDB);
            mfcc.mfcc(mfft.magnitudes, mfccs);
        }

        memset(lAudioOut, 0, initialBufferSize * sizeof(float));
        memset(rAudioOut, 0, initialBufferSize * sizeof(float));
    }
}

//--------------------------------------------------------------
void testApp::audioReceived 	(float * input, int bufferSize, int nChannels){
    for (int i = 0; i < bufferSize; i++){
        
        /* grab the data out of the arrays*/
        lAudioIn[i] = input[i*2];
        rAudioIn[i] = input[i*2+1];
    }
}

//--------------------------------------------------------------
void testApp::keyPressed(int key){
    
}

//--------------------------------------------------------------
void testApp::keyReleased(int key){
    
}

//--------------------------------------------------------------
void testApp::mouseMoved(int x, int y ){
    
}

//--------------------------------------------------------------
void testApp::mouseDragged(int x, int y, int button){
    
}

//--------------------------------------------------------------
void testApp::mousePressed(int x, int y, int button){
    
}

//--------------------------------------------------------------
void testApp::mouseReleased(int x, int y, int button){
    
}

//--------------------------------------------------------------
void testApp::windowResized(int w, int h){
    
}

