/*  FM synth by Jeff Snyder, wekinator mod by Rebecca Fiebrink (2009-2015)
	
	This is an FM synthesis class.
    it is a sawtooth wave, which is frequency modulated by a sine wave
    which then gets put through a low-pass filter
    and has an amplitude envelope

	This one is "always on" -- no note triggering with keyboard
    
    parameters for this class are:
    0 = midinote pitch of Sawtooth oscillator (carrier freq)
    1 = lowpass filter cutoff frequency
    2 = Master gain (carrier gain)
    3 = fm oscillator midinote pitch (modulator freq)
    4 = fm oscillator index (modulator index)
*/


// create our OSC receiver
OscRecv recv;
// use port 12000
12000 => recv.port;
// start listening (launch thread)
recv.listen();

// create an address in the receiver, store in new variable
// Listen for 5 floats coming in:
recv.event( "/wek/outputs, f f f f f" ) @=> OscEvent oe;

<<< "Listening for 5 continuous parameters on port 12000, message name /wek/outputs">>>; 


OscSend xmit;
0 => int isSendingParams;	
50::ms => dur rate;

50 => float attack;
500 => float decay;
1. => float sustainlevel;
50 => float release;
SinOsc fmosc => SawOsc s => LPF lpf => Envelope vol => dac;
2000 => lpf.freq;
// d.set(attack::ms, decay::ms, sustainlevel, release::ms);
2 => s.sync;

5::ms => vol.duration;

5 => int numParams;
float myParams[numParams];


50 => Std.mtof => s.freq;

Envelope envs[numParams];
for (0 => int i; i < numParams; i++) {
    envs[i] => blackhole;
    .5 => envs[i].value;
    10::ms => envs[i].duration;
}
 
    //This is called by the main code, only once after initialization, like a constructor
    fun void setup() {
        spork ~smooth();	
    }
    
    fun void setParams(float params[]) {
        if (params.size() >= numParams) {		
            //Adjust the synthesis accordingly
            0.0 => float x;
            for (0 => int i; i < numParams; i++) {
                params[i] => x;
                if (x < 0)
                    0 => x;
                if (x > 1)
                    1 => x;
                x => envs[i].target;
                x => myParams[i];
            }
        }
        //NOTE: we rely on smooth() method to actually interpret these parameters musically.
    }
    fun void smooth() {
        while (true) {
            (envs[0].value() * 100 + 20) => Std.mtof => s.freq;
            (envs[1].value() * 10000) + 1 => lpf.freq;
            envs[2].value() * .5 => s.gain;
            (envs[3].value() * 100 + 20.)=> Std.mtof => fmosc.freq;
            (envs[4].value() * 400) => fmosc.gain;
            10::ms => now;
        }
    }
    
    fun void silent() {
        vol.keyOff();
    }
    
    //Turn volume on!
    fun void sound() {
        //<<< "SOUUUUUUUND">>>;
        vol.keyOn();
    }	



fun void waitForEvent() {
    // infinite event loop
    while ( true )
    {
        // wait for OSC message to arrive
        oe => now;
        
        // grab the next message from the queue. 
        while ( oe.nextMsg() != 0 )
        { 
			//Unpack our 5 floats into our array p
            float p[5];
            oe.getFloat() => p[0];
            oe.getFloat() => p[1];
            oe.getFloat() => p[2];
            oe.getFloat() => p[3];
            oe.getFloat() => p[4];
            setParams(p);
        }
    }   
    
}

setup();
sound();
spork ~waitForEvent();
10::hour => now;
