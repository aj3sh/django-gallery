#!/bin/bash

docker rmi dg-nginx
docker build -t dg-nginx -f nginx/Dockerfile .
docker run -it --rm --name nginx_gallery -p 80:80 dg-nginx
