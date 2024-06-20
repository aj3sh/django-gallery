# Django Gallery

Django Gallery is a web based project written in Python/Django framework. It contains a collection of Django codes that helps build a project.

## Running the project on docker

### Build docker image
```bash
docker build -t django-gallery .
```

### Run docker container
```bash
docker run -it --name my_gallery -p 8000:8000 django-gallery
```