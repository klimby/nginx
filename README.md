![Version v1.0.0](https://img.shields.io/badge/version-v1.0.0-blue.svg?style=plastic "Version v1.0.0")
![NGINX v1.21.6](https://img.shields.io/badge/NGINX-v1.21.6-blue.svg?style=plastic "NGINX v1.21.6")

[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow.svg)](https://conventionalcommits.org)

![Docker 20.10](https://img.shields.io/badge/Docker-20.10-blue.svg?style=plastic "Docker 20.10")

![example workflow](https://github.com/klimby/postgres/actions/workflows/docker-image.yml/badge.svg)


# NGINX docker image

NGINX docker aplpine based image.

```
git clone ssh://git@github.com/klimby/nginx.git

cd nginx

npm install
```


### Docker hub

[Docker Hub Repository.](https://hub.docker.com/repository/docker/klimby/nginx/general)

```
docker push klimby/nginx:latest
```

### Docker compose example

```
  &nginx nginx:
    image: klimby/nginx:latest
    container_name: nginx-test
    hostname: *nginx
    ports: ["8080:80"]
    volumes:
      - ./app:/app // app dir
      - ./default.conf:/etc/nginx/conf.d/default.conf:ro // nginx config
    networks:
      - nginx-test

```

