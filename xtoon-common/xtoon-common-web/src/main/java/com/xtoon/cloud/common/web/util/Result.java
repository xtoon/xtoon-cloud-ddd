package com.xtoon.cloud.common.web.util;

import com.xtoon.cloud.common.web.constant.ResultCode;

import java.util.HashMap;
import java.util.Map;

/**
 * 返回数据
 *
 * @author haoxin
 * @date 2021-05-21
 */
public class Result extends HashMap<String, Object> {

    private static final long serialVersionUID = 1L;

    public Result() {
        put("code", ResultCode.SUCCESS.getCode());
        put("msg", ResultCode.SUCCESS.getMsg());
    }

    public static Result error() {
        return error(ResultCode.SERVER_ERROR.getCode(), ResultCode.SERVER_ERROR.getMsg());
    }

    public static Result error(String msg) {
        return error(ResultCode.SERVER_ERROR.getCode(), msg);
    }

    public static Result error(int code, String msg) {
        Result r = new Result();
        r.put("code", code);
        r.put("msg", msg);
        return r;
    }

    public static Result ok(String msg) {
        Result r = new Result();
        r.put("msg", msg);
        return r;
    }

    public static Result ok(Map<String, Object> map) {
        Result r = new Result();
        r.putAll(map);
        return r;
    }

    public static Result ok() {
        return new Result();
    }

    @Override
    public Result put(String key, Object value) {
        super.put(key, value);
        return this;
    }
}
