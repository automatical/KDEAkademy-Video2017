AUDIOSRC='audiotestsrc freq=400 volume=0'
AUDIOSRC='d. ! queue ! mpegaudioparse ! avdec_mp3 ! queue' 
WITH_AUDIO=""
gst-launch-1.0 -vv \
    udpsrc address=239.255.42.42 port=5004 do-timestamp=true ! queue !\
    tsdemux name=d !\
    queue ! h264parse ! avdec_h264 !\
	videorate ! videoscale add-borders=false ! videoconvert !\
	video/x-raw,format=I420,width=1280,height=720,framerate=25/1,pixel-aspect-ratio=1/1 !\
	m. $AUDIOSRC !\
    audioconvert ! audioresample ! audiorate!\
    audio/x-raw,format=S16LE,channels=2,layout=interleaved,rate=44100 !\
    matroskamux name=m ! queue ! tcpclientsink blocksize=16384 host=localhost port=10000
