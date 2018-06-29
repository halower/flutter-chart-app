package com.halower.scbp.adminserver

import de.codecentric.boot.admin.server.config.EnableAdminServer
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.cloud.netflix.eureka.EnableEurekaClient


@EnableEurekaClient
@EnableAdminServer
@SpringBootApplication
class ScbpAdminServerApplication

fun main(args: Array<String>) {
    runApplication<ScbpAdminServerApplication>(*args)
}
