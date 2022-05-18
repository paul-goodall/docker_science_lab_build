#!/usr/bin/env bash

echo "================ Entering magic_init_mac.sh ================"
# Persistent home folder hack:
com=( rm -rf /home/rstudio ; ln -s ${MAGIC_FOLDER}/$DEFAULT_USER /home/$DEFAULT_USER )
printf '%q ' "${cmd[@]}"
printf '\n'
"${cmd[@]}"

com=( mkdir -p /home/$DEFAULT_USER/.jupyter )
printf '%q ' "${cmd[@]}"
printf '\n'
"${cmd[@]}"

com=( mv /jupyter_notebook_config.json /home/$DEFAULT_USER/.jupyter/jupyter_notebook_config.json )
printf '%q ' "${cmd[@]}"
printf '\n'
"${cmd[@]}"

com=( chmod -R 755 /home/$DEFAULT_USER/.jupyter )
printf '%q ' "${cmd[@]}"
printf '\n'
"${cmd[@]}"

com=( cd ${MAGIC_FOLDER} )
printf '%q ' "${cmd[@]}"
printf '\n'
"${cmd[@]}"

com=( su $DEFAULT_USER -c "/opt/venv/reticulate/bin/jupyter notebook --no-browser --ip=0.0.0.0 --port=8888 --allow-root &" )
printf '%q ' "${cmd[@]}"
printf '\n'
"${cmd[@]}"

echo "================ Finished magic_init_mac.sh ================"
