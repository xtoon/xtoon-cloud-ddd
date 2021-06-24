package com.xtoon.cloud.common.tenant.util;

import com.xtoon.cloud.common.core.constant.CommonConstant;
import com.xtoon.cloud.common.core.util.TenantContext;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 租户拦截
 *
 * @author haoxin
 * @date 2021-06-21
 **/
@Component
public class TenantHandlerInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse response, Object handler) {
        // 多租户支持
        String tenantId = httpServletRequest.getHeader(CommonConstant.TENANT_ID);
        if (StringUtils.isNoneBlank(tenantId)) {
            TenantContext.setTenantId(tenantId);
        }
        return true;
    }
}
