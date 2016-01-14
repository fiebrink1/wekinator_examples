//Sends Gametrak Tether to Wekinator, via ChucK
//This should run on Windows and Mac (and possibly Linux too)
//Sends 6 inputs to Wekinator on port 6448 using message /wek/inputs
//You may have to change the device number on your computer! (see comments below)

"/wek/inputs" => string sendMsg;
6448 => int port;
"localhost" => string hostname;

// which device number: (usually 0, but may be something else if Osculator/other software is installed)
0 => int device;

0 => int verbose;

// make HidIn and HidMsg
Hid hi;
HidMsg msg;

float axes[6];

10::ms => dur sendRate; //You could change this to send more or less often
OscSend xmit;
xmit.setHost( hostname, port );


// get from command line
if( me.args() ) me.arg(0) => Std.atoi => device;

// open joystick 0, exit on fail
if( !hi.openJoystick( device ) ) {
    device++;
}

// open joystick 1, exit on fail
if( !hi.openJoystick( device ) ) {
    device++;
}

// open joystick 2, exit on fail
if( !hi.openJoystick( device ) ) {
    <<< "Could not open device">>>;
    device++;
}

// open joystick 3, exit on fail
if( !hi.openJoystick( device ) ) {
    <<< "Could not open device">>>;
    me.exit();
}

<<< "HID device '" + hi.name() + "' ready", "" >>>;
<<< "Sending 6 inputs to host=", hostname, ", port=", port, ", message name=", sendMsg>>>; 

fun void sender() {
    while (true) {
     xmit.startMsg(sendMsg, "f f f f f f" );
     for (0 => int i; i < 6; i++) {
         axes[i] => xmit.addFloat;
     }
     sendRate => now;
    }
}


spork~ sender();

0 => int dataReceived;
// infinite event loop
while( true )
{
    // wait on HidIn as event
    hi => now;
    
    // messages received
    while( hi.recv( msg ) )
    {
        // joystick axis motion
        if( msg.isAxisMotion() )
        {
            if (verbose) {
                <<< "joystick axis", msg.which, ":", msg.axisPosition >>>;
            }
            
            if (!verbose && dataReceived == 0) {
                <<< "Data received. Good to go!">>>;
                1 => dataReceived;
            }
            
            msg.axisPosition => axes[msg.which];
        }
        
    }
}