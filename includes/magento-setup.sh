#!/bin/bash
source includes/core.sh
:: "Start"
## Create User and setup 2FA
## Configure 2FA provider
OTPAUTH_QRI=
TFA_SECRET=$(echo -n \'${SECURITY_TFA_GOOGLE_SECRET}\' | base64)
OTPAUTH_URL=$(printf "otpauth://totp/%s%%3Alocaladmin%%40example.com?issuer=%s&secret=%s" \
    "${TRAEFIK_SUBDOMAIN}.${TRAEFIK_DOMAIN}" "${TRAEFIK_SUBDOMAIN}.${TRAEFIK_DOMAIN}" "${TFA_SECRET}"
)
OATHTOOL=$(warden env exec -T php-fpm bash -c "oathtool -s 30 -w 10 --totp --base32 \"${TFA_SECRET}\"")
warden env exec -T php-fpm bash -c "
### Generate localadmin user
bin/magento admin:user:create \
    --admin-password=\"${ADMIN_PASS}\" \
    --admin-user=\"${ADMIN_USER}\" \
    --admin-firstname=\"Local\" \
    --admin-lastname=\"Admin\" \
    --admin-email=\"${ADMIN_USER}@example.com\"
printf \"u: %s\np: %s\n\" \"${ADMIN_USER}\" \"${ADMIN_PASS}\"

bin/magento config:set --lock-env twofactorauth/general/force_providers google
bin/magento security:tfa:google:set-secret \"${ADMIN_USER}\" \"${TFA_SECRET}\"

printf \"%s\n\n\" \"${OTPAUTH_URL}\"
printf \"2FA Authenticator Codes:\n%s\n\" \"${OATHTOOL}\"

segno \"${OTPAUTH_URL}\" -s 4 -o \"pub/media/${ADMIN_USER}-totp-qr.png\"
printf \"%s\n\n\" \"https://${TRAEFIK_SUBDOMAIN}.${TRAEFIK_DOMAIN}/media/${ADMIN_USER}-totp-qr.png?t=$(date +%s)\"
"
:: "Finished."
