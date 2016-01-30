/* This is a simple additive layered drum machine

Sounds adapted from standard ChucK demos by Ge Wang, Perry Cook
This was part of ICMC 2009 demo

Modified 2009-2015 by Rebecca Fiebrink

It is recommended to run this on the command line rather than in MiniAudicle.

If you run it in MiniAudicle, you will need to set the Current Directory 
(in Preferences) to the directory containing the data/ subdirectory,
otherwise MiniAudicle won't be able to find the drum samples. 

*/

// create our OSC receiver
OscRecv recv;
// use port 12000
12000 => recv.port;
// start listening (launch thread)
recv.listen();

0 => int useTriggerFinger;

// Listen for this OSC message, containing one float
// Event oe will be triggered whenever this message arrives.
recv.event( "/wek/outputs, f" ) @=> OscEvent oe;

<<< "Listening for 1 classifier output (4 classes) on port 12000, message name /wek/outputs">>>; 


    //Master gain envelope
    Envelope e => dac;
    .1::second => e.duration;
    0 => e.target => e.value;
    e.keyOn();
    
    
    //Beats-specific stuff:
    .5::second => dur T;
    
    //The synthesis patch: envelope each of 4 parts individually
    Envelope e1 => e;
    Envelope e2 => e;
    Envelope e3 => e;
    Envelope e4 => e;
    0 => e1.value => e2.value => e3.value => e4.value;
    0 => e1.target => e2.target => e3.target => e4.target;
    100::ms => e1.duration => e2.duration => e3.duration => dur defaultDuration;
    
        
    //This is called by the main code, only once after initialization, like a constructor
    fun void setup() {
        spork ~part1();
        spork ~part2();
        spork ~part3();
        spork ~part4();
        e1.keyOn();
        e2.keyOn();
        e3.keyOn();
        e4.keyOn();
        turnOnUpTo(0);		
    }
    

    fun void setClass(int c) {
        		
            turnOnUpTo(c);
            turnOffAbove(c);
       
    }
    
    //drum parts
    fun void part1() {
        drum1();
    }
    
    fun void part2() {
        spork ~drum2();
        drum3();
    }
    
    fun void part3() {
        spork ~melody1();
        melody2();
    }
    
    fun void part4() {
        funtimes();
    }
    
    fun void drum1() {
        // construct the patch
        SndBuf buf => Gain g => e1;
        "data/kick.wav" => buf.read;
        .5 => g.gain;
        
        // time loop
        while( true )
        {
            0 => buf.pos;
            Std.rand2f(.8,.9) => buf.gain;
            1::T => now;
        }
    }
    
    fun void drum2() {
        // construct the patch
        SndBuf buf => Gain g => e2;
        "data/hihat.wav" => buf.read;
        .25 => g.gain;
        
        // time loop
        while( true )
        {
            Std.rand2f(.4,.9) => buf.gain;
            if( Std.randf() > 0.75 )
            {
                0 => buf.pos;
                .5::T => now;
            }
            else
            {
                0 => buf.pos;
                .25::T => now;
                0 => buf.pos;
                .25::T => now;
            }
        }
    }
    
    fun void drum3() {
        // construct the patch
        SndBuf buf => Gain g => e2;
        "data/hihat-open.wav" => buf.read;
        .5 => g.gain;
        
        // time loop
        while( true )
        {
            0 => buf.pos;
            Std.rand2f(.8,.9) => buf.gain;
            1::T => now;
        }
    }
    
    fun void melody1() {
        // connect patch
        SinOsc s => e3;
        .25 => s.gain;
        
        // scale (in semitones)
        [ 0, 2, 4, 7, 9 ] @=> int scale[];
        
        // infinite time loop
        while( true )
        {
            // get note class
            scale[ Math.random2(0,4) ] => float freq;
        // get the final freq    
        Std.mtof( 21.0 + (Std.rand2(0,3)*12 + freq) ) => s.freq;
        
        // advance time
        .25::T => now;
    }
}

fun void melody2() {
    SinOsc s => JCRev r => e3;
    .05 => s.gain;
    .25 => r.mix;
    
    // scale (in semitones)
    [ 0, 2, 4, 7, 9 ] @=> int scale[];
    
    // infinite time loop
    while( true )
    {
        // get note class
        scale[ Math.random2(0,4) ] => float freq;
    // get the final freq
    Std.mtof( 69 + (Std.rand2(0,3)*12 + freq) ) => s.freq;
    // reset phase for extra bandwidth
    0 => s.phase;
    
    // advance time
    if( Std.randf() > -.5 ) .25::T => now;
    else .5::T => now;
}
}

fun void funtimes() {
    // construct the patch
    SndBuf buf => Gain g => JCRev r => e4;
    "data/snare.wav" => buf.read;
    .5 => g.gain;
    .05 => r.mix;
    
    // where we actually want to start
    25 => int where;
    
    // time loop
    while( true )
    {
        Std.rand2f(.8,.9) => buf.gain;
        
        if( Std.randf() > .5 )
        {
            0 => int i;
            while( i < 8 )
            {
                i / 8.0 => buf.gain;
                where => buf.pos;
                (1.0/8.0)::T => now;
                i++;
            }
            
            while( i > 0 )
            {
                i / 8.0 => buf.gain;
                where => buf.pos;
                (1.0/8.0)::T => now;
                i--;
            }
        } else {
            .9 => buf.gain;
            where => buf.pos;
            .25::T => now;
            .3 => buf.gain;
            where => buf.pos;
            .25::T => now;
            .3 => buf.gain;
            where => buf.pos;
            .25::T => now;
            
            .9 => buf.gain;
            where => buf.pos;
            .25::T => now;
            .3 => buf.gain;
            where => buf.pos;
            .25::T => now;
            .3 => buf.gain;
            where => buf.pos;
            .25::T => now;
            
            .9 => buf.gain;
            where => buf.pos;
            .25::T => now;
            .3 => buf.gain;
            where => buf.pos;
            .25::T => now;
        }
    }
}

//Control layering via envelopes:
fun void turnOnUpTo(float p) {
    1 => e1.target;
    if (p > 0) 
        1 => e2.target;
    if (p > 1)
        1 => e3.target;
    if (p > 2) 
        1 => e4.target;
}

fun void turnOffAbove(float p) {
    if (p < 3) 
        0 => e4.target;
    if (p < 2)
        0 => e3.target;
    if (p < 1) 
        0 => e2.target;
}


//Be quiet! If you want to improve efficiency here, you could also stop
//other processing
fun void silent() {
    0 => e.target;
}

//Make sound!
fun void sound() {
    1 => e.target;
}

fun void waitForEvent() {
    // infinite event loop
    while ( true )
    {
        // wait for our OSC message to arrive
        oe => now;
        
        // grab the next message from the queue. 
        while ( oe.nextMsg() != 0 )
        { 
            // getFloat fetches the expected float (as indicated by "f")
			//We can cast it to an int:
            oe.getFloat()$int => int c;
            setClass(c-1);
        }
    }   
    
}

setup();
sound();
spork ~waitForEvent();
10::hour => now;