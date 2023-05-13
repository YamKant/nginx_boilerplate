#!/bin/bash

SRC_SERVER1=$1
SRC_SERVER2=$2
TAR_SERVER1=$3
TAR_SERVER2=$4

# Firstly, remove the comment keywords
sed -i 's|#// ||g' /etc/nginx/conf.d/default.conf
# Secondly, set nginx upstream hostname
sed -i "s|${SRC_SERVER1}|${TAR_SERVER1}|g" /etc/nginx/conf.d/default.conf
sed -i "s|${SRC_SERVER2}|${TAR_SERVER2}|g" /etc/nginx/conf.d/default.conf

