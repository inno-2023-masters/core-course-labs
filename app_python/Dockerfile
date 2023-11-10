FROM python:3.8-slim-buster as builder
RUN useradd -m myuser && \
    mkdir /app && \
    chown myuser:myuser /app
WORKDIR /app
COPY . /app
RUN pip install --no-cache-dir -r requirements.txt
USER myuser
CMD ["python", "app.py"]
