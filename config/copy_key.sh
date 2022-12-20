for f in IdentityOne OmAdmin OmAdminApi OmCompany OmCustomer OmOnboard
do
mkdir -p ./$f/ && cp  ./Keys/git/id_rsa_git ./$f/
done 
