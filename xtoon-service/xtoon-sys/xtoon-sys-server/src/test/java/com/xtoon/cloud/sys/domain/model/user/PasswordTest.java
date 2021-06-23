package com.xtoon.cloud.sys.domain.model.user;

import org.junit.jupiter.api.Test;

/**
 * 密码测试
 *
 * @author haoxin
 * @date 2021-06-23
 **/
public class PasswordTest {

    @Test
    public void create() {
        System.out.println(Password.create("123456"));
    }
}
