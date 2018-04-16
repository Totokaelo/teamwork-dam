#!/bin/sh

TEAMWORK_DAM_HOST=https://teamwork-dam.appspot.com/
SPOKE_DAM_API_KEY=dG90b2thZWxvIDU3Mjc0MjU5NTQ1Nzg0MzIgMkRDbkp3UkJWOGRqTlMzMEtZSEptM29PS2xRekxIMzA=

curl \
  -s \
  -H "Content-Type: application/json" \
  -H "Access-Token: $SPOKE_DAM_API_KEY" \
  -H "svs-namespace: totokaelo" \
  -X "POST" -d '{ "styleNo": "157060" }' \
  "$TEAMWORK_DAM_HOST/external-api/media/get-style"
