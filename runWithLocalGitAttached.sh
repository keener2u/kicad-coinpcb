#!/bin/bash
xhost +local:docker
cd /tmp
if [ -d "/tmp/CoinPCB" ]; then
  cd /tmp/CoinPCB 
  git pull 
else 
   git clone git@github.com:keener2u/CoinPCB.git
fi
docker run -it --rm --volume /tmp/CoinPCB:/opt/CoinPCB --volume /tmp/.X11-unix:/tmp/.X11-unix --env DISPLAY=$DISPLAY --env RUNUSER_UID=$(id -u) keener2u/kicad-coinpcb
