FROM openjdk:8-jdk-alpine

LABEL MAINTAINER = "hailong<121625933@qq.com>"

RUN mkdir -p /opt/newbie-mico-service/springbootadmin

WORKDIR /opt/newbie-mico-service/springbootadmin

ADD ./build/libs/newbie-spring-clould-springbootadmin-server.jar .

EXPOSE 8763

ENTRYPOINT ["java", "-jar", "newbie-spring-clould-springbootadmin-server.jar"]



