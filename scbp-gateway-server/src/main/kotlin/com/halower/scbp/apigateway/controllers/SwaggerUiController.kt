package com.halower.scbp.apigateway.controllers

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import springfox.documentation.annotations.ApiIgnore

@Controller
@ApiIgnore
class SwaggerUiController {

    @GetMapping("", "/swagger", "/docs")
    fun redirectSwager(): String {
        return "redirect:/swagger-ui.html"
    }
}