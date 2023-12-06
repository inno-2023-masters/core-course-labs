FROM golang:1.20-alpine

WORKDIR /app

# Create user
RUN addgroup -g 2000 node && adduser -u 2000 -G node -s /bin/sh -D node

# Install dependencies
COPY go.* /app/
RUN go mod download

COPY volume/visits /app/volume/visits

# Build the binary
COPY *.go /app/
RUN go build -v -o appgo

EXPOSE 9000

USER node

CMD ["/app/appgo"]
