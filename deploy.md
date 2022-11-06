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


sudo docker compose up -d --env-file ./deploy.env identityone
sudo docker compose up -d omadminapi

bash integral_migration.sh

sudo docker compose up -d omadmin 
sudo docker compose up -d omcompany
sudo docker compose up -d omcustomer


#### database 
sudo docker exec -it ompgsqlone psql -U onlinemagic -d identityone

sudo docker exec -it ompgsqlone psql -U onlinemagic -d om

sudo docker exec -it ompgsqlone psql -U onlinemagic -d om -c "select now();"

sudo docker exec -it ompgsqlone psql -U onlinemagic -d identityone -c "INSERT INTO public.roles(role_name, role_label, role_level, record_status) VALUES('super_admin', 'SUPER ADMIN', 1, 'ACTIVE');";

 sudo docker exec -it ompgsqlone psql -U onlinemagic -d identityone -c "INSERT INTO accounts(username, mobile, email_id, "password", email_verification, mobile_verification, record_status, created_ip, created_by, created_on, updated_by, updated_on) VALUES('brijeshtd', '9446075755', 'brijeshtd@gmail.com', 'c43ef6742abe9ae2e874541f729d468360ff1d8ea68ca148104c1f93a8b9a367', false, false, 'ACTIVE', '10.44.4.42', 1, now(), 1, now());"

 sudo docker exec -it ompgsqlone psql -U onlinemagic -d identityone -c "INSERT INTO public.account_roles(account_id, role_id, client_app, record_status, created_by, created_on, updated_by, updated_on) VALUES(1, 1, 'ADMIN', 'ACTIVE', 1, NOW(), 1, NOW());"

