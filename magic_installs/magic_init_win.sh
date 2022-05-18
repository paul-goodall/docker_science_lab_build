#!/usr/bin/sh

# =====
echo "copying dir:"
cp -rf /home/${DEFAULT_USER} /Volumes/${DEFAULT_USER}_temp
rm -rf /home/${DEFAULT_USER}; ln -s ${MAGIC_FOLDER} /home/${DEFAULT_USER};
chmod -R 755 /home/${DEFAULT_USER}

#sleep 1
#cd ${MAGIC_FOLDER}
#su rstudio -c "/opt/venv/reticulate/bin/jupyter notebook --no-browser --ip=0.0.0.0 --port=8888 --allow-root &"

# Must create this if it doesn't exist.  The default jupyter notebooks password is 'jupyter'
if [ ! -d "/home/${DEFAULT_USER}/.jupyter" ]
then
  mkdir -p /home/${DEFAULT_USER}/.jupyter
  cp /jupyter_notebook_config.json /home/${DEFAULT_USER}/.jupyter/jupyter_notebook_config.json
  chmod -R 755 /home/${DEFAULT_USER}/.jupyter
fi

# also create it if fresh start is true:
if [[ "$FRESH_START" == "yes" ]]; then
    echo "Running as a FRESH_START."
    mkdir -p /home/${DEFAULT_USER}/.jupyter
    cp /jupyter_notebook_config.json /home/${DEFAULT_USER}/.jupyter/jupyter_notebook_config.json
    chmod -R 755 /home/${DEFAULT_USER}/.jupyter
else
    echo "Running as a resumed session."
fi

if [ ! -d "/home/${DEFAULT_USER}/shiny-server" ]
then
    mv -f /srv/shiny-server /home/${DEFAULT_USER}/.
else
    rm -rf /srv/shiny-server
fi
ln -s /home/${DEFAULT_USER}/shiny-server /srv/shiny-server
chmod -R 755 /srv
chmod -R 755 /home/${DEFAULT_USER}

cp /dot_files/.bashrc /home/${DEFAULT_USER}/.
cp /dot_files/.bash_logout /home/${DEFAULT_USER}/.
cp /dot_files/.profile /home/${DEFAULT_USER}/.

/init
