FROM python:3.9-alpine
WORKDIR /code
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
RUN addgroup user && adduser app -g user --disabled-password
COPY  --chown=app:app ./app /code/app
USER app
EXPOSE 80/tcp
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]