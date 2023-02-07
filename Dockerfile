# Dockerfile
FROM python:3.8-slim-buster

COPY . /app
WORKDIR /app

RUN pip install prometheus_client flask

CMD ["python", "app.py"]
