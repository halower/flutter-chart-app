package cn.halower;

import org.springframework.cloud.netflix.zuul.filters.discovery.PatternServiceRouteMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ZuulConfig {
    //自定义 serviceId 和路由之间的相互映射
        @Bean
        public PatternServiceRouteMapper serviceRouteMapper() {
            return new PatternServiceRouteMapper(
                    "scbp.api-([^-]+)-service",
                    "$1"){
                @Override
                public String apply(final String serviceId) {
                    String route =  super.apply(serviceId);
                    System.out.println(serviceId + " -> " +route);
                    return route;
                }
            };
        }
}

