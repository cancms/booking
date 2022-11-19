# Host: localhost  (Version: 5.7.26)
# Date: 2022-11-17 10:33:12
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "sn_a_admin_to_service_person"
#

DROP TABLE IF EXISTS `sn_a_admin_to_service_person`;
CREATE TABLE `sn_a_admin_to_service_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `service_person_id` int(11) DEFAULT NULL COMMENT 'service_person表外键',
  `admin_id` int(11) DEFAULT NULL COMMENT 'admin表外键',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='后台登录帐号和服务提供者之间的关联关系。后台管理员帐号如果是服务提供者角色，登录后可查看到自己的预约订单';

#
# Data for table "sn_a_admin_to_service_person"
#

/*!40000 ALTER TABLE `sn_a_admin_to_service_person` DISABLE KEYS */;
INSERT INTO `sn_a_admin_to_service_person` VALUES (7,2,3);
/*!40000 ALTER TABLE `sn_a_admin_to_service_person` ENABLE KEYS */;

#
# Structure for table "sn_a_booking"
#

DROP TABLE IF EXISTS `sn_a_booking`;
CREATE TABLE `sn_a_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_schedule_setting_id` int(11) DEFAULT NULL COMMENT '外键',
  `booking_user_id` int(11) DEFAULT NULL COMMENT '操作预约的用户id, 来自sn_user表，外键，客户id。接受服务的人不一定是他，因为可以为别人预约',
  `service_person_id` int(11) DEFAULT NULL COMMENT '服务人员id,外键',
  `served_person_id` int(11) DEFAULT NULL COMMENT '接受服务的人id, 外键，来自sn_a_served_person表',
  `service_time` datetime DEFAULT NULL COMMENT '服务执行的时间， 如 2022-09-18 10:00:00',
  `booking_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '预约的状态代号， pending(待完成)，confirmed (已完成)',
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '预约备注，留言',
  `created_at` datetime DEFAULT NULL COMMENT '记录创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='预约表';

#
# Data for table "sn_a_booking"
#

/*!40000 ALTER TABLE `sn_a_booking` DISABLE KEYS */;
INSERT INTO `sn_a_booking` VALUES (1,3,1,2,1,'2022-10-31 08:48:00','pending','噢噢品牌','2022-10-29 23:22:18','2022-10-29 23:22:18'),(4,9,1,1,7,'2022-11-02 09:36:00','confirmed','天天','2022-10-30 23:58:54','2022-10-30 23:58:54'),(5,10,1,1,2,'2022-11-21 16:00:00','pending','','2022-11-17 09:43:13','2022-11-17 09:43:13');
/*!40000 ALTER TABLE `sn_a_booking` ENABLE KEYS */;

#
# Structure for table "sn_a_served_person"
#

DROP TABLE IF EXISTS `sn_a_served_person`;
CREATE TABLE `sn_a_served_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_user_id` int(11) DEFAULT NULL COMMENT '预约操作人的id, 外键来自user 表',
  `real_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '接受服务的人真实姓名',
  `mobile_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '接受服务的人,手机号码',
  `note1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='预约单里面接受服务的人，可以为别人预约，由预约人添加';

#
# Data for table "sn_a_served_person"
#

/*!40000 ALTER TABLE `sn_a_served_person` DISABLE KEYS */;
INSERT INTO `sn_a_served_person` VALUES (1,1,'55','66','77'),(2,1,'cc','11','33'),(3,1,'','',''),(5,1,'','',''),(6,1,'ddd','222','33'),(7,1,'tt','667733','45ff'),(8,1,'55','sdfa',''),(10,1,'klkl','090909',''),(11,1,'asdf','234',''),(12,1,'ddd','2323',''),(13,1,'sds','123','3321');
/*!40000 ALTER TABLE `sn_a_served_person` ENABLE KEYS */;

#
# Structure for table "sn_a_service_person"
#

DROP TABLE IF EXISTS `sn_a_service_person`;
CREATE TABLE `sn_a_service_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '服务人员名字',
  `brief_intro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '简介，列表时简短介绍',
  `introduction` text COLLATE utf8_unicode_ci COMMENT '服务人员简介',
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像',
  `admin_id` int(11) DEFAULT NULL COMMENT 'fk, 服务人员关联sn_admin表（获得管理权限后），可以登录后台管理预约订单',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='服务人员表';

#
# Data for table "sn_a_service_person"
#

/*!40000 ALTER TABLE `sn_a_service_person` DISABLE KEYS */;
INSERT INTO `sn_a_service_person` VALUES (1,'张三',NULL,'<p>abc <strong>简介 </strong>7<span style=\"color: rgb(237, 225, 248); background-color: rgb(231, 95, 51);\">77</span></p>',NULL,NULL),(2,'李四','998877','<p>专业服务7</p>','http://salonnail.localhost.com/uploads/images/20221026/202210261133401e3722704.jpg',NULL);
/*!40000 ALTER TABLE `sn_a_service_person` ENABLE KEYS */;

#
# Structure for table "sn_a_service_person_dept"
#

DROP TABLE IF EXISTS `sn_a_service_person_dept`;
CREATE TABLE `sn_a_service_person_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_person_id` int(11) DEFAULT NULL COMMENT '服务人员id',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='服务人员所属部门关系表，多对多';

#
# Data for table "sn_a_service_person_dept"
#

/*!40000 ALTER TABLE `sn_a_service_person_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `sn_a_service_person_dept` ENABLE KEYS */;

#
# Structure for table "sn_a_service_schedule_setting"
#

DROP TABLE IF EXISTS `sn_a_service_schedule_setting`;
CREATE TABLE `sn_a_service_schedule_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '本设置的名字',
  `enabled` tinyint(4) DEFAULT '1' COMMENT '本排班设置是否生效，1生效， 0 非生效',
  `service_person_id` int(11) DEFAULT NULL COMMENT '服务人员id， 外键',
  `avg_duration` int(11) DEFAULT '15' COMMENT '一次服务平均时间多少分钟, 本字段不用来计算放号时间点。放号服务时间点计算方式： 时间段/放号数',
  `booking_minutes_delay` smallint(6) DEFAULT NULL COMMENT '过后多少分钟仍然可以预订',
  `booking_fee` decimal(6,2) DEFAULT NULL COMMENT '预约费用',
  `start_date` datetime DEFAULT NULL COMMENT '服务开始时间，如2022-09-07',
  `end_date` datetime DEFAULT NULL COMMENT '服务结束时间，如2022-09-22',
  `am_service_times` smallint(6) DEFAULT NULL COMMENT '每天早上（8-12）服务次数',
  `am_start_time` time DEFAULT NULL COMMENT '上午服务开始时间， 如 08:00:00',
  `am_end_time` time DEFAULT NULL COMMENT '上午服务结束时间， 如 12:00:00',
  `pm1_service_times` smallint(6) DEFAULT NULL COMMENT '每天下午（14-18）服务次数',
  `pm1_start_time` time DEFAULT NULL COMMENT '下午服务开始时间， 如 14:00:00',
  `pm1_end_time` time DEFAULT NULL COMMENT '下午服务结束时间， 如 18:00:00',
  `pm2_service_times` smallint(6) DEFAULT NULL COMMENT '每天晚上（20-24）服务次数',
  `pm2_start_time` time DEFAULT NULL COMMENT '晚上服务开始时间， 如 20:00:00',
  `pm2_end_time` time DEFAULT NULL COMMENT '晚上服务结束时间， 如 24:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='服务人员（医生）排班';

#
# Data for table "sn_a_service_schedule_setting"
#

/*!40000 ALTER TABLE `sn_a_service_schedule_setting` DISABLE KEYS */;
INSERT INTO `sn_a_service_schedule_setting` VALUES (3,'tt2',1,2,0,NULL,0.00,'2022-10-27 00:00:00','2022-11-05 00:00:00',5,'08:00:00','12:00:00',5,'14:00:00','18:00:00',5,'20:00:00','23:59:59'),(8,'tt5',1,2,0,20,0.00,'2022-11-16 00:00:00','2022-11-30 00:00:00',3,'08:00:00','12:00:00',3,'14:00:00','18:00:00',3,'20:00:00','23:59:59'),(9,'张三的时间安排',1,1,0,30,0.00,'2022-11-01 00:00:00','2022-11-10 00:00:00',5,'08:00:00','12:00:00',5,'14:00:00','18:00:00',3,'20:00:00','23:59:59'),(10,'',1,1,0,0,0.00,'2022-11-10 00:00:00','2022-12-07 00:00:00',2,'08:00:00','12:00:00',2,'14:00:00','18:00:00',0,'20:00:00','23:59:59');
/*!40000 ALTER TABLE `sn_a_service_schedule_setting` ENABLE KEYS */;

#
# Structure for table "sn_a_service_ticket_related"
#

DROP TABLE IF EXISTS `sn_a_service_ticket_related`;
CREATE TABLE `sn_a_service_ticket_related` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `service_schedule_setting_id` int(11) DEFAULT NULL COMMENT '外键，来自schedule_setting表',
  `service_person_id` int(11) DEFAULT NULL COMMENT '服务人员id，外键，来自schedule_setting表',
  `service_time` datetime DEFAULT NULL COMMENT '号源，执行服务时的具体时间',
  `booking_minutes_delay` smallint(6) DEFAULT NULL COMMENT '过多少分钟后仍然可以预订',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2400 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='服务号源表，具体哪一天什么时候能预订。和schedule_setting表关联，setting表有一条记录新增或者更新时，service_ticket表也要同时更新。';

#
# Data for table "sn_a_service_ticket_related"
#

/*!40000 ALTER TABLE `sn_a_service_ticket_related` DISABLE KEYS */;
INSERT INTO `sn_a_service_ticket_related` VALUES (281,3,NULL,'2022-10-27 08:00:00',NULL),(282,3,NULL,'2022-10-27 08:48:00',NULL),(283,3,NULL,'2022-10-27 09:36:00',NULL),(284,3,NULL,'2022-10-27 10:24:00',NULL),(285,3,NULL,'2022-10-27 11:12:00',NULL),(286,3,NULL,'2022-10-27 14:00:00',NULL),(287,3,NULL,'2022-10-27 14:48:00',NULL),(288,3,NULL,'2022-10-27 15:36:00',NULL),(289,3,NULL,'2022-10-27 16:24:00',NULL),(290,3,NULL,'2022-10-27 17:12:00',NULL),(291,3,NULL,'2022-10-28 08:00:00',NULL),(292,3,NULL,'2022-10-28 08:48:00',NULL),(293,3,NULL,'2022-10-28 09:36:00',NULL),(294,3,NULL,'2022-10-28 10:24:00',NULL),(295,3,NULL,'2022-10-28 11:12:00',NULL),(296,3,NULL,'2022-10-28 14:00:00',NULL),(297,3,NULL,'2022-10-28 14:48:00',NULL),(298,3,NULL,'2022-10-28 15:36:00',NULL),(299,3,NULL,'2022-10-28 16:24:00',NULL),(300,3,NULL,'2022-10-28 17:12:00',NULL),(301,3,NULL,'2022-10-29 08:00:00',NULL),(302,3,NULL,'2022-10-29 08:48:00',NULL),(303,3,NULL,'2022-10-29 09:36:00',NULL),(304,3,NULL,'2022-10-29 10:24:00',NULL),(305,3,NULL,'2022-10-29 11:12:00',NULL),(306,3,NULL,'2022-10-29 14:00:00',NULL),(307,3,NULL,'2022-10-29 14:48:00',NULL),(308,3,NULL,'2022-10-29 15:36:00',NULL),(309,3,NULL,'2022-10-29 16:24:00',NULL),(310,3,NULL,'2022-10-29 17:12:00',NULL),(311,3,NULL,'2022-10-30 08:00:00',NULL),(312,3,NULL,'2022-10-30 08:48:00',NULL),(313,3,NULL,'2022-10-30 09:36:00',NULL),(314,3,NULL,'2022-10-30 10:24:00',NULL),(315,3,NULL,'2022-10-30 11:12:00',NULL),(316,3,NULL,'2022-10-30 14:00:00',NULL),(317,3,NULL,'2022-10-30 14:48:00',NULL),(318,3,NULL,'2022-10-30 15:36:00',NULL),(319,3,NULL,'2022-10-30 16:24:00',NULL),(320,3,NULL,'2022-10-30 17:12:00',NULL),(321,3,NULL,'2022-10-31 08:00:00',NULL),(322,3,NULL,'2022-10-31 08:48:00',NULL),(323,3,NULL,'2022-10-31 09:36:00',NULL),(324,3,NULL,'2022-10-31 10:24:00',NULL),(325,3,NULL,'2022-10-31 11:12:00',NULL),(326,3,NULL,'2022-10-31 14:00:00',NULL),(327,3,NULL,'2022-10-31 14:48:00',NULL),(328,3,NULL,'2022-10-31 15:36:00',NULL),(329,3,NULL,'2022-10-31 16:24:00',NULL),(330,3,NULL,'2022-10-31 17:12:00',NULL),(331,3,NULL,'2022-11-01 08:00:00',NULL),(332,3,NULL,'2022-11-01 08:48:00',NULL),(333,3,NULL,'2022-11-01 09:36:00',NULL),(334,3,NULL,'2022-11-01 10:24:00',NULL),(335,3,NULL,'2022-11-01 11:12:00',NULL),(336,3,NULL,'2022-11-01 14:00:00',NULL),(337,3,NULL,'2022-11-01 14:48:00',NULL),(338,3,NULL,'2022-11-01 15:36:00',NULL),(339,3,NULL,'2022-11-01 16:24:00',NULL),(340,3,NULL,'2022-11-01 17:12:00',NULL),(341,3,NULL,'2022-11-02 08:00:00',NULL),(342,3,NULL,'2022-11-02 08:48:00',NULL),(343,3,NULL,'2022-11-02 09:36:00',NULL),(344,3,NULL,'2022-11-02 10:24:00',NULL),(345,3,NULL,'2022-11-02 11:12:00',NULL),(346,3,NULL,'2022-11-02 14:00:00',NULL),(347,3,NULL,'2022-11-02 14:48:00',NULL),(348,3,NULL,'2022-11-02 15:36:00',NULL),(349,3,NULL,'2022-11-02 16:24:00',NULL),(350,3,NULL,'2022-11-02 17:12:00',NULL),(351,3,NULL,'2022-11-03 08:00:00',NULL),(352,3,NULL,'2022-11-03 08:48:00',NULL),(353,3,NULL,'2022-11-03 09:36:00',NULL),(354,3,NULL,'2022-11-03 10:24:00',NULL),(355,3,NULL,'2022-11-03 11:12:00',NULL),(356,3,NULL,'2022-11-03 14:00:00',NULL),(357,3,NULL,'2022-11-03 14:48:00',NULL),(358,3,NULL,'2022-11-03 15:36:00',NULL),(359,3,NULL,'2022-11-03 16:24:00',NULL),(360,3,NULL,'2022-11-03 17:12:00',NULL),(361,3,NULL,'2022-11-04 08:00:00',NULL),(362,3,NULL,'2022-11-04 08:48:00',NULL),(363,3,NULL,'2022-11-04 09:36:00',NULL),(364,3,NULL,'2022-11-04 10:24:00',NULL),(365,3,NULL,'2022-11-04 11:12:00',NULL),(366,3,NULL,'2022-11-04 14:00:00',NULL),(367,3,NULL,'2022-11-04 14:48:00',NULL),(368,3,NULL,'2022-11-04 15:36:00',NULL),(369,3,NULL,'2022-11-04 16:24:00',NULL),(370,3,NULL,'2022-11-04 17:12:00',NULL),(371,3,NULL,'2022-11-05 08:00:00',NULL),(372,3,NULL,'2022-11-05 08:48:00',NULL),(373,3,NULL,'2022-11-05 09:36:00',NULL),(374,3,NULL,'2022-11-05 10:24:00',NULL),(375,3,NULL,'2022-11-05 11:12:00',NULL),(376,3,NULL,'2022-11-05 14:00:00',NULL),(377,3,NULL,'2022-11-05 14:48:00',NULL),(378,3,NULL,'2022-11-05 15:36:00',NULL),(379,3,NULL,'2022-11-05 16:24:00',NULL),(380,3,NULL,'2022-11-05 17:12:00',NULL),(595,9,1,'2022-11-01 08:00:00',30),(596,9,1,'2022-11-01 08:48:00',30),(597,9,1,'2022-11-01 09:36:00',30),(598,9,1,'2022-11-01 10:24:00',30),(599,9,1,'2022-11-01 11:12:00',30),(600,9,1,'2022-11-01 14:00:00',30),(601,9,1,'2022-11-01 14:48:00',30),(602,9,1,'2022-11-01 15:36:00',30),(603,9,1,'2022-11-01 16:24:00',30),(604,9,1,'2022-11-01 17:12:00',30),(605,9,1,'2022-11-01 20:00:00',30),(606,9,1,'2022-11-01 21:19:59',30),(607,9,1,'2022-11-01 22:39:58',30),(608,9,1,'2022-11-02 08:00:00',30),(609,9,1,'2022-11-02 08:48:00',30),(610,9,1,'2022-11-02 09:36:00',30),(611,9,1,'2022-11-02 10:24:00',30),(612,9,1,'2022-11-02 11:12:00',30),(613,9,1,'2022-11-02 14:00:00',30),(614,9,1,'2022-11-02 14:48:00',30),(615,9,1,'2022-11-02 15:36:00',30),(616,9,1,'2022-11-02 16:24:00',30),(617,9,1,'2022-11-02 17:12:00',30),(618,9,1,'2022-11-02 20:00:00',30),(619,9,1,'2022-11-02 21:19:59',30),(620,9,1,'2022-11-02 22:39:58',30),(621,9,1,'2022-11-03 08:00:00',30),(622,9,1,'2022-11-03 08:48:00',30),(623,9,1,'2022-11-03 09:36:00',30),(624,9,1,'2022-11-03 10:24:00',30),(625,9,1,'2022-11-03 11:12:00',30),(626,9,1,'2022-11-03 14:00:00',30),(627,9,1,'2022-11-03 14:48:00',30),(628,9,1,'2022-11-03 15:36:00',30),(629,9,1,'2022-11-03 16:24:00',30),(630,9,1,'2022-11-03 17:12:00',30),(631,9,1,'2022-11-03 20:00:00',30),(632,9,1,'2022-11-03 21:19:59',30),(633,9,1,'2022-11-03 22:39:58',30),(634,9,1,'2022-11-04 08:00:00',30),(635,9,1,'2022-11-04 08:48:00',30),(636,9,1,'2022-11-04 09:36:00',30),(637,9,1,'2022-11-04 10:24:00',30),(638,9,1,'2022-11-04 11:12:00',30),(639,9,1,'2022-11-04 14:00:00',30),(640,9,1,'2022-11-04 14:48:00',30),(641,9,1,'2022-11-04 15:36:00',30),(642,9,1,'2022-11-04 16:24:00',30),(643,9,1,'2022-11-04 17:12:00',30),(644,9,1,'2022-11-04 20:00:00',30),(645,9,1,'2022-11-04 21:19:59',30),(646,9,1,'2022-11-04 22:39:58',30),(647,9,1,'2022-11-05 08:00:00',30),(648,9,1,'2022-11-05 08:48:00',30),(649,9,1,'2022-11-05 09:36:00',30),(650,9,1,'2022-11-05 10:24:00',30),(651,9,1,'2022-11-05 11:12:00',30),(652,9,1,'2022-11-05 14:00:00',30),(653,9,1,'2022-11-05 14:48:00',30),(654,9,1,'2022-11-05 15:36:00',30),(655,9,1,'2022-11-05 16:24:00',30),(656,9,1,'2022-11-05 17:12:00',30),(657,9,1,'2022-11-05 20:00:00',30),(658,9,1,'2022-11-05 21:19:59',30),(659,9,1,'2022-11-05 22:39:58',30),(660,9,1,'2022-11-06 08:00:00',30),(661,9,1,'2022-11-06 08:48:00',30),(662,9,1,'2022-11-06 09:36:00',30),(663,9,1,'2022-11-06 10:24:00',30),(664,9,1,'2022-11-06 11:12:00',30),(665,9,1,'2022-11-06 14:00:00',30),(666,9,1,'2022-11-06 14:48:00',30),(667,9,1,'2022-11-06 15:36:00',30),(668,9,1,'2022-11-06 16:24:00',30),(669,9,1,'2022-11-06 17:12:00',30),(670,9,1,'2022-11-06 20:00:00',30),(671,9,1,'2022-11-06 21:19:59',30),(672,9,1,'2022-11-06 22:39:58',30),(673,9,1,'2022-11-07 08:00:00',30),(674,9,1,'2022-11-07 08:48:00',30),(675,9,1,'2022-11-07 09:36:00',30),(676,9,1,'2022-11-07 10:24:00',30),(677,9,1,'2022-11-07 11:12:00',30),(678,9,1,'2022-11-07 14:00:00',30),(679,9,1,'2022-11-07 14:48:00',30),(680,9,1,'2022-11-07 15:36:00',30),(681,9,1,'2022-11-07 16:24:00',30),(682,9,1,'2022-11-07 17:12:00',30),(683,9,1,'2022-11-07 20:00:00',30),(684,9,1,'2022-11-07 21:19:59',30),(685,9,1,'2022-11-07 22:39:58',30),(686,9,1,'2022-11-08 08:00:00',30),(687,9,1,'2022-11-08 08:48:00',30),(688,9,1,'2022-11-08 09:36:00',30),(689,9,1,'2022-11-08 10:24:00',30),(690,9,1,'2022-11-08 11:12:00',30),(691,9,1,'2022-11-08 14:00:00',30),(692,9,1,'2022-11-08 14:48:00',30),(693,9,1,'2022-11-08 15:36:00',30),(694,9,1,'2022-11-08 16:24:00',30),(695,9,1,'2022-11-08 17:12:00',30),(696,9,1,'2022-11-08 20:00:00',30),(697,9,1,'2022-11-08 21:19:59',30),(698,9,1,'2022-11-08 22:39:58',30),(699,9,1,'2022-11-09 08:00:00',30),(700,9,1,'2022-11-09 08:48:00',30),(701,9,1,'2022-11-09 09:36:00',30),(702,9,1,'2022-11-09 10:24:00',30),(703,9,1,'2022-11-09 11:12:00',30),(704,9,1,'2022-11-09 14:00:00',30),(705,9,1,'2022-11-09 14:48:00',30),(706,9,1,'2022-11-09 15:36:00',30),(707,9,1,'2022-11-09 16:24:00',30),(708,9,1,'2022-11-09 17:12:00',30),(709,9,1,'2022-11-09 20:00:00',30),(710,9,1,'2022-11-09 21:19:59',30),(711,9,1,'2022-11-09 22:39:58',30),(712,9,1,'2022-11-10 08:00:00',30),(713,9,1,'2022-11-10 08:48:00',30),(714,9,1,'2022-11-10 09:36:00',30),(715,9,1,'2022-11-10 10:24:00',30),(716,9,1,'2022-11-10 11:12:00',30),(717,9,1,'2022-11-10 14:00:00',30),(718,9,1,'2022-11-10 14:48:00',30),(719,9,1,'2022-11-10 15:36:00',30),(720,9,1,'2022-11-10 16:24:00',30),(721,9,1,'2022-11-10 17:12:00',30),(722,9,1,'2022-11-10 20:00:00',30),(723,9,1,'2022-11-10 21:19:59',30),(724,9,1,'2022-11-10 22:39:58',30),(2153,10,1,'2022-11-10 08:00:00',0),(2154,10,1,'2022-11-10 10:00:00',0),(2155,10,1,'2022-11-10 14:00:00',0),(2156,10,1,'2022-11-10 16:00:00',0),(2157,10,1,'2022-11-11 08:00:00',0),(2158,10,1,'2022-11-11 10:00:00',0),(2159,10,1,'2022-11-11 14:00:00',0),(2160,10,1,'2022-11-11 16:00:00',0),(2161,10,1,'2022-11-12 08:00:00',0),(2162,10,1,'2022-11-12 10:00:00',0),(2163,10,1,'2022-11-12 14:00:00',0),(2164,10,1,'2022-11-12 16:00:00',0),(2165,10,1,'2022-11-13 08:00:00',0),(2166,10,1,'2022-11-13 10:00:00',0),(2167,10,1,'2022-11-13 14:00:00',0),(2168,10,1,'2022-11-13 16:00:00',0),(2169,10,1,'2022-11-14 08:00:00',0),(2170,10,1,'2022-11-14 10:00:00',0),(2171,10,1,'2022-11-14 14:00:00',0),(2172,10,1,'2022-11-14 16:00:00',0),(2173,10,1,'2022-11-15 08:00:00',0),(2174,10,1,'2022-11-15 10:00:00',0),(2175,10,1,'2022-11-15 14:00:00',0),(2176,10,1,'2022-11-15 16:00:00',0),(2177,10,1,'2022-11-16 08:00:00',0),(2178,10,1,'2022-11-16 10:00:00',0),(2179,10,1,'2022-11-16 14:00:00',0),(2180,10,1,'2022-11-16 16:00:00',0),(2181,10,1,'2022-11-17 08:00:00',0),(2182,10,1,'2022-11-17 10:00:00',0),(2183,10,1,'2022-11-17 14:00:00',0),(2184,10,1,'2022-11-17 16:00:00',0),(2185,10,1,'2022-11-18 08:00:00',0),(2186,10,1,'2022-11-18 10:00:00',0),(2187,10,1,'2022-11-18 14:00:00',0),(2188,10,1,'2022-11-18 16:00:00',0),(2189,10,1,'2022-11-19 08:00:00',0),(2190,10,1,'2022-11-19 10:00:00',0),(2191,10,1,'2022-11-19 14:00:00',0),(2192,10,1,'2022-11-19 16:00:00',0),(2193,10,1,'2022-11-20 08:00:00',0),(2194,10,1,'2022-11-20 10:00:00',0),(2195,10,1,'2022-11-20 14:00:00',0),(2196,10,1,'2022-11-20 16:00:00',0),(2197,10,1,'2022-11-21 08:00:00',0),(2198,10,1,'2022-11-21 10:00:00',0),(2199,10,1,'2022-11-21 14:00:00',0),(2200,10,1,'2022-11-21 16:00:00',0),(2201,10,1,'2022-11-22 08:00:00',0),(2202,10,1,'2022-11-22 10:00:00',0),(2203,10,1,'2022-11-22 14:00:00',0),(2204,10,1,'2022-11-22 16:00:00',0),(2205,10,1,'2022-11-23 08:00:00',0),(2206,10,1,'2022-11-23 10:00:00',0),(2207,10,1,'2022-11-23 14:00:00',0),(2208,10,1,'2022-11-23 16:00:00',0),(2209,10,1,'2022-11-24 08:00:00',0),(2210,10,1,'2022-11-24 10:00:00',0),(2211,10,1,'2022-11-24 14:00:00',0),(2212,10,1,'2022-11-24 16:00:00',0),(2213,10,1,'2022-11-25 08:00:00',0),(2214,10,1,'2022-11-25 10:00:00',0),(2215,10,1,'2022-11-25 14:00:00',0),(2216,10,1,'2022-11-25 16:00:00',0),(2217,10,1,'2022-11-26 08:00:00',0),(2218,10,1,'2022-11-26 10:00:00',0),(2219,10,1,'2022-11-26 14:00:00',0),(2220,10,1,'2022-11-26 16:00:00',0),(2221,10,1,'2022-11-27 08:00:00',0),(2222,10,1,'2022-11-27 10:00:00',0),(2223,10,1,'2022-11-27 14:00:00',0),(2224,10,1,'2022-11-27 16:00:00',0),(2225,10,1,'2022-11-28 08:00:00',0),(2226,10,1,'2022-11-28 10:00:00',0),(2227,10,1,'2022-11-28 14:00:00',0),(2228,10,1,'2022-11-28 16:00:00',0),(2229,10,1,'2022-11-29 08:00:00',0),(2230,10,1,'2022-11-29 10:00:00',0),(2231,10,1,'2022-11-29 14:00:00',0),(2232,10,1,'2022-11-29 16:00:00',0),(2233,10,1,'2022-11-30 08:00:00',0),(2234,10,1,'2022-11-30 10:00:00',0),(2235,10,1,'2022-11-30 14:00:00',0),(2236,10,1,'2022-11-30 16:00:00',0),(2237,10,1,'2022-12-01 08:00:00',0),(2238,10,1,'2022-12-01 10:00:00',0),(2239,10,1,'2022-12-01 14:00:00',0),(2240,10,1,'2022-12-01 16:00:00',0),(2241,10,1,'2022-12-02 08:00:00',0),(2242,10,1,'2022-12-02 10:00:00',0),(2243,10,1,'2022-12-02 14:00:00',0),(2244,10,1,'2022-12-02 16:00:00',0),(2245,10,1,'2022-12-03 08:00:00',0),(2246,10,1,'2022-12-03 10:00:00',0),(2247,10,1,'2022-12-03 14:00:00',0),(2248,10,1,'2022-12-03 16:00:00',0),(2249,10,1,'2022-12-04 08:00:00',0),(2250,10,1,'2022-12-04 10:00:00',0),(2251,10,1,'2022-12-04 14:00:00',0),(2252,10,1,'2022-12-04 16:00:00',0),(2253,10,1,'2022-12-05 08:00:00',0),(2254,10,1,'2022-12-05 10:00:00',0),(2255,10,1,'2022-12-05 14:00:00',0),(2256,10,1,'2022-12-05 16:00:00',0),(2257,10,1,'2022-12-06 08:00:00',0),(2258,10,1,'2022-12-06 10:00:00',0),(2259,10,1,'2022-12-06 14:00:00',0),(2260,10,1,'2022-12-06 16:00:00',0),(2261,10,1,'2022-12-07 08:00:00',0),(2262,10,1,'2022-12-07 10:00:00',0),(2263,10,1,'2022-12-07 14:00:00',0),(2264,10,1,'2022-12-07 16:00:00',0),(2265,8,2,'2022-11-16 08:00:00',20),(2266,8,2,'2022-11-16 09:20:00',20),(2267,8,2,'2022-11-16 10:40:00',20),(2268,8,2,'2022-11-16 14:00:00',20),(2269,8,2,'2022-11-16 15:20:00',20),(2270,8,2,'2022-11-16 16:40:00',20),(2271,8,2,'2022-11-16 20:00:00',20),(2272,8,2,'2022-11-16 21:19:59',20),(2273,8,2,'2022-11-16 22:39:58',20),(2274,8,2,'2022-11-17 08:00:00',20),(2275,8,2,'2022-11-17 09:20:00',20),(2276,8,2,'2022-11-17 10:40:00',20),(2277,8,2,'2022-11-17 14:00:00',20),(2278,8,2,'2022-11-17 15:20:00',20),(2279,8,2,'2022-11-17 16:40:00',20),(2280,8,2,'2022-11-17 20:00:00',20),(2281,8,2,'2022-11-17 21:19:59',20),(2282,8,2,'2022-11-17 22:39:58',20),(2283,8,2,'2022-11-18 08:00:00',20),(2284,8,2,'2022-11-18 09:20:00',20),(2285,8,2,'2022-11-18 10:40:00',20),(2286,8,2,'2022-11-18 14:00:00',20),(2287,8,2,'2022-11-18 15:20:00',20),(2288,8,2,'2022-11-18 16:40:00',20),(2289,8,2,'2022-11-18 20:00:00',20),(2290,8,2,'2022-11-18 21:19:59',20),(2291,8,2,'2022-11-18 22:39:58',20),(2292,8,2,'2022-11-19 08:00:00',20),(2293,8,2,'2022-11-19 09:20:00',20),(2294,8,2,'2022-11-19 10:40:00',20),(2295,8,2,'2022-11-19 14:00:00',20),(2296,8,2,'2022-11-19 15:20:00',20),(2297,8,2,'2022-11-19 16:40:00',20),(2298,8,2,'2022-11-19 20:00:00',20),(2299,8,2,'2022-11-19 21:19:59',20),(2300,8,2,'2022-11-19 22:39:58',20),(2301,8,2,'2022-11-20 08:00:00',20),(2302,8,2,'2022-11-20 09:20:00',20),(2303,8,2,'2022-11-20 10:40:00',20),(2304,8,2,'2022-11-20 14:00:00',20),(2305,8,2,'2022-11-20 15:20:00',20),(2306,8,2,'2022-11-20 16:40:00',20),(2307,8,2,'2022-11-20 20:00:00',20),(2308,8,2,'2022-11-20 21:19:59',20),(2309,8,2,'2022-11-20 22:39:58',20),(2310,8,2,'2022-11-21 08:00:00',20),(2311,8,2,'2022-11-21 09:20:00',20),(2312,8,2,'2022-11-21 10:40:00',20),(2313,8,2,'2022-11-21 14:00:00',20),(2314,8,2,'2022-11-21 15:20:00',20),(2315,8,2,'2022-11-21 16:40:00',20),(2316,8,2,'2022-11-21 20:00:00',20),(2317,8,2,'2022-11-21 21:19:59',20),(2318,8,2,'2022-11-21 22:39:58',20),(2319,8,2,'2022-11-22 08:00:00',20),(2320,8,2,'2022-11-22 09:20:00',20),(2321,8,2,'2022-11-22 10:40:00',20),(2322,8,2,'2022-11-22 14:00:00',20),(2323,8,2,'2022-11-22 15:20:00',20),(2324,8,2,'2022-11-22 16:40:00',20),(2325,8,2,'2022-11-22 20:00:00',20),(2326,8,2,'2022-11-22 21:19:59',20),(2327,8,2,'2022-11-22 22:39:58',20),(2328,8,2,'2022-11-23 08:00:00',20),(2329,8,2,'2022-11-23 09:20:00',20),(2330,8,2,'2022-11-23 10:40:00',20),(2331,8,2,'2022-11-23 14:00:00',20),(2332,8,2,'2022-11-23 15:20:00',20),(2333,8,2,'2022-11-23 16:40:00',20),(2334,8,2,'2022-11-23 20:00:00',20),(2335,8,2,'2022-11-23 21:19:59',20),(2336,8,2,'2022-11-23 22:39:58',20),(2337,8,2,'2022-11-24 08:00:00',20),(2338,8,2,'2022-11-24 09:20:00',20),(2339,8,2,'2022-11-24 10:40:00',20),(2340,8,2,'2022-11-24 14:00:00',20),(2341,8,2,'2022-11-24 15:20:00',20),(2342,8,2,'2022-11-24 16:40:00',20),(2343,8,2,'2022-11-24 20:00:00',20),(2344,8,2,'2022-11-24 21:19:59',20),(2345,8,2,'2022-11-24 22:39:58',20),(2346,8,2,'2022-11-25 08:00:00',20),(2347,8,2,'2022-11-25 09:20:00',20),(2348,8,2,'2022-11-25 10:40:00',20),(2349,8,2,'2022-11-25 14:00:00',20),(2350,8,2,'2022-11-25 15:20:00',20),(2351,8,2,'2022-11-25 16:40:00',20),(2352,8,2,'2022-11-25 20:00:00',20),(2353,8,2,'2022-11-25 21:19:59',20),(2354,8,2,'2022-11-25 22:39:58',20),(2355,8,2,'2022-11-26 08:00:00',20),(2356,8,2,'2022-11-26 09:20:00',20),(2357,8,2,'2022-11-26 10:40:00',20),(2358,8,2,'2022-11-26 14:00:00',20),(2359,8,2,'2022-11-26 15:20:00',20),(2360,8,2,'2022-11-26 16:40:00',20),(2361,8,2,'2022-11-26 20:00:00',20),(2362,8,2,'2022-11-26 21:19:59',20),(2363,8,2,'2022-11-26 22:39:58',20),(2364,8,2,'2022-11-27 08:00:00',20),(2365,8,2,'2022-11-27 09:20:00',20),(2366,8,2,'2022-11-27 10:40:00',20),(2367,8,2,'2022-11-27 14:00:00',20),(2368,8,2,'2022-11-27 15:20:00',20),(2369,8,2,'2022-11-27 16:40:00',20),(2370,8,2,'2022-11-27 20:00:00',20),(2371,8,2,'2022-11-27 21:19:59',20),(2372,8,2,'2022-11-27 22:39:58',20),(2373,8,2,'2022-11-28 08:00:00',20),(2374,8,2,'2022-11-28 09:20:00',20),(2375,8,2,'2022-11-28 10:40:00',20),(2376,8,2,'2022-11-28 14:00:00',20),(2377,8,2,'2022-11-28 15:20:00',20),(2378,8,2,'2022-11-28 16:40:00',20),(2379,8,2,'2022-11-28 20:00:00',20),(2380,8,2,'2022-11-28 21:19:59',20),(2381,8,2,'2022-11-28 22:39:58',20),(2382,8,2,'2022-11-29 08:00:00',20),(2383,8,2,'2022-11-29 09:20:00',20),(2384,8,2,'2022-11-29 10:40:00',20),(2385,8,2,'2022-11-29 14:00:00',20),(2386,8,2,'2022-11-29 15:20:00',20),(2387,8,2,'2022-11-29 16:40:00',20),(2388,8,2,'2022-11-29 20:00:00',20),(2389,8,2,'2022-11-29 21:19:59',20),(2390,8,2,'2022-11-29 22:39:58',20),(2391,8,2,'2022-11-30 08:00:00',20),(2392,8,2,'2022-11-30 09:20:00',20),(2393,8,2,'2022-11-30 10:40:00',20),(2394,8,2,'2022-11-30 14:00:00',20),(2395,8,2,'2022-11-30 15:20:00',20),(2396,8,2,'2022-11-30 16:40:00',20),(2397,8,2,'2022-11-30 20:00:00',20),(2398,8,2,'2022-11-30 21:19:59',20),(2399,8,2,'2022-11-30 22:39:58',20);
/*!40000 ALTER TABLE `sn_a_service_ticket_related` ENABLE KEYS */;

#
# Structure for table "sn_admin"
#

DROP TABLE IF EXISTS `sn_admin`;
CREATE TABLE `sn_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `root` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否超级管理员 0-否 1-是',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '名称',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `account` varchar(32) NOT NULL DEFAULT '' COMMENT '账号',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色id',
  `dept_id` int(11) NOT NULL DEFAULT '0' COMMENT '部门id',
  `jobs_id` int(11) NOT NULL DEFAULT '0' COMMENT '岗位id',
  `login_time` int(10) DEFAULT NULL COMMENT '最后登录时间',
  `login_ip` varchar(15) DEFAULT '' COMMENT '最后登录ip',
  `multipoint_login` tinyint(1) unsigned DEFAULT '1' COMMENT '是否支持多处登录：1-是；0-否；',
  `disable` tinyint(1) unsigned DEFAULT '0' COMMENT '是否禁用：0-否；1-是；',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

#
# Data for table "sn_admin"
#

INSERT INTO `sn_admin` VALUES (1,1,'admin','','admin','092fcb95acd097f9449b45a723d3e979',0,1,0,1668645517,'127.0.0.1',1,0,1666188678,1668645517,NULL),(2,0,'test','resource/image/adminapi/default/avatar.png','test','092fcb95acd097f9449b45a723d3e979',3,1,0,NULL,'',1,1,1666332150,1666332289,1666332289),(3,0,'李四','','lisi','092fcb95acd097f9449b45a723d3e979',1,0,0,1667321132,'127.0.0.1',0,0,1667134258,1667321132,NULL);

#
# Structure for table "sn_admin_session"
#

DROP TABLE IF EXISTS `sn_admin_session`;
CREATE TABLE `sn_admin_session` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) unsigned NOT NULL COMMENT '用户id',
  `terminal` tinyint(1) NOT NULL DEFAULT '1' COMMENT '客户端类型：1-pc管理后台 2-mobile手机管理后台',
  `token` varchar(32) NOT NULL COMMENT '令牌',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `expire_time` int(10) NOT NULL COMMENT '到期时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `admin_id_client` (`admin_id`,`terminal`) USING BTREE COMMENT '一个用户在一个终端只有一个token',
  UNIQUE KEY `token` (`token`) USING BTREE COMMENT 'token是唯一的'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='管理员会话表';

#
# Data for table "sn_admin_session"
#

INSERT INTO `sn_admin_session` VALUES (1,1,1,'ad082aa2a74cba85ac6710535f006b03',1668645517,1668674317),(2,3,1,'52829e6307f50d7f482362cf85f77f3d',1667321248,1667321248);

#
# Structure for table "sn_article"
#

DROP TABLE IF EXISTS `sn_article`;
CREATE TABLE `sn_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `cid` int(11) NOT NULL COMMENT '文章分类',
  `title` varchar(255) NOT NULL COMMENT '文章标题',
  `desc` varchar(255) DEFAULT '' COMMENT '简介',
  `abstract` text COMMENT '文章摘要',
  `image` varchar(128) DEFAULT NULL COMMENT '文章图片',
  `author` varchar(255) DEFAULT '' COMMENT '作者',
  `content` text COMMENT '文章内容',
  `click_virtual` int(10) DEFAULT '0' COMMENT '虚拟浏览量',
  `click_actual` int(11) DEFAULT '0' COMMENT '实际浏览量',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示:1-是.0-否',
  `sort` int(5) DEFAULT '0' COMMENT '排序',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='文章表';

#
# Data for table "sn_article"
#

INSERT INTO `sn_article` VALUES (1,1,'让生活更精致！五款居家好物推荐，实用性超高','##好物推荐🔥','随着当代生活节奏的忙碌，很多人在闲暇之余都想好好的享受生活。随着科技的发展，也出现了越来越多可以帮助我们提升幸福感，让生活变得更精致的产品，下面周周就给大家盘点五款居家必备的好物，都是实用性很高的产品，周周可以保证大家买了肯定会喜欢。','/resource/image/adminapi/default/article01.png','红花','<p>拥有一台投影仪，闲暇时可以在家里直接看影院级别的大片，光是想想都觉得超级爽。市面上很多投影仪大几千，其实周周觉得没必要，选泰捷这款一千多的足够了，性价比非常高。</p><p>泰捷的专业度很高，在电视TV领域研发已经十年，有诸多专利和技术创新，荣获国内外多项技术奖项，拿下了腾讯创新工场投资，打造的泰捷视频TV端和泰捷电视盒子都获得了极高评价。</p><p>这款投影仪的分辨率在3000元内无敌，做到了真1080P高分辨率，也就是跟市场售价三千DLP投影仪一样的分辨率，真正做到了分毫毕现，像桌布的花纹、天空的云彩等，这些细节都清晰可见。</p><p>亮度方面，泰捷达到了850ANSI流明，同价位一般是200ANSI。这是因为泰捷为了提升亮度和LCD技术透射率低的问题，首创高功率LED灯源，让其亮度做到同价位最好。专业媒体也进行了多次对比，效果与3000元价位投影仪相当。</p><p>操作系统周周也很喜欢，完全不卡。泰捷作为资深音视频品牌，在系统优化方面有十年的研发经验，打造出的“零极”系统是业内公认效率最高、速度最快的系统，用户也评价它流畅度能一台顶三台，而且为了解决行业广告多这一痛点，系统内不植入任何广告。</p>',1,2,1,0,1663317759,1663317759,NULL),(2,1,'埋葬UI设计师的坟墓不是内卷，而是免费模式','','本文从另外一个角度，聊聊作者对UI设计师职业发展前景的担忧，欢迎从事UI设计的同学来参与讨论，会有赠书哦','/resource/image/adminapi/default/article02.jpeg','小明','<p><br></p><p style=\"text-align: justify;\">一个职业，卷，根本就没什么大不了的，尤其是成熟且收入高的职业，不卷才不符合事物发展的规律。何况 UI 设计师的人力市场到今天也和 5 年前一样，还是停留在大型菜鸡互啄的场面。远不能和医疗、证券、教师或者演艺练习生相提并论。</p><p style=\"text-align: justify;\">真正会让我对UI设计师发展前景觉得悲观的事情就只有一件 —— 国内的互联网产品免费机制。这也是一个我一直以来想讨论的话题，就在这次写一写。</p><p style=\"text-align: justify;\">国内互联网市场的发展，是一部浩瀚的 “免费经济” 发展史。虽然今天免费已经是深入国内民众骨髓的认知，但最早的中文互联网也是需要付费的，网游也都是要花钱的。</p><p style=\"text-align: justify;\">只是自有国情在此，付费确实阻碍了互联网行业的扩张和普及，一批创业家就开始通过免费的模式为用户提供服务，从而扩大了自己的产品覆盖面和普及程度。</p><p style=\"text-align: justify;\">印象最深的就是免费急先锋周鸿祎，和现在鲜少出现在公众视野不同，一零年前他是当之无愧的互联网教主，因为他开发出了符合中国国情的互联网产品 “打法”，让 360 的发展如日中天。</p><p style=\"text-align: justify;\">就是他在自传中提到：</p><p style=\"text-align: justify;\">只要是在互联网上每个人都需要的服务，我们就认为它是基础服务，基础服务一定是免费的，这样的话不会形成价值歧视。就是说，只要这种服务是每个人都一定要用的，我一定免费提供，而且是无条件免费。增值服务不是所有人都需要的，这个比例可能会相当低，它只是百分之几甚至更少比例的人需要，所以这种服务一定要收费……</p><p style=\"text-align: justify;\">这就是互联网的游戏规则，它决定了要想建立一个有效的商业模式，就一定要有海量的用户基数……</p>',2,4,1,0,1663322854,1663322854,NULL),(3,2,'金山电池公布“沪广深市民绿色生活方式”调查结果','','60%以上受访者认为高质量的10分钟足以完成“自我充电”','/resource/image/adminapi/default/article03.png','中网资讯科技','<p style=\"text-align: left;\"><strong>深圳，2021年10月22日）</strong>生活在一线城市的沪广深市民一向以效率见称，工作繁忙和快节奏的生活容易缺乏充足的休息。近日，一项针对沪广深市民绿色生活方式而展开的网络问卷调查引起了大家的注意。问卷的问题设定集中于市民对休息时间的看法，以及从对循环充电电池的使用方面了解其对绿色生活方式的态度。该调查采用随机抽样的模式，并对最终收集的1,500份有效问卷进行专业分析后发现，超过60%的受访者表示，在每天的工作时段能拥有10分钟高质量的休息时间，就可以高效“自我充电”。该调查结果反映出，在快节奏时代下，人们需要高质量的休息时间，也要学会利用高效率的休息方式和工具来应对快节奏的生活，以时刻保持“满电”状态。</p><p style=\"text-align: left;\">　　<strong>60%以上受访者认为高质量的10分钟足以完成“自我充电”</strong></p><p style=\"text-align: left;\">　　这次调查超过1,500人，主要聚焦18至85岁的沪广深市民，了解他们对于休息时间的观念及使用充电电池的习惯，结果发现：</p><p style=\"text-align: left;\">　　· 90%以上有工作受访者每天工作时间在7小时以上，平均工作时间为8小时，其中43%以上的受访者工作时间超过9小时</p><p style=\"text-align: left;\">　　· 70%受访者认为在工作期间拥有10分钟“自我充电”时间不是一件困难的事情</p><p style=\"text-align: left;\">　　· 60%受访者认为在工作期间有10分钟休息时间足以为自己快速充电</p><p style=\"text-align: left;\">　　临床心理学家黄咏诗女士在发布会上分享为自己快速充电的实用技巧，她表示：“事实上，只要选择正确的休息方法，10分钟也足以为自己充电。以喝咖啡为例，我们可以使用心灵休息法 ── 静观呼吸，慢慢感受咖啡的温度和气味，如果能配合着聆听流水或海洋的声音，能够有效放松大脑及心灵。”</p><p style=\"text-align: left;\">　　这次调查结果反映出沪广深市民的希望在繁忙的工作中适时停下来，抽出10分钟喝杯咖啡、聆听音乐或小睡片刻，为自己充电。金山电池全新推出的“绿再十分充”超快速充电器仅需10分钟就能充好电，喝一杯咖啡的时间既能完成“自我充电”，也满足设备使用的用电需求，为提升工作效率和放松身心注入新能量。</p><p style=\"text-align: left;\">　　<strong>金山电池推出10分钟超快电池充电器*绿再十分充，以创新科技为市场带来革新体验</strong></p><p style=\"text-align: left;\">　　该问卷同时从沪广深市民对循环充电电池的使用方面进行了调查，以了解其对绿色生活方式的态度：</p><p style=\"text-align: left;\">　　· 87%受访者目前没有使用充电电池，其中61%表示会考虑使用充电电池</p><p style=\"text-align: left;\">　　· 58%受访者过往曾使用过充电电池，却只有20%左右市民仍在使用</p><p style=\"text-align: left;\">　　· 60%左右受访者认为充电电池尚未被广泛使用，主要障碍来自于充电时间过长、缺乏相关教育</p><p style=\"text-align: left;\">　　· 90%以上受访者认为充电电池充满电需要1小时或更长的时间</p><p style=\"text-align: left;\">　　金山电池一直致力于为大众提供安全可靠的充电电池，并与消费者的需求和生活方式一起演变及进步。今天，金山电池宣布推出10分钟超快电池充电器*绿再十分充，只需10分钟*即可将4粒绿再十分充充电电池充好电，充电速度比其他品牌提升3倍**。充电器的LED灯可以显示每粒电池的充电状态和模式，并提示用户是否错误插入已损坏电池或一次性电池。尽管其体型小巧，却具备多项创新科技 ，如拥有独特的充电算法以优化充电电流，并能根据各个电池类型、状况和温度用最短的时间为充电电池充好电;绿再十分充内置横流扇，有效防止电池温度过热和提供低噪音的充电环境等。<br></p>',11,5,1,0,1663322665,1666469011,NULL);

#
# Structure for table "sn_article_cate"
#

DROP TABLE IF EXISTS `sn_article_cate`;
CREATE TABLE `sn_article_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章分类id',
  `name` varchar(90) DEFAULT NULL COMMENT '分类名称',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '是否显示:1-是;0-否',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='文章分类表';

#
# Data for table "sn_article_cate"
#

INSERT INTO `sn_article_cate` VALUES (1,'文章资讯',0,1,1663317280,1663317280,1663317282),(2,'社会热点',0,1,1663317280,1663321464,1663321494);

#
# Structure for table "sn_article_collect"
#

DROP TABLE IF EXISTS `sn_article_collect`;
CREATE TABLE `sn_article_collect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `article_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '收藏状态 0-未收藏 1-已收藏',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章收藏表';

#
# Data for table "sn_article_collect"
#


#
# Structure for table "sn_config"
#

DROP TABLE IF EXISTS `sn_config`;
CREATE TABLE `sn_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) DEFAULT NULL COMMENT '类型',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '名称',
  `value` text COMMENT '值',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='配置表';

#
# Data for table "sn_config"
#

INSERT INTO `sn_config` VALUES (1,'login','login_way','[\"1\",\"2\"]',1666333330,1666333330),(2,'login','coerce_mobile','0',1666333330,1666333330),(3,'login','login_agreement','1',1666333330,1666333330),(4,'login','third_auth','1',1666333330,1666333330),(5,'login','wechat_auth','1',1666333330,1666333330),(6,'login','qq_auth','0',1666333330,1666333330),(7,'website','name','预约管理系统',1666462864,1666462864),(8,'website','web_favicon','uploads/images/20221023/20221023022339506fd1589.png',1666462864,1666463034),(9,'website','web_logo','uploads/images/20221023/20221023022339506fd1589.png',1666462864,1666463034),(10,'website','login_image','resource/image/adminapi/default/login_image.png',1666462864,1666462864),(11,'website','shop_name','likeadmin',1666462864,1666462864),(12,'website','shop_logo','resource/image/adminapi/default/shop_logo.png',1666462864,1666462864),(13,'tabbar','style','{\"default_color\":\"#999999\",\"selected_color\":\"#4173ff\"}',1666713613,1666713613);

#
# Structure for table "sn_decorate_page"
#

DROP TABLE IF EXISTS `sn_decorate_page`;
CREATE TABLE `sn_decorate_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '10' COMMENT '页面类型',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '页面名称',
  `data` text COMMENT '页面数据',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='装修页面配置表';

#
# Data for table "sn_decorate_page"
#

INSERT INTO `sn_decorate_page` VALUES (1,1,'商城首页','[{\"title\":\"搜索\",\"name\":\"search\",\"disabled\":1,\"content\":{},\"styles\":{}},{\"title\":\"首页轮播图\",\"name\":\"banner\",\"content\":{\"enabled\":1,\"data\":[{\"image\":\"/resource/image/adminapi/default/banner01.png\",\"name\":\"\",\"link\":{\"path\":\"/pages/index/index\",\"name\":\"商城首页\",\"type\":\"shop\"}},{\"image\":\"/resource/image/adminapi/default/banner02.png\",\"name\":\"\",\"link\":{}}]},\"styles\":{}},{\"title\":\"导航菜单\",\"name\":\"nav\",\"content\":{\"enabled\":0,\"data\":[{\"image\":\"/resource/image/adminapi/default/nav01.png\",\"name\":\"资讯中心\",\"link\":{\"path\":\"/pages/news/news\",\"name\":\"文章资讯\",\"type\":\"shop\"}},{\"image\":\"/resource/image/adminapi/default/nav02.png\",\"name\":\"我的收藏\",\"link\":{\"path\":\"/pages/collection/collection\",\"name\":\"我的收藏\",\"type\":\"shop\"}},{\"image\":\"/resource/image/adminapi/default/nav03.png\",\"name\":\"个人设置\",\"link\":{\"path\":\"/pages/user_set/user_set\",\"name\":\"个人设置\",\"type\":\"shop\"}},{\"image\":\"/resource/image/adminapi/default/nav04.png\",\"name\":\"联系客服\",\"link\":{\"path\":\"/pages/customer_service/customer_service\",\"name\":\"联系客服\",\"type\":\"shop\"}},{\"image\":\"/resource/image/adminapi/default/nav05.png\",\"name\":\"关于我们\",\"link\":{\"path\":\"/pages/as_us/as_us\",\"name\":\"关于我们\",\"type\":\"shop\"}}]},\"styles\":{}},{\"id\":\"l84almsk2uhyf\",\"title\":\"资讯\",\"name\":\"news\",\"disabled\":1,\"content\":{},\"styles\":{}}]',1661757188,1666520581),(2,2,'个人中心','[{\"title\":\"用户信息\",\"name\":\"user-info\",\"disabled\":1,\"content\":{},\"styles\":{}},{\"title\":\"我的服务\",\"name\":\"my-service\",\"content\":{\"style\":2,\"title\":\"服务中心\",\"data\":[{\"image\":\"/resource/image/adminapi/default/user_collect.png\",\"name\":\"我的预约\",\"link\":{\"path\":\"/pages/booking/booking_order\",\"name\":\"我的预约\",\"type\":\"shop\"}},{\"image\":\"/resource/image/adminapi/default/user_setting.png\",\"name\":\"个人设置\",\"link\":{\"path\":\"/pages/user_set/user_set\",\"name\":\"个人设置\",\"type\":\"shop\"}},{\"image\":\"/resource/image/adminapi/default/user_kefu.png\",\"name\":\"联系客服\",\"link\":{\"path\":\"/pages/customer_service/customer_service\",\"name\":\"联系客服\",\"type\":\"shop\"}}]},\"styles\":{}},{\"title\":\"个人中心广告图\",\"name\":\"user-banner\",\"content\":{\"enabled\":1,\"data\":[{\"image\":\"/resource/image/adminapi/default/ad01.jpg\",\"name\":\"\",\"link\":{}}]},\"styles\":{}}]',1661757188,1667058303),(3,3,'客服设置','[{\"title\":\"客服设置\",\"name\":\"customer-service\",\"content\":{\"title\":\"添加客服二维码\",\"time\":\"早上 9:00 - 22:00\",\"mobile\":\"13800138000\",\"qrcode\":\"\"},\"styles\":{}}]',1661757188,1662689155);

#
# Structure for table "sn_decorate_tabbar"
#

DROP TABLE IF EXISTS `sn_decorate_tabbar`;
CREATE TABLE `sn_decorate_tabbar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '导航名称',
  `selected` varchar(200) NOT NULL DEFAULT '' COMMENT '未选图标',
  `unselected` varchar(200) NOT NULL DEFAULT '' COMMENT '已选图标',
  `link` varchar(200) DEFAULT NULL COMMENT '链接地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='装修底部导航表';

#
# Data for table "sn_decorate_tabbar"
#

INSERT INTO `sn_decorate_tabbar` VALUES (10,'首页','resource/image/adminapi/default/tabbar_home_sel.png','resource/image/adminapi/default/tabbar_home.png','{\"path\":\"\\/pages\\/index\\/index\",\"name\":\"\\u5546\\u57ce\\u9996\\u9875\",\"type\":\"shop\"}',1667058348,1667058348),(11,'预约','resource/image/adminapi/default/tabbar_text_sel.png','resource/image/adminapi/default/tabbar_text.png','{\"path\":\"\\/pages\\/booking\\/booking\",\"name\":\"\\u9884\\u7ea6\",\"type\":\"shop\"}',1667058348,1667058348),(12,'我的','resource/image/adminapi/default/tabbar_me_sel.png','resource/image/adminapi/default/tabbar_me.png','{\"path\":\"\\/pages\\/user\\/user\",\"name\":\"\\u4e2a\\u4eba\\u4e2d\\u5fc3\",\"type\":\"shop\"}',1667058348,1667058348);

#
# Structure for table "sn_dept"
#

DROP TABLE IF EXISTS `sn_dept`;
CREATE TABLE `sn_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '部门名称',
  `pid` bigint(20) NOT NULL DEFAULT '0' COMMENT '上级部门id',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `leader` varchar(64) DEFAULT NULL COMMENT '负责人',
  `mobile` varchar(16) DEFAULT NULL COMMENT '联系电话',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '部门状态（0停用 1正常）',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='部门表';

#
# Data for table "sn_dept"
#

INSERT INTO `sn_dept` VALUES (1,'公司',0,0,'李玲','13345698745',1,1650592684,1666331862,NULL),(2,'客服部',1,0,'','',1,1666331936,1666331936,NULL);

#
# Structure for table "sn_dict_data"
#

DROP TABLE IF EXISTS `sn_dict_data`;
CREATE TABLE `sn_dict_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) NOT NULL COMMENT '数据名称',
  `value` varchar(255) NOT NULL COMMENT '数据值',
  `type_id` int(11) NOT NULL COMMENT '字典类型id',
  `type_value` varchar(255) NOT NULL COMMENT '字典类型',
  `sort` int(10) DEFAULT '0' COMMENT '排序值',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-停用 1-正常',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';

#
# Data for table "sn_dict_data"
#

INSERT INTO `sn_dict_data` VALUES (1,'隐藏','0',1,'show_status',0,1,'',1656381543,1656381543,NULL),(2,'显示','1',1,'show_status',0,1,'',1656381550,1656381550,NULL),(3,'进行中','0',2,'business_status',0,1,'',1656381410,1656381410,NULL),(4,'成功','1',2,'business_status',0,1,'',1656381437,1656381437,NULL),(5,'失败','2',2,'business_status',0,1,'',1656381449,1656381449,NULL),(6,'待处理','0',3,'event_status',0,1,'',1656381212,1656381212,NULL),(7,'已处理','1',3,'event_status',0,1,'',1656381315,1656381315,NULL),(8,'拒绝处理','2',3,'event_status',0,1,'',1656381331,1656381331,NULL),(9,'禁用','1',4,'system_disable',0,1,'',1656312030,1656312030,NULL),(10,'正常','0',4,'system_disable',0,1,'',1656312040,1656312040,NULL),(11,'未知','0',5,'sex',0,1,'',1656062988,1656062988,NULL),(12,'男','1',5,'sex',0,1,'',1656062999,1656062999,NULL),(13,'女','2',5,'sex',0,1,'',1656063009,1656063009,NULL);

#
# Structure for table "sn_dict_type"
#

DROP TABLE IF EXISTS `sn_dict_type`;
CREATE TABLE `sn_dict_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '字典名称',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '字典类型名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-停用 1-正常',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';

#
# Data for table "sn_dict_type"
#

INSERT INTO `sn_dict_type` VALUES (1,'显示状态','show_status',1,'',1656381520,1656381520,NULL),(2,'业务状态','business_status',1,'',1656381393,1656381393,NULL),(3,'事件状态','event_status',1,'',1656381075,1656381075,NULL),(4,'禁用状态','system_disable',1,'',1656311838,1656311838,NULL),(5,'用户性别','sex',1,'',1656062946,1656380925,NULL);

#
# Structure for table "sn_file"
#

DROP TABLE IF EXISTS `sn_file`;
CREATE TABLE `sn_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `cid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '类目ID',
  `source_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传者id',
  `source` tinyint(1) NOT NULL DEFAULT '0' COMMENT '来源类型[0-后台,1-用户]',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '10' COMMENT '类型[10=图片, 20=视频]',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '文件名称',
  `uri` varchar(200) NOT NULL COMMENT '文件路径',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='文件表';

#
# Data for table "sn_file"
#

INSERT INTO `sn_file` VALUES (1,0,0,0,10,'backend_logo - 副本.png','uploads/images/20221023/20221023022339506fd1589.png',1666463019,1666463019,NULL),(2,0,0,0,10,'tx.jpg','uploads/images/20221026/202210261133401e3722704.jpg',1666755220,1666755220,NULL);

#
# Structure for table "sn_file_cate"
#

DROP TABLE IF EXISTS `sn_file_cate`;
CREATE TABLE `sn_file_cate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '10' COMMENT '类型[10=图片，20=视频，30=文件]',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '分类名称',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) unsigned DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件分类表';

#
# Data for table "sn_file_cate"
#


#
# Structure for table "sn_generate_column"
#

DROP TABLE IF EXISTS `sn_generate_column`;
CREATE TABLE `sn_generate_column` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `table_id` int(11) NOT NULL DEFAULT '0' COMMENT '表id',
  `column_name` varchar(100) NOT NULL DEFAULT '' COMMENT '字段名称',
  `column_comment` varchar(300) NOT NULL DEFAULT '' COMMENT '字段描述',
  `column_type` varchar(100) NOT NULL DEFAULT '' COMMENT '字段类型',
  `is_required` tinyint(1) DEFAULT '0' COMMENT '是否必填 0-非必填 1-必填',
  `is_pk` tinyint(1) DEFAULT '0' COMMENT '是否为主键 0-不是 1-是',
  `is_insert` tinyint(1) DEFAULT '0' COMMENT '是否为插入字段 0-不是 1-是',
  `is_update` tinyint(1) DEFAULT '0' COMMENT '是否为更新字段 0-不是 1-是',
  `is_lists` tinyint(1) DEFAULT '0' COMMENT '是否为列表字段 0-不是 1-是',
  `is_query` tinyint(1) DEFAULT '0' COMMENT '是否为查询字段 0-不是 1-是',
  `query_type` varchar(100) DEFAULT '=' COMMENT '查询类型',
  `view_type` varchar(100) DEFAULT 'input' COMMENT '显示类型',
  `dict_type` varchar(255) DEFAULT '' COMMENT '字典类型',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成表字段信息表';

#
# Data for table "sn_generate_column"
#

INSERT INTO `sn_generate_column` VALUES (1,3,'id','','int',0,1,0,0,0,0,'=','input','',1666343533,1666343966),(2,3,'name','服务人员名字','string',0,0,1,1,1,1,'=','input','',1666343533,1666343966),(3,3,'introduction','服务人员简介','string',0,0,1,1,1,1,'=','editor','',1666343533,1666343966),(4,4,'id','','int',0,1,0,1,1,1,'=','input','',1666375103,1666375175),(5,4,'label','本设置的名字','string',0,0,1,1,1,1,'=','input','',1666375103,1666375175),(6,4,'enabled','本排班设置是否生效，1生效， 0 非生效','int',0,0,1,1,1,1,'=','input','',1666375103,1666375175),(7,4,'service_person_id','服务人员id， 外键','int',0,0,1,1,1,1,'=','input','',1666375103,1666375175),(8,4,'avg_duration','一次服务平均时间多少分钟','int',0,0,1,1,1,1,'=','input','',1666375103,1666375175),(9,4,'booking_fee','预约费用','float',0,0,1,1,1,1,'=','input','',1666375103,1666375175),(10,4,'start_date','服务开始时间，如2022-09-07','datetime',0,0,1,1,1,1,'=','input','',1666375103,1666375175),(11,4,'end_date','服务结束时间，如2022-09-22','datetime',0,0,1,1,1,1,'=','input','',1666375103,1666375175),(12,4,'am_service_times','每天早上（8-12）服务次数','int',0,0,1,1,1,1,'=','input','',1666375103,1666375175),(13,4,'am_start_time','上午服务开始时间， 如 08:00:00','string',0,0,1,1,1,1,'=','input','',1666375103,1666375175),(14,4,'am_end_time','上午服务结束时间， 如 12:00:00','string',0,0,1,1,1,1,'=','input','',1666375103,1666375175),(15,4,'pm1_service_times','每天下午（14-18）服务次数','int',0,0,1,1,1,1,'=','input','',1666375103,1666375175),(16,4,'pm1_start_time','下午服务开始时间， 如 14:00:00','string',0,0,1,1,1,1,'=','input','',1666375103,1666375175),(17,4,'pm1_end_time','下午服务结束时间， 如 18:00:00','string',0,0,1,1,1,1,'=','input','',1666375103,1666375175),(18,4,'pm2_service_times','每天晚上（20-24）服务次数','int',0,0,1,1,1,1,'=','input','',1666375103,1666375175),(19,4,'pm2_start_time','晚上服务开始时间， 如 20:00:00','string',0,0,1,1,1,1,'=','input','',1666375103,1666375175),(20,4,'pm2_end_time','晚上服务结束时间， 如 24:00:00','string',0,0,1,1,1,1,'=','input','',1666375103,1666375175),(21,5,'id','','int',0,1,0,1,1,1,'=','input','',1666543519,1666543611),(22,5,'service_schedule_setting_id','外键','int',0,0,1,1,1,1,'=','input','',1666543519,1666543611),(23,5,'booking_user_id','操作预约的用户id, 来自sn_user表，外键，客户id。接受服务的人不一定是他，因为可以为别人预约','int',0,0,1,1,1,1,'=','input','',1666543519,1666543611),(24,5,'service_person_id','服务人员id,外键','int',0,0,1,1,1,1,'=','input','',1666543519,1666543611),(25,5,'served_person_id','接受服务的人id, 外键，来自sn_a_served_person表','int',0,0,1,1,1,1,'=','input','',1666543519,1666543611),(26,5,'booking_time','预约的时间， 如 2022-09-18 10:00:00','datetime',0,0,1,1,1,1,'=','input','',1666543519,1666543611),(27,5,'booking_status','预约的状态代号， pending(待完成)，confirmed (已完成)','string',0,0,1,1,1,1,'=','input','',1666543519,1666543611),(28,5,'comment','预约备注，留言','string',0,0,1,1,1,1,'=','input','',1666543519,1666543611),(29,5,'created_at','记录创建时间','datetime',0,0,1,1,1,1,'=','input','',1666543519,1666543611),(30,5,'updated_at','记录更新时间','datetime',0,0,1,1,1,1,'=','input','',1666543519,1666543611);

#
# Structure for table "sn_generate_table"
#

DROP TABLE IF EXISTS `sn_generate_table`;
CREATE TABLE `sn_generate_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `table_name` varchar(200) NOT NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(300) NOT NULL DEFAULT '' COMMENT '表描述',
  `template_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '模板类型 0-单表(curd) 1-树表(curd)',
  `author` varchar(100) DEFAULT '' COMMENT '作者',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `generate_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '生成方式  0-压缩包下载 1-生成到模块',
  `module_name` varchar(100) DEFAULT '' COMMENT '模块名',
  `class_dir` varchar(100) DEFAULT '' COMMENT '类目录名',
  `class_comment` varchar(100) DEFAULT '' COMMENT '类描述',
  `admin_id` int(11) DEFAULT '0' COMMENT '管理员id',
  `menu` text COMMENT '菜单配置',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成表信息表';

#
# Data for table "sn_generate_table"
#

INSERT INTO `sn_generate_table` VALUES (3,'sn_a_service_person','服务人员表',0,'','',1,'adminapi','','',1,'{\"pid\":\"121\",\"type\":\"1\",\"name\":\"\\u670d\\u52a1\\u4eba\\u5458\\u7ba1\\u7406\"}',1666343533,1666343966),(4,'sn_a_service_schedule_setting','服务人员排班',0,'','',0,'adminapi','','',1,'{\"pid\":\"0\",\"type\":\"0\",\"name\":\"\\u670d\\u52a1\\u653e\\u53f7\"}',1666375103,1666375175),(5,'sn_a_booking','预约表',0,'','',0,'adminapi','','',1,'{\"pid\":\"0\",\"type\":\"0\",\"name\":\"\\u9884\\u7ea6\\u8868\"}',1666543519,1666543611);

#
# Structure for table "sn_hot_search"
#

DROP TABLE IF EXISTS `sn_hot_search`;
CREATE TABLE `sn_hot_search` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '关键词',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='热门搜索表';

#
# Data for table "sn_hot_search"
#


#
# Structure for table "sn_jobs"
#

DROP TABLE IF EXISTS `sn_jobs`;
CREATE TABLE `sn_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) NOT NULL COMMENT '岗位名称',
  `code` varchar(64) NOT NULL COMMENT '岗位编码',
  `sort` int(11) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（0停用 1正常）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='岗位表';

#
# Data for table "sn_jobs"
#


#
# Structure for table "sn_notice_record"
#

DROP TABLE IF EXISTS `sn_notice_record`;
CREATE TABLE `sn_notice_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `scene_id` int(10) unsigned DEFAULT '0' COMMENT '场景',
  `read` tinyint(1) DEFAULT '0' COMMENT '已读状态;0-未读,1-已读',
  `recipient` tinyint(1) DEFAULT '0' COMMENT '通知接收对象类型;1-会员;2-商家;3-平台;4-游客(未注册用户)',
  `send_type` tinyint(1) DEFAULT '0' COMMENT '通知发送类型 1-系统通知 2-短信通知 3-微信模板 4-微信小程序',
  `notice_type` tinyint(1) DEFAULT NULL COMMENT '通知类型 1-业务通知 2-验证码',
  `extra` varchar(255) DEFAULT '' COMMENT '其他',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通知记录表';

#
# Data for table "sn_notice_record"
#


#
# Structure for table "sn_notice_setting"
#

DROP TABLE IF EXISTS `sn_notice_setting`;
CREATE TABLE `sn_notice_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scene_id` int(10) NOT NULL COMMENT '场景id',
  `scene_name` varchar(255) NOT NULL DEFAULT '' COMMENT '场景名称',
  `scene_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '场景描述',
  `recipient` tinyint(1) NOT NULL DEFAULT '1' COMMENT '接收者 1-用户 2-平台',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '通知类型: 1-业务通知 2-验证码',
  `system_notice` text COMMENT '系统通知设置',
  `sms_notice` text COMMENT '短信通知设置',
  `oa_notice` text COMMENT '公众号通知设置',
  `mnp_notice` text COMMENT '小程序通知设置',
  `support` char(10) NOT NULL DEFAULT '' COMMENT '支持的发送类型 1-系统通知 2-短信通知 3-微信模板消息 4-小程序提醒',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通知设置表';

#
# Data for table "sn_notice_setting"
#


#
# Structure for table "sn_official_account_reply"
#

DROP TABLE IF EXISTS `sn_official_account_reply`;
CREATE TABLE `sn_official_account_reply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '规则名称',
  `keyword` varchar(64) NOT NULL DEFAULT '' COMMENT '关键词',
  `reply_type` tinyint(1) NOT NULL COMMENT '回复类型 1-关注回复 2-关键字回复 3-默认回复',
  `matching_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '匹配方式：1-全匹配；2-模糊匹配',
  `content_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '内容类型：1-文本',
  `content` text NOT NULL COMMENT '回复内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '启动状态：1-启动；0-关闭',
  `sort` int(11) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='公众号消息回调表';

#
# Data for table "sn_official_account_reply"
#


#
# Structure for table "sn_operation_log"
#

DROP TABLE IF EXISTS `sn_operation_log`;
CREATE TABLE `sn_operation_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT '管理员ID',
  `admin_name` varchar(16) NOT NULL DEFAULT '' COMMENT '管理员名称',
  `account` varchar(16) NOT NULL DEFAULT '' COMMENT '管理员账号',
  `action` varchar(64) DEFAULT '' COMMENT '操作名称',
  `type` varchar(8) NOT NULL COMMENT '请求方式',
  `url` varchar(255) NOT NULL COMMENT '访问链接',
  `params` text COMMENT '请求数据',
  `result` text COMMENT '请求结果',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2535 DEFAULT CHARSET=utf8mb4 COMMENT='系统日志表';

#
# Structure for table "sn_sms_log"
#

DROP TABLE IF EXISTS `sn_sms_log`;
CREATE TABLE `sn_sms_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `scene_id` int(11) NOT NULL COMMENT '场景id',
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `content` varchar(255) NOT NULL COMMENT '发送内容',
  `code` varchar(32) DEFAULT NULL COMMENT '发送关键字（注册、找回密码）',
  `is_verify` tinyint(1) DEFAULT '0' COMMENT '是否已验证；0-否；1-是',
  `check_num` int(5) DEFAULT '0' COMMENT '验证次数',
  `send_status` tinyint(1) NOT NULL COMMENT '发送状态：0-发送中；1-发送成功；2-发送失败',
  `send_time` int(10) NOT NULL COMMENT '发送时间',
  `results` text COMMENT '短信结果',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='短信记录表';

#
# Data for table "sn_sms_log"
#


#
# Structure for table "sn_system_menu"
#

DROP TABLE IF EXISTS `sn_system_menu`;
CREATE TABLE `sn_system_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级菜单',
  `type` char(2) NOT NULL DEFAULT '' COMMENT '权限类型: M=目录，C=菜单，A=按钮',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '菜单排序',
  `perms` varchar(100) NOT NULL DEFAULT '' COMMENT '权限标识',
  `paths` varchar(100) NOT NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(200) NOT NULL DEFAULT '' COMMENT '前端组件',
  `selected` varchar(200) NOT NULL DEFAULT '' COMMENT '选中路径',
  `params` varchar(200) NOT NULL DEFAULT '' COMMENT '路由参数',
  `is_cache` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否缓存: 0=否, 1=是',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示: 0=否, 1=是',
  `is_disable` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用: 0=否, 1=是',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COMMENT='系统菜单表';

#
# Data for table "sn_system_menu"
#

INSERT INTO `sn_system_menu` VALUES (4,0,'M','权限管理','el-icon-Lock',400,'','permission','','','',0,1,0,1656664556,1664354975),(5,0,'C','工作台','el-icon-Monitor',1000,'workbench/index','workbench','workbench/index','','',0,0,1,1656664793,1668645505),(6,4,'C','菜单','el-icon-Operation',1,'auth.menu/lists','menu','permission/menu/index','','',1,1,0,1656664960,1658989504),(7,4,'C','管理员','local-icon-shouyiren',1,'auth.admin/lists','admin','permission/admin/index','','',0,1,0,1656901567,1664355515),(8,4,'C','角色','el-icon-Female',1,'auth.role/lists','role','permission/role/index','','',0,1,0,1656901660,1664355612),(12,8,'A','新增','',1,'auth.role/add','','','','',0,1,0,1657001790,1663750625),(14,8,'A','编辑','',1,'auth.role/edit','','','','',0,1,0,1657001924,1663750631),(15,8,'A','删除','',1,'auth.role/delete','','','','',0,1,0,1657001982,1663750637),(16,6,'A','新增','',1,'auth.menu/add','','','','',0,1,0,1657072523,1663750565),(17,6,'A','编辑','',1,'auth.menu/edit','','','','',0,1,0,1657073955,1663750570),(18,6,'A','删除','',1,'auth.menu/delete','','','','',0,1,0,1657073987,1663750578),(19,7,'A','新增','',1,'auth.admin/add','','','','',0,1,0,1657074035,1663750596),(20,7,'A','编辑','',1,'auth.admin/edit','','','','',0,1,0,1657074071,1663750603),(21,7,'A','删除','',1,'auth.admin/delete','','','','',0,1,0,1657074108,1663750609),(23,0,'M','开发工具','el-icon-EditPen',100,'','dev_tools','','','',0,1,0,1657097744,1664355057),(24,23,'C','代码生成器','el-icon-DocumentAdd',1,'tools.generator/generateTable','code','dev_tools/code/index','','',0,1,0,1657098110,1658989423),(25,0,'M','组织管理','el-icon-OfficeBuilding',500,'','organization','','','',0,1,0,1657099914,1664354956),(26,25,'C','部门管理','el-icon-Coordinate',1,'dept.dept/lists','department','organization/department/index','','',1,1,0,1657099989,1664353662),(27,25,'C','岗位管理','el-icon-PriceTag',1,'dept.jobs/lists','post','organization/post/index','','',0,1,0,1657100044,1658989726),(28,0,'M','系统设置','el-icon-Setting',200,'','setting','','','',0,1,0,1657100164,1664355035),(29,28,'M','网站设置','el-icon-Basketball',1,'','website','','','',0,1,0,1657100230,1658989861),(30,29,'C','网站信息','',1,'setting.web.web_setting/getWebsite','information','setting/website/information','','',0,1,0,1657100306,1657164412),(31,29,'C','网站备案','',1,'setting.web.web_setting/getCopyright','filing','setting/website/filing','','',0,1,0,1657100434,1657164723),(32,29,'C','政策协议','',1,'setting.web.web_setting/getAgreement','protocol','setting/website/protocol','','',0,1,0,1657100571,1657164770),(33,28,'C','存储设置','el-icon-FolderOpened',1,'setting.storage/lists','storage','setting/storage/index','','',0,1,0,1657160959,1658989894),(34,23,'C','字典管理','el-icon-Box',1,'setting.dict.dict_type/lists','dict','setting/dict/type/index','','',0,1,0,1657161211,1663225935),(35,28,'M','系统维护','el-icon-SetUp',1,'','system','','','',0,1,0,1657161569,1658989938),(36,35,'C','系统日志','',1,'setting.system.log/lists','journal','setting/system/journal','','',0,1,0,1657161696,1657165722),(37,35,'C','系统缓存','',1,'','cache','setting/system/cache','','',0,1,0,1657161896,1657173767),(38,35,'C','系统环境','',1,'setting.system.system/info','environment','setting/system/environment','','',0,1,0,1657162000,1657173794),(39,24,'A','导入数据表','',1,'tools.generator/selectTable','','','','',0,1,0,1657162736,1657162736),(40,24,'A','代码生成','',1,'tools.generator/generate','','','','',0,1,0,1657162806,1657162806),(41,23,'C','编辑数据表','',1,'tools.generator/edit','code/edit','dev_tools/code/edit','/dev_tools/code','',1,0,0,1657162866,1663748668),(42,24,'A','同步表结构','',1,'tools.generator/syncColumn','','','','',0,1,0,1657162934,1657162934),(43,24,'A','删除数据表','',1,'tools.generator/delete','','','','',0,1,0,1657163015,1657163015),(44,24,'A','预览代码','',1,'tools.generator/preview','','','','',0,1,0,1657163263,1657163263),(45,26,'A','新增','',1,'dept.dept/add','','','','',0,1,0,1657163548,1663750492),(46,26,'A','编辑','',1,'dept.dept/edit','','','','',0,1,0,1657163599,1663750498),(47,26,'A','删除','',1,'dept.dept/delete','','','','',0,1,0,1657163687,1663750504),(48,27,'A','新增','',1,'dept.jobs/add','','','','',0,1,0,1657163778,1663750524),(49,27,'A','编辑','',1,'dept.jobs/edit','','','','',0,1,0,1657163800,1663750530),(50,27,'A','删除','',1,'dept.jobs/delete','','','','',0,1,0,1657163820,1663750535),(51,30,'A','保存','',1,'setting.web.web_setting/setWebsite','','','','',0,1,0,1657164469,1663750649),(52,31,'A','保存','',1,'setting.web.web_setting/setCopyright','','','','',0,1,0,1657164692,1663750657),(53,32,'A','保存','',1,'setting.web.web_setting/setAgreement','','','','',0,1,0,1657164824,1663750665),(54,33,'A','设置','',1,'setting.storage/setup','','','','',0,1,0,1657165303,1663750673),(55,34,'A','新增','',1,'setting.dict.dict_type/add','','','','',0,1,0,1657166966,1663750783),(56,34,'A','编辑','',1,'setting.dict.dict_type/edit','','','','',0,1,0,1657166997,1663750789),(57,34,'A','删除','',1,'setting.dict.dict_type/delete','','','','',0,1,0,1657167038,1663750796),(58,62,'A','新增','',1,'setting.dict.dict_data/add','','','','',0,1,0,1657167317,1663750758),(59,62,'A','编辑','',1,'setting.dict.dict_data/edit','','','','',0,1,0,1657167371,1663750751),(60,62,'A','删除','',1,'setting.dict.dict_data/delete','','','','',0,1,0,1657167397,1663750768),(61,37,'A','清除系统缓存','',1,'setting.system.cache/clear','','','','',0,1,0,1657173837,1657173939),(62,23,'C','字典数据管理','',1,'setting.dict.dict_data/lists','dict/data','setting/dict/data/index','/dev_tools/dict','',1,0,0,1657174351,1663745617),(63,0,'M','素材管理','el-icon-Picture',300,'','material','','','',0,1,0,1657507133,1664355047),(64,63,'C','素材中心','el-icon-PictureRounded',0,'','index','material/index','','',0,1,0,1657507296,1664355653),(66,26,'A','详情','',0,'dept.dept/detail','','','','',0,1,0,1663725459,1663750516),(67,27,'A','详情','',0,'dept.jobs/detail','','','','',0,1,0,1663725514,1663750559),(68,6,'A','详情','',0,'auth.menu/detail','','','','',0,1,0,1663725564,1663750584),(69,7,'A','详情','',0,'auth.admin/detail','','','','',0,1,0,1663725623,1663750615),(70,0,'M','文章资讯','el-icon-ChatLineSquare',900,'','article','','','',0,1,0,1663749965,1664354597),(71,70,'C','文章管理','el-icon-ChatDotSquare',0,'article.article/lists','lists','article/lists/index','','',0,1,0,1663750101,1664354615),(72,70,'C','文章添加/编辑','',0,'article.article/add:edit','lists/edit','article/lists/edit','/article/lists','',0,0,0,1663750153,1664356275),(73,70,'C','文章栏目','el-icon-CollectionTag',0,'article.articleCate/lists','column','article/column/index','','',1,1,0,1663750287,1664354678),(74,71,'A','新增','',0,'article.article/add','','','','',0,1,0,1663750335,1663750335),(75,71,'A','详情','',0,'article.article/detail','','','','',0,1,0,1663750354,1663750383),(76,71,'A','删除','',0,'article.article/delete','','','','',0,1,0,1663750413,1663750413),(77,71,'A','修改状态','',0,'article.article/updateStatus','','','','',0,1,0,1663750442,1663750442),(78,73,'A','添加','',0,'article.articleCate/add','','','','',0,1,0,1663750483,1663750483),(79,73,'A','删除','',0,'article.articleCate/delete','','','','',0,1,0,1663750895,1663750895),(80,73,'A','详情','',0,'article.articleCate/detail','','','','',0,1,0,1663750913,1663750913),(81,73,'A','修改状态','',0,'article.articleCate/updateStatus','','','','',0,1,0,1663750936,1663750936),(82,0,'M','渠道设置','el-icon-Message',600,'','channel','','','',0,1,0,1663754084,1664354919),(83,82,'C','h5设置','el-icon-Cellphone',0,'channel.web_page_setting/getConfig','h5','channel/h5','','',0,1,0,1663754158,1663754158),(84,83,'A','保存','',0,'channel.web_page_setting/setConfig','','','','',0,1,0,1663754259,1663754259),(85,82,'M','微信公众号','local-icon-dingdan',0,'','wx_oa','','','',0,1,0,1663755470,1664355356),(86,85,'C','公众号配置','',0,'channel.official_account_setting/getConfig','config','channel/wx_oa/config','','',0,1,0,1663755663,1664355450),(87,85,'C','菜单管理','',0,'channel.official_account_menu/detail','menu','channel/wx_oa/menu','','',0,1,0,1663755767,1664355456),(88,86,'A','保存','',0,'channel.official_account_setting/setConfig','','','','',0,1,0,1663755799,1663755799),(89,86,'A','保存并发布','',0,'channel.official_account_menu/save','','','','',0,1,0,1663756490,1663756490),(90,85,'C','关注回复','',0,'channel.official_account_reply/lists','follow','channel/wx_oa/reply/follow_reply','','',0,1,0,1663818358,1663818366),(91,85,'C','关键字回复','',0,'','keyword','channel/wx_oa/reply/keyword_reply','','',0,1,0,1663818445,1663818445),(93,85,'C','默认回复','',0,'','default','channel/wx_oa/reply/default_reply','','',0,1,0,1663818580,1663818580),(94,82,'C','微信小程序','local-icon-weixin',0,'channel.mnp_settings/getConfig','weapp','channel/weapp','','',0,1,0,1663831396,1664355388),(95,94,'A','保存','',0,'channel.mnp_settings/setConfig','','','','',0,1,0,1663831436,1663831436),(96,0,'M','装修管理','el-icon-Brush',700,'','decoration','','','',0,1,0,1663834825,1664354863),(97,96,'C','页面装修','el-icon-CopyDocument',0,'decorate.page/detail','pages','decoration/pages/index','','',0,1,0,1663834879,1664355183),(98,97,'A','保存','',0,'decorate.page/save','','','','',0,1,0,1663834956,1663834956),(99,96,'C','底部导航','el-icon-Position',0,'decorate.tabbar/detail','tabbar','decoration/tabbar','','',0,1,0,1663835004,1664355253),(100,99,'A','保存','',0,'decorate.tabbar/save','','','','',0,1,0,1663835018,1663835018),(101,28,'M','消息管理','el-icon-ChatDotRound',0,'','message','','','',0,1,0,1663838602,1664355731),(102,101,'C','通知设置','',0,'notice.notice/settingLists','notice','message/notice/index','','',0,1,0,1663839195,1663839195),(103,102,'A','详情','',0,'notice.notice/detail','','','','',0,1,0,1663839537,1663839537),(104,101,'C','通知设置编辑','',0,'notice.notice/set','notice/edit','message/notice/edit','/message/notice','',0,0,0,1663839873,1663898477),(105,71,'A','编辑','',0,'article.article/edit','','','','',0,1,0,1663840043,1663840053),(106,71,'A','详情','',0,'article.article/detail','','','','',0,1,0,1663840284,1663840494),(107,101,'C','短信设置','',0,'notice.sms_config/getConfig','short_letter','message/short_letter/index','','',0,1,0,1663898591,1664355708),(108,107,'A','设置','',0,'notice.sms_config/setConfig','','','','',0,1,0,1663898644,1663898644),(109,107,'A','详情','',0,'notice.sms_config/detail','','','','',0,1,0,1663898661,1663898661),(110,28,'C','热门搜索','el-icon-Search',0,'setting.hot_search/getConfig','search','setting/search/index','','',0,1,0,1663901821,1664355779),(111,110,'A','保存','',0,'setting.hot_search/setConfig','','','','',0,1,0,1663901856,1663901856),(112,28,'M','用户设置','local-icon-keziyuyue',0,'','user','','','',0,1,0,1663903302,1664355695),(113,112,'C','用户设置','',0,'setting.user.user/getConfig','setup','setting/user/setup','','',0,1,0,1663903506,1663903506),(114,113,'A','保存','',0,'setting.user.user/setConfig','','','','',0,1,0,1663903522,1663903522),(115,112,'C','登录注册','',0,'setting.user.user/getRegisterConfig','login_register','setting/user/login_register','','',0,1,0,1663903832,1663903832),(116,115,'A','保存','',0,'setting.user.user/setRegisterConfig','','','','',0,1,0,1663903852,1663903852),(117,0,'M','用户管理','el-icon-User',800,'','consumer','','','',0,1,0,1663904351,1664354732),(118,117,'C','用户列表','local-icon-user_guanli',0,'user.user/lists','lists','consumer/lists/index','','',0,1,0,1663904392,1664355092),(119,117,'C','用户详情','',0,'user.user/detail','lists/detail','consumer/lists/detail','/consumer/lists','',0,0,0,1663904470,1663928109),(120,119,'A','编辑','',0,'user.user/edit','','','','',0,1,0,1663904499,1663904499),(121,0,'M','预约管理','local-icon-sort',920,'','booking','','','',0,1,0,1666341227,1666345827),(122,121,'C','服务人员','',1,'a_service_person/lists','a_service_person','booking/a_service_person/index','','',0,1,0,1666344389,1667143156),(123,122,'A','添加','',1,'a_service_person/add','','','','',0,1,0,1666344389,1666344389),(124,122,'A','编辑','',1,'a_service_person/edit','','','','',0,1,0,1666344389,1666344389),(125,122,'A','删除','',1,'a_service_person/delete','','','','',0,1,0,1666344389,1666344389),(126,121,'C','预约订单','',1,'a_booking/lists','booking/order','booking/booking_order/index','','',0,1,0,1667134967,1667134967),(127,121,'C','号源预览','',5,'a_service_ticket_related/lists','booking/availableTickets','booking/booking_order/availableTickets','','',0,1,0,1667242731,1667318947);

#
# Structure for table "sn_system_role"
#

DROP TABLE IF EXISTS `sn_system_role`;
CREATE TABLE `sn_system_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_code` varchar(255) DEFAULT NULL COMMENT '角色代号',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称',
  `desc` varchar(128) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '描述',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

#
# Data for table "sn_system_role"
#

INSERT INTO `sn_system_role` VALUES (1,'service_person_role','服务人员','为客户服务的人员',0,1666331631,1667319300,NULL),(2,NULL,'客户','享受服务的人员',0,1666331657,1666331657,NULL),(3,'business_admin_role','业务管理人员','负责日常业务管理',0,1666331719,1667221794,NULL),(4,'uuuu88','uuu','uuuu',0,1667221679,1667221744,1667221744);

#
# Structure for table "sn_system_role_menu"
#

DROP TABLE IF EXISTS `sn_system_role_menu`;
CREATE TABLE `sn_system_role_menu` (
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `menu_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色菜单关系表';

#
# Data for table "sn_system_role_menu"
#

INSERT INTO `sn_system_role_menu` VALUES (1,121),(1,122),(1,123),(1,124),(1,125),(1,126),(1,127);

#
# Structure for table "sn_user"
#

DROP TABLE IF EXISTS `sn_user`;
CREATE TABLE `sn_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sn` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '编号',
  `avatar` varchar(200) NOT NULL DEFAULT '' COMMENT '头像',
  `real_name` varchar(32) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `account` varchar(32) NOT NULL DEFAULT '' COMMENT '用户账号',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '用户密码',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '用户电话',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户性别: [1=男, 2=女]',
  `channel` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '注册渠道: [1-微信小程序 2-微信公众号 3-手机H5 4-电脑PC 5-苹果APP 6-安卓APP]',
  `is_disable` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用: [0=否, 1=是]',
  `login_ip` varchar(30) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `delete_time` int(10) unsigned DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `sn` (`sn`) USING BTREE COMMENT '编号唯一',
  UNIQUE KEY `account` (`account`) USING BTREE COMMENT '账号唯一'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

#
# Data for table "sn_user"
#

INSERT INTO `sn_user` VALUES (1,95033090,'resource/image/adminapi/default/avatar.png','王晓丽','用户95033090','client1','1aef1bc8879876f7122dc38faca724fe','',0,3,0,'127.0.0.1',1668649325,1666332936,1668649325,NULL);

#
# Structure for table "sn_user_auth"
#

DROP TABLE IF EXISTS `sn_user_auth`;
CREATE TABLE `sn_user_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `openid` varchar(128) NOT NULL COMMENT '微信openid',
  `unionid` varchar(128) DEFAULT '' COMMENT '微信unionid',
  `terminal` tinyint(1) NOT NULL DEFAULT '1' COMMENT '客户端类型：1-微信小程序；2-微信公众号；3-手机H5；4-电脑PC；5-苹果APP；6-安卓APP',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `openid` (`openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户授权表';

#
# Data for table "sn_user_auth"
#


#
# Structure for table "sn_user_session"
#

DROP TABLE IF EXISTS `sn_user_session`;
CREATE TABLE `sn_user_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `terminal` tinyint(1) NOT NULL DEFAULT '1' COMMENT '客户端类型：1-微信小程序；2-微信公众号；3-手机H5；4-电脑PC；5-苹果APP；6-安卓APP',
  `token` varchar(32) NOT NULL COMMENT '令牌',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `expire_time` int(10) NOT NULL COMMENT '到期时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `admin_id_client` (`user_id`,`terminal`) USING BTREE COMMENT '一个用户在一个终端只有一个token',
  UNIQUE KEY `token` (`token`) USING BTREE COMMENT 'token是唯一的'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户会话表';

#
# Data for table "sn_user_session"
#

INSERT INTO `sn_user_session` VALUES (1,1,3,'a3beef968606e0a636de39e79bf7ea0f',1668649325,1668678125),(2,1,2,'9c337389015fbe31a2d57e74ae040094',NULL,1667579108);

#
# Structure for table "sn_a_view_service_ticket_related"
#

DROP VIEW IF EXISTS `sn_a_view_service_ticket_related`;
CREATE VIEW `sn_a_view_service_ticket_related` AS 
  (select `ticket`.`service_schedule_setting_id` AS `service_schedule_setting_id`,`ticket`.`service_person_id` AS `service_person_id`,`ticket`.`service_time` AS `service_time`,if(`ticket`.`booking_minutes_delay`,`ticket`.`booking_minutes_delay`,0) AS `booking_minutes_delay`,if(`b`.`id`,`b`.`id`,NULL) AS `is_booked`,`b`.`booking_status` AS `booking_status` from (((select `s`.`service_person_id` AS `service_person_id`,`s`.`booking_minutes_delay` AS `booking_minutes_delay`,`r`.`service_time` AS `service_time`,`r`.`service_schedule_setting_id` AS `service_schedule_setting_id` from (`sn_a_service_ticket_related` `r` left join `sn_a_service_schedule_setting` `s` on((`r`.`service_schedule_setting_id` = `s`.`id`))))) `ticket` left join `sn_a_booking` `b` on(((`b`.`service_time` = `ticket`.`service_time`) and (`b`.`service_person_id` = `ticket`.`service_person_id`)))));
