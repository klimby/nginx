FROM nginx:1.15-alpine
LABEL e-nginx.description="nginx:1.15-alpine"

ENV SERVER_CONFIG_PATH /etc/nginx/conf.d/default.conf
ENV FPM_PORT 9000
ENV FPM_HOST dataserver
ENV ROOT_DIR /var/www
ENV SERVER_NAME localhost

ENV SERVER_PATH /var/www/dataserver/public
ENV CLIENT_PATH /var/www/client

# RUN set -x ; \
#  addgroup -g 82 -S www-data ; \
#  adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1

RUN apk --no-cache --update add nano

COPY ./etc/nginx.conf /etc/nginx/

RUN rm /etc/nginx/conf.d/*.conf

COPY ./etc/default.conf /etc/nginx/conf.d/
COPY ./etc/fastcgi_params /etc/nginx/fastcgi_params
COPY ./etc/html-errorpages /usr/share/nginx/html-errorpages
COPY ./etc/errorpages.conf /etc/nginx/errorpages.conf

COPY ./nginx-entrypoint.sh /nginx-entrypoint.sh

WORKDIR $ROOT_DIR

ENTRYPOINT ["/nginx-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]