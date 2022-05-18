#!/usr/bin/sh

cp -rf /home/rstudio /Volumes/rstudio_temp
rm -rf /home/$DEFAULT_USER; ln -s ${MAGIC_FOLDER} /home/$DEFAULT_USER;
chmod -R 755 ${MAGIC_FOLDER}

#sleep 1
#cd ${MAGIC_FOLDER}
#su rstudio -c "/opt/venv/reticulate/bin/jupyter notebook --no-browser --ip=0.0.0.0 --port=8888 --allow-root &"

# Must create this if it doesn't exist.  The default jupyter notebooks password is 'jupyter'
if [ ! -d "${MAGIC_FOLDER}/.jupyter" ]
then
  mkdir -p ${MAGIC_FOLDER}/.jupyter
  cp /jupyter_notebook_config.json ${MAGIC_FOLDER}/.jupyter/jupyter_notebook_config.json
  chmod -R 755 ${MAGIC_FOLDER}/.jupyter
fi

# also create it if fresh start is true:
if [[ "$FRESH_START" == "yes" ]]; then
    echo "Running as a FRESH_START."
    mkdir -p ${MAGIC_FOLDER}/.jupyter
    cp /jupyter_notebook_config.json ${MAGIC_FOLDER}/.jupyter/jupyter_notebook_config.json
    chmod -R 755 ${MAGIC_FOLDER}/.jupyter
else
    echo "Running as a resumed session."
fi

if [ ! -d "${MAGIC_FOLDER}/shiny-server" ]
then
    mv -f /srv/shiny-server ${MAGIC_FOLDER}/.
else
    rm -rf /srv/shiny-server
fi
ln -s ${MAGIC_FOLDER}/shiny-server /srv/shiny-server
chmod -R 755 /srv
chmod -R 755 ${MAGIC_FOLDER}

cp /dot_files/.bashrc ${MAGIC_FOLDER}/.
cp /dot_files/.bash_logout ${MAGIC_FOLDER}/.
cp /dot_files/.profile ${MAGIC_FOLDER}/.

/init
