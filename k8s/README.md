# K8S

## K8S Deployment & Service
### Deployment 
`kubectl get pods`

```
NAME                         READY   STATUS    RESTARTS   AGE
app-python-dbfc8f6b4-5gsbm   1/1     Running   0          49s
```

### Service
`kubectl get svc`

```
NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
kubernetes   ClusterIP   10.96.0.1        <none>        443/TCP          77m
python-app   NodePort    10.96.121.224    <none>        8000:32713/TCP   3s
```

## Declarative Kubernetes Manifests
### Deployment
`kubectl apply -f app_python/deployment.yml`
```
deployment.apps/python-app created
```

`kubectl apply -f app_go/deployment.yml`
```
deployment.apps/go-app created
```

`kubectl get pods`
```
NAME                          READY   STATUS    RESTARTS   AGE
app-python-dbfc8f6b4-5gsbm    1/1     Running   0          16m
go-app-58b7c44d98-6dl5n       1/1     Running   0          3m40s
go-app-58b7c44d98-g5rl9       1/1     Running   0          3m40s
go-app-58b7c44d98-tvwhs       1/1     Running   0          3m40s
python-app-84c9748db8-btxx8   1/1     Running   0          6m32s
python-app-84c9748db8-f2k6v   1/1     Running   0          6m32s
python-app-84c9748db8-nptck   1/1     Running   0          6m32s
```

### Service
`kubectl apply -f app_python/service.yml`

```
service/python-app created
```

`kubectl apply -f app_go/service.yml`
```
service/go-app created
```

`kubectl get svc`

```
NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
go-app       NodePort    10.108.176.231   <none>        9000:32732/TCP   38s
kubernetes   ClusterIP   10.96.0.1        <none>        443/TCP          77m
python-app   NodePort    10.96.121.224    <none>        8000:32713/TCP   3s
```

### Minikub Service
`minikube service --all`

```
|-----------|--------|-------------|---------------------------|
| NAMESPACE |  NAME  | TARGET PORT |            URL            |
|-----------|--------|-------------|---------------------------|
| default   | go-app |        9000 | http://192.168.49.2:32732 |
|-----------|--------|-------------|---------------------------|
|-----------|------------|-------------|--------------|
| NAMESPACE |    NAME    | TARGET PORT |     URL      |
|-----------|------------|-------------|--------------|
| default   | kubernetes |             | No node port |
|-----------|------------|-------------|--------------|
😿  service default/kubernetes has no node port
|-----------|------------|-------------|---------------------------|
| NAMESPACE |    NAME    | TARGET PORT |            URL            |
|-----------|------------|-------------|---------------------------|
| default   | python-app |        8000 | http://192.168.49.2:32713 |
|-----------|------------|-------------|---------------------------|
🏃  Starting tunnel for service go-app.
🏃  Starting tunnel for service kubernetes.
🏃  Starting tunnel for service python-app.
|-----------|------------|-------------|------------------------|
| NAMESPACE |    NAME    | TARGET PORT |          URL           |
|-----------|------------|-------------|------------------------|
| default   | go-app     |             | http://127.0.0.1:50678 |
| default   | kubernetes |             | http://127.0.0.1:50680 |
| default   | python-app |             | http://127.0.0.1:50682 |
|-----------|------------|-------------|------------------------|
🎉  Opening service default/go-app in default browser...
🎉  Opening service default/kubernetes in default browser...
🎉  Opening service default/python-app in default browser...
```
####  go-app 
![1](imgs/1.jpeg)

####  kubernetes
![2](imgs/2.jpeg)

####  python-app
![3](imgs/3.jpeg)

## Ingress
`kubectl apply -f ingress.yml`
```
ingress.networking.k8s.io/ingress created
```

`kubectl get ingress`
```
NAME      CLASS    HOSTS               ADDRESS   PORTS   AGE
ingress   <none>   app.python,app.go             80      9s
```

## Check
`minikube ip`

```
192.168.49.2
```

`curl --resolve "app.go:9000:192.168.49.2" -i http://app.go`
```
"04:10:20"
```

`curl --resolve "app.python:8000:192.168.49.2" -i http://app.python`

```
"04:11:07"
```