package com.newbie.controllers;

import com.newbie.feigns.HelloFeignClient;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class TestController {
    @Autowired
    private HelloFeignClient helloFeignClient;

    @HystrixCommand(fallbackMethod = "helloFallback")
    @GetMapping("/hello")
    public String hello() {
       return this.helloFeignClient.hello();
    }

    private String helloFallback() {
        return "hello, from fallback";
    }
}
