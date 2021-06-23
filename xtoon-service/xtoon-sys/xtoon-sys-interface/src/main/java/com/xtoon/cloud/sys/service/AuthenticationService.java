package com.xtoon.cloud.sys.service;

import com.xtoon.cloud.sys.dto.AuthenticationDTO;

/**
 * 认证服务接口
 *
 * @author haoxin
 * @date 2021-06-23
 **/
public interface AuthenticationService {

    /**
     * 验证验证码
     *
     * @param uuid
     * @return
     */
    boolean validateCaptcha(String uuid, String captchaCode);

    /**
     * 认证
     *
     * @param userName 用户名
     * @return
     */
    AuthenticationDTO loginByUserName(String userName);
}
