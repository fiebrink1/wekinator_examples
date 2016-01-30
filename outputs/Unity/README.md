THIS EXAMPLE REQUIRES TWO FLOAT VALUES. These control the rotation of the cube.

*Note: You may not notice the effect of these values on your unity project if it is running in the background, so make sure you bring it to the front of your screen.*

To control Unity from Wekinator, this is what I do. (May not be the best way, since I don’t really use Unity.)

1) Create an empty object in your scene. I called mine OSCEmpty.

2) Add 3 scripts to this object:
	A) UDPPacketIO
	B) OSC
	C) OSCReceiver

3) Make sure the OSCReceiver script is set with the following parameters:
	Remote IP: 127.0.0.1
	Send to Port: 6448 (this allows you to send data back to Wekinator if you want)
	Listener Port: 12000

4) Edit OSCReceiver to tell it how many float values to unpack from the message, and store each of these in a global variable. In my example, I am unpacking 2 floats in function Example1, and I’m setting these to variables sig1 and sig2.

5) Edit OSCReceiver’s update() function to use the received values in some way. In this example, I’m using them to rotate the cube along two different axes.


If you want to SEND data from Unity to Wekinator, check out the OSCTestSender script in this project. You'll need to edit the OSC message (i.e., make it /wek/inputs), attach any input/feature values you want (make sure you attach as floats), and send to Wekinator (by default, send to 127.0.0.1 on port 6448).