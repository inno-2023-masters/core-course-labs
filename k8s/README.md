# k8s

## W/out configuration files
### Startup
Start the local cluster
```bash
minikube start
```

Deploy the application
```bash
kubectl create deployment python-app --image=run4w4y/devops-course-python-app:latest
kubectl expose deployment python-app --type=LoadBalancer --port=8080
``` 
### Verify
Run `kubectl get pods,svc` to verify that everything is running
![screenshots/k8s1.png](screenshots/k8s1.png)

Tunnel to a service
![screenshots/k8s2.png](screenshots/k8s2.png)

Clean up and stop the cluster
![screenshots/k8s3.png](screenshots/k8s3.png)

## W/ configuration files
### Startup
Start the local cluster
```bash
minikube start
```

Deploy the application
```bash
kubectl apply -f deployment.yml
kubectl apply -f service.yml
```

### Verify
Run `kubectl get pods,svc` to verify that everything is running
![screenshots/k8s1.png](screenshots/k8s4.png)

Tunnel to a service
![screenshots/k8s2.png](screenshots/k8s5.png)

Check the server response
![screenshots/k8s3.png](screenshots/k8s6.png)

Cleanup is the same as before
