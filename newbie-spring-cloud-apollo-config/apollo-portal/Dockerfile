FROM openjdk:8-jdk-alpine

LABEL MAINTAINER = "hailong<121625933@qq.com>"

RUN mkdir -p /opt/newbie-mico-service/apollo-portal

WORKDIR /opt/newbie-mico-service/apollo-portal

ADD ./target/apollo-portal-1.2.0-SNAPSHOT.jar /opt/newbie-mico-service/apollo-portal

EXPOSE 8767

ENTRYPOINT ["java", "-jar", "apollo-portal-1.2.0-SNAPSHOT.jar"]



