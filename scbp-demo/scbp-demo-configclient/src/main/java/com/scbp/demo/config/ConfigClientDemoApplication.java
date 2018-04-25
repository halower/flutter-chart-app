package com.scbp.demo.config;

import com.ctrip.framework.apollo.spring.annotation.EnableApolloConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@EnableDiscoveryClient
@SpringBootApplication
@RestController
@EnableApolloConfig
public class ConfigClientDemoApplication {
    public static void main(String[] args) {
        SpringApplication.run(ConfigClientDemoApplication.class, args);
    }
    @GetMapping("/hello")
    public String hello(){
        return "Hello, World" ;
    }
}
