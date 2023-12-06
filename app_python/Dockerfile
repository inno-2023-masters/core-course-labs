FROM python:3

EXPOSE 7098

RUN useradd -ms /bin/bash python_runner
USER python_runner
ENV PATH="/home/python_runner/.local/bin:${PATH}"
WORKDIR /home/python_runner/python/src/app

RUN python -m venv ~/opt/venv

COPY requirements/requirements.txt ./

RUN ~/opt/venv/bin/pip install --no-cache-dir -r requirements.txt

COPY . ./app_python

CMD . ~/opt/venv/bin/activate && exec python app_python/src/main.py