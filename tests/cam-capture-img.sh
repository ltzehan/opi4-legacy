#!/bin/bash
gst-launch-1.0 rkisp num-buffers=1 device=/dev/video0 io-mode=1 ! \
  video/x-raw,format=NV12,width=2112,height=1568,framerate=10/1 ! \
  jpegenc ! \
  filesink location=/home/orangepi/Desktop/test.jpg