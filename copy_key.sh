for f in IdentityOne OmAdmin OmAdminApi OmCompany
do
sudo mkdir -p ./$f/git/ && sudo cp   /home/ubuntu/.ssh/id_ed25519 ./$f/git/
done
