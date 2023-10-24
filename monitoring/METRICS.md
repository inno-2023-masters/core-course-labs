### Configured prometheus targets:

![prometheus_targets.png](resources/prometheus_targets.png)

Then I also added other services to scrape metrics from:
![all_services_targets.png](resources/all_services_targets.png)

### Scraped Loki metrics:

![scraped_loki_metrics.png](resources/scraped_loki_metrics.png)

### Scraped Promtail metrics:

![scraped_prometheus_metrics.png](resources/scraped_prometheus_metrics.png)

### Loki Grafana Dashboard:

![loki_grafana_dashboard.png](resources/loki_grafana_dashboard.png)

![loki_grafana_dashboard_2.png](resources/loki_grafana_dashboard_2.png)

### Prometheus Grafana Dashboard:

![prometheus_grafana_dashboard.png](resources/prometheus_grafana_dashboard.png)
![prometheus_grafana_dashboard_2.png](resources/prometheus_grafana_dashboard_2.png)

## Log rotation

For log rotation I used options for docker default json-file logging driver:

```
logging:
  driver: "json-file"
  options:
    max-size: "100k"
    max-file: "10"
```

which means that docker will store all the logs in files of maximum 100KB.

## Memory limits

To limit resources for each container I used docker-compose `deploy` option:

```
deploy:
  resources:
    limits:
      memory: 100M
```

This option also supports CPU limits.

I chose different values of memory limit for different containers appropriately by their needs.

## Python application metrics and dashboard

I used django-prometheus dependency to export default metrics in prometheus view on `/metrics` endpoint.

I setted up my prometheus to scrape metrics from Python application:
![python_app_prometheus_target.png](resources/python_app_prometheus_target.png)

And build small dashboard with application uptime and RPS on different pages:
![python_app_grafana_dashboard.png](resources/python_app_grafana_dashboard.png)

## Kotlin application metrics and dashboard

I used spring-boot-actuator along with micrometer dependencies to export metrics in prometheus view
on `/actuator/metrics` endpoint.

I setted up my prometheus to scrape metrics from this endpoint:
![kotlin_app_prometheus_target.png](resources/kotlin_app_prometheus_target.png)

And imported dashboard to check my JVM:
![kotlin_app_grafana_dashboard.png](resources/kotlin_app_grafana_dashboard.png)
![kotlin_app_grafana_dashboard_2.png](resources/kotlin_app_grafana_dashboard_2.png)

## Healthchecks

I added healthchecks for my applications. Both of them make GET request to some endpoint and checking if curl will exit
with 0 status code. After interval timeout my docker ps shows that both applications are healthy:
![docker_healthchecks.png](resources/docker_healthchecks.png)