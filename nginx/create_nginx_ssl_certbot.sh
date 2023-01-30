DOMAIN_LIST=("admin.onlinemagic.in" "portal.onlinemagic.in" "user.onlinemagic.in" "onboarding.onlinemagic.in")
SERVER_LIST=("omadmin" "omcompany" "omcustomer" "omonboard")
echo "
worker_processes 1;
events {
    # worker_connections  1024;
}
http {
    server_tokens off;
    charset utf-8;

    # always redirect to https
    server {
        listen 80 default_server;

        server_name _;

        return 301 https://$host$request_uri;
    } 
    server {
            listen 443 ssl http2;

            ssl_certificate     /etc/letsencrypt/live/${DOMAIN_LIST[$1]}/fullchain.pem;
            ssl_certificate_key /etc/letsencrypt/live/${DOMAIN_LIST[$1]}/privkey.pem;
            server_name _ ;
            return 404;

    location ~ /.well-known/acme-challenge/ {
                root /var/www/certbot;
            }
        }

    
    " > ./nginx_created_cert.conf
for i in 0 1 2 3
do 

    echo "
        server {
            listen 443 ssl http2;

            ssl_certificate     /etc/letsencrypt/live/${DOMAIN_LIST[$1]}/fullchain.pem;
            ssl_certificate_key /etc/letsencrypt/live/${DOMAIN_LIST[$1]}/privkey.pem;
            server_name ${DOMAIN_LIST[$"$i"]};
            
        location /images/ {
            sendfile           on;
            sendfile_max_chunk 1m;
            root /var/www/static_volume;

            }

        location / {
                proxy_pass http://${SERVER_LIST[$"$i"]}:5000;
            }
        location ~ /.well-known/acme-challenge/ {
                root /var/www/certbot;
            }
        }
    
    ">> ./nginx_created_cert.conf
done

echo '}' >> ./nginx_created_cert.conf
