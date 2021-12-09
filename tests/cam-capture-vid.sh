#!/bin/bash
# Note that mpph264enc has max. resolution 1920x1080
# Expect that the result is stretched due to incompatible aspect ratio 2112x1568 
# but this suffices for testing

gst-launch-1.0 rkisp num-buffers=128 device=/dev/video0 io-mode=1 ! \
  video/x-raw,format=NV12,width=1920,height=1080,framerate=60/1 ! \
  mpph264enc ! queue ! h264parse ! mpegtsmux ! \
  filesink location=/home/orangepi/Desktop/test.ts