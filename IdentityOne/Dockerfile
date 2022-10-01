FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
RUN dotnet tool install --global dotnet-ef
WORKDIR /app

# Copy everything
RUN git clone https://github.com/brijeshtd/IdentityOne.git ./
# COPY ./IdentityOne ./
# Restore as distinct layers
RUN dotnet restore
# Build and publish a release
RUN dotnet publish -c Release -o out
ENV PATH $PATH:/root/.dotnet/tools
RUN dotnet-ef migrations script -o out/db.sql
# WORKDIR /app/IdentityOne
# RUN cp ./private-key.pem ./out/
# RUN cp ./public-key.pem ./out/


# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "IdentityOne.dll"]