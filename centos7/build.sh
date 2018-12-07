#!/bin/sh

tag="0.2"
image_name="centos7-devtoolset-base"
echo "${image_name}:${tag}"

docker build  -f Dockerfile -t ${image_name}:${tag} .
#docker build --net=host --pull=true --no-cache=true -f Dockerfile -t ${image_name}:${tag} .