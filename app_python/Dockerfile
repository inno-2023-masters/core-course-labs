FROM python:3.10-slim

RUN apt update && apt -y install gcc curl

WORKDIR /app_python

ENV PYTHONPATH=/app_python

COPY ./requirements.txt /app_python/requirements.txt

RUN pip install --upgrade pip && pip install --no-cache-dir --upgrade -r /app_python/requirements.txt

COPY . /app_python

RUN useradd -m core_lab_user

USER core_lab_user

CMD uvicorn app:app --host 0.0.0.0 --port 8000 --reload
