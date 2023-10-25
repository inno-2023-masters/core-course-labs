FROM python:3.8-slim

# Updating and upgrading packages before work. Also auto-removing unncecessary packages.
# Cleaning up the install lists afterwards.
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    rm -rf /var/lib/apt/lists/*

# Set a non-root user and group
RUN groupadd -g 1000 myuser && \
    useradd -u 1000 -g myuser -m -s /bin/bash myuser

WORKDIR /app

# Whitelist of copied directories to not copy unnecessary items.
COPY ./flaskr /app/flaskr
COPY ./tests /app/tests
COPY ./app.py /app/
COPY ./requirements.txt /app/

# Install the requirements and set user rights to read for safety.
# Also utilized cache mount for pip to avoid redundant package downloads on each build.
RUN --mount=type=cache,target=/root/.cache pip install -r requirements.txt --no-cache-dir && \
    chown -R myuser:myuser /app

USER myuser:myuser

EXPOSE 5000

ENV NAME app_python

ENTRYPOINT ["python", "app.py"]