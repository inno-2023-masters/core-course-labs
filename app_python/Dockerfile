FROM python:3.10

RUN mkdir /proj
COPY ./ /proj
WORKDIR /proj

ENV PYTHONPATH=${PYTHONPATH}:${PWD}

RUN useradd -ms /bin/bash pythonapp

RUN pip3 install poetry==1.5.1
RUN poetry config virtualenvs.create false 
RUN poetry install --no-dev

USER pythonapp

ENTRYPOINT exec uvicorn src.app:app --host 0.0.0.0 --port 8080
