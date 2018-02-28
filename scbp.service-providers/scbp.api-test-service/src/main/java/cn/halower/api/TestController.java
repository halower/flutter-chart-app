package cn.halower.api;

import cn.halower.feigns.TestFeignClient;
import cn.halower.models.Demo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RefreshScope
public class TestController {
    @Autowired
    private DiscoveryClient discoveryClient;
    @Autowired
    private TestFeignClient testFeignClient;
    
    @GetMapping("/ask")
    public String ask() {
        String services = "ask: " + discoveryClient.getServices();
        System.out.println(services);
        return services;
    }

    @GetMapping("/demo/{id}")
    public Demo findDemo(int id) {
        return testFeignClient.findDemo(id);
    }
}
