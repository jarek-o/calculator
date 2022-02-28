FROM openjdk:11
COPY ./target/calculator-0.0.1-SNAPSHOT-spring-boot.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]
