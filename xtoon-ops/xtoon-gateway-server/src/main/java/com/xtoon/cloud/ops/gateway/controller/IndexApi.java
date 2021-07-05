package com.xtoon.cloud.ops.gateway.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

/**
 * 网关
 *
 * @author haoxin
 * @date 2021-05-28
 **/
@RestController
public class IndexApi {

    /**
     * 网关测试
     *
     * @return
     */
    @RequestMapping("/")
    public Mono<String> index() {
        return Mono.just("xtoon cloud gateway");
    }
}
