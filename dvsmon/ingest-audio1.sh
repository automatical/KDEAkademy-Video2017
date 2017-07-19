#!/bin/sh

#FIXME: Python script so this delay is configurable
DELAY="! queue max-size-buffers=0 max-size-time=0 max-size-bytes=0 min-threshold-time=2400000000"
DELAY="! queue max-size-buffers=0 max-size-time=0 max-size-bytes=0 min-threshold-time=1400000000"
DELAY="! queue max-size-buffers=0 max-size-time=0 max-size-bytes=0 min-threshold-time=0400000000"
DELAY=""

gst-launch-1.0 -qe \
	tcpclientsrc host=raspicam1 port=6000 do-timestamp=true ! queue ! matroskaparse ! matroskademux ! queue ! opusdec $DELAY ! \
	queue ! matroskamux streamable=true !\
		tcpclientsink host=localhost port=10003
