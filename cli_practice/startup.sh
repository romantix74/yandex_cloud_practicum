#!/bin/bash
apt-get update
apt-get install -y nginx
service nginx start
sed -i -- "s/nginx/Yandex Cloud - LAPTOP-VUBIDHQF/" /var/www/html/index.nginx-debian.html
