#!/bin/sh
gst-launch-1.0 -v tcpclientsrc host=10.0.0.12 port=5000 !\
  gdpdepay ! rtph264depay ! avdec_h264 ! videoconvert !\
  videoscale !\
  video/x-raw,format=I420,width=1280,height=720,framerate=25/1,pixel-aspect-ratio=1/1 ! \
  mux. \
  \
  audiotestsrc freq=440 !\
    audio/x-raw,format=S16LE,channels=2,layout=interleaved,rate=48000 !\
    mux. \
  \
  matroskamux name=mux !\
    tcpclientsink host=localhost port=10000
