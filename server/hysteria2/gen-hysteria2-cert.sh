#!/usr/bin/bash

openssl req -x509 -newkey rsa:2048 -sha384 -days 3650 -noenc \
    -keyout server.key \
    -out server.crt \
    -subj "/CN=cloud.google.com" \
    -addext "subjectAltName=DNS:cloud.google.com"
