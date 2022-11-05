## Edit domain list here
export CERT_MAIL="muslih@gksinfotech.in" && \
DOMAIN_LIST=("admin.onlinemagic.in" "portal.onlinemagic.in" "user.onlinemagic.in") && \
DOMAINS="" && for d in ${DOMAIN_LIST[@]};do DOMAINS="${DOMAINS} -d $d";done &&\
export DOMAIN="$DOMAINS" && \
export MAINDOMAIN=${DOMAIN_LIST[$1]} 