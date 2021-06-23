package com.xtoon.cloud.common.core.util;

import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.xtoon.cloud.common.core.constant.CommonConstant;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * 请求工具类
 *
 * @author haoxin
 * @date 2021-06-01
 **/
@Slf4j
public class RequestUtils {

    public static HttpServletRequest getRequest() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request;
    }

    public static JSONObject getJwtPayload() {
        String jwtPayload = getRequest().getHeader(CommonConstant.JWT_PAYLOAD_KEY);
        JSONObject jsonObject = JSONUtil.parseObj(jwtPayload);
        return jsonObject;
    }

    public static String getUserId() {
        String userId = getJwtPayload().getStr(CommonConstant.USER_ID);
        return userId;
    }


    public static String getUserName() {
        String userName = getJwtPayload().getStr(CommonConstant.USER_NAME);
        return userName;
    }
}
