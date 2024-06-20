FROM python:3.12-slim

WORKDIR /code

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt


ENV PYTHONUNBUFFERED=1 \
    LANG=C.UTF-8 \
    PORT=8000

COPY . .

EXPOSE $PORT

ENTRYPOINT ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:$PORT"]
