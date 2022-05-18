#!/usr/bin/env bash

if [ ! -d "/home/${DEFAULT_USER}/magic_home/magic_init/" ] || [ "$FRESH_START" == "yes" ]
then
  mkdir -p /home/${DEFAULT_USER}/magic_home/magic_init/
  cd /home/${DEFAULT_USER}/magic_home/magic_init/
  wget https://raw.githubusercontent.com/paul-goodall/docker_science_lab_build/main/magic_installs/magic_init_mac.sh
  wget https://raw.githubusercontent.com/paul-goodall/docker_science_lab_build/main/magic_installs/magic_init_win.sh
  chmod 755 magic_init_win.sh
  chmod 755 magic_init_mac.sh
fi

cd /home/${DEFAULT_USER}/magic_home/magic_init/
if [ "$HOST_OS" == "win" ]
then
  ./magic_init_win.sh
else
  ./magic_init_mac.sh
fi

/init
