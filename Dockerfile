#lordius/alpine-nginx:nginx-1.10.1
FROM alpine:3.4
MAINTAINER lordius<andriy.khomych@gmail.com>
#Variables
ENV KEEPALIVE_TIMEOUT 3000
ENV FASTCGI_READ_TIMEOUT 3000
ENV LISTEN_PORT 80
ENV SERVER_ROOT /var/www/localhost/htdocs
ENV SERVER_NAME localhost
ENV CLIENT_MAX_BODY_SIZE 32m
ENV PROXY_CONNECT_TIMEOUT 600
ENV PROXY_SEND_TIMEOUT 600
ENV PROXY_READ_TIMEOUT 600
ENV SEND_TIMEOUT 600
ENV PROXY_PASS http://apache2_mpm:8080
#Install packages
RUN apk add --no-cache nginx
RUN adduser -D -u 1000 -g 'www' www
#RUN mkdir /var/www/localhost/htdocs
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /var/www/localhost/htdocs
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
#Configure nginx by copy our config files
#RUN rm /etc/nginx/nginx.conf
ADD configs/nginx/nginx.conf /etc/nginx/nginx.conf
ADD configs/nginx/proxy_params /etc/nginx/proxy_params
#Clean trash
RUN  rm -rf /var/lib/apt/lists/* && \
     rm -rf /var/cache/apk/* && \
     rm -rf /var/www/localhost/htdocs/*

#Setup temp directory
WORKDIR /var/www/localhost/htdocs
VOLUME ["/var/www/localhost/htdocs"]     
COPY docker-entrypoint.sh /usr/local/bin/ 
RUN  chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 80
