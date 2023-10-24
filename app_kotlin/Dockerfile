#
# Build stage
#
FROM maven:3.8.4-openjdk-17-slim AS build

RUN useradd -ms /bin/bash testuser
RUN chown testuser /home/testuser

COPY lab1/src /home/testuser/src
COPY lab1/pom.xml /home/testuser

USER testuser
WORKDIR /home/testuser
RUN mvn -f /home/testuser/pom.xml clean package

#
# Run stage
#
FROM openjdk:17-alpine

RUN apk add --update curl
COPY --from=build /home/testuser/target/lab1-0.0.1-SNAPSHOT.jar /usr/local/lib/lab1.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/lab1.jar"]