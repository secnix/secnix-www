# WordPress single site rules.
# Designed to be included in any server {} block.
# Upstream to abstract backend connection(s) for php

#server {
#        server_name  _;
#        return 302 $scheme://example.com$request_uri;
#}

upstream php {
        #server unix:/tmp/php-cgi.socket;
        server 192.168.33.10:9000;
}

server {

  server_name   www.example.com;
  root          /var/www/html;
  index         index.php index.html;

  location ~ \.(js|css|png|jpg|jpeg|gif|ico)$ {
    expires        2592000;   # 30 days
    log_not_found  off;
  }

  ## Trigger client to download instead of display '.xml' files.
  location ~ \.xml$ {
    add_header Content-disposition "attachment; filename=$1";
  }

  location ~ \.php$ {
    fastcgi_read_timeout  3600;
    include               /etc/nginx/fastcgi.conf;
    keepalive_timeout     0;
    fastcgi_param         SCRIPT_FILENAME  $document_root$fastcgi_script_name;
    fastcgi_pass          192.168.33.10:9000;
  }
}

server {
  server_name   example.com;
  rewrite       ^/(.*) http://www.example.com/$1 permanent;
}
