package com.halower.scbp.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;
import org.springframework.context.annotation.ComponentScan;

@EnableZuulProxy
@EnableDiscoveryClient
@SpringBootApplication
public class ScbpApiGatewayApplication {

	public static void main(String[] args) {
		SpringApplication.run(ScbpApiGatewayApplication.class, args);
	}
}
