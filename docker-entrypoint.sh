#!/bin/sh

set -e

if [ -n "$KEEPALIVE_TIMEOUT" ]; then
      sed -i 's@^    keepalive_timeout.*@'"    keepalive_timeout           ${KEEPALIVE_TIMEOUT};"'@' /etc/nginx/nginx.conf
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

if [ -n "$PROXY_PASS" ]; then
      sed -i 's@^            proxy_pass.*@'"            proxy_pass ${PROXY_PASS};"'@' /etc/nginx/nginx.conf
fi

nginx -g "daemon off;"
