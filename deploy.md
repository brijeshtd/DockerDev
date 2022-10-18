### start nginx
-------------
edit ssh key path and run below
bash copy_key.sh

sudo docker compose up omadmin -d

 nginx
sudo cp nginx/nginx_before_cert.conf nginx/nginx.conf
sudo docker compose up -d reverseproxy
sudo docker compose up -d certbot
sudo cp nginx/nginx_after_cert.conf nginx/nginx.conf
sudo docker compose restart reverseproxy


sudo docker compose up -d identityone
sudo docker compose up -d omadminapi

bash integral_migration.sh

sudo docker compose up -d omadmin 
sudo docker compose up -d omcompany
