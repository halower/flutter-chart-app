package com.halower.scbp.apigateway.config

import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.stereotype.Component
import org.springframework.web.cors.CorsConfiguration
import org.springframework.web.cors.UrlBasedCorsConfigurationSource
import org.springframework.web.filter.CorsFilter

@Component
@Configuration
class CorsConfig {
    @Bean
    fun corsFilter(): CorsFilter {
        val source = UrlBasedCorsConfigurationSource()
        val corsConfiguration = CorsConfiguration()
        corsConfiguration.addAllowedHeader("*")
        corsConfiguration.addAllowedOrigin("*")
        corsConfiguration.addAllowedMethod("*")
        source.registerCorsConfiguration("/**", corsConfiguration)
        return CorsFilter(source)
    }
}