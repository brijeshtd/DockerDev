#!/bin/bash

for image in   nginx \
                postgres:14.5-bullseye \
                certbot/certbot \
                mcr.microsoft.com/dotnet/sdk:6.0 \
                mcr.microsoft.com/dotnet/aspnet:6.0 \
                python:3.10-slim-bullseye 
do 
docker pull $image
done
cd dotnet_builder/
SSH_PRIVATE_KEY=`cat ./id_rsa`
docker build -t mcr.microsoft.com-dotnet-sdk:6.0 --build-arg SSH_PRIVATE_KEY="${SSH_PRIVATE_KEY}" .
cd ..
