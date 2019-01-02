package com.newbie.feigns;

import feign.hystrix.FallbackFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class HelloFallbackFactory implements FallbackFactory<HelloFeignClient> {
    private static final Logger LOGGER = LoggerFactory.getLogger(HelloFallbackFactory.class);
    @Override
    public HelloFeignClient create(Throwable cause) {
        return () -> {
            HelloFallbackFactory.LOGGER.info("回退原因：" + cause);
            return "hello, from fallback's factory";
        };
    }
}
