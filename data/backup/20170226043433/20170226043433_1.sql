-- ThinkCMF SQL Dump Program
-- 
-- DATE : 2017-02-26 04:35:27
-- Vol : 1
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
