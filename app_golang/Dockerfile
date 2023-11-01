FROM golang:1.19 as builder

LABEL iviosab.moscow_time_go.created="2023-09-12T20:18:08+00:00"
LABEL iviosab.moscow_time_go.authors="Mosab Mohamed"
LABEL iviosab.moscow_time_go.source="https://github.com/IVIosab/core-course-labs/tree/main/app_golang"
LABEL iviosab.moscow_time_go.version="0.0.1"
LABEL iviosab.moscow_time_go.title="Moscow Time"
LABEL iviosab.moscow_time_go.description="This image creates a simple web app that displays moscow time (intended for docker learning purposes)"
LABEL iviosab.moscow_time_go.base.digest="1611d4f97c5ab666d3c123d72b3bb646dd12bbf7577dd1388fdb191d54cdf440"

WORKDIR /app

COPY . .

RUN GOOS=linux GOARCH=amd64 go build .

FROM golang:1.19.13-alpine3.18

RUN apk --no-cache add libc6-compat=1.2.4-r2 \
    && adduser myuser -D && chown -R myuser . \
    && apk --no-cache add curl=8.4.0-r0

USER myuser

COPY --from=builder /app/moscowtime /bin/moscowtime

WORKDIR /bin

EXPOSE 8080

ENTRYPOINT [ "./moscowtime" ]

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl --fail http://localhost:8080/ || exit 1