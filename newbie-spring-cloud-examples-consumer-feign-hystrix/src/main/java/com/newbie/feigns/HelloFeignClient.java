package com.newbie.feigns;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
@FeignClient(name = "service-provider")
//@FeignClient(name = "service-provider", fallbackFactory = HelloFallbackFactory.class)
public interface HelloFeignClient {
    @GetMapping("/hello")
    String hello();
}
