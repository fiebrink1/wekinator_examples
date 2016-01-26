// Created by Rebecca Fiebrink 2015

public class WekinatorProxy {
   OscP5 oscP5;
   
   public WekinatorProxy(OscP5 oscP5) {
       this.oscP5 = oscP5;
   }

   public void sendInputs(int x) {
       //println("Sending msg " + x + ","  + y);
       OscMessage msg = new OscMessage("/wek/inputs");
       msg.add((float)x); 
       oscP5.send(msg, dest);
   }
  
   public void setOutput(float f) {
       OscMessage msg = new OscMessage("/wekinator/control/outputs");
       println("setting output to " + f);
       msg.add(f); 
       oscP5.send(msg, dest);
   }
   
   void startRecording() {
       OscMessage msg = new OscMessage("/wekinator/control/startRecording");
       println("Recording");
       oscP5.send(msg, dest);
   }
   
   void stopRecording() {
       OscMessage msg = new OscMessage("/wekinator/control/stopRecording");
       println("Stoping recording");
       oscP5.send(msg, dest);
   }
   
   void train() {
       OscMessage msg = new OscMessage("/wekinator/control/train");
       println("Recording");
       oscP5.send(msg, dest);
   }
   
   void startRunning() {
       OscMessage msg = new OscMessage("/wekinator/control/startRunning");
       println("Running");
       oscP5.send(msg, dest);
     
   }
   
   void stopRunning() {
       OscMessage msg = new OscMessage("/wekinator/control/stopRecording");
       println("Stop running");
       oscP5.send(msg, dest);     
   }
   
   void deleteTraining() {
       OscMessage msg = new OscMessage("/wekinator/control/deleteAllExamples");
       println("Deleting examples");
       oscP5.send(msg, dest);
   }
   
   public float getOutputValue(OscMessage theOscMessage) {
      if (theOscMessage.checkAddrPattern("/wek/outputs")) {
        if(theOscMessage.checkTypetag("f")) {
          return theOscMessage.get(0).floatValue();
        }
      }
      println("Error parsing OSC message");
      return -1;
   }
}
