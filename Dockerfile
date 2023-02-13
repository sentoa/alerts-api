# Use an official Python runtime as the base image
FROM python:3.9-slim

RUN adduser -D worker
USER worker
WORKDIR /home/worker

RUN pip install --user pipenv
RUN pip install prometheus_client requests Flask --user pipenv


ENV PATH="/home/worker/.local/bin:${PATH}"

COPY --chown=worker:worker Pipfile Pipfile
RUN pipenv lock -r > requirements.txt
RUN pip install --user -r requirements.txt

COPY --chown=worker:worker . .

CMD ["python", "app.py"]
