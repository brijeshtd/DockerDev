Only initial setup of Environment
---------------------------

bash ./collect_base_images.sh
bash ./nginx_setup_certbot.sh


recreate the image
-----------------------

docker compose --env-file ./domain.env build  --no-cache   omadminapi

restart all 
-----------------------

 docker compose --env-file ./domain.env up -d

table creation
--------------------------

bash integral_migration.sh



####  SSO available at

https://tstportal.onlinemagic.in/sso/XXXX/XXXX


####  adminapi avaialable at 

https://tstadmin.onlinemagic.in/adminapi/XXXX/XXXX


####    APPS

        OmAdmin
        OmAdminApi
        OmCompany
        OmOnboard
        IdentityOne
        OmCustomer
        OmCarePackApi
        WhatsAppOne
        OmInventoryApi
        OmProductApi
        OmCustomerApi