#!/bin/bash

CUR_PATH="$( cd "$( dirname "$0" )" && pwd -P )"
IMAGE_NAME=my-nginx:1.0
MOUNT_DIR=$CUR_PATH/code/logs

docker build -t $IMAGE_NAME $CUR_PATH
docker run -d -p 80:80 -p 443:443 -v $MOUNT_DIR:/var/log/nginx/logs --name my-nginx $IMAGE_NAME
