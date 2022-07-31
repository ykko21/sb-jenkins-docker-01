FROM openjdk:11.0.4-jre-slim
WORKDIR /app
ADD target/hello.jar /app/hello.jar
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "hello.jar"]