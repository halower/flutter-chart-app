package cn.halower.scbp.demos.consumelog;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@EnableEurekaClient
@SpringBootApplication
public class DemoConsumeLogApplication {
    public static void main(String[] args) {
        SpringApplication.run(DemoConsumeLogApplication.class,args);
    }
}
