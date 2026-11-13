#!/bin/sh
set -u
set -e
mkdir -p /data
F=/data/shared-secret
if [ ! -s "$F" ]; then head -c 24 /dev/urandom | base64 | tr -d '\n' > "$F"; fi
export PS_SHARED_SECRET_FILE="$F"
exec /app/docker-entrypoint -db /data/store.db
