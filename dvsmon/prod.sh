#!/bin/bash -ix

export PATH=$PATH:`pwd`/../voctomix/voctocore/
export PATH=$PATH:`pwd`/../voctomix/voctogui/
export PATH=$PATH:`pwd`/../voctomix/example-scripts/gstreamer/
export PATH=$PATH:`pwd`/../voctomix/example-scripts/ffmpeg/

# sencible params for production (recording talks) 

./dvs-mon.py -c \
    vocto-prod1.py

