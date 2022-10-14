sudo docker cp identityone:/app/db.sql ./IdentityOne/
sudo docker cp omadminapi:/app/db.sql ./OmAdminApi/
sudo docker cp ./OmAdminApi/db.sql ompgsqlone:/db_omadminapi.sql
sudo docker cp ./IdentityOne/db.sql ompgsqlone:/db_identityone.sql
sudo docker exec -it ompgsqlone psql -U onlinemagic -d identityone -f /db_identityone.sql
sudo docker exec -it ompgsqlone psql -U onlinemagic -d om -f /db_omadminapi.sql
