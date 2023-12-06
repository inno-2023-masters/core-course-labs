FROM python:3.11.5-slim

WORKDIR /app_python

# ==== [Build] ====
COPY requirements/requirements-prod.txt requirements-prod.txt

RUN apt-get update && apt-get install -y \
    curl
RUN pip install -r requirements-prod.txt
# ==== [/Build] ====

# add user 'user'
RUN addgroup --system user && adduser --system --group user
# give user permissions for `/app_python` dir
RUN chown user /app_python
# switch to user 'user'
USER user

COPY ./src ./src

EXPOSE 8080
ENTRYPOINT [ "python3", "src/app.py" ]
