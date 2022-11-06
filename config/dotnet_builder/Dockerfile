FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
RUN dotnet tool install --global dotnet-ef
ARG SSH_PRIVATE_KEY 
RUN apt-get -yq update && \ 
    apt-get -yqq install ssh git 
RUN mkdir /root/.ssh/ && \
    chmod 0700 /root/.ssh && \
    echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa && chmod 0700 /root/.ssh/id_rsa && \
    touch /root/.ssh/known_hosts && \
    ssh-keyscan github.com >> /root/.ssh/known_hosts 
