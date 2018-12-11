#!/usr/bin/env sh
set -e

SERVER_CONFIG_PATH="${SERVER_CONFIG_PATH:-/etc/nginx/conf.d/default.conf}";

FPM_PORT="${FPM_PORT:-9000}";
FPM_HOST="${FPM_HOST:-dataserver}";
FPM_UPSTREAM_PARAMS="${FPM_UPSTREAM_PARAMS:-max_fails=3 fail_timeout=30s}";
ROOT_DIR="${ROOT_DIR:-/var/www}";
APP_BASE_URL="${APP_BASE_URL:-http://myapp.com/}";
ADDITIONAL_FPM_HOSTS="${ADDITIONAL_FPM_HOSTS:-# Additional fpm hosts not passed}";

SERVER_NAME="${SERVER_NAME:-localhost}";
SERVER_PATH="${SERVER_PATH:-/var/www/dataserver/public}";
CLIENT_PATH="${CLIENT_PATH:-/var/www/client}";
NGINX_PORT="${NGINX_PORT:-80}";

sed -i "s#%FPM_PORT%#${FPM_PORT}#g" "$SERVER_CONFIG_PATH";
sed -i "s#%FPM_HOST%#${FPM_HOST}#g" "$SERVER_CONFIG_PATH";
sed -i "s#%FPM_UPSTREAM_PARAMS%#${FPM_UPSTREAM_PARAMS}#g" "$SERVER_CONFIG_PATH";
sed -i "s#%ROOT_DIR%#${ROOT_DIR}#g" "$SERVER_CONFIG_PATH";
sed -i "s#%APP_BASE_URL%#${APP_BASE_URL}#g" "$SERVER_CONFIG_PATH";
sed -i "s^%ADDITIONAL_FPM_HOSTS%^${ADDITIONAL_FPM_HOSTS}^g" "$SERVER_CONFIG_PATH";

sed -i "s#%SERVER_NAME%#${SERVER_NAME}#g" "$SERVER_CONFIG_PATH";
sed -i "s#%SERVER_PATH%#${SERVER_PATH}#g" "$SERVER_CONFIG_PATH";
sed -i "s#%CLIENT_PATH%#${CLIENT_PATH}#g" "$SERVER_CONFIG_PATH";
sed -i "s#%NGINX_PORT%#${NGINX_PORT}#g" "$SERVER_CONFIG_PATH";

exec "$@";
