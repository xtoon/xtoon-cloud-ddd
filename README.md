<p align="center">
  <a href="http://xtoon-boot.xiangtoon.com/">
    <img width="250" src="http://xtoon.gitee.io/xtoon-boot-site/logo.png">
  </a>
</p>

<h1 align="center">xtoon-cloud</h1>

<div align="center">

基于领域驱动设计（DDD）并支持SaaS平台的微服务开发框架.

</div>

<div align="center">

![](https://img.shields.io/badge/language-java-red.svg)
[![ApiAdmin](https://img.shields.io/hexpm/l/plug.svg)](http://xtoon-boot.xiangtoon.com/)
[![ApiAdmin](https://img.shields.io/badge/release-1.0.0-blue.svg)](http://xtoon-boot.xiangtoon.com/)
[![ApiAdmin](https://img.shields.io/badge/build-passing-brightgreen.svg)](http://xtoon-boot.xiangtoon.com/)

</div>

<div align="center">

  [官网](http://xtoon-boot.xiangtoon.com/) |
  [在线体验](http://xtoon-boot.demo.xiangtoon.com/) |
  [前端开源框架](https://gitee.com/xtoon/xtoon-cloud-element) |
</div>

#### [单体应用版：https://gitee.com/xtoon/xtoon-boot](https://gitee.com/xtoon/xtoon-boot) 

## 为何选择xtoon-cloud
- 解决编写过程式和事务代码，造成后期维护逻辑混乱、维护成本高的痛点；
- 边界规范易维持，核心业务逻辑内聚在领域内，低耦合，高内聚，易于长期维护；
- 网上基本讲的都是DDD的理论很少有讲怎么落地，xtoon-cloud提供了完整落地方案和企业级微服务架构；
- 可以快速开发，框架提供了系统管理和组织架构等核心模块；
- 支持多租户的SaaS平台；

## 技术交流
如果有什么问题或建议可以 [提ISSUE](https://gitee.com/xtoon/xtoon-cloud/issues) 或 加群（QQ：130950009），交流技术，分享经验。 <br >
如果你解决了某些bug，或者新增了一些功能，欢迎 [贡献代码](https://gitee.com/xtoon/xtoon-cloud/pulls)，感激不尽~ <br >
大家多点 ⭐Star 支持下。


## 技术选型
-  基础框架：Spring Cloud Alibaba
-  网关：Spring Cloud Gateway
-  鉴权认证：Spring Cloud Security+JWT
-  服务监控：spring-boot-admin
-  流量控制：Sentinel
-  注册配置中心：Nacos
-  RPC：dubbo
-  mybatis-plus


## 主要模块
1.  登录注册：账号、手机号验证登录，租户注册；
2.  用户管理：用户新增，分配角色，禁用等；
3.  角色管理：角色新增，查看，维护菜单等；
4.  菜单管理：树形菜单管理，可配置菜单和按钮权限等；
5.  租户管理：租户列表，禁用等；
6.  日志管理：记录操作日志记录和查询；

## 项目结构 
```
xtoon-could
├──doc                           文档
│    ├─db                        sql
│    └─yaml                      配置文件
│ 
├─xtoon-common                   公共模块
│    ├─xtoon-common-core         核心公共模块
│    ├─xtoon-common-log          日志公共模块
│    ├─xtoon-common-mybatis      mybatis公共模块
│    ├─xtoon-common-redis        redis公共模块
│    ├─xtoon-common-swagger      swagger公共模块
│    ├─xtoon-common-tenant       多租户公共模块 
│    └─xtoon-common-web          web公共模块 
│   
├─xtoon-ops                      运维服务
│    ├─xtoon-auth-server         认证服务
│    ├─xtoon-gateway-server      网关  
│    ├─xtoon-monitor-server      健康监控服务 
│    ├─xtoon-register-server     注册配置中心
│    └─xtoon-sentinel-server     流量控制
│ 
├─xtoon-service                  业务服务
│    └─xtoon-sys                 系统管理领域
│         ├─xtoon-sys-interface  系统管理接口
│         └─xtoon-sys-server     系统管理服务
│       

```

## 部署

### 部署方式
- 拉取前后端项目代码；
- 安装必要的环境：jdk1.8+,mysql5.7+,redis,nodejs等；
- mysql新建两个库，导入doc下面的sql文件；
- 修改成本地环境配置：mysql，redis；
- 启动前后端项目，访问地址；

### 启动顺序
- xtoon-register-server（注册配置中心）
- xtoon-sys-server（用户服务）
- xtoon-auth-server（认证服务）
- xtoon-gateway-server（网关服务）
- xtoon-monitor-server（监控服务）
- xtoon-sentinel-server（流量控制服务）
- xtoon-could-element（前端项目）


## 核心理念
### 六边形理论
<p align="center">
   <img width="650" src="http://xtoon.gitee.io/xtoon-boot-site/640.png">
</p>
Alistair Cockburn提出了六边形架构，又被称为端口和适配器架构。观察上图我们发现，对于核心的应用程序和领域模型来说，其他的底层依赖或实现都可以抽象为输入和输出两类。组织关系变为了一个二维的内外关系，而不是上下结构。每个io与应用程序之前均有适配器完成隔离工作，每个最外围的边都是一个端口。基于六边形架构设计的系统是DDD追求的最终形态。

### 数据驱动和领域驱动对比
<p align="center">
   <img width="650" src="http://xtoon.gitee.io/xtoon-boot-site/650.webp">
</p>
领域驱动设计与之前的系统设计开发过程有很大的不同：  
1. 就在于系统的参与角色，产品、开发、测试等，需要形成一套通用语言；  
2. 在于方案设计不再把db设计放在一个核心问题去解决，更加专注于业务模型本身，进行领域、业务聚合的设计，领域层的聚合及实体才是整个系统的核心内容；  
3. 真正的面向对象编程，由过程式的事务脚本方式，转变为真正的面向对象。

### 分层架构
<p align="center">
   <img width="650" src="http://xtoon.gitee.io/xtoon-boot-site/660.png">
</p>

-  用户界面层(或表示层)  
负责向用户显示信息和解释用户指令。这里指的用户可以是另一个计算机系统， 不一定是使用用户界面的人
-  应用层  
定义软件要完成的任务，并且指挥表达领域概念的对象来解决问题。这一层所负 责的工作对业务来说意义重大，也是与其他系统的应用层进行交互的必要渠道
应用层要尽量简单，不包含业务规则或者知识，而只为下一层中的领域对象协调 任务，分配工作，使它们互相协作。它没有反映业务情况的状态，但是却可以具有 另外一种状态，为用户或程序显示某个任务的进度
- 领域层(或模型层)  
负责表达业务概念，业务状态信息以及业务规则。尽管保存业务状态的技术细节 是由基础设施层实现的，但是反映业务情况的状态是由本层控制并且使用的。领域 层是业务软件的核心
- 基础设施层  
为上面各层提供通用的技术能力:为应用层传递消息，为领域层提供持久化机制， 为用户界面层绘制屏幕组件，等等。基础设施层还能够通过架构框架来支持4个层次 间的交互模式

## 相关文档
- [CSDN博客-DDD系列](https://blog.csdn.net/haoxin963/category_10708582.html)持续更新中，欢迎关注！


## 维护者

- [haoxin963](https://github.com/haoxin963) 


## 版权声明

<img alt="Apache-2.0 license" src="https://www.apache.org/img/ASF20thAnniversary.jpg" width="128">

本软件基于 Apache-2.0 协议进行分发和使用，更多信息参见 [协议文件](LICENSE)。