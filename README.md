# SCBP （springcloud boilerplate）
# 项目组成元素
1. 服务注册发现（Eureka）
2. 断路器（Hystrix）
3. 智能路由（Zuul)
4. 客户端负载均衡（Ribbon）
5. 持续集成
# 项目架构图
![](https://github.com/halower/SCBP/blob/master/images/scbp.png)
# 设计原则   
1. 单一指责原则
2. 服务自治原则
3. 轻量级通信原则
4. 接口明确原则
# 项目解决方案
scbp.eureka-server: 服务注册和发现     
scbp.api-{服务名}-service: 服务提供者【开发人员关注项目】    
scbp.config-server-git: 配置中心        
scbp.api-gateway : 服务网关    
# 使用说明
## 如何获取配置信息
1. 引入以下依赖
```
<dependency>
  <groupId>org.springframework.cloud</groupId>
  <artifactId>spring-cloud-starter-config</artifactId>
</dependency>
```
2. 创建bootstrap.yml配置,指定从配置中心获取相关的配置信息
```
spring:
  application:
    name: your application' name
  cloud:
    config:
      uri: http://localhost: 9003
      profile: default
      label: master

server:
  port: your port
```
3. 现在即可直接通过当前应用访问到所需配置，etc. http://localhost:9005/name
## 如何添加接口文档注解
```
@Api：说明该类的作用
@ApiOperation：用在方法上，说明方法的作用，每一个url资源的定义
@ApiParam： 参数说明(required = “是否必须参数”, name = “参数名称”, value = “参数具体描述）
@ApiImplicitParams：用在方法上包含一组参数说明；
@ApiImplicitParam：用在@ApiImplicitParams注解中，指定一个请求参数的各个方面
  paramType：参数放在哪个地方
    path	以地址的形式提交数据
    query	直接跟参数完成自动映射赋值
    body	以流的形式提交 仅支持POST
    header	参数在request headers 里边提交
    form	以form表单的形式提交 仅支持POST
  name：参数代表的含义
  value：参数名称
  dataType： 参数类型，有String/int，无用
  required ： 是否必要
  defaultValue：参数的默认值
@ApiResponses：用于表示一组响应；
@ApiResponse：用在@ApiResponses中，一般用于表达一个错误的响应信息；
  code： 响应码(int型)，可自定义
  message：状态码对应的响应信息
@ApiModel：描述一个Model的信息（这种一般用在post创建的时候，使用@RequestBody这样的场景，请求参数无法使用@ApiImplicitParam注解进行描述的时候；)
@ApiModelProperty：描述一个model的属性。

---------示例代码-----------
@ApiOperation("信息软删除")
@ApiResponses({ @ApiResponse(code = CommonStatus.OK, message = "操作成功"),
        @ApiResponse(code = CommonStatus.EXCEPTION, message = "服务器内部异常"),
        @ApiResponse(code = CommonStatus.FORBIDDEN, message = "权限不足") })
@ApiImplicitParams({
   @ApiImplicitParam(paramType = "query", dataType = "Long", name = "id", value = "信息id", required = true)
})
@RequestMapping(value = "/remove.json", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
public RestfulProtocol remove(Long id) {
```


