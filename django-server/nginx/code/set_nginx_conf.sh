#!/bin/bash

sed -i 's|#// ||g' /etc/nginx/conf.d/default.conf
sed -i 's|server1|172.20.0.3|g' /etc/nginx/conf.d/default.conf
sed -i 's|server2|172.20.0.4|g' /etc/nginx/conf.d/default.conf

# nginx reload in docker
nginx -s reload

