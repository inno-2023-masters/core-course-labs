FROM python:3.9.12-slim

RUN useradd -ms /bin/bash testuser
RUN chown testuser /home/testuser

RUN apt-get -y update && apt-get install -y curl

WORKDIR /home/testuser
COPY . /home/testuser
RUN chown testuser db.sqlite3
USER testuser

RUN python3 -m pip install --no-cache-dir --no-warn-script-location --upgrade pip \
    && python3 -m pip install --no-cache-dir --no-warn-script-location --user -r requirements.txt

RUN python3 manage.py migrate

ENTRYPOINT python3 manage.py runserver 0.0.0.0:8000
EXPOSE 8000
