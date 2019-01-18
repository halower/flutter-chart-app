package com.newbie.providers;

import com.newbie.models.ApiMeta;
import com.newbie.repositorys.ApiMetaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.netflix.zuul.filters.Route;
import org.springframework.cloud.netflix.zuul.filters.RouteLocator;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;
import springfox.documentation.swagger.web.SwaggerResource;
import springfox.documentation.swagger.web.SwaggerResourcesProvider;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

@Primary
@Component
public class SwaggerConfigProvider implements SwaggerResourcesProvider {
    private final RouteLocator routeLocator;
    @Autowired
    private ApiMetaRepository repository;

    public SwaggerConfigProvider(RouteLocator routeLocator) {
        this.routeLocator = routeLocator;
    }

    /**
     * note: 后期全部移到配置中心
     * @return
     */
    @Override
    public List<SwaggerResource> get() {
        List resources = new ArrayList<>();
        List<Route> routes = routeLocator.getRoutes();
        List<String> ignoreServices = new ArrayList<String>();
        ignoreServices.add("newbie-spring-cloud-adminserver");
        ignoreServices.add("newbie-spring-cloud-eureka-service");
        ignoreServices.add("newbie-spring-cloud-eureka-service");
        ignoreServices.add("newbie-spring-cloud-apollo-configservice");
        ignoreServices.add("newbie-spring-cloud-apollo-adminservice");
        ignoreServices.add("apollo-configservice");
        ignoreServices.add("apollo-adminservice");
        ignoreServices.add("newbie-spring-clould-admin-server"); //兼容之前的错误拼写，后期删除
        ignoreServices.add("newbie-eureka-service");//兼容之前的错误拼写，后期删除

        routes.forEach(route -> {
           if(!(ignoreServices.contains(route.getId()) || repository.existsById(route.getId()))){
               repository.save(new ApiMeta(route.getId(),route.getFullPath().replace("**", "v2/api-docs"),"", false));
            }
        });

        repository.findAll().forEach(doc -> {
            if(!doc.getIsPrivate()) {
                resources.add(swaggerResource(doc.getDescription().isEmpty()?doc.getServiceName():doc.getDescription() ,doc.getDocJsonUrl(),"2.0"));
            }
        });
        return resources;
    }

    private SwaggerResource swaggerResource(String name, String location, String version) {
        SwaggerResource swaggerResource = new SwaggerResource();
        swaggerResource.setName(name);
        swaggerResource.setLocation(location);
        swaggerResource.setSwaggerVersion(version);
        return swaggerResource;
    }
}
