for f in IdentityOne OmAdmin OmAdminApi OmCompany
do
mkdir -p ./$f/git/ && cp  ~/.ssh/id_ed25519 ./$f/git/
done 