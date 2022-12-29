

bash copy_key.sh

bash setup_build_image.sh

docker compose build --no-cache \
ominventoryapi \
omproductapi \
omcustomerapi \
whatsappone \
omcarepackapi \
omadmin \
omcompany \
omonboard \
omcustomer \
omadminapi \
identityone 

or 

docker compose build --no-cache

docker compose \
        --env-file ./deploy.env \
        --env-file ./domain.env \
        up -d 

bash integral_migration.sh

docker ps --format "{{.Names}} \t  {{.Status}} \t {{.Ports}}"