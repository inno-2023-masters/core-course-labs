
# Logging

## Grafana

Used to access the log using pretty UI.

In this case we use grafana with default options. We add Loki's datasource from compose.

## Loki

Concentrates the logs.

Used with totally default config from image

## Promtail

Brings the logs from given sources.

## Result

### List of containers

![Container list](screenshots/containers.png)

### Python app logs

![Python App Logs](screenshots/python_app_logs.png)

### Promtail logs

![Promtail Logs](screenshots/promtail_logs.png)