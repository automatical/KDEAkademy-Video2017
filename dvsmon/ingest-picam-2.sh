gst-launch-1.0 -vv \
        tcpclientsrc host=raspicam1 port=5000  ! gdpdepay !  rtph264depay ! avdec_h264 !\
                video/x-raw,format=I420,width=1280,height=720,framerate=25/1,pixel-aspect-ratio=1/1 ! \
                mux. \
        \
        alsasrc device=hw:1 ! audioconvert !\
                audio/x-raw,format=S16LE,channels=2,layout=interleaved,rate=44100 !\
                mux. \
        \
        matroskamux name=mux !\
                tcpclientsink host=localhost port=10000
