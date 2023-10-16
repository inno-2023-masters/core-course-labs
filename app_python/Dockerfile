FROM python:3.9-alpine
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN adduser -D myuser && chown -R myuser /app
RUN pip install -r requirements.txt
COPY . /app
USER myuser
ENV APP_TMP_DATA=/tmp
ENTRYPOINT ["/app"]
ENTRYPOINT ["python"]
CMD ["main.py"]