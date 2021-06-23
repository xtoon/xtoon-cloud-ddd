package com.xtoon.cloud.ops.auth.service;

import com.xtoon.cloud.common.core.constant.AuthConstants;
import com.xtoon.cloud.ops.auth.domain.User;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 自定义用户认证和授权
 *
 * @author haoxin
 * @date 2021-05-29
 **/
@Service
@AllArgsConstructor
@Slf4j
public class UserDetailsServiceImpl implements UserDetailsService {

    @Override
    public User loadUserByUsername(String s) throws UsernameNotFoundException {
        String permissions = "log:list";
        List<GrantedAuthority> grantedAuthorities = AuthorityUtils.commaSeparatedStringToAuthorityList(permissions);
        // TODO test
        return new User(1L, "test", AuthConstants.BCRYPT + new BCryptPasswordEncoder().encode("123456"), true, "client", grantedAuthorities);
    }
}
