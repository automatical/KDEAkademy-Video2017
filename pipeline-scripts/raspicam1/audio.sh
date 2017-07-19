#!/bin/bash
gst-launch-1.0 -v pulsesrc device="alsa_input.usb-Alesis_io_2-00-io2.analog-stereo" ! audioconvert !\
        "audio/x-raw,rate=44100" ! vorbisenc ! rtpvorbispay config-interval=1 !\
	rtpstreampay ! tcpserversink host=0.0.0.0 port=6000