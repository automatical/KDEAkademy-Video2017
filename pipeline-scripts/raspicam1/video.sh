#!/bin/bash
sudo pkill -9 gst-launch-1.0
sudo pkill -9 raspivid

sudo modprobe bcm2835-v4l2 &
raspivid -t 0 -md 1 -h 720 -w 1280 -fps 25 -o - | gst-launch-1.0 -v fdsrc ! h264parse ! rtph264pay config-interval=1 ! gdppay ! queue ! tcpserversink host=0.0.0.0 port=5000