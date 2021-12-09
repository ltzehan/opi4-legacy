#!/bin/bash
gst-launch-1.0 rkisp num-buffers=256 device=/dev/video0 io-mode=1 ! \
  video/x-raw,format=NV12,width=2112,height=1568,framerate=60/1 ! \
  mpph264enc ! queue ! h264parse ! mpegtsmux ! \
  filesink location=/home/orangepi/Desktop/test.ts