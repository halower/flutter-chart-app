package cn.halower.scbpzipkinserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import zipkin.server.EnableZipkinServer;

@EnableEurekaClient
@EnableZipkinServer
@SpringBootApplication
public class ScbpZipKinServerApplication {
    public static void main (String[] args) {
        SpringApplication.run(ScbpZipKinServerApplication.class, args);
    }
}
