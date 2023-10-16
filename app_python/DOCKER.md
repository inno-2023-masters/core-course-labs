# Best practices used in my dockerfile:
* ## Avoid rootless containers
```
RUN adduser -D myuser && chown -R myuser /app
USER myuser
```
* ## Avoid binding to a specific UID
```
ENV APP_TMP_DATA=/tmp
ENTRYPOINT ["/app"]
```  
* ## Make executables owned by root and not writable
My container do not update its code automatically at runtime
* ## Use trusted base images
```
FROM python:3.9-alpine
```
* ## ADD, COPY
I use COPY instructions over ADD
```
COPY ./requirements.txt /app/requirements.txt
```