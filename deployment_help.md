

### copy appsettings

        for f in IdentityOne OmAdmin OmAdminApi OmCarePackApi \
                OmCompany OmCustomer OmCustomerApi OmEmailApi \
                OmInventoryApi OmNotificationApi OmOnboard \
                OmProductApi OmServiceApi OmWhatsappApi \
                OmWhatsappWebhook 
        do 
        mkdir -p ./settings/$f/
        cp /root/testenv/DockerDev/config/$f/appsettings.json ./settings/$f/
        done 


### clean docker images


for ima in $(sudo docker images -a | grep none | awk '{ print $3; }')
do
sudo docker image rm $ima
done