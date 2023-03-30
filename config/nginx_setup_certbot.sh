#!/bin/bash
sudo cp ./nginx/nginx_before_cert.conf ./nginx/nginx.conf ;
sudo docker compose --env-file ./domain.env up  -d reverseproxy ;
sleep 2 ;
# create nginx.conf after succesfull certbot ssl creation
sudo docker compose --env-file ./domain.env  up  certbot && \



cd nginx && bash create_nginx_ssl_certbot.sh && \ 
cd .. && sudo cp ./nginx/nginx_created_cert.conf ./nginx/nginx.conf ;
sudo docker compose --env-file ./domain.env restart reverseproxy;


