package cn.halower.apis;

import cn.halower.models.Demo;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {
    @ApiOperation("按照Id查询Demo")
    @ApiImplicitParams({
      @ApiImplicitParam(paramType = "query", dataType = "Long", name = "id", value = "DemoId", required = true)
    })
   public Demo findDemo(Long id) {
       return new Demo(id, "测试");
   }
}
