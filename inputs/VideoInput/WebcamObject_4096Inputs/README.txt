README

This program uses Gene Kogan’s ConvnetOSC (https://github.com/ml4a/ml4a-ofx/tree/master/apps/ConvnetOSC)

1. Download the file image-net-2012.sqlite3 from https://github.com/liuliu/ccv/blob/stable/samples/image-net-2012.sqlite3

2. Save this file to the WebcamObject_4096Inputs/data/ directory

3. Run the WebcamObject_4096Inputs application

4. Set up Wekinator to listen for 4096 inputs. We recommend using these inputs for object classification (e.g., class 1 = “holding a mug in front of webcam”, class 2 = “holding a book in front of webcam”, etc.) 

5. Press spacebar within the WebcamObject_4096Inputs application to start extracting features. Note that this will be rather slow (e.g. about 1 feature vector per second).