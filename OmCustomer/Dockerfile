FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
RUN dotnet tool install --global dotnet-ef
WORKDIR /app

RUN  apt-get -yq update && apt-get -yqq install ssh && mkdir /root/.ssh/ && chmod 0700 /root/.ssh
COPY ./git/id_ed25519 /root/.ssh/id_ed25519
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

# Copy everything
RUN git clone git@github.com:brijeshtd/OmCustomer.git ./
# COPY ./IdentityOne ./
# Restore as distinct layers
RUN dotnet restore
# Build and publish a release
RUN dotnet publish -c Release -o out

# WORKDIR /app/OmAdmin
# RUN cp ./public-key.pem ./out/

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "OmCustomer.dll"]