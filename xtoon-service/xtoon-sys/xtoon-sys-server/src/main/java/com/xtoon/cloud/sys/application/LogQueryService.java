package com.xtoon.cloud.sys.application;

import com.xtoon.cloud.common.mybatis.util.Page;

import java.util.Map;

/**
 * 系统日志查询服务接口
 *
 * @author haoxin
 * @date 2021-05-10
 **/
public interface LogQueryService {

    /**
     * 分页查询
     *
     * @param params
     * @return
     */
    Page queryPage(Map<String, Object> params);
}
