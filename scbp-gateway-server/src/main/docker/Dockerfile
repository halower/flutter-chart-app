FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
LABEL maintainer ="halower<121625933@qq.com>"
ADD scbp-api-gateway-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]