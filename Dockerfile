FROM nginx:1.21.6

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./init.sh /init.sh
COPY ./html /usr/share/nginx/html

CMD ["/bin/bash", "init.sh"]