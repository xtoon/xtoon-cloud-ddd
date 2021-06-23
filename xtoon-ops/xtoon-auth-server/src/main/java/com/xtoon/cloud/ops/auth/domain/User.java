package com.xtoon.cloud.ops.auth.domain;

import com.xtoon.cloud.common.core.constant.AuthConstants;
import com.xtoon.cloud.common.core.domain.StatusEnum;
import com.xtoon.cloud.sys.dto.AuthenticationDTO;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.commons.lang.StringUtils;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;


/**
 * 登录用户信息
 */
@Data
@NoArgsConstructor
public class User implements UserDetails {

    private String id;

    private String username;

    private String password;

    private Boolean enabled;

    private String tenantId;

    private Collection<GrantedAuthority> authorities;

    public User(AuthenticationDTO authenticationDTO) {
        this.setId(authenticationDTO.getUserId());
        this.setUsername(authenticationDTO.getUserName());
        this.setPassword(AuthConstants.BCRYPT + authenticationDTO.getPassword());
        this.setEnabled(StatusEnum.ENABLE.getValue().equals(authenticationDTO.getStatus()));
        this.setTenantId(authenticationDTO.getTenantId());
        this.authorities = AuthorityUtils.commaSeparatedStringToAuthorityList(StringUtils.join(authenticationDTO.getPermissionCodes(), ","));
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return this.authorities;
    }

    @Override
    public String getPassword() {
        return this.password;
    }

    @Override
    public String getUsername() {
        return this.username;
    }

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
