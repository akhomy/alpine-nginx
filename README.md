### Nginx 1.10
Nginx 1.10 image based on Alpine linux.

### Available options
KEEPALIVE_TIMEOUT - keepalive_timeout param in nginx conf
FASTCGI_READ_TIMEOUT - fastcgi_read_timeout param in nginx conf
LISTEN_PORT  - port in which nginx will listen.
SERVER_ROOT - container root directory
SERVER_NAME - server name nginx param
CLIENT_MAX_BODY_SIZE - client_max_body_size param in nginx conf
PROXY_CONNECT_TIMEOUT - proxy_connect_timeout param in nginx conf
PROXY_SEND_TIMEOUT - proxy_send_timeout param in nginx conf
PROXY_READ_TIMEOUT - proxy_read_timeout param in nginx conf
SEND_TIMEOUT - send_timeout param in nginx conf
PROXY_PASS - proxy-container for processing php requests

### How to run

Run on port 80 image, be aware first you need start proxy php container, in our example proxy is apache2_mpm
docker run -v /hostDir:/var/www/localhost/htdocs -d -p 8003:80  -e LISTEN_PORT="80" -e PROXY_PASS="http://apache2_mpm:8080" --name nginx --link apache2_mpm lordius/alpine-nginx:nginx-1.10.1
