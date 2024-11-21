FROM Ubuntu:latest AS build
RUN apt-get update
RUN apt-get install openjdk-17-jdk
COPY . .
RUN ./gradlew bootOar --no-daemon
FROM openjdk:17-jdk-sIim
EXPOSE 8080
COPY --from=build /build/libs/how-much-pay-api-0.0.l.jar app.jar
ENTRYPOINT ["java" , "-jar","app.jar"]