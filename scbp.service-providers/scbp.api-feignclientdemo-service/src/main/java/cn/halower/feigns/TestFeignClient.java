package cn.halower.feigns;

import cn.halower.models.Demo;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by halower on 2018-2-24.
 */
@FeignClient(name = "scbp-api-jpademo-service")
public interface TestFeignClient {
    @GetMapping("/demo/{id}")
    public Demo findDemo(@PathVariable("id") int id);
}
