PV预约系统
===============


## 项目介绍
本系统打造了一个预约平台，实现了服务人员排班与客户在线预约的功能。客户能否预约取决于某天是否有服务人员排班放号和该号源是否已经被别人预约。

系统掇合了店员与客户的时间，自动梳理出员工与客户配对的服务时间点列表。

本软件系统适合`美甲店`, `私人诊所`，`医馆`等需要先预约后服务的单位使用。

技术架构使用PHP + VUE

## 系统功能
### 管理后台：
* 服务人员管理，增删改服务人员
* 服务人员排班，支持按时间跨度设置每天排班时间。排班时间灵活，可排临时班。
* 全部服务人员排班号源一览表
* 可设置预约延迟时间，若超过一段时间没人预约，该号源仍然可约
* 预约订单列表，按时间排序
* 不同角色登录管理后台有不同权限
### 客户预约前端：
* 简单企业首页，放置企业公告与企业简介、联系方式等信息。
* “我的”页面， 客户基本信息，登录与注册功能。“我的预约”列表
* 预约功能，客户登录后，可按时间选择服务人员进行在线预约
* 服务人员介绍详细页面
* 客户可以自己预约，也可以为他人进行在线预约
## 使用说明
  服务人员放号管理以及预约订单管理通过电脑版后台管理（PC版管理端后台）， 客户在线预约通过手机操作（H5版本客户端）。客户端H5版本容易整合成微信公众号服务应用和微信小程序。

  预约流程：
~~~
  1. 先为服务人员排班，设置好号源
  2. 客户预约，通过手机端(H5)在线预约
  3. 预约订单列表， 后端管理入口查看已经预约的订单
~~~

  系统展示：

  排班放号设置

![排班放号设置](https://gitee.com/tt2030/booking/raw/doc_branch/images/demo/haoYuan.png)

前端预约界面

![前端预约界面](https://gitee.com/tt2030/booking/raw/doc_branch/images/demo/qianDuanYuYue.png)

预约订单列表

![预约订单列表](https://gitee.com/tt2030/booking/raw/doc_branch/images/demo/yuYueDingDan.png)


## 技术架构
> 运行环境要求 php >=8.0, MYSQL >= 5.7

后端技术基于 [likeadmin](http://doc.likeadmin.cn/php), ThinkPHP6, Mysql, RestFul api

前端技术: 
Vue
Vuex
element-plus UI
vue-router
axios
手机端uniapp前台

### 安装
1. 基础框架搭建，参考 [likeadmin](http://doc.likeadmin.cn/php)
2. 导入数据库： sql/salon_nail.sql
3. 项目入口文件 ： server/public/index.php
4. 假设项目域名为： salonnail.localhost.com
~~~
   后台管理入口： http://salonnail.localhost.com/admin/

   前端H5预约入口： http://salonnail.localhost.com/mobile/
~~~


## 版权信息

本软件遵循LGPL-2.1开源协议发布，并提供免费使用。

本项目包含的第三方源码和二进制文件之版权信息另行标注。

版权所有Copyright © by Cancms

All rights reserved
