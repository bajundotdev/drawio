#!/usr/bin/env bash
# Encodes deploy/preconfig.js and deploy/postconfig.js as base64 and writes
# them into .env alongside the other docker-compose variables.
set -euo pipefail

cd "$(dirname "$0")/.."

PRECONFIG_B64=$(base64 -i deploy/preconfig.js | tr -d '\n')
POSTCONFIG_B64=$(base64 -i deploy/postconfig.js | tr -d '\n')

cat > .env <<EOF
PUBLIC_DNS=https://yourdomain.com
DRAWIO_CONFIG_PRECONFIG=${PRECONFIG_B64}
DRAWIO_CONFIG_POSTCONFIG=${POSTCONFIG_B64}
DRAWIO_GOOGLE_CLIENT_ID=
DRAWIO_MSGRAPH_CLIENT_ID=
EOF

echo "Wrote .env"
