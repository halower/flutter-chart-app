package cn.halower;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {
    @Autowired
    DiscoveryClient discoveryClient;

    @GetMapping("/ask")
    public String ask() {
        String services = "ask: " + discoveryClient.getServices();
        System.out.println(services);
        return services;
    }
}
