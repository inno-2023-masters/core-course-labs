# Metrics

## Prometheus screenshots
![screenshot](./screenshots/img_prom0.png)
![screenshot](./screenshots/img_prom1.png)

## Grafana screenshots
![screenshot](./screenshots/img_prom_dashboard.png)
![screenshot](./screenshots/img_loki_dashboard.png)

## Docker compose

### Log rotation
An x-logger config was added with the following options
```yaml
max-size: "15m"
max-file: "3"
```

### Memory limits
Memory was limited to 512mb for all containers
