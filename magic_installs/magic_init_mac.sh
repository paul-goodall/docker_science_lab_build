#!/usr/bin/env bash

# Persistent home folder hack:
rm -rf /home/rstudio; ln -s ${MAGIC_FOLDER}/$DEFAULT_USER /home/$DEFAULT_USER;

mkdir -p /home/$DEFAULT_USER/.jupyter
mv /jupyter_notebook_config.json /home/$DEFAULT_USER/.jupyter/jupyter_notebook_config.json
chmod -R 755 /home/$DEFAULT_USER/.jupyter

cd ${MAGIC_FOLDER}
su $DEFAULT_USER -c "/opt/venv/reticulate/bin/jupyter notebook --no-browser --ip=0.0.0.0 --port=8888 --allow-root &"

/init
