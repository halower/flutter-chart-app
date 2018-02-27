# SCBP （springcloud boilerplate）
# 项目组成元素
1. 服务注册发现（Eureka）
2. 断路器（Hystrix）
3. 智能路由（Zuul)
4. 客户端负载均衡（Ribbon）
5. 持续集成
6. 配置中心
7. 服务追踪分析 (ZipKin + ELK)
# 项目架构图
![](https://github.com/halower/SCBP/blob/master/images/scbp.png)
# 设计原则   
1. 单一指责原则
2. 服务自治原则
3. 轻量级通信原则
4. 接口明确原则
# 项目解决方案
```
|--scbp.eureka-server: 服务注册和发现        
|--scbp.config-server-git: 配置中心        
|--scbp.api-gateway : 服务网关
|--scbp.zipkin-server: 服务追踪 
|--scbp.admin-dashboard-server: 作用等同于 scbp.eureka-server，功能更强大
|--scbp.service-providers: 服务集合
   |--scbp.api-{服务名}-service: 服务提供者【开发人员介入的工程】 
```
# 使用说明
> 开发人员只关注写自己的服务，即 ```scbp.api-{服务名}-service``` ，服务粒度由开发需求确定，代码越简洁越好
>> 约定如下文件夹功能：
>>> apis - RestController 集合, models - 实体集合, dtos - 数据传输对象集合, feigns - feign接口集合， 其它的待定
## 一、如何获取配置信息
1. 引入以下依赖
```
<dependency>
  <groupId>org.springframework.cloud</groupId>
  <artifactId>spring-cloud-starter-config</artifactId>
</dependency>
```
2. 创建bootstrap.yml配置,指定从配置中心获取相关的配置信息
```
server:
  port: 10002
eureka:
  client:
    service-url:
      defaultZone: http://localhost:xxxx/eureka
spring:
  cloud:
    config:
      discovery:
        enabled: true
        service-id: scbp.config-server
```
3. 如何自动刷新配置 (确保已经安装了```RabbitMQ```)
 - 1.  添加如下依赖
 ```
 <dependency>
   <groupId>org.springframework.cloud</groupId>
   <artifactId>spring-cloud-starter-bus-amqp</artifactId>
 </dependency>
 <dependency>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-actuator</artifactId>
</dependency>
 ```
 - 2. 在bootstrap.yml中添加以下内容:（rabbitmq的默认用户和密码都是guest，而默认端口是5672）
 ```
 ## 刷新时，关闭安全验证
management:
  security:
    enabled: false
## 开启消息跟踪
spring:
   cloud:
     bus:
       trace:
         enabled: true
   rabbitmq:
     host: localhost
     port: 5672
     username: guest 
     password: guest
 ```
 - 3. 添加@RefreshScope注解

## 二、如何添加接口文档注解
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
## 三、 如何创建一个服务
1. 新建一个Maven 项目，如果使用Intellij idea开发的话需要安装Lombok plugin，同时设置 Setting -> Compiler -> Annotation Processors -> Enable annotation processing勾选
2. 在POM.xml 中添加必要的依赖
```
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>1.5.4.RELEASE</version>
        <relativePath/>
    </parent>
    <dependencies>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-eureka</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-config</artifactId>
        </dependency>
        <dependency>
            <groupId>io.springfox</groupId>
            <artifactId>springfox-swagger2</artifactId>
            <version>2.6.1</version>
        </dependency>
        <dependency>
            <groupId>io.springfox</groupId>
            <artifactId>springfox-swagger-ui</artifactId>
            <version>2.6.1</version>
        </dependency>
         <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <version>1.16.16</version>
        </dependency>
    </dependencies>
    <dependencyManagement>
        <dependencies>
            <dependency>
                <groupId>org.springframework.cloud</groupId>
                <artifactId>spring-cloud-dependencies</artifactId>
                <version>Dalston.SR1</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
        </dependencies>
    </dependencyManagement>
    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>
```
3. 在src/main/resources 目录下添加applicattion.yml 配置文件
```
spring:
  application:
    name: xxxx # 服务识别名称
server:
  port: xxxx
eureka:
  client:
    serviceUrl:
      defaultZone: http://localhost:xxxx/eureka/
  instance:
    hostname: xxxx
```
4. 编写程序入口
```
@SpringBootApplication
@EnableEurekaClient
@EnableSwagger2
public class Application {
   public static void main(String[] args) {
       SpringApplication.run(Application.class, args);
   }

    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("api扫描包"))
                .paths(PathSelectors.any())
                .build();
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("接口文档注释")
                .description("接口文档注释说明")
                .termsOfServiceUrl("帮助连接")
                .contact(new Contact("作者", "", "邮箱"))
                .version("1.0")
                .build();
    }
}
```
## 四、如何支持服务追踪
1. 在服务pom.xml中添加如下依赖
```
 <dependency>
    <groupId>org.springframework.cloud</groupId>
    <artifactId>spring-cloud-starter-sleuth</artifactId>
 </dependency>
<dependency>
    <groupId>org.springframework.cloud</groupId>
    <artifactId>spring-cloud-sleuth-zipkin</artifactId>
</dependency>
```
2. 在application.yml中添加如下配置
```
spring:
  zipkin:
    base-url: http://localhost:7000 # zipkin服务地址
  sleuth:
    sampler:
      percentage: 1.0  #测试时获取所有日志,开发后统一调整概率值
```
## 五、 服务间如何进行伪RPC调用
1. 在服务pom.xml中添加如下依赖
```
   <dependency>
       <groupId>org.springframework.cloud</groupId>
       <artifactId>spring-cloud-starter-feign</artifactId>
       <version>1.3.0.RELEASE</version>
   </dependency>
```
2. 使用方式(定义接口后使用依赖注入的方式在使用类中调用)
```
@FeignClient(name = "服务名")
public interface TestFeignClient {
    @GetMapping("/demo/{id}")
    public Demo findDemo(@PathVariable("id") int id);
}
```
## 下一步计划
1. JPA服务样例
2. 配置中心支持本地文件和gitlab
3. 支持服务高可用
4. 消息驱动
