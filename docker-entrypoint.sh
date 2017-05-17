#!/bin/sh

set -e

# Copy user defined configs from temp folder to existing.
if [ "$(ls -A /temp_configs_dir)" ]; then
  cp -f -R /temp_configs_dir/* /etc/
fi

if [ -n "$KEEPALIVE_TIMEOUT" ]; then
      sed -i 's@^    keepalive_timeout.*@'"    keepalive_timeout           ${KEEPALIVE_TIMEOUT};"'@' /etc/nginx/nginx.conf
fi

if [ -n "$FASTCGI_READ_TIMEOUT" ]; then
      sed -i 's@^    fastcgi_read_timeout.*@'"    fastcgi_read_timeout           ${FASTCGI_READ_TIMEOUT};"'@' /etc/nginx/nginx.conf
fi

if [ -n "$LISTEN_PORT" ]; then
      sed -i 's@^        listen.*@'"        listen                  ${LISTEN_PORT};"'@' /etc/nginx/nginx.conf
fi

if [ -n "$SERVER_ROOT" ]; then
      sed -i 's@^        root.*@'"        root                  ${SERVER_ROOT};"'@' /etc/nginx/nginx.conf
fi

if [ -n "$SERVER_NAME" ]; then
      sed -i 's@^        server_name.*@'"        server_name                  ${SERVER_NAME};"'@' /etc/nginx/nginx.conf
fi

if [ -n "$CLIENT_MAX_BODY_SIZE" ]; then
      sed -i 's@^        client_max_body_size.*@'"        client_max_body_size                  ${CLIENT_MAX_BODY_SIZE};"'@' /etc/nginx/nginx.conf
fi

if [ -n "$PROXY_CONNECT_TIMEOUT" ]; then
      sed -i 's@^        proxy_connect_timeout.*@'"        proxy_connect_timeout                  ${PROXY_CONNECT_TIMEOUT};"'@' /etc/nginx/nginx.conf
fi

if [ -n "$PROXY_SEND_TIMEOUT" ]; then
      sed -i 's@^        proxy_send_timeout.*@'"        proxy_send_timeout                  ${PROXY_SEND_TIMEOUT};"'@' /etc/nginx/nginx.conf
fi

if [ -n "$PROXY_READ_TIMEOUT" ]; then
      sed -i 's@^        proxy_read_timeout.*@'"        proxy_read_timeout                  ${PROXY_READ_TIMEOUT};"'@' /etc/nginx/nginx.conf
fi

if [ -n "$SEND_TIMEOUT" ]; then
      sed -i 's@^        send_timeout.*@'"        send_timeout                  ${SEND_TIMEOUT};"'@' /etc/nginx/nginx.conf
fi


if [ -n "$PROXY_PASS" ]; then
      sed -i 's@^            proxy_pass.*@'"            proxy_pass ${PROXY_PASS};"'@' /etc/nginx/nginx.conf
fi

nginx -g "daemon off;"
