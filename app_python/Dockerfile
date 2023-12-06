FROM python:3.11.5-alpine3.18

COPY requirements.txt .
RUN pip install -r requirements.txt && rm requirements.txt && rm -rf `pip cache dir`

RUN adduser app --system -S /bin/nologin -D -H
USER app
WORKDIR /app

COPY src/ .

ENV PORT="8000"
EXPOSE $PORT
CMD ["sh", "-c", "/usr/local/bin/python3 -m uvicorn main:app --host 0.0.0.0 --port $PORT"]