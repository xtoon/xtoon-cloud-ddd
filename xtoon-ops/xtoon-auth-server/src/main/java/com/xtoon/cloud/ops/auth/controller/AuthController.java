package com.xtoon.cloud.ops.auth.controller;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.endpoint.TokenEndpoint;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.Map;

/**
 * 认证中心
 *
 * @author haoxin
 * @date 2021-05-29
 **/
@RestController
@RequestMapping("/oauth")
@AllArgsConstructor
@Slf4j
public class AuthController {

    private TokenEndpoint tokenEndpoint;

    @PostMapping("/token")
    public OAuth2AccessToken postAccessToken(
            Principal principal,
            @RequestParam Map<String, String> parameters
    ) throws HttpRequestMethodNotSupportedException {
        OAuth2AccessToken oAuth2AccessToken;
        oAuth2AccessToken = tokenEndpoint.postAccessToken(principal, parameters).getBody();
        return oAuth2AccessToken;
    }
}
