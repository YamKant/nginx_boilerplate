FROM nginx:1.21.6

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./init.sh /init.sh

ENV NGINX_HOST=yourwish.kr
ENTRYPOINT ["/bin/bash", "init.sh"]

EXPOSE 80
