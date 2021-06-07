package com.xtoon.cloud.common.core.util;

import lombok.experimental.UtilityClass;

/**
 * 用户ID存储器
 *
 * @author haoxin
 * @date 2021-05-21
 **/
@UtilityClass
public class UserContext {

    /**
     * 支持父子线程之间的数据传递
     */
    private final ThreadLocal<String> THREAD_LOCAL_USER = new ThreadLocal<>();

    /**
     * 设置用户ID
     *
     * @param userId 租户ID
     */
    public void setUserId(String userId) {
        THREAD_LOCAL_USER.set(userId);
    }

    /**
     * 获取TTL中的用户ID
     *
     * @return String
     */
    public String getUserId() {
        return THREAD_LOCAL_USER.get();
    }

    /**
     * 清除用户ID
     */
    public void clear() {
        THREAD_LOCAL_USER.remove();
    }
}
