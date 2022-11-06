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

SSH_PRIVATE_KEY=`cat ~/.ssh/id_ed25519`
docker build -t mcr.microsoft.com-dotnet-sdk-git:6.0 --build-arg SSH_PRIVATE_KEY="${SSH_PRIVATE_KEY}" - < ./dotnet_builder/Dockerfile