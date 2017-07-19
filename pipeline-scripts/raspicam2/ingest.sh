#!/bin/bash
gst-launch-1.0 \
    tcpclientsrc host=raspicam2 port=6000 do-timestamp=true !\
            "application/x-rtp-stream,media=audio,clock-rate=44100,encoding-name=VORBIS" !\
            rtpstreamdepay ! rtpvorbisdepay ! decodebin ! audioconvert !\
            "audio/x-raw,format=S16LE,channels=2,layout=interleaved,rate=44100" !\
            mux. \
    audiotestsrc freq=550 !\
            audio/x-raw,format=S16LE,channels=2,layout=interleaved,rate=44100 !\
            mux. \
    \
    matroskamux name=mux !\
            tcpclientsink host=localhost port=10001
