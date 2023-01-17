FROM nginx:1.21.6

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./init.sh /init.sh
COPY ./templates /etc/nginx/templates
COPY ./html /usr/share/nginx/html

ENV NGINX_HOST=yourwish.kr
ENV NGINX_PORT=8000
ENTRYPOINT ["/bin/bash", "init.sh"]

EXPOSE 80
