package com.halower.scbp.gateway.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.netflix.zuul.filters.discovery.PatternServiceRouteMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ZuulConfig {
    private final Logger log = LoggerFactory.getLogger(ZuulConfig.class);
        @Bean
        public PatternServiceRouteMapper serviceRouteMapper() {
            return new PatternServiceRouteMapper(
                    "([^-]+)-service",
                    "$1"){
                @Override
                public String apply(final String serviceId) {
                    String route =  super.apply(serviceId);
                    log.info(serviceId + " -> " +route);
                    return route;
                }
            };
        }
}

