""" sending OSC with pyOSC
https://trac.v2.nl/wiki/pyOSC
example by www.ixi-audio.net based on pyOSC documentation
"""
#Modified for Wekinator by Rebecca Fiebrink


import OSC
import time, random

"""
note that if there is nobody listening in the other end we get an error like this
    OSC.OSCClientError: while sending: [Errno 111] Connection refused
so we need to have an app listening in the receiving port for this to work properly

this is a very basic example, for detailed info on pyOSC functionality check the OSC.py file 
or run pydoc pyOSC.py. you can also get the docs by opening a python shell and doing
>>> import OSC
>>> help(OSC)
"""

print "*******"
print "This program sends 3 random inputs to Wekinator every second."
print "Default is port 6448, message name /wek/inputs"
print "If Wekinator is not already listening for OSC, we will get an error."
print "*******"


send_address = '127.0.0.1', 6448

# OSC basic client
c = OSC.OSCClient()
c.connect( send_address ) # set the address for all following messages

# lets try sending a different random number every frame in a loop
try :
    seed = random.Random() # need to seed first 
    
    while 1: # endless loop
        rNum = OSC.OSCMessage()
        rNum.setAddress("/wek/inputs")
        n = seed.randint(1, 1000) # get a random num every loop
        rNum.append(n + 0.0) #0.0 here is hack to make it float
        n = seed.randint(1, 1000) # get another random num every loop
        rNum.append(n + 0.0)
        n = seed.randint(1, 1000) # get another random num every loop
        rNum.append(n + 0.0)
        c.send(rNum)
        print "Sent 3 values..."
        time.sleep(1) # wait here 1 second

except KeyboardInterrupt:
    print "Closing OSCClient"
    c.close()
    print "Done"
        
