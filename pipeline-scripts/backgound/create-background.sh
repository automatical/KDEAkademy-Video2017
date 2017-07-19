ffmpeg -loop 1 -i $1 -c:v libx264 -t 5 -pix_fmt yuv420p -vf scale=1280:720 background.ts
