FROM python:3.11-slim-buster

LABEL build-date="2023-09-12T12:00:00Z" \
    name="app_python" \
    maintainer="Mikhail Fedorov" \
    schema-version="0.1" \
    description="Simple Python web app(FastAPI + Uvicorn) to show UTC+3 time" \
    docker.cmd="docker run -d -p 80:80 app_python"


RUN groupadd -r mygroup && useradd -r -g mygroup myuser

WORKDIR /app

# Copy only the requirements file first to leverage Docker cache
COPY requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir --upgrade -r requirements.txt

EXPOSE 80

COPY . /app

RUN chown -R myuser:mygroup /app

USER myuser:mygroup

CMD [ "uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "80"]

HEALTHCHECK --interval=5s --timeout=5s --retries=3 CMD curl --fail http://localhost || exit 1