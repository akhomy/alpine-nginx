# NGINX image for LAMP stack
NGINX image based on Alpine Linux.

## Include own configs
You could mount to `/temp_configs_dir` with your volume and use own configs. Variable **USE_ONLY_CONFIGS** - disable using the custom variables in the list below.

## How to run

Run image the on port 80, be aware first you need start proxy(in [docker-compose-lamp](https://github.com/a-kom/docker-compose-lamp) **APACHE2-MPM** container).

`docker run -v /hostDir:/var/www/localhost/htdocs -d -p 8003:80  -e LISTEN_PORT="80" -e PROXY_PASS="http://apache2_mpm:8080" --name nginx --link apache2_mpm lordius/alpine-nginx`

## Environment Variables

| Variable                          | Default Value | Description |
| --------------------------------- | ------------- | ----------- |
| KEEPALIVE_TIMEOUT                                 | `keepalive_timeout           3000`                                        | Line *`keepalive_timeout`* in the **/etc/nginx/nginx.conf**                                           |
| FASTCGI_READ_TIMEOUT                              | `fastcgi_read_timeout        300`                                         | Line *`fastcgi_read_timeout`* in the **/etc/nginx/nginx.conf**                                        |
| LISTEN_PORT                                       | `listen                  80`                                              | Line *`listen`* in the **/etc/nginx/nginx.conf**                                                      |
| LISTEN_SSL_PORT                                   | `listen              443 ssl`                                             | Line *`listen`* in the **/etc/nginx/nginx.conf**                                                      |
| GENERATE_SSL_KEY                                  |             0                                                              | Generates SSL keys **/etc/nginx/ssl/nginx-selfsigned.key**, **/etc/nginx/ssl/nginx-selfsigned.crt**   |
| SERVER_ROOT                                       | `root                    /var/www/localhost/htdocs`                       | Line *`root`* in the **/etc/nginx/nginx.conf**                                                        |
| SERVER_NAME                                       | `server_name             localhost`                                       | Line *`server_name`* in the **/etc/nginx/nginx.conf**                                                 |
| CLIENT_MAX_BODY_SIZE                              | `client_max_body_size    32m`                                             | Line *`client_max_body_size`* in the **/etc/nginx/nginx.conf**                                        |
| PROXY_CONNECT_TIMEOUT                             | `proxy_connect_timeout       600`                                         | Line *`proxy_connect_timeout`* in the **/etc/nginx/nginx.conf**                                       |
| PROXY_SEND_TIMEOUT                                | `proxy_send_timeout          600`                                         | Line *`proxy_send_timeout`* in the **/etc/nginx/nginx.conf**                                          |
| PROXY_READ_TIMEOUT                                | `proxy_read_timeout          600`                                         | Line *`proxy_read_timeout`* in the **/etc/nginx/nginx.conf**                                          |
| SEND_TIMEOUT                                      | `send_timeout                600`                                         | Line *`send_timeout`* in the **/etc/nginx/nginx.conf**                                                |
| FASTCGI_BUFFERS                                   | `fastcgi_buffers 16 16k`                                                  | Line *`fastcgi_buffers`* in the **/etc/nginx/nginx.conf**                                             |
| FASTCGI_BUFFER_SIZE                               | `fastcgi_buffer_size 32k`                                                 | Line *`fastcgi_buffer_size`* in the **/etc/nginx/nginx.conf**                                         |
| PROXY_BUFFER_SIZE                                 | `proxy_buffer_size   128k`                                                | Line *`proxy_buffer_size`* in the **/etc/nginx/nginx.conf**                                           |
| PROXY_BUFFERS                                     | `proxy_buffers   4 256k`                                                  | Line *`proxy_buffers`* in the **/etc/nginx/nginx.conf**                                               |
| PROXY_BUSY_BUFFER_SIZE                            | `proxy_busy_buffers_size   256k`                                          | Line *`proxy_busy_buffers_size`* in the **/etc/nginx/nginx.conf**                                     |
| PROXY_PASS                                        | `proxy_pass http://apache2_mpm:8080`                                      | Lines *`proxy_pass`* in the **/etc/nginx/nginx.conf**                                                 |

## Full LAMP stack

See [docker-compose-lamp](https://github.com/a-kom/docker-compose-lamp)
