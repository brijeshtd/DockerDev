FROM mcr.microsoft.com/dotnet/sdk:6.0 as build-env
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 as release-env
WORKDIR /src
RUN git clone git@github.com:brijeshtd/IdentityOne.git ./
COPY ["src/IdentityOne.csproj", "WebApp/IdentityOne.WebApp/"]
RUN dotnet restore "WebApp/IdentityOne.WebApp/IdentityOne.csproj"
WORKDIR /src/WebApp/IdentityOne.WebApp
COPY . .
RUN dotnet build "IdentityOne.csproj" -c Release -o /app
#RUN dotnet ef database update

FROM build AS publish
RUN dotnet publish "IdentityOne.csproj" -c Release -o /app

FROM node:11.6.0-alpine as nodebuild
WORKDIR /src
COPY ["src/client", "ClientApp/"]
WORKDIR /src/ClientApp
RUN yarn
RUN yarn build

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
COPY --from=nodebuild /src/ClientApp/build /app/wwwroot
ENTRYPOINT ["dotnet", "IdentityOne.dll"]