package com.newbie.controllers;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;


@RestController
public class TestController {
    @Autowired
    private RestTemplate restTemplate;

    @HystrixCommand(fallbackMethod = "helloFallback")
    @GetMapping("/hello")
    public String hello() {
        return this.restTemplate.getForObject("http://service-provider/hello", String.class);
    }

    private String helloFallback() {
        return "hello, from fallback";
    }
}
