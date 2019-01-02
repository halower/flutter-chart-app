FROM openjdk:8-jdk-alpine

LABEL MAINTAINER = "hailong<121625933@qq.com>"

RUN mkdir -p /opt/newbie-mico-service/apollo-adminservice

WORKDIR /opt/newbie-mico-service/apollo-adminservice

ADD ./target/apollo-adminservice-1.2.0-SNAPSHOT.jar /opt/newbie-mico-service/apollo-adminservice

EXPOSE 8769

ENTRYPOINT ["java", "-jar", "apollo-adminservice-1.2.0-SNAPSHOT.jar"]



