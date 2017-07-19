#!/bin/bash -ix

export PATH=$PATH:~/Development/voctomix/voctocore/
export PATH=$PATH:~/Development/voctomix/voctogui/
export PATH=$PATH:~/Development/voctomix/example-scripts/gstreamer/
export PATH=$PATH:~/Development/voctomix/example-scripts/ffmpeg/

# sencible params for production (recording talks) 

./dvs-mon.py -c \
    vocto-prod1.py

