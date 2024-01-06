FROM gcc:latest

WORKDIR /app

COPY . /app

RUN mkdir -p /app/include

COPY cpp-httplib/httplib.h /app/include/

ENV LD_LIBRARY_PATH=/app:$LD_LIBRARY_PATH

# Create a non-root user and group
RUN groupadd -r myuser && useradd -r -g myuser myuser

# Give permissions to the non-root user for the /app directory
RUN chown -R myuser:myuser /app

# Switch to the non-root user
USER myuser

RUN g++ -o summer-time app.cpp

EXPOSE 80

CMD ["./summer-time"]

