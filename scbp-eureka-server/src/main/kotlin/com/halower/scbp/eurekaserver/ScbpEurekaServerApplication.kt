package com.halower.scbp.eurekaserver

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer

@EnableEurekaServer
@SpringBootApplication
class ScbpEurekaServerApplication

fun main(args: Array<String>) {
    runApplication<ScbpEurekaServerApplication>(*args)
}
