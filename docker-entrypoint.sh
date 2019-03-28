#!/bin/sh

set -e

# Copy user defined configs from temp folder to existing.
if [ "$(ls -A /temp_configs_dir)" ]; then
    cp -f -R /temp_configs_dir/* /etc/
fi

if [ -z "$USE_ONLY_CONFIGS" ]; then

    if [ -n "$KEEPALIVE_TIMEOUT" ]; then
        sed -i 's@^    keepalive_timeout.*@'"    keepalive_timeout           ${KEEPALIVE_TIMEOUT};"'@' /etc/nginx/nginx.conf
    fi

    if [ -n "$FASTCGI_READ_TIMEOUT" ]; then
        sed -i 's@^    fastcgi_read_timeout.*@'"    fastcgi_read_timeout           ${FASTCGI_READ_TIMEOUT};"'@' /etc/nginx/nginx.conf
    fi

    if [ -n "$LISTEN_PORT" ]; then
        sed -i 's@^        listen                  80;.*@'"        listen                  ${LISTEN_PORT};"'@' /etc/nginx/nginx.conf
    fi

    if [ -n "$LISTEN_SSL_PORT" ]; then
        sed -i 's@^        listen              443 ssl;.*@'"        listen                  ${LISTEN_SSL_PORT} ssl;"'@' /etc/nginx/nginx.conf
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

    if [ -n "$FASTCGI_BUFFERS" ]; then
        sed -i 's@^        fastcgi_buffers.*@'"        fastcgi_buffers                  ${FASTCGI_BUFFERS};"'@' /etc/nginx/nginx.conf
    fi

    if [ -n "$FASTCGI_BUFFER_SIZE" ]; then
        sed -i 's@^        fastcgi_buffer_size.*@'"        fastcgi_buffer_size                  ${FASTCGI_BUFFER_SIZE};"'@' /etc/nginx/nginx.conf
    fi

    if [ -n "$PROXY_BUFFER_SIZE" ]; then
        sed -i 's@^        proxy_buffer_size.*@'"        proxy_buffer_size                  ${PROXY_BUFFER_SIZE};"'@' /etc/nginx/nginx.conf
    fi

    if [ -n "$PROXY_BUFFERS" ]; then
        sed -i 's@^        proxy_buffers.*@'"        proxy_buffers                  ${PROXY_BUFFERS};"'@' /etc/nginx/nginx.conf
    fi

    if [ -n "$PROXY_BUSY_BUFFER_SIZE" ]; then
        sed -i 's@^        proxy_busy_buffers_size.*@'"        proxy_busy_buffers_size                 ${PROXY_BUSY_BUFFER_SIZE};"'@' /etc/nginx/nginx.conf
    fi

    if [ -n "$PROXY_PASS" ]; then
            sed -i 's@^            proxy_pass.*@'"            proxy_pass ${PROXY_PASS};"'@' /etc/nginx/nginx.conf
    fi

    if  [ -n "$OPENSSL_ARGS" ]; then
      if [ -s /etc/nginx/ssl/nginx-selfsigned.custom.key ] || [ -s /etc/nginx/ssl/nginx-selfsigned.custom.key ]; then
            openssl "$OPENSSL_ARGS" -keyout /etc/nginx/ssl/nginx-selfsigned.custom.key -out /etc/nginx/ssl/nginx-selfsigned.custom.crt
            cp /etc/nginx/ssl/nginx-selfsigned.custom.key /etc/nginx/ssl/nginx-selfsigned.key
            cp /etc/nginx/ssl/nginx-selfsigned.custom.crt /etc/nginx/ssl/nginx-selfsigned.crt
      fi
    fi

fi

nginx -g "daemon off;"
