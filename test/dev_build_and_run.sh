#!/bin/bash

docker rmi django-gallery
docker build -t django-gallery .
docker run -it --rm --name my_gallery -p 8000:8000 django-gallery
