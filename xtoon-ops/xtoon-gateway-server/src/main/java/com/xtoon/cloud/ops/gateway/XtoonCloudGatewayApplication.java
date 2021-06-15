package com.xtoon.cloud.ops.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * 网关服务
 *
 * @author haoxin
 * @date 2021-06-15
 **/
@EnableDiscoveryClient
@SpringBootApplication
public class XtoonCloudGatewayApplication {
    public static void main(String[] args) {
        SpringApplication.run(XtoonCloudGatewayApplication.class, args);
    }
}
