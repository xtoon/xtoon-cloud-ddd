package com.xtoon.cloud.common.mybatis.util;

import com.xtoon.cloud.common.core.util.RequestUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.binding.MapperMethod;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlCommandType;
import org.apache.ibatis.plugin.*;
import org.springframework.stereotype.Component;

import java.lang.reflect.Field;
import java.util.*;

/**
 * mybatis拦截器，自动注入创建人、创建时间、修改人、修改时间
 *
 * @author haoxin
 * @date 2021-01-25
 **/
@Slf4j
@Component
@Intercepts({@Signature(type = Executor.class, method = "update", args = {MappedStatement.class, Object.class})})
public class MybatisInterceptor implements Interceptor {

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        MappedStatement mappedStatement = (MappedStatement) invocation.getArgs()[0];
        SqlCommandType sqlCommandType = mappedStatement.getSqlCommandType();
        Object parameter = invocation.getArgs()[1];
        if (parameter == null) {
            return invocation.proceed();
        }
        if (SqlCommandType.INSERT == sqlCommandType) {
            String userId = this.getLoginUser();
            Field[] fields = getAllFields(parameter);
            for (Field field : fields) {
                try {
                    if ("createdBy".equals(field.getName())) {
                        field.setAccessible(true);
                        Object local_createBy = field.get(parameter);
                        field.setAccessible(false);
                        if (local_createBy == null || local_createBy.equals("")) {
                            if (userId != null) {
                                // 登录人账号
                                field.setAccessible(true);
                                field.set(parameter, userId);
                                field.setAccessible(false);
                            }
                        }
                    }
                    // 注入创建时间
                    if ("createdTime".equals(field.getName())) {
                        field.setAccessible(true);
                        Object local_createDate = field.get(parameter);
                        field.setAccessible(false);
                        if (local_createDate == null || local_createDate.equals("")) {
                            field.setAccessible(true);
                            field.set(parameter, new Date());
                            field.setAccessible(false);
                        }
                    }
                } catch (Exception e) {
                }
            }
        }
        if (SqlCommandType.UPDATE == sqlCommandType) {
            String userId = this.getLoginUser();
            Field[] fields = null;
            if (parameter instanceof MapperMethod.ParamMap) {
                MapperMethod.ParamMap<?> p = (MapperMethod.ParamMap<?>) parameter;
                if (p.containsKey("et")) {
                    parameter = p.get("et");
                } else {
                    parameter = p.get("param1");
                }
                if (parameter == null) {
                    return invocation.proceed();
                }
                fields = getAllFields(parameter);
            } else {
                fields = getAllFields(parameter);
            }

            for (Field field : fields) {
                try {
                    if ("updatedBy".equals(field.getName())) {
                        //获取登录用户信息
                        if (userId != null) {
                            // 登录账号
                            field.setAccessible(true);
                            field.set(parameter, userId);
                            field.setAccessible(false);
                        }
                    }
                    if ("updatedTime".equals(field.getName())) {
                        field.setAccessible(true);
                        field.set(parameter, new Date());
                        field.setAccessible(false);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return invocation.proceed();
    }

    @Override
    public Object plugin(Object target) {
        return Plugin.wrap(target, this);
    }

    @Override
    public void setProperties(Properties properties) {
        // TODO Auto-generated method stub
    }

    private String getLoginUser() {
        String userId = null;
        try {
            userId = RequestUtils.getUserId();
        } catch (Exception e) {
            userId = null;
        }
        return userId;
    }

    /**
     * 获取类的所有属性，包括父类
     *
     * @param object
     * @return
     */
    private Field[] getAllFields(Object object) {
        Class<?> clazz = object.getClass();
        List<Field> fieldList = new ArrayList<>();
        while (clazz != null) {
            fieldList.addAll(new ArrayList<>(Arrays.asList(clazz.getDeclaredFields())));
            clazz = clazz.getSuperclass();
        }
        Field[] fields = new Field[fieldList.size()];
        fieldList.toArray(fields);
        return fields;
    }

}

