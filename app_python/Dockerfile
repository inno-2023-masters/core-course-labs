FROM python:3.8-slim-buster
WORKDIR /app
COPY requirements.txt /app
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
COPY . /app
EXPOSE 5000
RUN adduser --disabled-password --no-create-home john-doe
USER john-doe
CMD ["python", "main.py"]