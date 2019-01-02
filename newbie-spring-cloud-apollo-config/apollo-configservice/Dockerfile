FROM openjdk:8-jdk-alpine

LABEL MAINTAINER = "hailong<121625933@qq.com>"

RUN mkdir -p /opt/newbie-mico-service/apollo-configservice

WORKDIR /opt/newbie-mico-service/apollo-configservice

ADD ./target/apollo-configservice-1.2.0-SNAPSHOT.jar /opt/newbie-mico-service/apollo-configservice

EXPOSE 8767

ENTRYPOINT ["java", "-jar", "apollo-configservice-1.2.0-SNAPSHOT.jar"]



