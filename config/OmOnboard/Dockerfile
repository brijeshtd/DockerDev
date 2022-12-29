# FROM mcr.microsoft.com/dotnet/sdk:6.0 as build-env
# RUN dotnet tool install --global dotnet-ef
# WORKDIR /app

# RUN  apt-get -yq update && apt-get -yqq install ssh && mkdir /root/.ssh/ && chmod 0700 /root/.ssh
# COPY ./id_rsa_git /root/.ssh/id_ed25519
# RUN chmod 0700 /root/.ssh/id_ed25519
# RUN touch /root/.ssh/known_hosts
# RUN ssh-keyscan github.com >> /root/.ssh/known_hosts


# FROM build-env as release-env

FROM dotnet-sdk-build-env:6.0 as release-env

# Copy everything
RUN git clone git@github.com:brijeshtd/OmOnboard.git ./
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
COPY --from=release-env /app/out .
ENTRYPOINT ["dotnet", "OmOnboard.dll"]