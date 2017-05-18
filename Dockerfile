#lordius/alpine-nginx:nginx-1.10.1
FROM alpine:3.4
MAINTAINER lordius<andriy.khomych@gmail.com>
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

#Create /temp_configs_dir for use
RUN mkdir /temp_configs_dir && chmod -R +x /temp_configs_dir && cd /temp_configs_dir

#Setup temp directory
WORKDIR /var/www/localhost/htdocs
VOLUME ["/var/www/localhost/htdocs"]     
COPY docker-entrypoint.sh /usr/local/bin/ 
RUN  chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 80
