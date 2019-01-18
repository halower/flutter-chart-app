FROM openjdk:8-jdk-alpine

LABEL MAINTAINER = "hailong<121625933@qq.com>"

RUN mkdir -p /opt/newbie-mico-service/eureka

WORKDIR /opt/newbie-mico-service/eureka

ADD ./build/libs/newbie-spring-clould-eureka.jar .

EXPOSE 8761 8762

ENTRYPOINT ["java", "-jar", "newbie-spring-clould-eureka.jar"]
