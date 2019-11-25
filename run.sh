xhost +local:docker
docker run --rm --volume /tmp/.X11-unix:/tmp/.X11-unix --env DISPLAY=$DISPLAY --env LANG=$LANG --env RUNUSER_UID=$(id -u) keener2u/kicad-coinlib
