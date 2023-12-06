# Stage 1: Build the Go application
FROM golang:1.21-bullseye as builder

LABEL build-date="2023-09-13T09:00:00Z" \
    name="app_go" \
    maintainer="Mikhail Fedorov" \
    schema-version="0.1" \
    description="Simple Go web app in Gin to show UTC+3 time"

WORKDIR /build

COPY go.mod .

RUN go mod download

COPY . .

EXPOSE 8080

RUN go build -o main -ldflags "-linkmode external -extldflags -static" main.go

# Stage 2: Create the final image
FROM alpine:latest

RUN addgroup -g 1000 mygroup && adduser -u 1000 -G mygroup -s /bin/sh -D myuser

WORKDIR /app

COPY --from=builder /build/main /app/main

COPY templates /app/templates

COPY static /app/static

USER myuser:mygroup

EXPOSE 8080

CMD [ "./main" ]