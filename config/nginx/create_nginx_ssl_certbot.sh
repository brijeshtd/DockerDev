
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

        }
    
    " > ./nginx_created_cert.conf
for domain in ${DOMAIN_LIST[@]}
do echo $domain
    echo "
        server {
            listen 443 ssl http2;

            ssl_certificate     /etc/letsencrypt/live/${DOMAIN_LIST[$1]}/fullchain.pem;
            ssl_certificate_key /etc/letsencrypt/live/${DOMAIN_LIST[$1]}/privkey.pem;
            server_name $domain;


            location ~ /.well-known/acme-challenge/ {
                root /var/www/certbot;
            }
        }
    
    ">> ./nginx_created_cert.conf
done

echo '}' >> ./nginx_created_cert.conf
