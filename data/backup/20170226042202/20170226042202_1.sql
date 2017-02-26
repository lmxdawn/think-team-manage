-- ThinkCMF SQL Dump Program
-- 
-- DATE : 2017-02-26 04:22:04
-- Vol : 1
DROP TABLE IF EXISTS `lmx_auth_access`;
CREATE TABLE `lmx_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lmx_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('1','admin/Node/add','admin');
INSERT INTO lmx_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('1','admin/Node/index','admin');
INSERT INTO lmx_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/Backup/del_backup','admin');
INSERT INTO lmx_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/Backup/import','admin');
INSERT INTO lmx_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('1','admin/Node/default','admin');
INSERT INTO lmx_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('1','admin/Node/edit','admin');
INSERT INTO lmx_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('1','admin/Node/delete','admin');
INSERT INTO lmx_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/Backup/restore','admin');
INSERT INTO lmx_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/Backup/index','admin');
INSERT INTO lmx_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/Backup/default','admin');
INSERT INTO lmx_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/System/siteConfig','admin');
INSERT INTO lmx_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/System/updateSiteConfig','admin');
INSERT INTO lmx_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/Setting/default','admin');
INSERT INTO lmx_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/Backup/download','admin');
INSERT INTO lmx_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/Node/default','admin');
INSERT INTO lmx_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/Node/index','admin');
INSERT INTO lmx_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('2','admin/Node/add','admin');
DROP TABLE IF EXISTS `lmx_auth_rule`;
CREATE TABLE `lmx_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则编号',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `title` char(20) DEFAULT '' COMMENT '规则中文名称',
  `type` tinyint(1) DEFAULT '1' COMMENT '规则类型',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `condition` char(100) DEFAULT '' COMMENT '规则表达式，为空表示存在就验证，不为空表示按照条件验证',
  `listorder` int(10) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lmx_auth_rule ( `id`, `name`, `title`, `type`, `status`, `condition`, `listorder`, `create_time`, `update_time` ) VALUES  ('45','admin/Node/default','菜单管理','1','1','','0','1488007070','1488007070');
INSERT INTO lmx_auth_rule ( `id`, `name`, `title`, `type`, `status`, `condition`, `listorder`, `create_time`, `update_time` ) VALUES  ('46','admin/System/siteConfig','网站信息','1','1','','0','1488043079','1488043079');
INSERT INTO lmx_auth_rule ( `id`, `name`, `title`, `type`, `status`, `condition`, `listorder`, `create_time`, `update_time` ) VALUES  ('47','admin/System/updateSiteConfig','更新配置','1','1','','0','1488043231','1488043231');
INSERT INTO lmx_auth_rule ( `id`, `name`, `title`, `type`, `status`, `condition`, `listorder`, `create_time`, `update_time` ) VALUES  ('48','admin/Backup/default','备份管理','1','1','','0','1488044935','1488044935');
INSERT INTO lmx_auth_rule ( `id`, `name`, `title`, `type`, `status`, `condition`, `listorder`, `create_time`, `update_time` ) VALUES  ('31','admin/Node/index','后台菜单','1','1','','0','1487789220','1487950594');
INSERT INTO lmx_auth_rule ( `id`, `name`, `title`, `type`, `status`, `condition`, `listorder`, `create_time`, `update_time` ) VALUES  ('32','admin/Node/add','添加菜单','1','1','','0','1487789234','1487789234');
INSERT INTO lmx_auth_rule ( `id`, `name`, `title`, `type`, `status`, `condition`, `listorder`, `create_time`, `update_time` ) VALUES  ('33','admin/Node/delete','删除菜单','1','1','','0','1487789246','1487789246');
INSERT INTO lmx_auth_rule ( `id`, `name`, `title`, `type`, `status`, `condition`, `listorder`, `create_time`, `update_time` ) VALUES  ('34','admin/Node/edit','编辑菜单','1','1','','0','1487789255','1487789255');
INSERT INTO lmx_auth_rule ( `id`, `name`, `title`, `type`, `status`, `condition`, `listorder`, `create_time`, `update_time` ) VALUES  ('35','admin/Setting/default','设置','1','1','','0','1487951321','1487951321');
INSERT INTO lmx_auth_rule ( `id`, `name`, `title`, `type`, `status`, `condition`, `listorder`, `create_time`, `update_time` ) VALUES  ('36','admin/Users/default','用户组','1','1','','0','1487951847','1487999511');
INSERT INTO lmx_auth_rule ( `id`, `name`, `title`, `type`, `status`, `condition`, `listorder`, `create_time`, `update_time` ) VALUES  ('37','admin/Users/index','本站用户','1','1','','0','1487954667','1487999501');
INSERT INTO lmx_auth_rule ( `id`, `name`, `title`, `type`, `status`, `condition`, `listorder`, `create_time`, `update_time` ) VALUES  ('38','admin/Admin/default','管理组','1','1','','0','1487954732','1487954732');
INSERT INTO lmx_auth_rule ( `id`, `name`, `title`, `type`, `status`, `condition`, `listorder`, `create_time`, `update_time` ) VALUES  ('39','admin/Admin/index','管理员','1','1','','0','1487957700','1487999532');
INSERT INTO lmx_auth_rule ( `id`, `name`, `title`, `type`, `status`, `condition`, `listorder`, `create_time`, `update_time` ) VALUES  ('40','admin/Admin/add','添加管理员','1','1','','0','1487966778','1487966778');
INSERT INTO lmx_auth_rule ( `id`, `name`, `title`, `type`, `status`, `condition`, `listorder`, `create_time`, `update_time` ) VALUES  ('41','admin/Admin/edit','编辑管理员','1','1','','0','1487966821','1487966821');
INSERT INTO lmx_auth_rule ( `id`, `name`, `title`, `type`, `status`, `condition`, `listorder`, `create_time`, `update_time` ) VALUES  ('42','admin/Admin/delete','删除管理员','1','1','','0','1487966874','1487966874');
INSERT INTO lmx_auth_rule ( `id`, `name`, `title`, `type`, `status`, `condition`, `listorder`, `create_time`, `update_time` ) VALUES  ('43','admin/Role/index','角色管理','1','1','','0','1487997838','1487997838');
INSERT INTO lmx_auth_rule ( `id`, `name`, `title`, `type`, `status`, `condition`, `listorder`, `create_time`, `update_time` ) VALUES  ('44','admin/Rbac/index','角色管理','1','1','','0','1487998167','1487999640');
INSERT INTO lmx_auth_rule ( `id`, `name`, `title`, `type`, `status`, `condition`, `listorder`, `create_time`, `update_time` ) VALUES  ('49','admin/Backup/index','数据备份','1','1','','0','1488044981','1488044981');
INSERT INTO lmx_auth_rule ( `id`, `name`, `title`, `type`, `status`, `condition`, `listorder`, `create_time`, `update_time` ) VALUES  ('50','admin/Backup/restore','数据列表','1','1','','0','1488045030','1488052426');
INSERT INTO lmx_auth_rule ( `id`, `name`, `title`, `type`, `status`, `condition`, `listorder`, `create_time`, `update_time` ) VALUES  ('51','admin/Backup/import','数据恢复','1','1','','0','1488052552','1488052552');
INSERT INTO lmx_auth_rule ( `id`, `name`, `title`, `type`, `status`, `condition`, `listorder`, `create_time`, `update_time` ) VALUES  ('52','admin/Backup/del_backup','数据删除','1','1','','0','1488052594','1488052594');
INSERT INTO lmx_auth_rule ( `id`, `name`, `title`, `type`, `status`, `condition`, `listorder`, `create_time`, `update_time` ) VALUES  ('53','admin/Backup/download','数据下载','1','1','','0','1488052624','1488052624');
DROP TABLE IF EXISTS `lmx_menu`;
CREATE TABLE `lmx_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `parent_id` smallint(6) unsigned DEFAULT '0' COMMENT '父级ID',
  `parent_name` varchar(50) DEFAULT NULL COMMENT '父级菜单名称',
  `app` char(20) DEFAULT NULL COMMENT '应用名称',
  `model` char(20) DEFAULT NULL COMMENT '控制器',
  `action` char(20) DEFAULT NULL COMMENT '操作名称',
  `param` char(50) DEFAULT NULL COMMENT 'url参数',
  `type` tinyint(1) DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `title` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `nav_id` int(11) DEFAULT '0' COMMENT 'nav ID ',
  `is_update` tinyint(1) DEFAULT '0' COMMENT '是否自动刷新',
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE,
  KEY `model` (`model`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('66','0','顶级','admin','Node','default','','1','1','菜单管理','fa-list','','1','1487778496','1488007070','0','0');
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('67','66','菜单管理','admin','Node','index','','1','1','后台菜单','fa-circle-o','','2','1487779790','1487950594','0','0');
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('68','67','后台菜单','admin','Node','add','','1','0','添加菜单','fa-circle-o','','3','1487779957','1487789234','0','0');
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('69','67','后台菜单','admin','Node','edit','','1','0','编辑菜单','fa-circle-o','','4','1487780038','1487789255','0','0');
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('70','67','后台菜单','admin','Node','delete','','1','0','删除菜单','fa-circle-o','','5','1487780088','1487789246','0','0');
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('71','0','顶级','admin','Setting','default','','1','1','设置','fa-cogs','','0','1487951321','1487951321','0','0');
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('72','0','顶级','admin','Users','default','','1','1','用户管理','fa-group','','0','1487951847','1487952237','0','0');
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('73','72','用户管理','admin','Users','default','','1','1','用户组','fa-circle-o','','1','1487954607','1487999511','0','0');
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('74','73','用户组','admin','Users','index','','1','1','本站用户','fa-user-o','','1','1487954667','1487999501','0','0');
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('75','72','用户管理','admin','Admin','default','','1','1','管理组','fa-circle-o','','2','1487954732','1487954732','0','0');
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('76','75','管理组','admin','Admin','index','','1','1','管理员','fa-user-circle-o','','2','1487957700','1487999532','0','0');
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('77','76','管理员','admin','Admin','add','','1','0','添加管理员','fa-circle-o','','1','1487966778','1487966778','0','0');
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('78','76','管理员','admin','Admin','edit','','1','0','编辑管理员','fa-circle-o','','2','1487966821','1487966821','0','0');
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('79','76','管理员','admin','Admin','delete','','1','0','删除管理员','fa-circle-o','','3','1487966874','1487966874','0','0');
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('80','75','管理组','admin','Rbac','index','','1','1','角色管理','fa-venus-mars','','1','1487997838','1487999640','0','0');
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('81','71','设置','admin','User','default','','0','1','个人信息','fa-circle-o','','1','1488042992','1488043017','0','0');
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('82','71','设置','admin','System','siteConfig','','1','1','网站信息','fa-circle-o','','2','1488043079','1488043079','0','0');
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('83','82','网站信息','admin','System','updateSiteConfig','','1','0','更新配置','fa-circle-o','','1','1488043231','1488043231','0','0');
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('84','71','设置','admin','Backup','default','','1','1','备份管理','fa-circle-o','','3','1488044935','1488044935','0','0');
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('85','84','备份管理','admin','Backup','index','','1','1','数据备份','fa-circle-o','','1','1488044981','1488044981','0','0');
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('86','84','备份管理','admin','Backup','restore','','1','1','数据列表','fa-circle-o','','2','1488045030','1488052426','0','0');
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('87','84','备份管理','admin','Backup','import','','1','0','数据恢复','fa-circle-o','','3','1488052552','1488052552','0','0');
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('88','84','备份管理','admin','Backup','del_backup','','1','0','数据删除','fa-circle-o','','4','1488052594','1488052594','0','0');
INSERT INTO lmx_menu ( `id`, `parent_id`, `parent_name`, `app`, `model`, `action`, `param`, `type`, `status`, `title`, `icon`, `remark`, `listorder`, `create_time`, `update_time`, `nav_id`, `is_update` ) VALUES  ('89','84','备份管理','admin','Backup','download','','1','0','数据下载','fa-circle-o','','5','1488052624','1488052624','0','0');
DROP TABLE IF EXISTS `lmx_options`;
CREATE TABLE `lmx_options` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '配置名',
  `value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`name`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lmx_options ( `id`, `name`, `value`, `autoload` ) VALUES  ('7','site_config','a:7:{s:10:\"site_title\";s:5:\"lkjlj\";s:9:\"seo_title\";s:0:\"\";s:11:\"seo_keyword\";s:0:\"\";s:15:\"seo_description\";s:0:\"\";s:14:\"site_copyright\";s:0:\"\";s:8:\"site_icp\";s:0:\"\";s:11:\"site_tongji\";s:0:\"\";}','1');
DROP TABLE IF EXISTS `lmx_role`;
CREATE TABLE `lmx_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lmx_role ( `id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder` ) VALUES  ('1','超级管理员','0','1','拥有网站最高管理员权限！','1329633709','1329633709','0');
INSERT INTO lmx_role ( `id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder` ) VALUES  ('2','普通管理','0','1','测试','0','0','0');
DROP TABLE IF EXISTS `lmx_role_user`;
CREATE TABLE `lmx_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lmx_role_user ( `role_id`, `user_id` ) VALUES  ('1','3');
INSERT INTO lmx_role_user ( `role_id`, `user_id` ) VALUES  ('3','3');
INSERT INTO lmx_role_user ( `role_id`, `user_id` ) VALUES  ('2','5');
INSERT INTO lmx_role_user ( `role_id`, `user_id` ) VALUES  ('2','2');
DROP TABLE IF EXISTS `lmx_users`;
CREATE TABLE `lmx_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT '2000-01-01' COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除日期',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_name`),
  KEY `user_nicename` (`user_nicename`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lmx_users ( `id`, `user_name`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile`, `delete_time` ) VALUES  ('2','admin','c3284d0f94606de1fd2af172aba15bf3','admin','lmxdawn@gmail.com','kk','','0','2000-01-01','','127.0.0.1','1488042286','1487868050','','1','0','1','0','','');
INSERT INTO lmx_users ( `id`, `user_name`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile`, `delete_time` ) VALUES  ('5','demo','6c5ac7b4d3bd3311f033f971196cfa75','demo','862253272@qq.com','','','0','2000-01-01','','127.0.0.1','1488043526','1487966028','','1','0','1','0','','');
INSERT INTO lmx_users ( `id`, `user_name`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile`, `delete_time` ) VALUES  ('6','demo1','655e9d2a52f932bdde5ba3e0c544a6b9','demo1','','','','0','2000-01-01','','','0','1487966314','','1','0','1','0','','');
