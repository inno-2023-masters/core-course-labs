FROM python:3.11.5-alpine3.18

LABEL iviosab.moscow_time.created="2023-09-12T20:08:13+00:00"
LABEL iviosab.moscow_time.authors="Mosab Mohamed"
LABEL iviosab.moscow_time.source="https://github.com/IVIosab/core-course-labs/tree/main/app_python"
LABEL iviosab.moscow_time.version="0.0.1"
LABEL iviosab.moscow_time.title="Moscow Time"
LABEL iviosab.moscow_time.description="This image creates a simple web app that displays moscow time (intended for docker learning purposes)"
LABEL iviosab.moscow_time.base.digest="e5d592c422d6e527cb946ae6abb1886c511a5e163d3543865f5a5b9b61c01584"

WORKDIR /app

COPY . /app

RUN adduser myuser -D && chown -R myuser /app \
    && pip3 install -r requirements.txt \
    && apk --no-cache add curl=8.3.0-r0

USER myuser

EXPOSE 5000

CMD [ "python3", "app.py"]

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl --fail http://localhost:5000/ || exit 1
