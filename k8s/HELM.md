# Helm overview

## Task 1

1. Installed helm.

1. Created helm chart for python app. `helm create helm-python-app`.

1. Install helm chart. `helm install python-helm-app ./helm-python-app`

```bash
    NAME: python-helm-app
LAST DEPLOYED: Wed Nov  8 10:37:33 2023
NAMESPACE: default
STATUS: pending-install
REVISION: 1
HOOKS:
---
# Source: helm-python-app/templates/tests/test-connection.yaml
apiVersion: v1
kind: Pod
metadata:
  name: "python-helm-app-helm-python-app-test-connection"
  labels:
    helm.sh/chart: helm-python-app-0.1.0
    app.kubernetes.io/name: helm-python-app
    app.kubernetes.io/instance: python-helm-app
    app.kubernetes.io/version: "1.16.0"
    app.kubernetes.io/managed-by: Helm
  annotations:
    "helm.sh/hook": test
spec:
  containers:
    - name: wget
      image: busybox
      command: ['wget']
      args: ['python-helm-app-helm-python-app:80']
  restartPolicy: Never
MANIFEST:
---
# Source: helm-python-app/templates/serviceaccount.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: python-helm-app-helm-python-app
  labels:
    helm.sh/chart: helm-python-app-0.1.0
    app.kubernetes.io/name: helm-python-app
    app.kubernetes.io/instance: python-helm-app
    app.kubernetes.io/version: "1.16.0"
    app.kubernetes.io/managed-by: Helm
automountServiceAccountToken: true
---
# Source: helm-python-app/templates/service.yaml
apiVersion: v1
kind: Service
metadata:
  name: python-helm-app-helm-python-app
  labels:
    helm.sh/chart: helm-python-app-0.1.0
    app.kubernetes.io/name: helm-python-app
    app.kubernetes.io/instance: python-helm-app
    app.kubernetes.io/version: "1.16.0"
    app.kubernetes.io/managed-by: Helm
spec:
  type: NodePort
  ports:
    - port: 80
      targetPort: http
      protocol: TCP
      name: http
  selector:
    app.kubernetes.io/name: helm-python-app
    app.kubernetes.io/instance: python-helm-app
---
# Source: helm-python-app/templates/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: python-helm-app-helm-python-app
  labels:
    helm.sh/chart: helm-python-app-0.1.0
    app.kubernetes.io/name: helm-python-app
    app.kubernetes.io/instance: python-helm-app
    app.kubernetes.io/version: "1.16.0"
    app.kubernetes.io/managed-by: Helm
spec:
  replicas: 1
  selector:
    matchLabels:
      app.kubernetes.io/name: helm-python-app
      app.kubernetes.io/instance: python-helm-app
  template:
    metadata:
      labels:
        helm.sh/chart: helm-python-app-0.1.0
        app.kubernetes.io/name: helm-python-app
        app.kubernetes.io/instance: python-helm-app
        app.kubernetes.io/version: "1.16.0"
        app.kubernetes.io/managed-by: Helm
    spec:
      serviceAccountName: python-helm-app-helm-python-app
      securityContext:
        {}
      containers:
        - name: helm-python-app
          securityContext:
            {}
          image: ":tagname"
          imagePullPolicy: IfNotPresent
          ports:
            - name: http
              containerPort: 80
              protocol: TCP
          livenessProbe:
            httpGet:
              path: /
              port: http
          readinessProbe:
            httpGet:
              path: /
              port: http
          resources:
            {}

NOTES:
1. Get the application URL by running these commands:
  export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services python-helm-app-helm-python-app)
  export NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")
  echo http://$NODE_IP:$NODE_PORT
```

### Check minikube pod and service

```bash
$minikube kubectl get pods,svc

NAME                                                  READY   STATUS             RESTARTS   AGE
pod/python-helm-app-helm-python-app-b69888b8f-cbdkz   1/1     Running   0          5m12s

NAME                                      TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
service/kubernetes                        ClusterIP      10.96.0.1       <none>        443/TCP        44h
service/python-helm-app-helm-python-app   NodePort       10.110.80.62    <none>        80:31047/TCP   5m12s


## Task 2

1. Add pre-install and post-install hooks to helm chart from lab example.

2. Install helm chart. `helm install python-helm-app ./helm-python-app`

```bash
helm install helm-hooks helm-python-app

NAME: helm-hooks
LAST DEPLOYED: Wed Nov  8 10:35:14 2023
NAMESPACE: default
STATUS: deployed
REVISION: 1
NOTES:
1. Get the application URL by running these commands:
  export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services helm-hooks-helm-python-app)
  export NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")
  echo http://$NODE_IP:$NODE_PORT
```

```bash
minikube kubectl get po
NAME                                               READY   STATUS      RESTARTS       AGE
helm-hooks-helm-python-app-6bd66d5d86-m7ztw        1/1     Running     1 (2m2s ago)   4m55s
postinstall-hook                                   0/1     Completed   0              4m55s
preinstall-hook                                    0/1     Completed   0              5m22s
python-helm-app-helm-python-app-6c8d48dbb4-cf86g   1/1     Running     1 (2m1s ago)   21m
```

1. Describe pre-install hook pod.

```bash
minikube kubectl describe po preinstall-hook
Name:             preinstall-hook
Namespace:        default
Priority:         0
Service Account:  default
Node:             minikube/192.168.49.2
Start Time:       Wed, 08 Nov 2023 10:42:14 +0300
Labels:           <none>
Annotations:      helm.sh/hook: pre-install
Status:           Succeeded
IP:               
IPs:              <none>
Containers:
  pre-install-container:
    Container ID:  docker://2f57d67677755e1f75498b479bfa7122a185cd2ee6054626ad8b61bff68d0e66
    Image:         busybox
    Image ID:      docker-pullable://busybox@sha256:3fbc632167424a6d997e74f52b878d7cc478225cffac6bc977eedfe51c7f4e79
    Port:          <none>
    Host Port:     <none>
    Command:
      sh
      -c
      echo The pre-install hook is running && sleep 20
    State:          Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Wed, 08 Nov 2023 10:42:19 +0300
      Finished:     Wed, 08 Nov 2023 10:42:39 +0300
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-l4964 (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             False 
  ContainersReady   False 
  PodScheduled      True 
Volumes:
  kube-api-access-l4964:
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
  Normal  Scheduled  7m45s  default-scheduler  Successfully assigned default/preinstall-hook to minikube
  Normal  Pulling    7m44s  kubelet            Pulling image "busybox"
  Normal  Pulled     7m40s  kubelet            Successfully pulled image "busybox" in 4.382133304s (4.382679808s including waiting)
  Normal  Created    7m40s  kubelet            Created container pre-install-container
  Normal  Started    7m40s  kubelet            Started container pre-install-container
```


1. Describe post-install hook pod.

```bash
minikube kubectl describe po postinstall-hook
Name:             postinstall-hook
Namespace:        default
Priority:         0
Service Account:  default
Node:             minikube/192.168.49.2
Start Time:       Wed, 08 Nov 2023 10:42:41 +0300
Labels:           <none>
Annotations:      helm.sh/hook: post-install
Status:           Succeeded
IP:               
IPs:              <none>
Containers:
  post-install-container:
    Container ID:  docker://02c7084bd78b1e2baea3aaf7f31d94d1eff97af8aab13b0228d6d00c92c05805
    Image:         busybox
    Image ID:      docker-pullable://busybox@sha256:3fbc632167424a6d997e74f52b878d7cc478225cffac6bc977eedfe51c7f4e79
    Port:          <none>
    Host Port:     <none>
    Command:
      sh
      -c
      echo The post-install hook is running && sleep 15
    State:          Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Wed, 08 Nov 2023 10:42:44 +0300
      Finished:     Wed, 08 Nov 2023 10:42:59 +0300
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-c7tkj (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             False 
  ContainersReady   False 
  PodScheduled      True 
Volumes:
  kube-api-access-c7tkj:
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
  Normal  Scheduled  8m19s  default-scheduler  Successfully assigned default/postinstall-hook to minikube
  Normal  Pulling    8m18s  kubelet            Pulling image "busybox"
  Normal  Pulled     8m16s  kubelet            Successfully pulled image "busybox" in 1.747802672s (1.747827506s including waiting)
  Normal  Created    8m16s  kubelet            Created container post-install-container
  Normal  Started    8m16s  kubelet            Started container post-install-container
```