FROM nginx:1.21.6-alpine
LABEL e-nginx.description="nginx:1.21.6-alpine"

COPY ./conf/nginx.conf /etc/nginx/

RUN rm /etc/nginx/conf.d/*.conf
