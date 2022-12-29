for f in BuildEnv 

        #  IdentityOne \
        #  OmAdmin \
        #  OmAdminApi \
        #  OmCompany \
        #  OmCustomer \
        #  OmOnboard \
        #  WhatsAppOne \
        #  OmInventoryApi \
        #  OmProductApi \
        #  OmCarePackApi \
        #  OmCustomerApi \
         

do
mkdir -p ./$f/ && cp  ./Keys/git/id_rsa_git ./$f/
done 
