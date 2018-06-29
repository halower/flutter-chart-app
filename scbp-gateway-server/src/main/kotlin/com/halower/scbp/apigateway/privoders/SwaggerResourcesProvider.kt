package com.halower.scbp.apigateway.privoders

import org.springframework.cloud.netflix.zuul.filters.RouteLocator
import org.springframework.context.annotation.Primary
import org.springframework.stereotype.Component
import springfox.documentation.swagger.web.SwaggerResource
import springfox.documentation.swagger.web.SwaggerResourcesProvider

@Component
@Primary
class SwaggerResourcesProvider(private val routeLocator: RouteLocator) : SwaggerResourcesProvider {
    override fun get(): List<SwaggerResource> {
        val resources = mutableListOf<SwaggerResource>()
        val routes = routeLocator.routes
        routes.forEach { resources.add(swaggerResource(it.id, it.fullPath.replace("**", "v2/api-docs"))) }

        return resources
    }

    private fun swaggerResource(name: String, location: String): SwaggerResource {
        val swaggerResource = SwaggerResource()
        swaggerResource.name = name
        swaggerResource.location = location
        swaggerResource.swaggerVersion = "2.0"
        return swaggerResource
    }
}