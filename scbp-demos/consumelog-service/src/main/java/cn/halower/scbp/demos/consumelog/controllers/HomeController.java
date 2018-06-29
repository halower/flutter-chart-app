package cn.halower.scbp.demos.consumelog.controllers;

import cn.halower.scbp.core.annotations.ScbpLogger;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {
    @ScbpLogger("hello")
    @GetMapping("/hello")
    public String Hello() {
        return "hello";
    }

    @ScbpLogger("Hello2")
    @GetMapping("/hello2/{hello}")
    public String Hello2(@PathVariable String hello) {
        return hello;
    }
}
