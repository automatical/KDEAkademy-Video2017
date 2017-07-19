DELAY="! queue max-size-buffers=0 max-size-time=0 max-size-bytes=0 min-threshold-time=2400000000"
DELAY="! queue max-size-buffers=0 max-size-time=0 max-size-bytes=0 min-threshold-time=1400000000"
DELAY="! queue max-size-buffers=0 max-size-time=0 max-size-bytes=0 min-threshold-time=0400000000"
DELAY=""

gst-launch-1.0 \
        tcpclientsrc host=raspicam1 port=6000 do-timestamp=true !\
                "application/x-rtp-stream,media=audio,clock-rate=44100,encoding-name=VORBIS" !\
                rtpstreamdepay ! rtpvorbisdepay ! decodebin ! audioconvert !\
                "audio/x-raw,format=S16LE,channels=2,layout=interleaved,rate=44100" !\
                mux. \
        tcpclientsrc host=raspicam1 port=5000 ! gdpdepay ! rtph264depay ! avdec_h264 !\
                video/x-raw,format=I420,width=1280,height=720,framerate=25/1,pixel-aspect-ratio=1/1 ! \
                mux. \
        \
        matroskamux name=mux !\
                tcpclientsink host=localhost port=10000
