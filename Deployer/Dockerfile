
FROM dotnet-sdk-build-env:6.0 as release-env

WORKDIR /app
# Copy everything
ARG repository=brijeshtd/IdentityOne.git
ARG branch=main
ARG dbmigration=0
RUN git clone --single-branch --branch ${branch} git@github.com:${repository} ./

RUN dotnet restore
RUN dotnet publish -c Release -o out
ENV PATH $PATH:/root/.dotnet/tools
RUN [[ "${dbmigration}" == 1 ]] && dotnet-ef migrations script -o out/db.sql


# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
ARG DLL_RUNNER
COPY --from=release-env /app/out .
ENTRYPOINT ["dotnet", "${DLL_RUNNER}"]