
# 1. Step to follow for updating the applications

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

    docker compose --env-file ./deploy.env --env-file ./domain.env up -d 

### only need to do if fresh database without migration    
    
    bash integral_migration.sh

### To View the services

    docker ps --format "{{.Names}} \t  {{.Status}} \t {{.Ports}}"
    
    docker ps
    
    docker ps -a
    
### restart the reverse proxy(nginx)

    sudo docker compose restart reverseproxy


# 2. Adding New service
    
  a) update docker-compose service.
  
  b) create directory and Dockerfile,appsettings,etc..
  
## a) example docker compose service part


          omadminapi:
            build:
              context: ./OmAdminApi/
            container_name: omadminapi
            command: ["dotnet","OmAdminApi.dll"]      
            environment:
              - ASPNETCORE_URLS=http://+:5000
              - RUNNER=OmAdminApi.dll      
            depends_on:
              - db
            volumes: 
              - ./OmAdminApi/appsettings.json:/app/appsettings.json
              - ./Keys/public-key.pem:/app/public-key.pem
  
 ## b) create the service folder which hold appsettings and other relevent file of the service.
        
        ## create folder
        
        mkdir OmAdminApi
        
        ## copy Dockerfile/ create Dockerfile
        
        cp <from_dir>  OmAdminApi/
        
        ## create appsettings
        
        vim appsettings.json
        
     
   
    