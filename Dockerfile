# Nginx config
#
# VERSION               0.1.0

FROM nginx:1.15-alpine

ARG NGINX_HOST=test.local;
ARG NGINX_PHP_APP=127.0.0.1;

RUN set -x ; \
  addgroup -g 82 -S www-data ; \
  adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1


ADD nginx.conf /etc/nginx/
# ADD prod/nginx/default.conf /etc/nginx/conf.d/
ADD site.template /etc/nginx/conf.d/

CMD /bin/sh -c "envsubst '\$NGINX_HOST \$NGINX_PHP_APP' < /etc/nginx/conf.d/site.template > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"

WORKDIR /var/www/