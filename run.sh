#!/bin/bash

[ ! -f $PWD/config.json ] && echo "config.json missing! (see config.json.template)" && exit 1

docker build . -t belabox
docker run --rm -it --name belabox \
   -p 5000:5000/udp \
   -p 8181:8181/tcp \
   -p 8282:8282/udp \
   -v $PWD/config.json:/app/config.json belabox

# SLS stats page:
# http://localhost:8181/stats
#
# Belabox
# host: <ip>
# port: 5000
# stream-id: live/stream/belabox
#
# OBS MediaSource:
# srt://<ip>:8282/?streamid=play/stream/belabox
#
