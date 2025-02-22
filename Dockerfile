# Build Stage
FROM maven:3.9.0-eclipse-temurin-21 AS build
WORKDIR /app
COPY . .
RUN mvn clean install

# Runtime Stage
FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY --from=build /app/target/demoapp.jar /app/
EXPOSE 8080
CMD ["java", "-jar", "demoapp.jar"]
