#!/usr/bin/bash

SERVER_IP="${1}"

REALITY_SHORT_ID="$(sing-box generate rand 8 --hex)"
_REALITY_KEYS="$(sing-box generate reality-keypair)"
REALITY_PRIVATE_KEY="$(echo "${_REALITY_KEYS}" | awk '/PrivateKey:/ {print $2}')"
REALITY_PUBLIC_KEY="$(echo "${_REALITY_KEYS}" | awk '/PublicKey:/ {print $2}')"

VLESS_USER_UUID="$(sing-box generate uuid)"

SALAMANDER_OBFS_PASSWORD="$(sing-box generate rand 24 --base64)"

HYSTERIA2_USER_PASSWORD="$(sing-box generate rand 32 --base64)"
HYSTERIA2_CERT_HASH="$(openssl x509 -in server/hysteria2/server.crt -pubkey -noout \
    | openssl pkey -pubin -outform der \
    | openssl dgst -sha256 -binary \
    | openssl enc -base64)"

sed -i \
    -e "s|SERVER_IP|${SERVER_IP}|g" \
    -e "s|REALITY_PUBLIC_KEY|${REALITY_PUBLIC_KEY}|g" \
    -e "s|REALITY_SHORT_ID|${REALITY_SHORT_ID}|g" \
    -e "s|VLESS_USER_UUID|${VLESS_USER_UUID}|g" \
    -e "s|SALAMANDER_OBFS_PASSWORD|${SALAMANDER_OBFS_PASSWORD}|g" \
    -e "s|HYSTERIA2_USER_PASSWORD|${HYSTERIA2_USER_PASSWORD}|g" \
    -e "s|HYSTERIA2_CERT_HASH|${HYSTERIA2_CERT_HASH}|g" \
    client/config.json

sed -i \
    -e "s|REALITY_PRIVATE_KEY|${REALITY_PRIVATE_KEY}|g" \
    -e "s|REALITY_SHORT_ID|${REALITY_SHORT_ID}|g" \
    -e "s|VLESS_USER_UUID|${VLESS_USER_UUID}|g" \
    -e "s|SALAMANDER_OBFS_PASSWORD|${SALAMANDER_OBFS_PASSWORD}|g" \
    -e "s|HYSTERIA2_USER_PASSWORD|${HYSTERIA2_USER_PASSWORD}|g" \
    server/config.json
