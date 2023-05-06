FROM nginx:1.21.6

RUN apt-get update
RUN apt-get install -y openssl

COPY ./code/nginx.conf /etc/nginx/nginx.conf
COPY ./code/run.sh /run.sh
COPY ./code/templates /etc/nginx/templates

ENV NGINX_HOST localhost
ENV INITIAL_START 1

CMD ["/bin/bash", "/run.sh"]