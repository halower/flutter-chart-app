package com.halower.scbp.gateway.config;

import org.springframework.cloud.netflix.zuul.filters.discovery.PatternServiceRouteMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ZuulConfig {
        @Bean
        public PatternServiceRouteMapper serviceRouteMapper() {
            return new PatternServiceRouteMapper(
                    "scbp-([^-]+)-service",
                    "halower-$1"){
                @Override
                public String apply(final String serviceId) {
                    String route =  super.apply(serviceId);
                    System.out.println(serviceId + " -> " +route);
                    return route;
                }
            };
        }
}

