# Helm
## Task 1 
```
▶kubectl get pods,svc
NAME                              READY   STATUS    RESTARTS   AGE
pod/python-app-7c7d44969c-kfzvm   1/1     Running   0          27s

NAME                 TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)    AGE
service/kubernetes   ClusterIP   10.96.0.1      <none>        443/TCP    7d4h
service/python-app   ClusterIP   10.100.65.78   <none>        8080/TCP   27s
```
## Task 2
Dry run logs
```
▶helm install --dry-run helm-hooks python-app
NAME: helm-hooks
LAST DEPLOYED: Wed Nov  8 04:18:16 2023
NAMESPACE: default
STATUS: pending-install
REVISION: 1
HOOKS:
---
# Source: python-app/templates/post-install-hook.yaml
apiVersion: v1
kind: Pod
metadata:
   name: postinstall-hook
   annotations:
       "helm.sh/hook": "post-install"
       "helm.sh/hook-delete-policy": hook-succeeded,hook-failed
spec:
  containers:
  - name: post-install-container
    image: busybox
    imagePullPolicy: Always
    command: ['sh', '-c', 'echo Hello from the post-install hook && sleep 5' ]
  restartPolicy: Never
  terminationGracePeriodSeconds: 0
---
# Source: python-app/templates/pre-install-hook.yaml
apiVersion: v1
kind: Pod
metadata:
   name: preinstall-hook
   annotations:
       "helm.sh/hook": "pre-install"
       "helm.sh/hook-delete-policy": hook-succeeded,hook-failed
spec:
  containers:
  - name: pre-install-container
    image: busybox
    imagePullPolicy: IfNotPresent
    command: ['sh', '-c', 'echo Hello from the pre-install hook && sleep 5' ]
  restartPolicy: Never
  terminationGracePeriodSeconds: 0
```
kubectl logs, though this doesnt tell much due to hook-delete-policy
```
▶kubectl get po
NAME                          READY   STATUS    RESTARTS   AGE
python-app-7c7d44969c-kfzvm   1/1     Running   0          2m58s

▶kubectl describe po pre-install-hook
Error from server (NotFound): pods "pre-install-hook" not found

▶kubectl describe po post-install-hook
Error from server (NotFound): pods "post-install-hook" not found
```
