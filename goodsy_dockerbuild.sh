#!/usr/bin/env bash

docker_file="${dockerfile_dir}/Cake_Dockerfile"
image_name="dsl_cake:${build_label}"
docker_stamp="Dockerfile_$(date +%Y.%m.%d-%H.%M.%S)"

docker build -f $docker_file \
             --build-arg docker_stamp=$docker_stamp \
             --build-arg docker_file=$docker_file \
             -t $image_name .


# =============
# add the following into your dockerfile just after the FROM line:
# -------------
#ARG docker_stamp
#ARG docker_file
#RUN mkdir -p /Dockerfiles
#COPY $docker_file /Dockerfiles/$docker_stamp
# =============
