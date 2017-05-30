### NGINX 1.10
<p>NGINX 1.10 image based on Alpine Linux.</p>

### Include own configs
<p>You could mount to <code>/temp_configs_dir</code> with your volume and use own configs.</p>
<p>USE_ONLY_CONFIGS - disable using of the custom ENV in list bellow.</p>

### Available options
<ul>
<li>KEEPALIVE_TIMEOUT - <code>/etc/nginx/nginx.conf keepalive_timeout</code></li>
<li>FASTCGI_READ_TIMEOUT - <code>/etc/nginx/nginx.conf fastcgi_read_timeout</code></li>
<li>LISTEN_PORT - <code>/etc/nginx/nginx.conf listen</code></li>
<li>LISTEN_SSL_PORT - <code>/etc/nginx/nginx.conf listen</code></li>
<li>GENERATE_SSL_KEY - <code>openssl req -x509 -nodes -subj '/CN=localhost/O=My Company Name LTD./C=US' -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx-selfsigned.key -out /etc/nginx/ssl/nginx-selfsigned.crt</code></li>
<li>SERVER_ROOT - <code>/etc/nginx/nginx.conf root</code></li>
<li>SERVER_NAME - <code>/etc/nginx/nginx.conf server_name</code></li>
<li>CLIENT_MAX_BODY_SIZE - <code>/etc/nginx/nginx.conf client_max_body_size</code></li>
<li>PROXY_CONNECT_TIMEOUT - <code>/etc/nginx/nginx.conf proxy_connect_timeout</code></li>
<li>PROXY_SEND_TIMEOUT - <code>/etc/nginx/nginx.conf proxy_send_timeout param</code></li>
<li>PROXY_READ_TIMEOUT - <code>/etc/nginx/nginx.conf proxy_read_timeout param</code></li>
<li>SEND_TIMEOUT - <code>/etc/nginx/nginx.conf send_timeout param</code></li>
<li>PROXY_PASS - <code>/etc/nginx/nginx.conf send_timeout</code></li>
</ul>

### How to run

<p>Run on port 80 image, be aware first you need start proxy php container, in our example proxy is apache2_mpm</p>
<code>docker run -v /hostDir:/var/www/localhost/htdocs -d -p 8003:80  -e LISTEN_PORT="80" -e PROXY_PASS="http://apache2_mpm:8080" --name nginx --link apache2_mpm lordius/alpine-nginx:nginx-1.10.1</code>
