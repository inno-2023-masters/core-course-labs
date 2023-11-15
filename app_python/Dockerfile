FROM python:3.9

WORKDIR /app

COPY . /app/

COPY requirements.txt /app/

RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

RUN useradd --create-home myuser && chown -R myuser /app

USER myuser

EXPOSE 5000

CMD [ "python", "main.py" ]