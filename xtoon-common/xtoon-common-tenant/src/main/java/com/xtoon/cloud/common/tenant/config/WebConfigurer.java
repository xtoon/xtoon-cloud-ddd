package com.xtoon.cloud.common.tenant.config;

import com.xtoon.cloud.common.tenant.util.TenantHandlerInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * 拦截器配置
 *
 * @author haoxin
 * @date 2021-06-24
 **/
@Configuration
public class WebConfigurer extends WebMvcConfigurerAdapter {

    @Autowired
    private TenantHandlerInterceptor tenantHandlerInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(tenantHandlerInterceptor)
                .excludePathPatterns("/auth/*");
    }
}
