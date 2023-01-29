

for f in BuildEnv 
do
mkdir -p ./$f/ && cp  ./Keys/git/id_rsa_git ./$f/
done 

