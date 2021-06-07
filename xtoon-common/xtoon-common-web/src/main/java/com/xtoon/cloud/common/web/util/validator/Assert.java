package com.xtoon.cloud.common.web.util.validator;

import com.xtoon.cloud.common.core.exception.BaseException;
import org.apache.commons.lang3.StringUtils;

/**
 * 数据校验
 *
 * @author haoxin
 */
public abstract class Assert {

    public static void isBlank(String str, String message) {
        if (StringUtils.isBlank(str)) {
            throw new BaseException(message);
        }
    }

    public static void isNull(Object object, String message) {
        if (object == null) {
            throw new BaseException(message);
        }
    }
}
