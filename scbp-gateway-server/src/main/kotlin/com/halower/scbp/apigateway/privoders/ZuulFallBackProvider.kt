package com.halower.scbp.apigateway.privoders


import com.alibaba.fastjson.JSONObject
import org.springframework.cloud.netflix.zuul.filters.route.FallbackProvider
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.stereotype.Component;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;



@Component
class ZuulFallBackProvider : FallbackProvider {
    override fun getRoute(): String {
        return "*"
    }

    override fun fallbackResponse(route: String, cause: Throwable): ClientHttpResponse {
        return object : ClientHttpResponse {
            @Throws(IOException::class)
            override fun getStatusCode(): HttpStatus {
                return HttpStatus.OK
            }

            @Throws(IOException::class)
            override fun getRawStatusCode(): Int {
                return HttpStatus.OK.value()
            }

            @Throws(IOException::class)
            override fun getStatusText(): String {
                return HttpStatus.OK.reasonPhrase
            }

            override fun close() {

            }

            @Throws(IOException::class)
            override fun getBody(): InputStream {
                val json = JSONObject()
                json["code"] = "501"
                json["msg"] = "后台接口异常服务自动熔断"
                return ByteArrayInputStream(json.toJSONString().toByteArray(charset("UTF-8")))
            }

            override fun getHeaders(): HttpHeaders {
                val httpHeaders = HttpHeaders()
                httpHeaders.contentType = MediaType.APPLICATION_JSON_UTF8
                return httpHeaders
            }
        }
    }
}