#!/usr/bin/env bash

docker container stop data_science_lab
docker container prune -f
rm -rf magic_home
bash goodsy_dockerbuild_win.sh
bash goodsy_dockerrun_win.sh
docker ps
sleep 1
docker logs data_science_lab
