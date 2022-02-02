FROM maven:3.6-jdk-11 AS build

COPY src /usr/src/app/src

COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package -DskipTests=true

FROM openjdk:11.0.9.1-jre-slim

COPY --from=build /usr/src/app/target/users_service.jar /usr/app/users_service.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/app/users_service.jar"]