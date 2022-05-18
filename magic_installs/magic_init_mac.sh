#!/usr/bin/env bash

echo "================ Entering magic_init_mac.sh ================"
# Persistent home folder hack:
com=( rm -rf /home/rstudio ; ln -s ${MAGIC_FOLDER}/$DEFAULT_USER /home/$DEFAULT_USER )
echo "$cmd"
eval "$cmd"

com=( mkdir -p /home/$DEFAULT_USER/.jupyter )
echo "$cmd"
eval "$cmd"

com=( mv /jupyter_notebook_config.json /home/$DEFAULT_USER/.jupyter/jupyter_notebook_config.json )
echo "$cmd"
eval "$cmd"

com=( chmod -R 755 /home/$DEFAULT_USER/.jupyter )
echo "$cmd"
eval "$cmd"

com=( cd ${MAGIC_FOLDER} )
echo "$cmd"
eval "$cmd"

com=( su $DEFAULT_USER -c "/opt/venv/reticulate/bin/jupyter notebook --no-browser --ip=0.0.0.0 --port=8888 --allow-root &" )
echo "$cmd"
eval "$cmd"

echo "================ Finished magic_init_mac.sh ================"
