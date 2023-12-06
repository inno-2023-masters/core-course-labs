# Helm

Start `minikube`

```
minikube start
```

Install chart

```
helm install web-app-release ./web-app/
```

Start service in `minikube`

```
minikube service web-app-release
```

---

Output of `kubectl get pods,svc`

```
NAME                                   READY   STATUS    RESTARTS   AGE
pod/web-app-release-6554667c5f-nsrt6   1/1     Running   0          5m54s

NAME                      TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
service/kubernetes        ClusterIP      10.96.0.1      <none>        443/TCP          9d
service/web-app-release   LoadBalancer   10.104.14.36   <pending>     8080:31241/TCP   5m54s
```

---

After setting up `helm` hooks:

```
kubectl get po
```

```
NAME                                     READY   STATUS      RESTARTS   AGE
web-app-release-6554667c5f-7tnjg         1/1     Running     0          89s
web-app-release-post-install-job-hcrtk   0/1     Completed   0          89s
web-app-release-pre-install-job-8brqz    0/1     Completed   0          112s
```

---

```
kubectl describe po web-app-release-pre-install-job-8brqz
```

```
Name:             web-app-release-pre-install-job-8brqz
Namespace:        default
Priority:         0
Service Account:  default
Node:             minikube/192.168.49.2
Start Time:       Tue, 07 Nov 2023 20:40:59 +0300
Labels:           batch.kubernetes.io/controller-uid=1d7ed724-bf1a-4462-bdc3-96c332f26f0c
                  batch.kubernetes.io/job-name=web-app-release-pre-install-job
                  controller-uid=1d7ed724-bf1a-4462-bdc3-96c332f26f0c
                  job-name=web-app-release-pre-install-job
Annotations:      <none>
Status:           Succeeded
IP:               10.244.0.30
IPs:
  IP:           10.244.0.30
Controlled By:  Job/web-app-release-pre-install-job
Containers:
  pre-install-job:
    Container ID:  docker://a445412fceae9c1687bb28b2767712017c46632c7e465ecafd81ca759d73ae27
    Image:         alpine:3.3
    Image ID:      docker-pullable://alpine@sha256:6bff6f65597a69246f79233ef37ff0dc50d97eaecbabbe4f8a885bf358be1ecf
    Port:          <none>
    Host Port:     <none>
    Command:
      sh
      -c
      sleep 20
    State:          Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Tue, 07 Nov 2023 20:40:59 +0300
      Finished:     Tue, 07 Nov 2023 20:41:19 +0300
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-2f9r5 (ro)
Conditions:
  Type              Status
  Initialized       True
  Ready             False
  ContainersReady   False
  PodScheduled      True
Volumes:
  kube-api-access-2f9r5:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age    From               Message
  ----    ------     ----   ----               -------
  Normal  Scheduled  4m13s  default-scheduler  Successfully assigned default/web-app-release-pre-install-job-8brqz to minikube
  Normal  Pulled     4m13s  kubelet            Container image "alpine:3.3" already present on machine
  Normal  Created    4m13s  kubelet            Created container pre-install-job
  Normal  Started    4m13s  kubelet            Started container pre-install-job
```

---

```
kubectl describe po web-app-release-post-install-job-hcrtk
```

```
Name:             web-app-release-post-install-job-hcrtk
Namespace:        default
Priority:         0
Service Account:  default
Node:             minikube/192.168.49.2
Start Time:       Tue, 07 Nov 2023 20:41:22 +0300
Labels:           batch.kubernetes.io/controller-uid=0869fa23-4b89-433f-a370-4fe88df6f332
                  batch.kubernetes.io/job-name=web-app-release-post-install-job
                  controller-uid=0869fa23-4b89-433f-a370-4fe88df6f332
                  job-name=web-app-release-post-install-job
Annotations:      <none>
Status:           Succeeded
IP:               10.244.0.32
IPs:
  IP:           10.244.0.32
Controlled By:  Job/web-app-release-post-install-job
Containers:
  post-install-job:
    Container ID:  docker://50eb42b3e055675cdef4b79c33f21fa05868205866e5b1342a401fbe5f7e68d3
    Image:         alpine:3.3
    Image ID:      docker-pullable://alpine@sha256:6bff6f65597a69246f79233ef37ff0dc50d97eaecbabbe4f8a885bf358be1ecf
    Port:          <none>
    Host Port:     <none>
    Command:
      sh
      -c
      sleep 20
    State:          Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Tue, 07 Nov 2023 20:41:25 +0300
      Finished:     Tue, 07 Nov 2023 20:41:45 +0300
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-qtkdw (ro)
Conditions:
  Type              Status
  Initialized       True
  Ready             False
  ContainersReady   False
  PodScheduled      True
Volumes:
  kube-api-access-qtkdw:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age    From               Message
  ----    ------     ----   ----               -------
  Normal  Scheduled  4m56s  default-scheduler  Successfully assigned default/web-app-release-post-install-job-hcrtk to minikube
  Normal  Pulled     4m55s  kubelet            Container image "alpine:3.3" already present on machine
  Normal  Created    4m54s  kubelet            Created container post-install-job
  Normal  Started    4m54s  kubelet            Started container post-install-job
```

---

In order to change to implement hook delete policy on `helm` chart, it is needed to change the line on both hooks as following:

```
    "helm.sh/hook-delete-policy": hook-succeeded
```

Now once hooks successfully executed, it will be removed. 