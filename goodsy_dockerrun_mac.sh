#!/usr/bin/env bash

# Install socat on Mac and run the listener.  Can comment this if you don't need X11.
#brew install socat
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &

# Get your mac's local IP:
my_ip=$(ifconfig en0 | grep "inet " | cut -d " " -f 2)

# Create a wormhole between docker and the local machine
# (Map a persistent data directory)
my_local_volume="/Volumes/Abyss/Dropbox"
my_docker_volume="/Volumes/Abyss/Dropbox"

# If this is the first time running the container, will need to copy
# the magic_home folder into the local volumes
# if it doesn't exist, copy it across.
local_magic_folder=$my_local_volume/magic_home
[ ! -d "$local_magic_folder" ] && cp -rf magic_home $my_docker_volume/.

docker run -d -p 8787:8787 -p 3838:3838 -p 8888:8888 \
      -e DISPLAY=$my_ip:0 \
      -e MAGIC_FOLDER=$my_docker_volume \
      -v $my_local_volume:$my_docker_volume \
      -e DISABLE_AUTH=true \
      data_science_lab:ubuntu20_r420_202205
