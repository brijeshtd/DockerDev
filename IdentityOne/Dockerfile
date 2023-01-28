
FROM dotnet-sdk-build-env:6.0 as release-env

WORKDIR /app
# Copy everything
ARG repository=brijeshtd/IdentityOne.git
ARG branch=main
RUN git clone --single-branch --branch ${branch} git@github.com:${repository} ./

RUN dotnet restore
RUN dotnet publish -c Release -o out
ENV PATH $PATH:/root/.dotnet/tools
RUN dotnet-ef migrations script -o out/db.sql


# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=release-env /app/out .
ENTRYPOINT ["dotnet", "IdentityOne.dll"]