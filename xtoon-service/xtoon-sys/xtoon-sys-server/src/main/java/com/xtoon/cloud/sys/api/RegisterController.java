package com.xtoon.cloud.sys.api;

import com.xtoon.cloud.common.log.SysLog;
import com.xtoon.cloud.common.web.util.Result;
import com.xtoon.cloud.common.web.util.validator.ValidatorUtils;
import com.xtoon.cloud.common.web.util.validator.group.AddGroup;
import com.xtoon.cloud.sys.application.AuthenticationApplicationService;
import com.xtoon.cloud.sys.application.command.RegisterTenantCommand;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * 注册Controller
 *
 * @author haoxin
 * @date 2021-02-13
 **/
@Api(tags = "注册")
@RestController
public class RegisterController {

    @Autowired
    private AuthenticationApplicationService authenticationApplicationService;

    /**
     * 注册租户
     */
    @ApiOperation("注册租户")
    @SysLog("注册租户")
    @PostMapping("/registerTenant")
    public Result registerTenantAndUser(@RequestBody RegisterTenantCommand registerTenantCommand) {
        ValidatorUtils.validateEntity(registerTenantCommand, AddGroup.class);
        authenticationApplicationService.registerTenant(registerTenantCommand);
        return Result.ok();
    }
}
