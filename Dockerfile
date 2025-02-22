# Build Stage
FROM eclipse-temurin:21-jdk AS build
WORKDIR /app
COPY . .
RUN apt-get update && apt-get install -y maven \
    && mvn clean install

# Runtime Stage
FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY --from=build /app/target/demoapp.jar /app/
EXPOSE 8080
CMD ["java", "-jar", "demoapp.jar"]
