#!/bin/bash

mkdir -p /etc/letsencrypt/live/$NGINX_HOST
mkdir -p /var/www/certbot
openssl req -x509 -nodes -newkey rsa:4096 -days 1\
    -keyout "/etc/letsencrypt/live/$NGINX_HOST/privkey.pem" \
    -out "/etc/letsencrypt/live/$NGINX_HOST/fullchain.pem" \
    -subj "/CN=localhost"

bash /docker-entrypoint.d/20-envsubst-on-templates.sh
nginx -g "daemon off;"
