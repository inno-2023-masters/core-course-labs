# Kubernetes

The output of the command `kubectl get pods,svc`

```bash
NAME                             READY   STATUS    RESTARTS   AGE
pod/app-python-748c96ffc-jnv74   1/1     Running   0          2m25s
pod/app-python-748c96ffc-r7w4j   1/1     Running   0          2m25s
pod/app-python-748c96ffc-tzgdp   1/1     Running   0          2m25s
pod/hello-node-ccf4b9788-6wgkw   1/1     Running   0          71m

NAME                 TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
service/app-python   LoadBalancer   10.99.130.237   <pending>     8000:30391/TCP   2m19s
service/hello-node   LoadBalancer   10.103.42.157   <pending>     8080:31584/TCP   13m
service/kubernetes   ClusterIP      10.96.0.1       <none>        443/TCP          74m
```