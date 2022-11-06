#!/bin/bash
sudo cp nginx/nginx_before_cert.conf nginx/nginx.conf 
sudo docker compose --env-file ./domain.env up -d reverseproxy 
sudo docker compose --env-file ./domain.env  up -d certbot 
cd nginx 
DOMAIN_LIST=("admin.onlinemagic.in", "portal.onlinemagic.in", "user.onlinemagic.in")
bash create_nginx_ssl_certbot.sh 
cd .. && sudo docker compose --env-file ./domain.env restart reverseproxy
sudo cp nginx/nginx_created_cert.conf nginx/nginx.conf 

