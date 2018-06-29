package com.halower.scbp.eurekaserver.controllers

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class HelloKotlinController{
    @GetMapping("/hk")
    fun hello():String = "Hello,Kotlin"
}

