package com.xtoon.cloud.sys;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * 系统服务
 *
 * @author haoxin
 * @date 2021-06-18
 **/
@EnableDiscoveryClient
@SpringBootApplication
public class XtoonCloudSysApplication {
    public static void main(String[] args) {
        SpringApplication.run(XtoonCloudSysApplication.class);
    }
}
