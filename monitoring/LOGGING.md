# Logging 

It is done with the power of Grafana, Promtail, and Loki.

Use `docker-compose up` from the `monitoring` directory to
start.

![running_docker_containers.png](images/containers.png)


## The results

Here we can check any label  
![job.png](images/job.png)

### Python logs

Check for `container_name` is `app_python-1`

![py.png](images/for-python.png)

### Javascript logs

Check for `container_name` is `app_javascript-1`

![js.png](images/for-js.png)