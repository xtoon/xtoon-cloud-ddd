package com.xtoon.cloud.ops.auth.service;

import com.xtoon.cloud.ops.auth.domain.User;
import com.xtoon.cloud.sys.dto.AuthenticationDTO;
import com.xtoon.cloud.sys.service.AuthenticationService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * 自定义用户认证和授权
 *
 * @author haoxin
 * @date 2021-05-29
 **/
@Service
@Slf4j
public class UserDetailsServiceImpl implements UserDetailsService {

    @DubboReference
    protected AuthenticationService authenticationService;

    @Override
    public User loadUserByUsername(String username) throws UsernameNotFoundException {
        AuthenticationDTO authenticationDTO = authenticationService.loginByUserName(username);
        if (authenticationDTO != null) {
            return new User(authenticationDTO);
        } else {
            throw new UsernameNotFoundException("");
        }
    }
}
