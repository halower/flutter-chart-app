package cn.halower.zipkin_actuator;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@EnableEurekaClient
@SpringBootApplication
@RequestMapping("/user")
public class DemoZipKinActuatorApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoZipKinActuatorApplication.class, args);
    }


    @GetMapping("/hi")
    public String hi () {
        return "msg from zipkin_actuator";
    }
}
