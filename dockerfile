# Etapa de construcción
FROM gradle:7.6.2-jdk17 AS build
WORKDIR /app
COPY . .
RUN ./gradlew bootJar --no-daemon

# Etapa de ejecución
FROM openjdk:21-jdk-slim
WORKDIR /app
EXPOSE 8080
COPY --from=build /app/build/libs/how-much-pay-api-0.0.1.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
