# Use the official Go base image
FROM golang:1.21-alpine as build

# Set the working directory in the container
WORKDIR /app

# Copy the application code
COPY /src .

# Build application using static compilation
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags="-s -w -extldflags \"-static\"" -o go_app

# Second stage of docker build
FROM alpine:3.18.3 as final

# Set the working directory in the container
WORKDIR /

# Add required package
RUN apk --no-cache add tzdata=2023c-r1

# Copy compiled application and .env
COPY --from=build /app/go_app /app/go.env /

# Copy templates folder as it is not included in binary file
COPY --from=build /app/templates /templates

# Run the application as a non-root user
RUN addgroup -g 1000 myuser \
    && adduser -D -u 1000 -G myuser myuser
USER myuser

# Expose port 8070
EXPOSE 8070

# Run application
CMD [ "./go_app" ]