FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
RUN dotnet tool install --global dotnet-ef
ARG SSH_PRIVATE_KEY
RUN  apt-get -yq update && \ 
    apt-get -yqq install ssh git  && \
    mkdir /root/.ssh/ && \
    chmod 0700 /root/.ssh && \
    echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa && \
    touch /root/.ssh/known_hosts && \
    ssh-keyscan github.com >> /root/.ssh/known_hosts

FROM build-env as build-stage

WORKDIR /app
# Copy everything
RUN git clone git@github.com:brijeshtd/OmAdmin.git ./
# Restore as distinct layers
RUN dotnet restore
# Build and publish a release
RUN dotnet publish -c Release -o out


# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build-stage /app/out .

ENTRYPOINT ["dotnet", "OmAdmin.dll"]