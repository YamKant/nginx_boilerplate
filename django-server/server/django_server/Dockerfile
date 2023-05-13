# syntax=docker/dockerfile:1
FROM python:3
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /code
COPY code /code/
COPY requirements.txt /code/
COPY run.sh /code/
EXPOSE 8000/tcp
RUN /bin/bash run.sh
