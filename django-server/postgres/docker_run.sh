#!/bin/bash

CUR_PATH="$( cd "$( dirname "$0" )" && pwd -P )"
IMAGE_NAME=my-postgres:1.0
MOUNT_DIR=$CUR_PATH/data/db

docker build -t $IMAGE_NAME $CUR_PATH
docker run -d -p 5431:5432 -v $MOUNT_DIR:/var/lib/postgresql/data --name my-postgres $IMAGE_NAME