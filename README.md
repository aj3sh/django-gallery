# Django Gallery

Django Gallery is a web based project written in Python/Django framework. It contains a collection of Django codes that helps build a project.

## Running the project on docker

### For Development

#### Build docker image

```bash
docker build -t django-gallery .
```

#### Run docker container

```bash
docker run -it --name my_gallery -p 8000:8000 django-gallery
```

#### Using Docker Compose

Create a `.env.compose` file.

```bash
cp .env.compose.example .env.compose
```

Build and run container

```bash
docker-compose up --build
```

### For Production

#### Build docker image

```bash
docker build -t django-gallery -f Dockerfile.prod .
```

#### Build nginx image

```bash
docker build -t django-gallery-nginx -f nginx/Dockerfile .
```

#### Run docker containers

Create bridge network

```bash
docker network create django-gallery
```

Run django container

```bash
docker run -it --name my_gallery --network django-gallery --network-alias web -p 8000:8000 django-gallery
```

Run nginx container

```bash
docker run -it --name my_nginx --network django-gallery -p 80:80 django-gallery-nginx
```

#### Using Docker Compose

```bash
docker-compose -f docker-compose.prod.yml up --build
```
