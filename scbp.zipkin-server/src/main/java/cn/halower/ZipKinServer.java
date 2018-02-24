package cn.halower;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import zipkin.server.EnableZipkinServer;

/**
 * Created by halower on 2018-2-24.
 */
@SpringBootApplication
@EnableZipkinServer
public class ZipKinServer {
    public static void main(String[] args) {
        SpringApplication.run(ZipKinServer.class, args);
    }
}

