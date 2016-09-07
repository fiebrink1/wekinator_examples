README - osculator_touchOSC_9inputs

To run:

0) Make sure the computer running Osculator and the device running touchOSC are on the same wifi network.

1) In touchOSC options, turn on the “Accelerometer (/xyz)” option.

2) In touchOSC connections:
	* Set “enabled” to on
	* Choose the IP address or name of the computer running Osculator as your Host
	* Choose 8000 as the outgoing port

3) In touchOSC, run the layout “simple” and go to the third pane/tab, where you will see a big yellow box (a 2d touch slider).

4) Run the Osculator program, osculator_touchOSC_9inputs. You should see a green light next to /accxyz. If you don’t, that means Osculator is not receiving data from touchOSC. Check that you’ve done all the instructions above.

5) Run Wekinator with 9 inputs.

The inputs received by wekinator will be (in this order):
	* accelerometer x
	* accelerometer y
	* accelerometer z
	* touchpad x
	* touchpad y
	* button 1 (1 = on, 0 = off)
	* button 2
	* button 3
	* button 4

You will probably want to edit the “input/output connections” (i.e., do feature selection) in Wekinator to only use the controls that you need.
