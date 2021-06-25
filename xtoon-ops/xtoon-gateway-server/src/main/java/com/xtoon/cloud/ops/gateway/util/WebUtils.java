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

    private static final String ALLOWED_HEADERS = "X-Requested-With, tenant_id, Blade-Auth, Content-Type, Authorization, credential, X-XSRF-TOKEN, token, username, client, knfie4j-gateway-request, request-origion";
    private static final String ALLOWED_METHODS = "GET,POST,PUT,DELETE,OPTIONS,HEAD";
    private static final String ALLOWED_ORIGIN = "http://localhost:8001";
    private static final String ALLOWED_EXPOSE = "*";
    private static final String MAX_AGE = "18000L";

    public static Mono<Void> getAuthFailResult(ServerHttpResponse response, Integer code) {
        response.setStatusCode(HttpStatus.OK);
        response.getHeaders().add("Content-Type", "application/json;charset=UTF-8");
        response.getHeaders().add("Access-Control-Allow-Headers", ALLOWED_HEADERS);
        response.getHeaders().add("Access-Control-Allow-Methods", ALLOWED_METHODS);
        response.getHeaders().add("Access-Control-Allow-Origin", ALLOWED_ORIGIN);
        response.getHeaders().add("Access-Control-Expose-Headers", ALLOWED_EXPOSE);
        response.getHeaders().add("Access-Control-Max-Age", MAX_AGE);
        response.getHeaders().add("Access-Control-Allow-Credentials", "true");
        byte[] responseByte = new Gson().toJson(Result.error(code, ResultCode.getValue(code).getMsg())).getBytes(StandardCharsets.UTF_8);
        DataBuffer buffer = response.bufferFactory().wrap(responseByte);
        return response.writeWith(Flux.just(buffer));
    }
}
