FROM nginx:1.21.6

RUN apt-get update \
    && apt-get install -y openssl \
	&& apt-get install -y certbot \
	&& apt-get install -y python3-certbot-nginx

COPY ./nginx.conf /etc/nginx/nginx.conf

CMD ["/bin/bash", "init.sh"]