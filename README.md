# Akademy Video 2017

This repository contains a number of items required to bootstrap the video infrastructure for KDE Akademy 2017.

# Configuration Steps

1. DVSmon
2. Voctomix - Core
3. Voctomix - GUI
4. Raspberry Pi 1 - Video
5. Raspberry Pi 1 - Audio
6. Raspberry Pi 1 - Receiver
7. Raspberry Pi 2 - Video
8. Lenken - Framegrabber
9. Background Video
10. Record to File
11. Video Preview Window

### DVSMon

From the dvsmon directory, run the following command:

```
./prod.sh
```

### Voctomix - Core and GUI
Voctomix Core and GUI can be started by running the first and second commands within DVSMon.

The settings file for voctomix can be found in the pipeline-scripts directory: voctomix-config.ini

### Raspberry Pi 1 - Video & Audio

The Raspberry Pi Camera needs to run a few scripts in order to deliver audio and video to Voctomix, these need to be placed within the home directory of the pi user on the RPi. 

At this stage, we should also give RPi 1 a static ip address and point raspicam1 to it in the servers host file. We should also add the ssh key of the voctocore server to this Pi so that DVSmon can control it.

### Raspberry Pi 1 - Receiver

The reciver runs on the voctocore server and muxes the video and audio rtp feeds into a single feed. It will then push these to Voctomix.

### Raspberry Pi 2 - Video

The second RPi needs to have the video.sh script placed within the pi user home directory.

At this stage, we should also give RPi 2 a static ip address and point raspicam2 to it in the servers host file. We should also add the ssh key of the voctocore server to this Pi so that DVSmon can control it.

### Lenken - Framegrabber

The lenken framegrabber will send video to a multicast address. 

### Background Video

The background video should be placed in the assets directory, a 5 second .ts file will suffice.

### Record to File

Videos will be output to the Video directory of the current users home directory.
