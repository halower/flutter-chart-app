package com.halower.scbp.apigateway.config

import org.slf4j.LoggerFactory
import org.springframework.cloud.netflix.zuul.filters.discovery.PatternServiceRouteMapper
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration

@Configuration
class ZuulConfig {
    private val log = LoggerFactory.getLogger(ZuulConfig::class.java)
    @Bean
    fun serviceRouteMapper(): PatternServiceRouteMapper {
        return object : PatternServiceRouteMapper(
                "([^-]+)-service",
                "$1") {
            override fun apply(serviceId: String): String {
                val route = super.apply(serviceId)
                log.info("$serviceId -> $route")
                return route
            }
        }
    }
}
