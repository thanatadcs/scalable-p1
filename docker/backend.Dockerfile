FROM maven:3.8.6-jdk-11 AS builder
WORKDIR /ums-backend
COPY . .
RUN mvn clean package

FROM openjdk:11
WORKDIR /ums-backend
COPY --from=builder /ums-backend/target/ums-1.0.jar /ums-backend
EXPOSE 8080
CMD ["java", "-jar", "ums-1.0.jar"]
