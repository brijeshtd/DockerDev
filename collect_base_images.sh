#!/bin/bash

for image in   nginx \
                postgres:14.5-bullseye \
                certbot/certbot \
                mcr.microsoft.com/dotnet/sdk:6.0 \
                mcr.microsoft.com/dotnet/aspnet:6.0 \
                python:3.10-slim-bullseye \
                rabbitmq:3.11-management
do 
docker pull $image
done
