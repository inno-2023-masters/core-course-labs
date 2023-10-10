FROM python:3.10-alpine3.18

WORKDIR /app

COPY ./requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY app/__init__.py ./

RUN adduser no_root_user --system -S /bin/nologin -D -H
USER no_root_user

ENV PYTHONPATH .
ENTRYPOINT ["python3", "__init__.py"]