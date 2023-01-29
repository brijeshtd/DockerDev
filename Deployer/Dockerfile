
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
RUN if [[ "${dbmigration}" == 1 ]] ;then dotnet-ef migrations script -o out/db.sql ; fi


# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY entrypoint.sh /entrypoint.sh
COPY public-key.pem .
ARG DLL_RUNNER
ENV RUNNER=${DLL_RUNNER}
COPY --from=release-env /app/out .
ENTRYPOINT ["bash", "/entrypoint.sh"]