package com.xtoon.cloud.sys.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * 日志dto
 *
 * @author haoxin
 * @date 2021-06-21
 **/
@Data
public class LogDTO implements Serializable {

    /**
     * 用户名
     */
    private String userName;

    /**
     * 用户操作
     */
    private String operation;

    /**
     * 请求方法
     */
    private String method;

    /**
     * 请求参数
     */
    private String params;

    /**
     * 执行时长(毫秒)
     */
    private Long time;

    /**
     * IP地址
     */
    private String ip;

    /**
     * 租户ID
     */
    private String tenantId;
}
