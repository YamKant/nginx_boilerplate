#!/bin/bash
PARAM=${1:?"requires an argument. in: init, dp: deploy, rb: rollback"}

BLUE_SERVER_1_HOST=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' my-blue-server-1`
BLUE_SERVER_2_HOST=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' my-blue-server-2`
GREEN_SERVER_1_HOST=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' my-green-server-1`
GREEN_SERVER_2_HOST=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' my-green-server-2`

if [ -z "$GREEN_SERVER_1_HOST" -o  -z "$GREEN_SERVER_2_HOST" ]; then
  if [ $PARAM != 'in' ]; then
    echo "Turn on green servers first."
    exit
  fi
fi
 
if [ $PARAM == 'in' ]; then
  docker exec -it my-nginx /set_nginx_conf.sh server1 server2 $BLUE_SERVER_1_HOST $BLUE_SERVER_2_HOST
elif [ $PARAM == 'rb' ]; then
  docker exec -it my-nginx /set_nginx_conf.sh $GREEN_SERVER_1_HOST $GREEN_SERVER_2_HOST $BLUE_SERVER_1_HOST $BLUE_SERVER_2_HOST
else
  docker exec -it my-nginx /set_nginx_conf.sh $BLUE_SERVER_1_HOST $BLUE_SERVER_2_HOST $GREEN_SERVER_1_HOST $GREEN_SERVER_2_HOST
fi

# nginx reload in docker
docker exec -it my-nginx nginx -s reload
