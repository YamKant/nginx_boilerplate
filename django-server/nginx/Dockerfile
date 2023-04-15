FROM nginx:1.21.6

RUN apt-get update
RUN apt-get install -y openssl

COPY ./code/nginx.conf /etc/nginx/nginx.conf

# CMD ["/bin/bash", "/run.sh"]