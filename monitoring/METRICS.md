# Metrics

## Results

### Collecting metrics from Loki and Prometheus

![parts.png](images/loki-and-promet-targets.png)

## Healthcheck

Added the following block and use it for all services.
```
x-healthcheck: &healthcheck-params
  interval: 15s
  timeout: 10s
  retries: 5
  start_period: 5s
```
