#!/bin/bash
while true; do cat `pwd`/../assets/background.ts || exit 1; done |\
	ffmpeg -y -nostdin -re -i - \
	-filter_complex "
		[0:v] scale=$WIDTH:$HEIGHT,fps=$FRAMERATE [v]
	" \
	-map "[v]" \
	-c:v rawvideo \
	-pix_fmt yuv420p \
	-f matroska \
	tcp://localhost:16000
