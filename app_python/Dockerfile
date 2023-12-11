FROM python:3.10

ENV API_PORT=8000
WORKDIR /app

RUN useradd --create-home newuser && chown -R newuser:newuser /app
USER newuser

RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . . 

EXPOSE $API_PORT

CMD python -m gunicorn --bind 0.0.0.0:$API_PORT --workers 4 run:app