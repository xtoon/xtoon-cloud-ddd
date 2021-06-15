package com.xtoon.cloud.ops.gateway.util;

import com.google.gson.Gson;
import com.xtoon.cloud.common.web.constant.ResultCode;
import com.xtoon.cloud.common.web.util.Result;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpResponse;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.nio.charset.StandardCharsets;

/**
 * web工具类
 *
 * @author haoxin
 * @date 2021-05-29
 **/
public class WebUtils {

    public static Mono<Void> getAuthFailResult(ServerHttpResponse response, Integer code) {
        response.setStatusCode(HttpStatus.OK);
        response.getHeaders().add("Content-Type", "application/json;charset=UTF-8");
        byte[] responseByte = new Gson().toJson(Result.error(code, ResultCode.getValue(code).getMsg())).getBytes(StandardCharsets.UTF_8);
        DataBuffer buffer = response.bufferFactory().wrap(responseByte);
        return response.writeWith(Flux.just(buffer));
    }
}
