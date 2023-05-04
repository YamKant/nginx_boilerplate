#!/bin/bash

CUR_PATH="$( cd "$( dirname "$0" )" && pwd -P )"
IMAGE_NAME=my-nginx:1.0

docker build -t $IMAGE_NAME $CUR_PATH
docker run -d -p 80:80 --name my-nginx $IMAGE_NAME
