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

echo "환경변수 출력"
echo $INITIAL_START

# nginx 실행 전 템플릿 파일의 변수를 환경 변수 값으로 변경해주는 구문입니다.
if [ "$INITIAL_START" -eq '1' ]; then
  bash /docker-entrypoint.d/20-envsubst-on-templates.sh
  INITIAL_START="0"
fi
nginx -g "daemon off;"