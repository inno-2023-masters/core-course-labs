# Helm

## Python Application Chart
The chart is located in `k8s/app-python`.

* ```shell
  helm install app-python app-python
  ```
  ```text
  NAME: app-python
  LAST DEPLOYED: Tue Nov  7 17:42:42 2023
  NAMESPACE: default
  STATUS: deployed
  REVISION: 1
  NOTES:
  1. Get the application URL by running these commands:
     export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=app-python,app.kubernetes.io/instance=app-python" -o jsonpath="{.items[0].metadata.name}")
     export CONTAINER_PORT=$(kubectl get pod --namespace default $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
     echo "Visit http://127.0.0.1:8080 to use your application"
     kubectl --namespace default port-forward $POD_NAME 8080:$CONTAINER_PORT
  ```
* ```shell
  kubectl get pods,svc
  ```
  ```text
  NAME                             READY   STATUS    RESTARTS   AGE
  pod/app-python-6cccc94fc-gcvbm   1/1     Running   0          13m

  NAME                 TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)    AGE
  service/app-python   ClusterIP   10.103.89.84   <none>        8080/TCP   13m
  service/kubernetes   ClusterIP   10.96.0.1      <none>        443/TCP    7d15h
  ```

## Helm Chart hooks
* ```shell
  helm lint app-python
  ```
  ```text
  ==> Linting app-python

  1 chart(s) linted, 0 chart(s) failed
  ```
* ```shell
  helm install --dry-run helm-hooks app-python
  ```
  ```
  NAME: helm-hooks
  LAST DEPLOYED: Tue Nov  7 18:50:11 2023
  NAMESPACE: default
  STATUS: pending-install
  REVISION: 1
  HOOKS:
  ---
  # Source: app-python/templates/tests/test-connection.yaml
  apiVersion: v1
  kind: Pod
  metadata:
  name: "helm-hooks-app-python-test-connection"
  labels:
  helm.sh/chart: app-python-0.1.0
  app.kubernetes.io/name: app-python
  app.kubernetes.io/instance: helm-hooks
  app.kubernetes.io/version: "1.16.0"
  app.kubernetes.io/managed-by: Helm
  annotations:
  "helm.sh/hook": test
  spec:
  containers:
  - name: wget
  image: busybox
  command: ['wget']
  args: ['helm-hooks-app-python:8080']
  restartPolicy: Never
  ---
  # Source: app-python/templates/post-install-job.yaml
  apiVersion: batch/v1
  kind: Job
  metadata:
  name: "helm-hooks"
  labels:
  app.kubernetes.io/managed-by: "Helm"
  app.kubernetes.io/instance: "helm-hooks"
  app.kubernetes.io/version: 1.16.0
  helm.sh/chart: "app-python-0.1.0"
  annotations:
  # This is what defines this resource as a hook. Without this line, the
  # job is considered part of the release.
  "helm.sh/hook": post-install
  "helm.sh/hook-delete-policy": hook-succeeded
  spec:
  template:
  metadata:
  name: "helm-hooks"
  labels:
  app.kubernetes.io/managed-by: "Helm"
  app.kubernetes.io/instance: "helm-hooks"
  helm.sh/chart: "app-python-0.1.0"
  spec:
  restartPolicy: Never
  containers:
  - name: post-install-job
  image: "alpine:3.3"
  command:
  - "/bin/sleep"
  - "15"
  ---
  # Source: app-python/templates/pre-install-job.yaml
  apiVersion: batch/v1
  kind: Job
  metadata:
  name: "helm-hooks"
  labels:
  app.kubernetes.io/managed-by: "Helm"
  app.kubernetes.io/instance: "helm-hooks"
  app.kubernetes.io/version: 1.16.0
  helm.sh/chart: "app-python-0.1.0"
  annotations:
  # This is what defines this resource as a hook. Without this line, the
  # job is considered part of the release.
  "helm.sh/hook": pre-install
  "helm.sh/hook-delete-policy": hook-succeeded
  spec:
  template:
  metadata:
  name: "helm-hooks"
  labels:
  app.kubernetes.io/managed-by: "Helm"
  app.kubernetes.io/instance: "helm-hooks"
  helm.sh/chart: "app-python-0.1.0"
  spec:
  restartPolicy: Never
  containers:
  - name: pre-install-job
  image: "alpine:3.3"
  command:
  - "echo"
  - "The pre-install hook is running..."
  MANIFEST
  {...}

  NOTES:
  {...}
  ```
* ```shell
  kubectl get po
  ```
  ```text
  NAME                                         READY   STATUS    RESTARTS   AGE
  app-python-release-pre-install-hook-6f979   1/1     Running   0          3s
  ```
* ```shell
  kubectl describe po app-python-release-pre-install-hook-6f979 
  ```
  ```text
  Name:             app-python-release-pre-install-hook-6f979
  Namespace:        default
  Priority:         0
  Service Account:  default
  Node:             minikube/192.168.49.2
  Start Time:       Tue, 07 Nov 2023 19:28:13 +0300
  Labels:           batch.kubernetes.io/controller-uid=ec091bfb-73ce-4015-b044-6616b95b8dc5
  batch.kubernetes.io/job-name=app-python-release-pre-install-hook
  controller-uid=ec091bfb-73ce-4015-b044-6616b95b8dc5
  job-name=app-python-release-pre-install-hook
  Annotations:      <none>
  Status:           Running
  IP:               10.244.0.39
  IPs:
  IP:           10.244.0.39
  Controlled By:  Job/app-python-release-pre-install-hook
  Containers:
  pre-install-job:
  Container ID:  docker://0cb9cc221e4605459330af5e61a426d407fd8ecc71adab901647b0e0adb7d7c5
  Image:         alpine:3.3
  Image ID:      docker-pullable://alpine@sha256:6bff6f65597a69246f79233ef37ff0dc50d97eaecbabbe4f8a885bf358be1ecf
  Port:          <none>
  Host Port:     <none>
  Command:
  /bin/sleep
  60s
  State:          Terminated
  Reason:       Completed
  Exit Code:    0
  Started:      Tue, 07 Nov 2023 19:28:14 +0300
  Finished:     Tue, 07 Nov 2023 19:29:14 +0300
  Ready:          False
  Restart Count:  0
  Environment:    <none>
  Mounts:
  /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-kc6nz (ro)
  Conditions:
  Type              Status
  Initialized       True
  Ready             False
  ContainersReady   False
  PodScheduled      True
  Volumes:
  kube-api-access-kc6nz:
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
  Type    Reason     Age   From               Message
    ----    ------     ----  ----               -------
  Normal  Scheduled  62s   default-scheduler  Successfully assigned default/app-python-release-pre-install-hook-6f979 to minikube
  Normal  Pulled     61s   kubelet            Container image "alpine:3.3" already present on machine
  Normal  Created    61s   kubelet            Created container pre-install-job
  Normal  Started    61s   kubelet            Started container pre-install-job
  ```
* ```shell
  kubectl get po
  ```
  ```text
  NAME                                         READY   STATUS    RESTARTS   AGE
  app-python-release-79b6f74df7-chn24          0/1     Running   0          7s
  app-python-release-79b6f74df7-xt22w          0/1     Running   0          7s
  app-python-release-post-install-hook-wxqdw   1/1     Running   0          7s
  ```
* ```shell
  kubectl describe po app-python-release-post-install-hook-wxqdw
  ```
  ```text
  Name:             app-python-release-post-install-hook-wxqdw
  Namespace:        default
  Priority:         0
  Service Account:  default
  Node:             minikube/192.168.49.2
  Start Time:       Tue, 07 Nov 2023 19:32:59 +0300
  Labels:           batch.kubernetes.io/controller-uid=2838fbb4-df79-4718-923f-9aa5748976ec
  batch.kubernetes.io/job-name=app-python-release-post-install-hook
  controller-uid=2838fbb4-df79-4718-923f-9aa5748976ec
  job-name=app-python-release-post-install-hook
  Annotations:      <none>
  Status:           Running
  IP:               10.244.0.44
  IPs:
  IP:           10.244.0.44
  Controlled By:  Job/app-python-release-post-install-hook
  Containers:
  post-install-job:
  Container ID:  docker://d0bb47786a21ccd14c76514ce30de9c4c808fe990db3ff471ab18678f3d3ad2e
  Image:         alpine:3.3
  Image ID:      docker-pullable://alpine@sha256:6bff6f65597a69246f79233ef37ff0dc50d97eaecbabbe4f8a885bf358be1ecf
  Port:          <none>
  Host Port:     <none>
  Command:
  /bin/sleep
  60s
  State:          Running
  Started:      Tue, 07 Nov 2023 19:33:01 +0300
  Ready:          True
  Restart Count:  0
  Environment:    <none>
  Mounts:
  /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-xdn4n (ro)
  Conditions:
  Type              Status
  Initialized       True
  Ready             True
  ContainersReady   True
  PodScheduled      True
  Volumes:
  kube-api-access-xdn4n:
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
  Type    Reason     Age   From               Message
    ----    ------     ----  ----               -------
  Normal  Scheduled  44s   default-scheduler  Successfully assigned default/app-python-release-post-install-hook-wxqdw to minikube
  Normal  Pulled     44s   kubelet            Container image "alpine:3.3" already present on machine
  Normal  Created    44s   kubelet            Created container post-install-job
  Normal  Started    43s   kubelet            Started container post-install-job
  ```
* ```shell
  kubectl get pods,svc
  ```
  ```text
  NAME                                      READY   STATUS    RESTARTS   AGE
  pod/app-python-release-79b6f74df7-chn24   1/1     Running   0          78s
  pod/app-python-release-79b6f74df7-xt22w   1/1     Running   0          78s

  NAME                         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
  service/app-python-release   ClusterIP   10.103.167.128   <none>        8080/TCP   79s
  service/kubernetes           ClusterIP   10.96.0.1        <none>        443/TCP    7d17h
  ```

## Kotlin Application Chart
The chart is located in `k8s/app-kotlin`.

* ```shell
  helm install app-kotlin-release app-kotlin
  ```
  ```text
  NAME: app-kotlin-release
  LAST DEPLOYED: Tue Nov  7 20:02:11 2023
  NAMESPACE: default
  STATUS: deployed
  REVISION: 1
  NOTES:
  1. Get the application URL by running these commands:
     export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=app-kotlin,app.kubernetes.io/instance=app-kotlin-release" -o jsonpath="{.items[0].metadata.name}")
     export CONTAINER_PORT=$(kubectl get pod --namespace default $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
     echo "Visit http://127.0.0.1:8080 to use your application"
     kubectl --namespace default port-forward $POD_NAME 8080:$CONTAINER_PORT
  ```
* ```shell
  kubectl get pods,svc
  ```
  ```text
  NAME                                      READY   STATUS    RESTARTS   AGE
  pod/app-kotlin-release-67ddb87498-8zx27   1/1     Running   0          3m22s
  pod/app-kotlin-release-67ddb87498-dvckv   1/1     Running   0          3m22s

  NAME                         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
  service/app-kotlin-release   ClusterIP   10.110.180.108   <none>        8080/TCP   3m22s
  service/kubernetes           ClusterIP   10.96.0.1        <none>        443/TCP    7d17h
  ```

## Library Chart
The chart is located in `k8s/labels-lib`.

I use labels from the library in `templates/_helper.tpl` of the chart inside another labels section
`app-{}.labels`. For example:
```gotemplate
{{/*
Common labels
*/}}
{{- define "app-python.labels" -}}
...
{{ include "labels-lib.labels" . }}
...
{{- end }}
```

### Running both application charts
* ```shell
  helm dependency build
  ```
  ```
  Hang tight while we grab the latest from your chart repositories...
  ...Successfully got an update from the "bitnami" chart repository
  Update Complete. ⎈Happy Helming!⎈
  Saving 1 charts
  Deleting outdated charts
  ```
* ```shell
  helm list
  ```
  ```text
  NAME              	NAMESPACE	REVISION	UPDATED                             	STATUS  	CHART           	APP VERSION
  app-kotlin-release	default  	1       	2023-11-07 21:01:34.038914 +0300 MSK	deployed	app-kotlin-0.1.0	1.16.0     
  app-python-release	default  	1       	2023-11-07 21:08:36.887641 +0300 MSK	deployed	app-python-0.1.0	1.16.0
  ```
* ```shell
  kubectl get pods,svc  
  ```
  ```text
  NAME                                      READY   STATUS    RESTARTS   AGE
  pod/app-kotlin-release-746ff4c775-kbv9j   1/1     Running   0          9m27s
  pod/app-kotlin-release-746ff4c775-t2l4t   1/1     Running   0          9m27s
  pod/app-python-release-79b6f74df7-w4j7d   1/1     Running   0          2m4s
  pod/app-python-release-79b6f74df7-w55c8   1/1     Running   0          2m4s

  NAME                         TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
  service/app-kotlin-release   ClusterIP   10.109.14.223   <none>        8080/TCP   9m27s
  service/app-python-release   ClusterIP   10.104.46.155   <none>        8080/TCP   2m4s
  service/kubernetes           ClusterIP   10.96.0.1       <none>        443/TCP    7d18h
  ```
* ```shell
  kubectl describe deploy app-kotlin-release
  ```
  ```text
  Name:                   app-kotlin-release
  {...}
  Labels:                 app.kubernetes.io/instance=app-kotlin-release
  app.kubernetes.io/managed-by=Helm
  app.kubernetes.io/name=app-kotlin
  app.kubernetes.io/version=1.16.0
  helm.sh/chart=app-kotlin-0.1.0
  {...}
  Pod Template:
  Labels:           app.kubernetes.io/instance=app-kotlin-release
  app.kubernetes.io/managed-by=Helm
  app.kubernetes.io/name=app-kotlin
  app.kubernetes.io/version=1.16.0
  helm.sh/chart=app-kotlin-0.1.0
  {...}
  ```
* ```shell
  kubectl describe deploy app-python-release
  ```
  ```text
  Name:                   app-python-release
  {...}
  Labels:                 app.kubernetes.io/instance=app-python-release
  app.kubernetes.io/managed-by=Helm
  app.kubernetes.io/name=app-python
  app.kubernetes.io/version=1.16.0
  helm.sh/chart=app-python-0.1.0
  Annotations:            deployment.kubernetes.io/revision: 1
  meta.helm.sh/release-name: app-python-release
  meta.helm.sh/release-namespace: default
  {...}
  Pod Template:
  Labels:           app.kubernetes.io/instance=app-python-release
  app.kubernetes.io/managed-by=Helm
  app.kubernetes.io/name=app-python
  app.kubernetes.io/version=1.16.0
  helm.sh/chart=app-python-0.1.0
  {...}
  ```
