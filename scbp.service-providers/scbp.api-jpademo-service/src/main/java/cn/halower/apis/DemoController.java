package cn.halower.apis;

import cn.halower.models.Demo;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {
    @ApiOperation("按照Id查询Demo")
    @ApiImplicitParams({
      @ApiImplicitParam(paramType = "query", dataType = "int", name = "id", value = "标识", required = true)
    })
    @GetMapping("/demo/{id}")
   public Demo findDemo(int id) {
       return new Demo(id, "测试" + id);
   }
}
