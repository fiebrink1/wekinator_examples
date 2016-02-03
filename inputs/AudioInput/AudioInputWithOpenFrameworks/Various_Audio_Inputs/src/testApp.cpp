/* Audio input from Maximilian to Wekinator
  Adapted from Maximilian example code by Rebecca Fiebrink, 2016
 
  You can copy and paste this and use it as a starting example.
 
  Sends OSC to Wekinator. The number of inputs depends on what you select in the GUI.
 
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
    /* some standard setup stuff*/
    
    ofEnableAlphaBlending();
    ofSetupScreen();
    ofBackground(0, 0, 0);
    ofSetFrameRate(60);
    
    /* This is stuff you always need.*/
    
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
    
    
    fftSize = 1024;
    mfft.setup(fftSize, 512, 256);
    ifft.setup(fftSize, 512, 256);
    
    
    nAverages = 12;
    oct.setup(sampleRate, fftSize/2, nAverages);
    
    mfccs = (double*) malloc(sizeof(double) * 13);
    mfcc.setup(512, 42, 13, 20, 20000, sampleRate);
    
    ofxMaxiSettings::setup(sampleRate, 2, initialBufferSize);
    ofSoundStreamSetup(2,2, this, sampleRate, initialBufferSize, 4);/* Call this last ! */
    
    
    //GUI STUFF
    gui.setup(); // most of the time you don't need a name
    gui.add(fftToggle.setup("FFT bin magnitudes (pitch/timbre/volume) (512 inputs)", true));
    gui.add(mfccToggle.setup("MFCCs (timbre/vocal) (13 inputs)", true));
    gui.add(chromagramToggle.setup("Const-Q analyser (12 bands/oct) (104 inputs)", true));
    gui.add(peakFrequencyToggle.setup("Peak frequency (pitch) (1 input)", true));
    gui.add(centroidToggle.setup("Spectral centroid (timbre) (1 input)", true));
    gui.add(rmsToggle.setup("RMS (volume) (1 input)", true));
    
    bHide = true;
    
    myfont.loadFont("arial.ttf", 18); //requires this to be in bin/data/
    myFont2.loadFont("arial.ttf", 12); //requires this to be in bin/data/

    
    ofSetVerticalSync(true);
    
}

//--------------------------------------------------------------
void testApp::update(){
    
    ofxOscMessage m;
    m.setAddress("/wek/inputs");
    
    if (fftToggle) {
       // cout << "FFT" << endl;
        //m.setAddress("/fft");
        for (int i = 0; i < fftSize/2; i++) {
            m.addFloatArg(mfft.magnitudes[i]);
            
        }
        // sender.sendMessage(m);
    }
    
    if (mfccToggle) {
        //cout << "mfcc" << endl;
        
        // ofxOscMessage m;
        // m.setAddress("/mfccs");
        for (int i = 0; i < 13; i++) {
            m.addFloatArg(mfccs[i]);
        }
        //sender.sendMessage(m);
    }
    
    
    if (chromagramToggle) {
       // cout << "chrm" << endl;
        
        // ofxOscMessage m;
        // m.setAddress("/octaveBins");
        for (int i = 0; i < oct.nAverages; i++) {
            m.addFloatArg(oct.averages[i]);
            //cout << i << endl;
        }
        // sender.sendMessage(m);
    }
    
    if (peakFrequencyToggle) {
       // cout << "peak" << endl;
        
        //ofxOscMessage m;
        // m.setAddress("/peakFrequency");
        m.addFloatArg(peakFreq);
        // sender.sendMessage(m);
    }
    
    if (centroidToggle) {
       // cout << "centr" << endl;
        
        //// ofxOscMessage m;
        // m.setAddress("/centroid");
        m.addFloatArg(centroid);
        // sender.sendMessage(m);
    }
    if (rmsToggle) {
        
       // cout << "rms" << endl;
        
        // ofxOscMessage m;
        // m.setAddress("/rms");
        m.addFloatArg(RMS);
        // sender.sendMessage(m);
    }
    sender.sendMessage(m);
    
    
}



//--------------------------------------------------------------
void testApp::draw(){
    
    float horizWidth = 500.;
    float horizOffset = 100;
    float fftTop = 250;
    float mfccTop = 350;
    float chromagramTop = 450;
    
    ofSetColor(255, 0, 0,255);
    
    //FFT magnitudes:
    float xinc = horizWidth / fftSize * 2.0;
    for(int i=0; i < fftSize / 2; i++) {
        float height = mfft.magnitudes[i] * 100;
        ofRect(horizOffset + (i*xinc),250 - height,2, height);
    }
    myfont.drawString("FFT:", 30, 250);
    
    
    //MFCCs:
    ofSetColor(0, 255, 0,200);
    xinc = horizWidth / 13;
    for(int i=0; i < 13; i++) {
        float height = mfccs[i] * 100.0;
        ofRect(horizOffset + (i*xinc),mfccTop - height,40, height);
        //		cout << mfccs[i] << ",";
    }
    myfont.drawString("MFCCs:", 12, mfccTop);

    
    //Const-Q:
    ofSetColor(255, 0, 255,200);
    xinc = horizWidth / oct.nAverages;
    for(int i=0; i < oct.nAverages; i++) {
        float height = oct.averages[i] / 20.0 * 100;
        ofRect(horizOffset + (i*xinc),chromagramTop - height,2, height);
    }
    myfont.drawString("ConstQ:", 12, chromagramTop);

    
    ofSetColor(255, 255, 255,255);
    
    char peakString[255]; // an array of chars
    sprintf(peakString, "Peak Frequency: %.2f", peakFreq);
    myfont.drawString(peakString, 12, chromagramTop + 50);
    
    char centroidString[255]; // an array of chars
    sprintf(centroidString, "Spectral Centroid: %f", centroid);
    myfont.drawString(centroidString, 12, chromagramTop + 80);
    
    char rmsString[255]; // an array of chars
    sprintf(rmsString, "RMS: %.2f", RMS);
    myfont.drawString(rmsString, 12, chromagramTop + 110);
    
    int numInputs = 0;
    if (fftToggle) {
        numInputs += fftSize/2;
    }
    if (mfccToggle) {
        numInputs += 13;
    }
    if (chromagramToggle) {
        numInputs += 104;
    }
    if (peakFrequencyToggle) {
        numInputs++;
    }
    if (centroidToggle) {
        numInputs++;
    }
    if (rmsToggle) {
        numInputs++;
    }
    
    char numInputsString[255]; // an array of chars
    sprintf(numInputsString, "Sending %d inputs total", numInputs);
    myfont.drawString(numInputsString, 450, 100);

    
    
    if( bHide ){
        gui.draw();
    }
    
}

//--------------------------------------------------------------
void testApp::audioRequested 	(float * output, int bufferSize, int nChannels){
    for (int i = 0; i < bufferSize; i++){
        wave = lAudioIn[i];
        if (mfft.process(wave)) {

            mfft.magsToDB();
            oct.calculate(mfft.magnitudesDB);
            
            float sum = 0;
            float maxFreq = 0;
            int maxBin = 0;
            
            for (int i = 0; i < fftSize/2; i++) {
                sum += mfft.magnitudes[i];
                if (mfft.magnitudes[i] > maxFreq) {
                    maxFreq=mfft.magnitudes[i];
                    maxBin = i;
                }
            }
            centroid = sum / (fftSize / 2);
            peakFreq = (float)maxBin/fftSize * 44100;
            
            
            mfcc.mfcc(mfft.magnitudes, mfccs);
        }

        lAudioOut[i] = 0;
        rAudioOut[i] = 0;
        
    }
    
    
    
}

//--------------------------------------------------------------
void testApp::audioReceived 	(float * input, int bufferSize, int nChannels){
    
    
    /* You can just grab this input and stick it in a double, then use it above to create output*/
    
    float sum = 0;
    for (int i = 0; i < bufferSize; i++){
        
        /* you can also grab the data out of the arrays*/
        
        lAudioIn[i] = input[i*2];
        rAudioIn[i] = input[i*2+1];
        
        sum += input[i*2] * input[i*2];
        
    }
    RMS = sqrt(sum);
    
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

