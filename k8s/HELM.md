## kubectl get pods,svc
``````
NAME                         TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                                     AGE
service/app-python-service   NodePort    10.99.220.102   <none>        80:30155/TCP,443:32041/TCP,8080:30427/TCP   6d17h       
service/kubernetes           ClusterIP   10.96.0.1       <none>        443/TCP                                     6d18h  
``````
## kubectl get po
``````
NAME                                   READY   STATUS    RESTARTS      AGE
app-python-deployment-cf76cf88-c4bg2   1/1     Running   3 (35m ago)   6d15h
app-python-deployment-cf76cf88-pgk97   1/1     Running   3 (35m ago)   6d15h
app-python-deployment-cf76cf88-xpcdn   1/1     Running   3 (35m ago)   6d15h
``````
## kubectl describe po pre-install-hook
``````
Name:             pre-install-hook
Namespace:        default
Priority:         0
Service Account:  default
Node:             minikube/192.168.49.2
Start Time:       Tue, 07 Nov 2023 18:24:11 +0300
Labels:           app.kubernetes.io/managed-by=Helm
Annotations:      meta.helm.sh/release-name: helm-hooks
                  meta.helm.sh/release-namespace: default
Status:           Running
IP:               10.244.0.38
IPs:
  IP:  10.244.0.38
Containers:
  hook-container:
    Container ID:  docker://2ce881b2a416364988ccac6830a5ca53df063b574238a6852e64044e3c5b64f8
    Image:         busybox
    Image ID:      docker-pullable://busybox@sha256:3fbc632167424a6d997e74f52b878d7cc478225cffac6bc977eedfe51c7f4e79
    Port:          <none>
    Host Port:     <none>
    Args:
      sleep
      20
    State:          Waiting
      Reason:       CrashLoopBackOff
    Last State:     Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Tue, 07 Nov 2023 18:30:57 +0300
      Finished:     Tue, 07 Nov 2023 18:31:17 +0300
    Ready:          False
    Restart Count:  4
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-ms62v (ro)
Conditions:
  Type              Status
  Initialized       True
  Ready             False
  ContainersReady   False
  PodScheduled      True
Volumes:
  kube-api-access-ms62v:
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
  Type     Reason     Age                    From               Message
  ----     ------     ----                   ----               -------
  Normal   Scheduled  8m4s                   default-scheduler  Successfully assigned default/pre-install-hook to minikube     
  Normal   Pulled     6m38s                  kubelet            Successfully pulled image "busybox" in 33.23645008s (1m22.117731164s including waiting)
  Normal   Pulled     5m31s                  kubelet            Successfully pulled image "busybox" in 33.354869781s (45.565670416s including waiting)
  Normal   Pulled     4m20s                  kubelet            Successfully pulled image "busybox" in 33.986810453s (33.986847684s including waiting)
  Normal   Pulled     2m59s                  kubelet            Successfully pulled image "busybox" in 33.330055506s (33.33010453s including waiting)
  Warning  BackOff    2m11s (x6 over 5m10s)  kubelet            Back-off restarting failed container hook-container in pod pre-install-hook_default(ba409638-1029-4871-921c-00b0c1702ecb)
  Normal   Pulling    116s (x5 over 8m)      kubelet            Pulling image "busybox"
  Normal   Created    79s (x5 over 6m37s)    kubelet            Created container hook-container
  Normal   Pulled     79s                    kubelet            Successfully pulled image "busybox" in 33.277890721s (37.719386186s including waiting)
  Normal   Started    78s (x5 over 6m37s)    kubelet            Started container hook-container
``````
## kubectl describe po post-install-hook
``````
Name:             post-install-hook
Namespace:        default
Priority:         0
Service Account:  default
Node:             minikube/192.168.49.2
Start Time:       Tue, 07 Nov 2023 18:24:11 +0300
Labels:           app.kubernetes.io/managed-by=Helm
Annotations:      meta.helm.sh/release-name: helm-hooks
                  meta.helm.sh/release-namespace: default
Status:           Running
IP:               10.244.0.37
IPs:
  IP:  10.244.0.37
Containers:
  hook-container:
    Container ID:  docker://3476c16999060ccd171bdfdea6a57d96c9bdfef8231addbbe7460b7da28651e3
    Image:         busybox
    Image ID:      docker-pullable://busybox@sha256:3fbc632167424a6d997e74f52b878d7cc478225cffac6bc977eedfe51c7f4e79
    Port:          <none>
    Host Port:     <none>
    Args:
      sleep
      20
    State:          Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Tue, 07 Nov 2023 18:32:39 +0300
      Finished:     Tue, 07 Nov 2023 18:32:59 +0300
    Last State:     Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Tue, 07 Nov 2023 18:30:23 +0300
      Finished:     Tue, 07 Nov 2023 18:30:43 +0300
    Ready:          False
    Restart Count:  5
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-88nwv (ro)
Conditions:
  Type              Status
  Initialized       True
  Ready             False
  ContainersReady   False
  PodScheduled      True
Volumes:
  kube-api-access-88nwv:
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
  Type     Reason     Age                    From               Message
  ----     ------     ----                   ----               -------
  Normal   Scheduled  8m56s                  default-scheduler  Successfully assigned default/post-install-hook to minikube    
  Normal   Pulled     8m3s                   kubelet            Successfully pulled image "busybox" in 48.893513048s (48.894146923s including waiting)
  Normal   Pulled     6m56s                  kubelet            Successfully pulled image "busybox" in 33.340540082s (45.280175475s including waiting)
  Normal   Pulled     5m49s                  kubelet            Successfully pulled image "busybox" in 33.51624046s (35.002685561s including waiting)
  Normal   Started    4m27s (x4 over 8m3s)   kubelet            Started container hook-container
  Normal   Pulled     4m27s                  kubelet            Successfully pulled image "busybox" in 33.556208938s (33.556218297s including waiting)
  Warning  BackOff    3m29s (x7 over 6m36s)  kubelet            Back-off restarting failed container hook-container in pod post-install-hook_default(1d980985-4ea6-4422-860d-561d72ff229e)
  Normal   Pulling    3m17s (x5 over 8m52s)  kubelet            Pulling image "busybox"
  Normal   Created    2m44s (x5 over 8m3s)   kubelet            Created container hook-container
  Normal   Pulled     2m44s                  kubelet            Successfully pulled image "busybox" in 33.439972266s (33.440109127s including waiting)
``````

