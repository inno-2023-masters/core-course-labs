###############################################
# Base Image
###############################################
FROM python:3.11-slim-buster as python-base

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_VERSION=1.5.1 \
    POETRY_HOME="/opt/poetry" \
    POETRY_VIRTUALENVS_IN_PROJECT=true \
    POETRY_NO_INTERACTION=1 \
    PYSETUP_PATH="/opt/pysetup" \
    VENV_PATH="/opt/pysetup/.venv"

ENV PATH="$POETRY_HOME/bin:$VENV_PATH/bin:$PATH"
###############################################
# Builder Image
###############################################
FROM python-base as builder
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    curl \
    && rm -rf /var/lib/apt/lists/* \
    && curl -sSL https://install.python-poetry.org | python3 -

WORKDIR $PYSETUP_PATH
COPY poetry.lock pyproject.toml ./

RUN poetry install --without dev

###############################################
# Production Image
###############################################
FROM python-base as production
COPY --from=builder $PYSETUP_PATH $PYSETUP_PATH

WORKDIR /app

COPY app app
COPY docker/docker-entrypoint.sh docker-entrypoint.sh

RUN adduser --disabled-password --gecos "" app \
    && chmod +x docker-entrypoint.sh
USER app

EXPOSE 8000

ENTRYPOINT ./docker-entrypoint.sh $0 $@
