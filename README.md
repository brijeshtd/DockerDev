### TEST ENVIRONMENT
---------------------------------

    This is the test environment of onlinemagic 

    This project has a micro-service Architechure including following service

#### certbot
------------
    Which gives certificate for our SSL encription
    To update the certificate only need to start this service,this will update the certificate and stop
    Need  to start this container at specific interval to update the certificate

#### nginx 
-------------
    nginx Serve as the reverse proxy , Share the Configuration with certbot to achieve Certified SSL encription
    nginx will be listen the trafic and distribute to other UI/UX services

### IdentityOne
---------------

    It is the serve  onlinemagic sigle sign on

### ompgsqlone
---------------
 It serve the database for the entire application right now.
 postgres tuning should be done.

 https://www.enterprisedb.com/postgres-tutorials/introduction-postgresql-performance-tuning-and-optimization