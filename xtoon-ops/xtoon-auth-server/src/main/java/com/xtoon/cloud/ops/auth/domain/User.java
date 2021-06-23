package com.xtoon.cloud.ops.auth.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;

/**
 * 登录用户信息
 *
 * @author haoxin
 * @date 2021-06-15
 **/
@Data
@NoArgsConstructor
public class User implements UserDetails {

    public User(Long id, String username, String password, Boolean enabled, String clientId, Collection<? extends GrantedAuthority> authorities) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.enabled = enabled;
        this.clientId = clientId;
        this.authorities = authorities;
    }

    private Long id;

    private String username;

    private String password;

    private Boolean enabled;

    private String clientId;

    private Collection<? extends GrantedAuthority> authorities;

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return this.enabled;
    }
}
