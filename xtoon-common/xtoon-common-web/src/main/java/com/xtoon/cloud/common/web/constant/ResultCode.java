package com.xtoon.cloud.common.web.constant;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

/**
 * 返回数据定义
 *
 * @author haoxin
 * @date 2021-05-21
 */
@AllArgsConstructor
@NoArgsConstructor
public enum ResultCode {

    /**
     * success
     */
    SUCCESS(0, "success"),

    /**
     * 系统异常
     */
    SERVER_ERROR(500, "系统异常"),

    /**
     * 认证失败
     */
    UNAUTHORIZED(401, "认证失败");

    private int code;

    private String msg;

    public Integer getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    @Override
    public String toString() {
        return "{" +
                "\"code\":\"" + code + '\"' +
                ", \"msg\":\"" + msg + '\"' +
                '}';
    }


    public static ResultCode getValue(int code) {
        for (ResultCode value : values()) {
            if (value.getCode() == code) {
                return value;
            }
        }
        return null;
    }
}
