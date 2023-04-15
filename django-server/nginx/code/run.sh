#!/bin/bash

DIR_PEM="/etc/letsencrypt/live/$NGINX_HOST"
if [ -d "$DIR_PEM" ]; then
  echo "OPEN SSL SETTING DONE"
else
  echo "OPEN SSL SETTING DOING"
  mkdir -p /etc/letsencrypt/live/$NGINX_HOST
  ### Take action if $DIR exists ###
  openssl req -x509 -nodes -newkey rsa:4096 -days 1\
    -keyout "/etc/letsencrypt/live/$NGINX_HOST/privkey.pem" \
    -out "/etc/letsencrypt/live/$NGINX_HOST/fullchain.pem" \
    -subj "/CN=localhost"
fi

bash /docker-entrypoint.d/20-envsubst-on-templates.sh
nginx -g "daemon off;"