
## Step to follow for updating the applications

##### copy github key to the build container
                bash copy_key.sh

##### create build container image
This container will be ready to pull the repository from github
                bash setup_build_image.sh

####  Rebuild applications from github 

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

     We can build each application one by one specifying thier name
     
                docker compose build --no-cache <name>
    
    
### start application 

                docker compose \
                        --env-file ./deploy.env \
                        --env-file ./domain.env \
                        up -d 

                bash integral_migration.sh

                docker ps --format "{{.Names}} \t  {{.Status}} \t {{.Ports}}"

                sudo docker compose restart reverseproxy
