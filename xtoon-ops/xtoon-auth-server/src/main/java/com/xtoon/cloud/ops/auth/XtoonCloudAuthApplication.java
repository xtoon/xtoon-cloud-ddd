package com.xtoon.cloud.ops.auth;

import org.apache.dubbo.config.spring.context.annotation.DubboComponentScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * 认证服务
 *
 * @author haoxin
 * @date 2021-06-15
 **/
@EnableDiscoveryClient
@SpringBootApplication
@DubboComponentScan(basePackages = "com.xtoon.cloud.ops.auth")
public class XtoonCloudAuthApplication {
    public static void main(String[] args) {
        SpringApplication.run(XtoonCloudAuthApplication.class);
    }
}
