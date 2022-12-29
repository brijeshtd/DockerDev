
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

docker compose \
        --env-file ./deploy.env \
        --env-file ./domain.env \
        up -d 