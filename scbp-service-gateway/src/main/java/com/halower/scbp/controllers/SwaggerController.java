package com.halower.scbp.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import springfox.documentation.annotations.ApiIgnore;

@Controller
@ApiIgnore
public class SwaggerController {

    @GetMapping({ "", "/swagger", "/docs" })
    public String redirectSwager() {
        return "redirect:/swagger-ui.html";
    }

}
