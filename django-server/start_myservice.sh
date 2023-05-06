#!/bin/bash
./nginx/docker_run.sh
./create_network.sh
docker network connect my-network my-nginx 
docker-compose -f ./server/docker-compose.yaml up -d