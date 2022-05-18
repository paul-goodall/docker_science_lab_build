#!/usr/bin/env bash

echo "================ Entering magic_init_mac.sh ================"
# Persistent home folder hack:
com="rm -rf /home/rstudio ; ln -s ${MAGIC_FOLDER}/$DEFAULT_USER /home/$DEFAULT_USER"
echo "$com"
eval "$com"

com="cd /home/$DEFAULT_USER ; mkdir .jupyter"
echo "$com"
eval "$com"

com="mv /jupyter_notebook_config.json /home/$DEFAULT_USER/.jupyter/jupyter_notebook_config.json"
echo "$com"
eval "$com"

com="chmod -R 755 /home/$DEFAULT_USER/.jupyter"
echo "$com"
eval "$com"

com="cd ${MAGIC_FOLDER}"
echo "$com"
eval "$com"

com="su $DEFAULT_USER -c '/opt/venv/reticulate/bin/jupyter notebook --no-browser --ip=0.0.0.0 --port=8888 --allow-root &'"
echo "$com"
eval "$com"

echo "================ Finished magic_init_mac.sh ================"
