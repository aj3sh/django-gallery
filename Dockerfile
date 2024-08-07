FROM python:3.12-slim

WORKDIR /code

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    LANG=C.UTF-8 \
    PORT=8000

COPY . .

# For suppressing warning (.env not used inside the container)
RUN touch django_gallery/.env

VOLUME /code/media

EXPOSE $PORT

ENTRYPOINT ["sh", "-c", "\
    python manage.py migrate --no-input && \
    python manage.py runserver 0.0.0.0:$PORT \
"]
