#!/bin/bash

source ../domain_env.sh

sudo cp nginx/nginx_before_cert.conf nginx/nginx.conf \ &&
sudo docker compose up -d reverseproxy \ &&
sudo docker compose up -d certbot \ &&
cd nginx \ &&
bash create_nginx_ssl_certbot.sh \&&
cd .. \&&
sudo docker compose restart reverseproxy
