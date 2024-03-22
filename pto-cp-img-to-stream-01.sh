#!/bin/bash

#copy an image to the streaming server rtmp://localhost:1935/live/test
#docker run --rm -v $(pwd)/img:/tmp -it jgwill/server:rtmp ffmpeg -re -stream_loop -1 -i /tmp/1.jpg -c:v libx264 -preset veryfast -tune zerolatency -pix_fmt yuv420p -g 60 -c:a aac -b:a 160k -ar 44100 -f flv rtmp://localhost:1935/live/test
#ffmpeg -re -stream_loop -1 -i /img/1.jpg -c:v libx264 -preset veryfast -tune zerolatency -pix_fmt yuv420p -g 60 -c:a aac -b:a 160k -ar 44100 -f flv rtmp://localhost:1935/live/test
input_img=/img/1.jpg
if [ "$1" != "" ]; then
    input_img=$1
fi
STREAM_URL=rtmp://localhost:1935/live/test
xres=720
IMAGE_FILE=/img/resized.jpg
convert $input_img -resize $xres $IMAGE_FILE
#ffmpeg -re -stream_loop -1 -i /img/resized.jpg -c:v libx264 -preset veryfast -tune zerolatency -pix_fmt yuv420p -g 60 -c:a aac -b:a 160k -ar 44100 -f flv $STREAM_URL

# Push the image to the stream
#ffmpeg -i "$IMAGE_FILE" -vcodec libx264 -acodec aac -f flv "$STREAM_URL"

# ffmpeg -i "$IMAGE_FILE" -vcodec libx264 -acodec aac -f flv -movflags empty_moov "$STREAM_URL"

# faststart "$STREAM_URL"

ffmpeg -i "$IMAGE_FILE" -vcodec libx264 -acodec aac -f flv -movflags empty_moov+faststart "$STREAM_URL"

#http://server-address:8080/live/stream-name.flv