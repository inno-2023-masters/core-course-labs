### Application builder image
FROM eclipse-temurin:17-jdk AS APP_BUILDER

# Set working directory
WORKDIR /app_kotlin

# Copy project files excepting those in .dockerignore
COPY . .

# build application
RUN ./gradlew bootJar --no-daemon


### Application executable image
FROM eclipse-temurin:17-jre

# set working directory
WORKDIR /app_kotlin

# add user 'user'
RUN addgroup --system user && adduser --system --group user
# give user permissions for `/app_python` dir
RUN chown user /app_kotlin
# switch to user 'user'
USER user

COPY --from=APP_BUILDER app_kotlin/build/libs/app_kotlin-1.0.0.jar .

EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "/app_kotlin/app_kotlin-1.0.0.jar" ]
