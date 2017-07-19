#!/bin/sh
gst-launch-1.0 \
	tcpclientsrc host=10.0.0.12 port=1234 ! \
		alsasink provide-clock=false ts-offset=500000000
