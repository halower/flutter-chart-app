package cn.halower;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.config.server.EnableConfigServer;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableConfigServer
@EnableEurekaClient
public class ConfigServerApplication{
    public static void main(String[] args) {
        new SpringApplicationBuilder(ConfigServerApplication.class).web(true).run(args);
    }
}
