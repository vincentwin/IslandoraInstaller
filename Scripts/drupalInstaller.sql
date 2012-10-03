-- MySQL dump 10.13  Distrib 5.5.16, for Win64 (x86)
--
-- Host: localhost    Database: drupalInstaller
-- ------------------------------------------------------
-- Server version	5.5.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `mask` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `aid` varchar(255) NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  `callback` varchar(255) NOT NULL DEFAULT '',
  `parameters` longtext NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES ('comment_publish_action','comment','comment_publish_action','','Publish comment'),('comment_unpublish_action','comment','comment_unpublish_action','','Unpublish comment'),('node_make_sticky_action','node','node_make_sticky_action','','Make post sticky'),('node_make_unsticky_action','node','node_make_unsticky_action','','Make post unsticky'),('node_promote_action','node','node_promote_action','','Promote post to front page'),('node_publish_action','node','node_publish_action','','Publish post'),('node_save_action','node','node_save_action','','Save post'),('node_unpromote_action','node','node_unpromote_action','','Remove post from front page'),('node_unpublish_action','node','node_unpublish_action','','Unpublish post'),('user_block_ip_action','user','user_block_ip_action','','Ban IP address of current user'),('user_block_user_action','user','user_block_user_action','','Block current user');
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions_aid`
--

DROP TABLE IF EXISTS `actions_aid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions_aid` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions_aid`
--

LOCK TABLES `actions_aid` WRITE;
/*!40000 ALTER TABLE `actions_aid` DISABLE KEYS */;
/*!40000 ALTER TABLE `actions_aid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authmap`
--

DROP TABLE IF EXISTS `authmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authmap` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `authname` varchar(128) NOT NULL DEFAULT '',
  `module` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `authname` (`authname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authmap`
--

LOCK TABLES `authmap` WRITE;
/*!40000 ALTER TABLE `authmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `authmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(64) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `batch` longtext,
  PRIMARY KEY (`bid`),
  KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch`
--

LOCK TABLES `batch` WRITE;
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocks` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) NOT NULL DEFAULT '',
  `delta` varchar(32) NOT NULL DEFAULT '0',
  `theme` varchar(64) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  `region` varchar(64) NOT NULL DEFAULT '',
  `custom` tinyint(4) NOT NULL DEFAULT '0',
  `throttle` tinyint(4) NOT NULL DEFAULT '0',
  `visibility` tinyint(4) NOT NULL DEFAULT '0',
  `pages` text NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT '',
  `cache` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `tmd` (`theme`,`module`,`delta`),
  KEY `list` (`theme`,`status`,`region`,`weight`,`module`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks`
--

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
INSERT INTO `blocks` VALUES (1,'user','0','garland',1,0,'left',0,0,0,'','',-1),(2,'user','1','garland',1,0,'left',0,0,0,'','',-1),(3,'system','0','garland',1,10,'footer',0,0,0,'','',-1),(4,'comment','0','garland',0,0,'',0,0,0,'','',1),(5,'menu','primary-links','garland',0,0,'',0,0,0,'','',-1),(6,'menu','secondary-links','garland',0,0,'',0,0,0,'','',-1),(7,'node','0','garland',0,0,'',0,0,0,'','',-1),(8,'user','2','garland',0,0,'',0,0,0,'','',1),(9,'user','3','garland',0,0,'',0,0,0,'','',-1),(10,'islandora_solr_search','extended_advanced','garland',0,0,'',0,0,0,'','',-1),(11,'islandora_solr_search','advanced','garland',0,0,'',0,0,0,'','',-1),(12,'islandora_solr_search','simple','garland',0,0,'',0,0,0,'','',-1),(13,'islandora_solr_search','basic_facets','garland',0,0,'',0,0,0,'','',-1),(14,'islandora_solr_search','current_query','garland',0,0,'',0,0,0,'','',-1),(15,'islandora_solr_search','display_switch','garland',0,0,'',0,0,0,'','',-1);
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocks_roles`
--

DROP TABLE IF EXISTS `blocks_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocks_roles` (
  `module` varchar(64) NOT NULL,
  `delta` varchar(32) NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`module`,`delta`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks_roles`
--

LOCK TABLES `blocks_roles` WRITE;
/*!40000 ALTER TABLE `blocks_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `blocks_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boxes`
--

DROP TABLE IF EXISTS `boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boxes` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `body` longtext,
  `info` varchar(128) NOT NULL DEFAULT '',
  `format` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `info` (`info`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boxes`
--

LOCK TABLES `boxes` WRITE;
/*!40000 ALTER TABLE `boxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `cache_menu`
--

DROP TABLE IF EXISTS `cache_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_menu` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_page`
--

DROP TABLE IF EXISTS `cache_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_page` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_update`
--

DROP TABLE IF EXISTS `cache_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_update` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_form`
--

DROP TABLE IF EXISTS `cache_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_form` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_filter`
--

DROP TABLE IF EXISTS `cache_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_filter` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_block`
--

DROP TABLE IF EXISTS `cache_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_block` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `nid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(64) NOT NULL DEFAULT '',
  `comment` longtext NOT NULL,
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `format` smallint(6) NOT NULL DEFAULT '0',
  `thread` varchar(255) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `mail` varchar(64) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `pid` (`pid`),
  KEY `nid` (`nid`),
  KEY `comment_uid` (`uid`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `filemime` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_formats`
--

DROP TABLE IF EXISTS `filter_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_formats` (
  `format` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `roles` varchar(255) NOT NULL DEFAULT '',
  `cache` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`format`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_formats`
--

LOCK TABLES `filter_formats` WRITE;
/*!40000 ALTER TABLE `filter_formats` DISABLE KEYS */;
INSERT INTO `filter_formats` VALUES (1,'Filtered HTML',',1,2,',1),(2,'Full HTML','',1);
/*!40000 ALTER TABLE `filter_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filters`
--

DROP TABLE IF EXISTS `filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filters` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `format` int(11) NOT NULL DEFAULT '0',
  `module` varchar(64) NOT NULL DEFAULT '',
  `delta` tinyint(4) NOT NULL DEFAULT '0',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `fmd` (`format`,`module`,`delta`),
  KEY `list` (`format`,`weight`,`module`,`delta`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,'filter',2,0),(2,1,'filter',0,1),(3,1,'filter',1,2),(4,1,'filter',3,10),(5,2,'filter',2,0),(6,2,'filter',1,1),(7,2,'filter',3,10);
/*!40000 ALTER TABLE `filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flood`
--

DROP TABLE IF EXISTS `flood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flood` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(64) NOT NULL DEFAULT '',
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  KEY `allow` (`event`,`hostname`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flood`
--

LOCK TABLES `flood` WRITE;
/*!40000 ALTER TABLE `flood` DISABLE KEYS */;
/*!40000 ALTER TABLE `flood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `nid` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `islandora_content_model_forms`
--

DROP TABLE IF EXISTS `islandora_content_model_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `islandora_content_model_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_model` varchar(128) DEFAULT NULL,
  `form_name` varchar(128) DEFAULT NULL,
  `dsid` varchar(128) DEFAULT NULL,
  `title_field` varchar(128) DEFAULT NULL,
  `transform` varchar(128) DEFAULT NULL,
  `template` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `islandora_content_model_forms`
--

LOCK TABLES `islandora_content_model_forms` WRITE;
/*!40000 ALTER TABLE `islandora_content_model_forms` DISABLE KEYS */;
INSERT INTO `islandora_content_model_forms` VALUES (1,'islandora:sp_basic_image','Islandora Image MODS Form','MODS','[\'titleInfo\'][\'title\']','mods_to_dc.xsl',NULL),(2,'islandora:bookCModel','Islandora Books MODS Form','MODS','[\'titleInfo\'][\'title\']','mods_to_dc.xsl',NULL),(3,'islandora:iaBookCModel','Islandora Books MODS Form','MODS','[\'titleInfo\'][\'title\']','mods_to_dc.xsl',NULL),(4,'islandora:sp_large_image_cmodel','Islandora Large Image MODS Form','MODS','[\'titleInfo\'][\'title\']','mods_to_dc.xsl',NULL),(5,'islandora:sp_strict_pdf','Islandora PDF MODS Form','MODS','[\'titleInfo\'][\'title\']','mods_to_dc.xsl',NULL);
/*!40000 ALTER TABLE `islandora_content_model_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_custom`
--

DROP TABLE IF EXISTS `menu_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_custom` (
  `menu_name` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  PRIMARY KEY (`menu_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_custom`
--

LOCK TABLES `menu_custom` WRITE;
/*!40000 ALTER TABLE `menu_custom` DISABLE KEYS */;
INSERT INTO `menu_custom` VALUES ('navigation','Navigation','The navigation menu is provided by Drupal and is the main interactive menu for any site. It is usually the only menu that contains personalized links for authenticated users, and is often not even visible to anonymous users.'),('primary-links','Primary links','Primary links are often used at the theme layer to show the major sections of a site. A typical representation for primary links would be tabs along the top.'),('secondary-links','Secondary links','Secondary links are often used for pages like legal notices, contact details, and other secondary navigation items that play a lesser role than primary links');
/*!40000 ALTER TABLE `menu_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_links`
--

DROP TABLE IF EXISTS `menu_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_links` (
  `menu_name` varchar(32) NOT NULL DEFAULT '',
  `mlid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plid` int(10) unsigned NOT NULL DEFAULT '0',
  `link_path` varchar(255) NOT NULL DEFAULT '',
  `router_path` varchar(255) NOT NULL DEFAULT '',
  `link_title` varchar(255) NOT NULL DEFAULT '',
  `options` text,
  `module` varchar(255) NOT NULL DEFAULT 'system',
  `hidden` smallint(6) NOT NULL DEFAULT '0',
  `external` smallint(6) NOT NULL DEFAULT '0',
  `has_children` smallint(6) NOT NULL DEFAULT '0',
  `expanded` smallint(6) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `depth` smallint(6) NOT NULL DEFAULT '0',
  `customized` smallint(6) NOT NULL DEFAULT '0',
  `p1` int(10) unsigned NOT NULL DEFAULT '0',
  `p2` int(10) unsigned NOT NULL DEFAULT '0',
  `p3` int(10) unsigned NOT NULL DEFAULT '0',
  `p4` int(10) unsigned NOT NULL DEFAULT '0',
  `p5` int(10) unsigned NOT NULL DEFAULT '0',
  `p6` int(10) unsigned NOT NULL DEFAULT '0',
  `p7` int(10) unsigned NOT NULL DEFAULT '0',
  `p8` int(10) unsigned NOT NULL DEFAULT '0',
  `p9` int(10) unsigned NOT NULL DEFAULT '0',
  `updated` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mlid`),
  KEY `path_menu` (`link_path`(128),`menu_name`),
  KEY `menu_plid_expand_child` (`menu_name`,`plid`,`expanded`,`has_children`),
  KEY `menu_parents` (`menu_name`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p8`,`p9`),
  KEY `router_path` (`router_path`(128))
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_links`
--

LOCK TABLES `menu_links` WRITE;
/*!40000 ALTER TABLE `menu_links` DISABLE KEYS */;
INSERT INTO `menu_links` VALUES ('navigation',1,0,'batch','batch','','a:0:{}','system',-1,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0),('navigation',2,0,'admin','admin','Administer','a:0:{}','system',0,0,1,0,9,1,0,2,0,0,0,0,0,0,0,0,0),('navigation',3,0,'node','node','Content','a:0:{}','system',-1,0,0,0,0,1,0,3,0,0,0,0,0,0,0,0,0),('navigation',4,0,'logout','logout','Log out','a:0:{}','system',0,0,0,0,10,1,0,4,0,0,0,0,0,0,0,0,0),('navigation',5,0,'rss.xml','rss.xml','RSS feed','a:0:{}','system',-1,0,0,0,0,1,0,5,0,0,0,0,0,0,0,0,0),('navigation',6,0,'user','user','User account','a:0:{}','system',-1,0,0,0,0,1,0,6,0,0,0,0,0,0,0,0,0),('navigation',7,0,'node/%','node/%','','a:0:{}','system',-1,0,0,0,0,1,0,7,0,0,0,0,0,0,0,0,0),('navigation',8,2,'admin/compact','admin/compact','Compact mode','a:0:{}','system',-1,0,0,0,0,2,0,2,8,0,0,0,0,0,0,0,0),('navigation',9,0,'filter/tips','filter/tips','Compose tips','a:0:{}','system',1,0,0,0,0,1,0,9,0,0,0,0,0,0,0,0,0),('navigation',10,2,'admin/content','admin/content','Content management','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:27:\"Manage your site\'s content.\";}}','system',0,0,1,0,-10,2,0,2,10,0,0,0,0,0,0,0,0),('navigation',11,0,'node/add','node/add','Create content','a:0:{}','system',0,0,1,0,1,1,0,11,0,0,0,0,0,0,0,0,0),('navigation',12,0,'comment/delete','comment/delete','Delete comment','a:0:{}','system',-1,0,0,0,0,1,0,12,0,0,0,0,0,0,0,0,0),('navigation',13,0,'comment/edit','comment/edit','Edit comment','a:0:{}','system',-1,0,0,0,0,1,0,13,0,0,0,0,0,0,0,0,0),('navigation',14,0,'system/files','system/files','File download','a:0:{}','system',-1,0,0,0,0,1,0,14,0,0,0,0,0,0,0,0,0),('navigation',15,2,'admin/help','admin/help','Help','a:0:{}','system',0,0,0,0,9,2,0,2,15,0,0,0,0,0,0,0,0),('navigation',16,2,'admin/reports','admin/reports','Reports','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:59:\"View reports from system logs and other status information.\";}}','system',0,0,1,0,5,2,0,2,16,0,0,0,0,0,0,0,0),('navigation',17,2,'admin/build','admin/build','Site building','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:38:\"Control how your site looks and feels.\";}}','system',0,0,1,0,-10,2,0,2,17,0,0,0,0,0,0,0,0),('navigation',18,2,'admin/settings','admin/settings','Site configuration','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:40:\"Adjust basic site configuration options.\";}}','system',0,0,1,0,-5,2,0,2,18,0,0,0,0,0,0,0,0),('navigation',19,0,'user/autocomplete','user/autocomplete','User autocomplete','a:0:{}','system',-1,0,0,0,0,1,0,19,0,0,0,0,0,0,0,0,0),('navigation',20,2,'admin/user','admin/user','User management','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:61:\"Manage your site\'s users, groups and access to site features.\";}}','system',0,0,1,0,0,2,0,2,20,0,0,0,0,0,0,0,0),('navigation',21,0,'user/%','user/%','My account','a:0:{}','system',0,0,0,0,0,1,0,21,0,0,0,0,0,0,0,0,0),('navigation',22,20,'admin/user/rules','admin/user/rules','Access rules','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:80:\"List and create rules to disallow usernames, e-mail addresses, and IP addresses.\";}}','system',0,0,0,0,0,3,0,2,20,22,0,0,0,0,0,0,0),('navigation',23,18,'admin/settings/actions','admin/settings/actions','Actions','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:41:\"Manage the actions defined for your site.\";}}','system',0,0,0,0,0,3,0,2,18,23,0,0,0,0,0,0,0),('navigation',24,18,'admin/settings/admin','admin/settings/admin','Administration theme','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:55:\"Settings for how your administrative pages should look.\";}}','system',0,0,0,0,0,3,0,2,18,24,0,0,0,0,0,0,0),('navigation',25,17,'admin/build/block','admin/build/block','Blocks','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:79:\"Configure what block content appears in your site\'s sidebars and other regions.\";}}','system',0,0,0,0,0,3,0,2,17,25,0,0,0,0,0,0,0),('navigation',26,18,'admin/settings/clean-urls','admin/settings/clean-urls','Clean URLs','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:43:\"Enable or disable clean URLs for your site.\";}}','system',0,0,0,0,0,3,0,2,18,26,0,0,0,0,0,0,0),('navigation',27,10,'admin/content/comment','admin/content/comment','Comments','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:61:\"List and edit site comments and the comment moderation queue.\";}}','system',0,0,0,0,0,3,0,2,10,27,0,0,0,0,0,0,0),('navigation',28,10,'admin/content/node','admin/content/node','Content','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:43:\"View, edit, and delete your site\'s content.\";}}','system',0,0,0,0,0,3,0,2,10,28,0,0,0,0,0,0,0),('navigation',29,10,'admin/content/types','admin/content/types','Content types','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:82:\"Manage posts by content type, including default status, front page promotion, etc.\";}}','system',0,0,0,0,0,3,0,2,10,29,0,0,0,0,0,0,0),('navigation',30,18,'admin/settings/date-time','admin/settings/date-time','Date and time','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:89:\"Settings for how Drupal displays date and time, as well as the system\'s default timezone.\";}}','system',0,0,0,0,0,3,0,2,18,30,0,0,0,0,0,0,0),('navigation',31,0,'node/%/delete','node/%/delete','Delete','a:0:{}','system',-1,0,0,0,1,1,0,31,0,0,0,0,0,0,0,0,0),('navigation',32,21,'user/%/delete','user/%/delete','Delete','a:0:{}','system',-1,0,0,0,0,2,0,21,32,0,0,0,0,0,0,0,0),('navigation',33,18,'admin/settings/error-reporting','admin/settings/error-reporting','Error reporting','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:93:\"Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.\";}}','system',0,0,0,0,0,3,0,2,18,33,0,0,0,0,0,0,0),('navigation',34,18,'admin/settings/file-system','admin/settings/file-system','File system','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:68:\"Tell Drupal where to store uploaded files and how they are accessed.\";}}','system',0,0,0,0,0,3,0,2,18,34,0,0,0,0,0,0,0),('navigation',35,18,'admin/settings/image-toolkit','admin/settings/image-toolkit','Image toolkit','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:74:\"Choose which image toolkit to use if you have installed optional toolkits.\";}}','system',0,0,0,0,0,3,0,2,18,35,0,0,0,0,0,0,0),('navigation',36,18,'admin/settings/filters','admin/settings/filters','Input formats','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:127:\"Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.\";}}','system',0,0,0,0,0,3,0,2,18,36,0,0,0,0,0,0,0),('navigation',37,18,'admin/settings/logging','admin/settings/logging','Logging and alerts','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:156:\"Settings for logging and alerts modules. Various modules can route Drupal\'s system events to different destination, such as syslog, database, email, ...etc.\";}}','system',0,0,1,0,0,3,0,2,18,37,0,0,0,0,0,0,0),('navigation',38,17,'admin/build/menu','admin/build/menu','Menus','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:116:\"Control your site\'s navigation menu, primary links and secondary links, as well as rename and reorganize menu items.\";}}','system',0,0,1,0,0,3,0,2,17,38,0,0,0,0,0,0,0),('navigation',39,17,'admin/build/modules','admin/build/modules','Modules','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:47:\"Enable or disable add-on modules for your site.\";}}','system',0,0,0,0,0,3,0,2,17,39,0,0,0,0,0,0,0),('navigation',40,18,'admin/settings/performance','admin/settings/performance','Performance','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:101:\"Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.\";}}','system',0,0,0,0,0,3,0,2,18,40,0,0,0,0,0,0,0),('navigation',41,20,'admin/user/permissions','admin/user/permissions','Permissions','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:64:\"Determine access to features by selecting permissions for roles.\";}}','system',0,0,0,0,0,3,0,2,20,41,0,0,0,0,0,0,0),('navigation',42,10,'admin/content/node-settings','admin/content/node-settings','Post settings','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:126:\"Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.\";}}','system',0,0,0,0,0,3,0,2,10,42,0,0,0,0,0,0,0),('navigation',43,10,'admin/content/rss-publishing','admin/content/rss-publishing','RSS publishing','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:92:\"Configure the number of items per feed and whether feeds should be titles/teasers/full-text.\";}}','system',0,0,0,0,0,3,0,2,10,43,0,0,0,0,0,0,0),('navigation',44,0,'comment/reply/%','comment/reply/%','Reply to comment','a:0:{}','system',-1,0,0,0,0,1,0,44,0,0,0,0,0,0,0,0,0),('navigation',45,20,'admin/user/roles','admin/user/roles','Roles','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:30:\"List, edit, or add user roles.\";}}','system',0,0,0,0,0,3,0,2,20,45,0,0,0,0,0,0,0),('navigation',46,18,'admin/settings/site-information','admin/settings/site-information','Site information','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:107:\"Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.\";}}','system',0,0,0,0,0,3,0,2,18,46,0,0,0,0,0,0,0),('navigation',47,18,'admin/settings/site-maintenance','admin/settings/site-maintenance','Site maintenance','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:63:\"Take the site off-line for maintenance or bring it back online.\";}}','system',0,0,0,0,0,3,0,2,18,47,0,0,0,0,0,0,0),('navigation',48,16,'admin/reports/status','admin/reports/status','Status report','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:74:\"Get a status report about your site\'s operation and any detected problems.\";}}','system',0,0,0,0,10,3,0,2,16,48,0,0,0,0,0,0,0),('navigation',49,17,'admin/build/themes','admin/build/themes','Themes','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:57:\"Change which theme your site uses or allows users to set.\";}}','system',0,0,0,0,0,3,0,2,17,49,0,0,0,0,0,0,0),('navigation',50,20,'admin/user/settings','admin/user/settings','User settings','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:101:\"Configure default behavior of users, including registration requirements, e-mails, and user pictures.\";}}','system',0,0,0,0,0,3,0,2,20,50,0,0,0,0,0,0,0),('navigation',51,20,'admin/user/user','admin/user/user','Users','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:26:\"List, add, and edit users.\";}}','system',0,0,0,0,0,3,0,2,20,51,0,0,0,0,0,0,0),('navigation',52,15,'admin/help/block','admin/help/block','block','a:0:{}','system',-1,0,0,0,0,3,0,2,15,52,0,0,0,0,0,0,0),('navigation',53,15,'admin/help/color','admin/help/color','color','a:0:{}','system',-1,0,0,0,0,3,0,2,15,53,0,0,0,0,0,0,0),('navigation',54,15,'admin/help/comment','admin/help/comment','comment','a:0:{}','system',-1,0,0,0,0,3,0,2,15,54,0,0,0,0,0,0,0),('navigation',55,15,'admin/help/filter','admin/help/filter','filter','a:0:{}','system',-1,0,0,0,0,3,0,2,15,55,0,0,0,0,0,0,0),('navigation',56,15,'admin/help/help','admin/help/help','help','a:0:{}','system',-1,0,0,0,0,3,0,2,15,56,0,0,0,0,0,0,0),('navigation',57,15,'admin/help/menu','admin/help/menu','menu','a:0:{}','system',-1,0,0,0,0,3,0,2,15,57,0,0,0,0,0,0,0),('navigation',58,15,'admin/help/node','admin/help/node','node','a:0:{}','system',-1,0,0,0,0,3,0,2,15,58,0,0,0,0,0,0,0),('navigation',59,15,'admin/help/system','admin/help/system','system','a:0:{}','system',-1,0,0,0,0,3,0,2,15,59,0,0,0,0,0,0,0),('navigation',60,15,'admin/help/user','admin/help/user','user','a:0:{}','system',-1,0,0,0,0,3,0,2,15,60,0,0,0,0,0,0,0),('navigation',61,36,'admin/settings/filters/%','admin/settings/filters/%','','a:0:{}','system',-1,0,0,0,0,4,0,2,18,36,61,0,0,0,0,0,0),('navigation',62,26,'admin/settings/clean-urls/check','admin/settings/clean-urls/check','Clean URL check','a:0:{}','system',-1,0,0,0,0,4,0,2,18,26,62,0,0,0,0,0,0),('navigation',63,23,'admin/settings/actions/configure','admin/settings/actions/configure','Configure an advanced action','a:0:{}','system',-1,0,0,0,0,4,0,2,18,23,63,0,0,0,0,0,0),('navigation',64,25,'admin/build/block/configure','admin/build/block/configure','Configure block','a:0:{}','system',-1,0,0,0,0,4,0,2,17,25,64,0,0,0,0,0,0),('navigation',65,17,'admin/build/menu-customize/%','admin/build/menu-customize/%','Customize menu','a:0:{}','system',-1,0,0,0,0,3,0,2,17,65,0,0,0,0,0,0,0),('navigation',66,30,'admin/settings/date-time/lookup','admin/settings/date-time/lookup','Date and time lookup','a:0:{}','system',-1,0,0,0,0,4,0,2,18,30,66,0,0,0,0,0,0),('navigation',67,25,'admin/build/block/delete','admin/build/block/delete','Delete block','a:0:{}','system',-1,0,0,0,0,4,0,2,17,25,67,0,0,0,0,0,0),('navigation',68,36,'admin/settings/filters/delete','admin/settings/filters/delete','Delete input format','a:0:{}','system',-1,0,0,0,0,4,0,2,18,36,68,0,0,0,0,0,0),('navigation',69,22,'admin/user/rules/delete','admin/user/rules/delete','Delete rule','a:0:{}','system',-1,0,0,0,0,4,0,2,20,22,69,0,0,0,0,0,0),('navigation',70,45,'admin/user/roles/edit','admin/user/roles/edit','Edit role','a:0:{}','system',-1,0,0,0,0,4,0,2,20,45,70,0,0,0,0,0,0),('navigation',71,22,'admin/user/rules/edit','admin/user/rules/edit','Edit rule','a:0:{}','system',-1,0,0,0,0,4,0,2,20,22,71,0,0,0,0,0,0),('navigation',72,48,'admin/reports/status/php','admin/reports/status/php','PHP','a:0:{}','system',-1,0,0,0,0,4,0,2,16,48,72,0,0,0,0,0,0),('navigation',73,42,'admin/content/node-settings/rebuild','admin/content/node-settings/rebuild','Rebuild permissions','a:0:{}','system',-1,0,0,0,0,4,0,2,10,42,73,0,0,0,0,0,0),('navigation',74,23,'admin/settings/actions/orphan','admin/settings/actions/orphan','Remove orphans','a:0:{}','system',-1,0,0,0,0,4,0,2,18,23,74,0,0,0,0,0,0),('navigation',75,48,'admin/reports/status/run-cron','admin/reports/status/run-cron','Run cron','a:0:{}','system',-1,0,0,0,0,4,0,2,16,48,75,0,0,0,0,0,0),('navigation',76,48,'admin/reports/status/sql','admin/reports/status/sql','SQL','a:0:{}','system',-1,0,0,0,0,4,0,2,16,48,76,0,0,0,0,0,0),('navigation',77,23,'admin/settings/actions/delete/%','admin/settings/actions/delete/%','Delete action','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:17:\"Delete an action.\";}}','system',-1,0,0,0,0,4,0,2,18,23,77,0,0,0,0,0,0),('navigation',78,0,'admin/build/menu-customize/%/delete','admin/build/menu-customize/%/delete','Delete menu','a:0:{}','system',-1,0,0,0,0,1,0,78,0,0,0,0,0,0,0,0,0),('navigation',79,25,'admin/build/block/list/js','admin/build/block/list/js','JavaScript List Form','a:0:{}','system',-1,0,0,0,0,4,0,2,17,25,79,0,0,0,0,0,0),('navigation',80,39,'admin/build/modules/list/confirm','admin/build/modules/list/confirm','List','a:0:{}','system',-1,0,0,0,0,4,0,2,17,39,80,0,0,0,0,0,0),('navigation',81,0,'user/reset/%/%/%','user/reset/%/%/%','Reset password','a:0:{}','system',-1,0,0,0,0,1,0,81,0,0,0,0,0,0,0,0,0),('navigation',82,39,'admin/build/modules/uninstall/confirm','admin/build/modules/uninstall/confirm','Uninstall','a:0:{}','system',-1,0,0,0,0,4,0,2,17,39,82,0,0,0,0,0,0),('navigation',83,0,'node/%/revisions/%/delete','node/%/revisions/%/delete','Delete earlier revision','a:0:{}','system',-1,0,0,0,0,1,0,83,0,0,0,0,0,0,0,0,0),('navigation',84,0,'node/%/revisions/%/revert','node/%/revisions/%/revert','Revert to earlier revision','a:0:{}','system',-1,0,0,0,0,1,0,84,0,0,0,0,0,0,0,0,0),('navigation',85,0,'node/%/revisions/%/view','node/%/revisions/%/view','Revisions','a:0:{}','system',-1,0,0,0,0,1,0,85,0,0,0,0,0,0,0,0,0),('navigation',86,38,'admin/build/menu/item/%/delete','admin/build/menu/item/%/delete','Delete menu item','a:0:{}','system',-1,0,0,0,0,4,0,2,17,38,86,0,0,0,0,0,0),('navigation',87,38,'admin/build/menu/item/%/edit','admin/build/menu/item/%/edit','Edit menu item','a:0:{}','system',-1,0,0,0,0,4,0,2,17,38,87,0,0,0,0,0,0),('navigation',88,38,'admin/build/menu/item/%/reset','admin/build/menu/item/%/reset','Reset menu item','a:0:{}','system',-1,0,0,0,0,4,0,2,17,38,88,0,0,0,0,0,0),('navigation',89,38,'admin/build/menu-customize/navigation','admin/build/menu-customize/%','Navigation','a:0:{}','menu',0,0,0,0,0,4,0,2,17,38,89,0,0,0,0,0,0),('navigation',90,38,'admin/build/menu-customize/primary-links','admin/build/menu-customize/%','Primary links','a:0:{}','menu',0,0,0,0,0,4,0,2,17,38,90,0,0,0,0,0,0),('navigation',91,38,'admin/build/menu-customize/secondary-links','admin/build/menu-customize/%','Secondary links','a:0:{}','menu',0,0,0,0,0,4,0,2,17,38,91,0,0,0,0,0,0),('navigation',92,0,'taxonomy/autocomplete','taxonomy/autocomplete','Autocomplete taxonomy','a:0:{}','system',-1,0,0,0,0,1,0,92,0,0,0,0,0,0,0,0,0),('navigation',93,16,'admin/reports/dblog','admin/reports/dblog','Recent log entries','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:43:\"View events that have recently been logged.\";}}','system',0,0,0,0,-1,3,0,2,16,93,0,0,0,0,0,0,0),('navigation',94,10,'admin/content/taxonomy','admin/content/taxonomy','Taxonomy','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:67:\"Manage tagging, categorization, and classification of your content.\";}}','system',0,0,0,0,0,3,0,2,10,94,0,0,0,0,0,0,0),('navigation',95,0,'taxonomy/term/%','taxonomy/term/%','Taxonomy term','a:0:{}','system',-1,0,0,0,0,1,0,95,0,0,0,0,0,0,0,0,0),('navigation',96,16,'admin/reports/access-denied','admin/reports/access-denied','Top \'access denied\' errors','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:35:\"View \'access denied\' errors (403s).\";}}','system',0,0,0,0,0,3,0,2,16,96,0,0,0,0,0,0,0),('navigation',97,16,'admin/reports/page-not-found','admin/reports/page-not-found','Top \'page not found\' errors','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:36:\"View \'page not found\' errors (404s).\";}}','system',0,0,0,0,0,3,0,2,16,97,0,0,0,0,0,0,0),('navigation',98,15,'admin/help/dblog','admin/help/dblog','dblog','a:0:{}','system',-1,0,0,0,0,3,0,2,15,98,0,0,0,0,0,0,0),('navigation',99,15,'admin/help/taxonomy','admin/help/taxonomy','taxonomy','a:0:{}','system',-1,0,0,0,0,3,0,2,15,99,0,0,0,0,0,0,0),('navigation',100,37,'admin/settings/logging/dblog','admin/settings/logging/dblog','Database logging','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:169:\"Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.\";}}','system',0,0,0,0,0,4,0,2,18,37,100,0,0,0,0,0,0),('navigation',101,16,'admin/reports/event/%','admin/reports/event/%','Details','a:0:{}','system',-1,0,0,0,0,3,0,2,16,101,0,0,0,0,0,0,0),('navigation',102,94,'admin/content/taxonomy/%','admin/content/taxonomy/%','List terms','a:0:{}','system',-1,0,0,0,0,4,0,2,10,94,102,0,0,0,0,0,0),('navigation',103,94,'admin/content/taxonomy/edit/term','admin/content/taxonomy/edit/term','Edit term','a:0:{}','system',-1,0,0,0,0,4,0,2,10,94,103,0,0,0,0,0,0),('navigation',104,94,'admin/content/taxonomy/edit/vocabulary/%','admin/content/taxonomy/edit/vocabulary/%','Edit vocabulary','a:0:{}','system',-1,0,0,0,0,4,0,2,10,94,104,0,0,0,0,0,0),('navigation',105,16,'admin/reports/updates','admin/reports/updates','Available updates','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:82:\"Get a status report about available updates for your installed modules and themes.\";}}','system',0,0,0,0,10,3,0,2,16,105,0,0,0,0,0,0,0),('navigation',106,11,'node/add/page','node/add/page','Page','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:296:\"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.\";}}','system',0,0,0,0,0,2,0,11,106,0,0,0,0,0,0,0,0),('navigation',107,11,'node/add/story','node/add/story','Story','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:392:\"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site\'s initial home page, and provides the ability to post comments.\";}}','system',0,0,0,0,0,2,0,11,107,0,0,0,0,0,0,0,0),('navigation',108,15,'admin/help/update','admin/help/update','update','a:0:{}','system',-1,0,0,0,0,3,0,2,15,108,0,0,0,0,0,0,0),('navigation',109,105,'admin/reports/updates/check','admin/reports/updates/check','Manual update check','a:0:{}','system',-1,0,0,0,0,4,0,2,16,105,109,0,0,0,0,0,0),('navigation',110,10,'admin/content/node-type/page','admin/content/node-type/page','Page','a:0:{}','system',-1,0,0,0,0,3,0,2,10,110,0,0,0,0,0,0,0),('navigation',111,10,'admin/content/node-type/story','admin/content/node-type/story','Story','a:0:{}','system',-1,0,0,0,0,3,0,2,10,111,0,0,0,0,0,0,0),('navigation',112,0,'admin/content/node-type/page/delete','admin/content/node-type/page/delete','Delete','a:0:{}','system',-1,0,0,0,0,1,0,112,0,0,0,0,0,0,0,0,0),('navigation',113,0,'admin/content/node-type/story/delete','admin/content/node-type/story/delete','Delete','a:0:{}','system',-1,0,0,0,0,1,0,113,0,0,0,0,0,0,0,0,0),('navigation',114,0,'islandoracm.xsd','islandoracm.xsd','Islandora Content Model XML Schema Definition','a:0:{}','system',-1,0,0,0,0,1,0,114,0,0,0,0,0,0,0,0,0),('navigation',115,0,'fedora','fedora','','a:0:{}','system',-1,0,0,0,0,1,0,115,0,0,0,0,0,0,0,0,0),('navigation',116,0,'collection_policy.xsd','collection_policy.xsd','Islandora Content Model XML Schema Definition','a:0:{}','system',-1,0,0,0,0,1,0,116,0,0,0,0,0,0,0,0,0),('navigation',117,0,'fedora/repository','fedora/repository','Digital Repository','a:0:{}','system',0,0,0,0,0,1,0,117,0,0,0,0,0,0,0,0,0),('navigation',118,0,'fedora/basket','fedora/basket','Fedora Basket','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:46:\"View and download objects added to your basket\";}}','system',-1,0,0,0,0,1,0,118,0,0,0,0,0,0,0,0,0),('navigation',119,0,'fedora/imageapi','fedora/imageapi','Image manipulation functions','a:0:{}','system',-1,0,0,0,0,1,0,119,0,0,0,0,0,0,0,0,0),('navigation',120,0,'fedora/ingestObject','fedora/ingestObject','Ingest object','a:0:{}','system',-1,0,0,0,0,1,0,120,0,0,0,0,0,0,0,0,0),('navigation',121,0,'schema/%','schema/%','schema','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:6:\"schema\";}}','system',-1,0,0,0,0,1,0,121,0,0,0,0,0,0,0,0,0),('navigation',122,117,'fedora/repository/add_search_results_to_basket','fedora/repository/add_search_results_to_basket','','a:0:{}','system',-1,0,0,0,0,2,0,117,122,0,0,0,0,0,0,0,0),('navigation',123,117,'fedora/repository/addStream','fedora/repository/addStream','Add stream','a:0:{}','system',-1,0,0,0,0,2,0,117,123,0,0,0,0,0,0,0,0),('navigation',124,117,'fedora/repository/object_download','fedora/repository/object_download','Download object','a:0:{}','system',-1,0,0,0,0,2,0,117,124,0,0,0,0,0,0,0,0),('navigation',125,117,'fedora/repository/addToBasket','fedora/repository/addToBasket','','a:0:{}','system',-1,0,0,0,0,2,0,117,125,0,0,0,0,0,0,0,0),('navigation',126,117,'fedora/repository/removeFromBasket','fedora/repository/removeFromBasket','','a:0:{}','system',-1,0,0,0,0,2,0,117,126,0,0,0,0,0,0,0,0),('navigation',127,0,'islandora/form/update','islandora/form/update','','a:0:{}','system',-1,0,0,0,0,1,0,127,0,0,0,0,0,0,0,0,0),('navigation',128,117,'fedora/repository/service','fedora/repository/service','','a:0:{}','system',-1,0,0,0,0,2,0,117,128,0,0,0,0,0,0,0,0),('navigation',129,117,'fedora/repository/editmetadata','fedora/repository/editmetadata','Edit metadata','a:0:{}','system',-1,0,0,0,0,2,0,117,129,0,0,0,0,0,0,0,0),('navigation',130,18,'admin/settings/imageapi','admin/settings/imageapi','ImageAPI','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:19:\"Configure ImageAPI.\";}}','system',0,0,0,0,0,3,0,2,18,130,0,0,0,0,0,0,0),('navigation',131,18,'admin/settings/fedora_repository','admin/settings/fedora_repository','Islandora Configuration','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:45:\"Configure Islandora\'s interaction with Fedora\";}}','system',0,0,0,0,0,3,0,2,18,131,0,0,0,0,0,0,0),('navigation',132,117,'fedora/repository/list_terms','fedora/repository/list_terms','List terms','a:0:{}','system',-1,0,0,0,0,2,0,117,132,0,0,0,0,0,0,0,0),('navigation',133,117,'fedora/repository/purgeStream','fedora/repository/purgeStream','Purge data stream','a:0:{}','system',-1,0,0,0,0,2,0,117,133,0,0,0,0,0,0,0,0),('navigation',134,117,'fedora/repository/purgeObject','fedora/repository/purgeObject','Purge object','a:0:{}','system',-1,0,0,0,0,2,0,117,134,0,0,0,0,0,0,0,0),('navigation',135,117,'fedora/repository/replaceStream','fedora/repository/replaceStream','Replace Stream','a:0:{}','system',-1,0,0,0,0,2,0,117,135,0,0,0,0,0,0,0,0),('navigation',136,117,'fedora/repository/mnpl_advanced_search','fedora/repository/mnpl_advanced_search','Repository advanced search','a:0:{}','system',-1,0,0,0,0,2,0,117,136,0,0,0,0,0,0,0,0),('navigation',137,18,'admin/settings/tabs','admin/settings/tabs','Tabs','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:22:\"Configuration for tabs\";}}','system',0,0,0,0,0,3,0,2,18,137,0,0,0,0,0,0,0),('navigation',138,15,'admin/help/fedora_repository','admin/help/fedora_repository','fedora_repository','a:0:{}','system',-1,0,0,0,0,3,0,2,15,138,0,0,0,0,0,0,0),('navigation',139,18,'admin/settings/jquery_update','admin/settings/jquery_update','jQuery Update','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:44:\"Configure settings for jQuery Update module.\";}}','system',0,0,0,0,0,3,0,2,18,139,0,0,0,0,0,0,0),('navigation',141,10,'admin/content/model/forms','admin/content/model/forms','Form Associations','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:61:\"Lists Content Models and the forms they are association with.\";}}','system',0,0,0,0,0,3,0,2,10,141,0,0,0,0,0,0,0),('navigation',142,0,'objective/forms/test/%','objective/forms/test/%','Test Form Used By SimpleTest','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:21:\"menu_item_description\";}}','system',-1,0,0,0,0,1,0,142,0,0,0,0,0,0,0,0,0),('navigation',143,10,'admin/content/xml/form','admin/content/xml/form','XML Form Builder','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:23:\"Manage XML Based Forms.\";}}','system',0,0,0,0,0,3,0,2,10,143,0,0,0,0,0,0,0),('navigation',144,141,'admin/content/model/forms/autocomplete','admin/content/model/forms/autocomplete','Auto Complete List of Models.','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:21:\"Lists Content Models.\";}}','system',-1,0,0,0,0,4,0,2,10,141,144,0,0,0,0,0,0),('navigation',145,143,'admin/content/xml/form/create','admin/content/xml/form/create','Create Form','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:18:\"Create a new Form.\";}}','system',-1,0,0,0,0,4,0,2,10,143,145,0,0,0,0,0,0),('navigation',146,141,'admin/content/model/forms/titles','admin/content/model/forms/titles','List of elements to use as titles.','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:25:\"Lists Elements in a form.\";}}','system',-1,0,0,0,0,4,0,2,10,141,146,0,0,0,0,0,0),('navigation',147,10,'admin/content/model/%/forms','admin/content/model/%/forms','','a:0:{}','system',-1,0,0,0,0,3,0,2,10,147,0,0,0,0,0,0,0),('navigation',148,0,'xml/form/elements/ahah/validate','xml/form/elements/ahah/validate','Validate','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:13:\"AHAH callback\";}}','system',-1,0,0,0,0,1,0,148,0,0,0,0,0,0,0,0,0),('navigation',149,143,'admin/content/xml/form/%/copy','admin/content/xml/form/%/copy','Copy Form','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:22:\"Copy an existing Form.\";}}','system',-1,0,0,0,0,4,0,2,10,143,149,0,0,0,0,0,0),('navigation',150,143,'admin/content/xml/form/%/delete','admin/content/xml/form/%/delete','Delete Form','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:14:\"Delete a Form.\";}}','system',-1,0,0,0,0,4,0,2,10,143,150,0,0,0,0,0,0),('navigation',151,0,'xml/form/elements/ahah/duplicate/%','xml/form/elements/ahah/duplicate/%','Duplicate a Form Element','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:13:\"AHAH callback\";}}','system',-1,0,0,0,0,1,0,151,0,0,0,0,0,0,0,0,0),('navigation',152,143,'admin/content/xml/form/%/edit','admin/content/xml/form/%/edit','Edit Form','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:12:\"Edit a Form.\";}}','system',-1,0,0,0,0,4,0,2,10,143,152,0,0,0,0,0,0),('navigation',153,143,'admin/content/xml/form/%/export','admin/content/xml/form/%/export','Export Form','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:14:\"Export a form.\";}}','system',-1,0,0,0,0,4,0,2,10,143,153,0,0,0,0,0,0),('navigation',154,143,'admin/content/xml/form/%/view','admin/content/xml/form/%/view','Preview Form','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:15:\"Preview a form.\";}}','system',-1,0,0,0,0,4,0,2,10,143,154,0,0,0,0,0,0),('navigation',155,0,'xml/form/elements/ahah/rebuild/%','xml/form/elements/ahah/rebuild/%','Rebuild the form.','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:13:\"AHAH callback\";}}','system',-1,0,0,0,0,1,0,155,0,0,0,0,0,0,0,0,0),('navigation',156,141,'admin/content/model/forms/remove/%','admin/content/model/forms/remove/%','Remove Form Association.','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:26:\"Removes a associated form.\";}}','system',-1,0,0,0,0,4,0,2,10,141,156,0,0,0,0,0,0),('navigation',157,0,'xml/form/elements/ahah/remove/%','xml/form/elements/ahah/remove/%','Remove a Form Element','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:13:\"AHAH callback\";}}','system',-1,0,0,0,0,1,0,157,0,0,0,0,0,0,0,0,0),('navigation',158,0,'xml/form/elements/ahah/validate/%','xml/form/elements/ahah/validate/%','Validate a Element','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:13:\"AHAH callback\";}}','system',-1,0,0,0,0,1,0,158,0,0,0,0,0,0,0,0,0),('navigation',159,0,'xml/form/elements/ahah/tag/add/%','xml/form/elements/ahah/tag/add/%','Add a tag to the form, with the value submited for this first.','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:13:\"AHAH callback\";}}','system',-1,0,0,0,0,1,0,159,0,0,0,0,0,0,0,0,0),('navigation',160,0,'admin/content/xml/form/%/edit/save','admin/content/xml/form/%/edit/save','Edit Form','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:12:\"Edit a Form.\";}}','system',-1,0,0,0,0,1,0,160,0,0,0,0,0,0,0,0,0),('navigation',161,0,'xml/form/elements/ahah/tag/edit/%','xml/form/elements/ahah/tag/edit/%','Edit a tag.','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:13:\"AHAH callback\";}}','system',-1,0,0,0,0,1,0,161,0,0,0,0,0,0,0,0,0),('navigation',162,0,'xml/form/elements/ahah/tag/remove/%','xml/form/elements/ahah/tag/remove/%','Remove a tag.','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:13:\"AHAH callback\";}}','system',-1,0,0,0,0,1,0,162,0,0,0,0,0,0,0,0,0),('navigation',163,0,'gsearch','gsearch','','a:0:{}','system',-1,0,0,0,0,1,0,163,0,0,0,0,0,0,0,0,0),('navigation',164,0,'islandora/solr/search','islandora/solr/search','','a:0:{}','system',-1,0,0,0,0,1,0,164,0,0,0,0,0,0,0,0,0),('navigation',165,0,'islandora/solr/process','islandora/solr/process','','a:0:{}','system',-1,0,0,0,0,1,0,165,0,0,0,0,0,0,0,0,0),('navigation',166,18,'admin/settings/islandora_solr_search','admin/settings/islandora_solr_search','Islandora Solr Client','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:33:\"Managing Islandora Solr Searching\";}}','system',0,0,0,0,0,3,0,2,18,166,0,0,0,0,0,0,0),('navigation',167,15,'admin/help/islandora_bookviewer_search','admin/help/islandora_bookviewer_search','islandora_bookviewer_search','a:0:{}','system',-1,0,0,0,0,3,0,2,15,167,0,0,0,0,0,0,0),('navigation',168,15,'admin/help/islandora_solr_config','admin/help/islandora_solr_config','islandora_solr_config','a:0:{}','system',-1,0,0,0,0,3,0,2,15,168,0,0,0,0,0,0,0),('navigation',169,15,'admin/help/islandora_solr_search','admin/help/islandora_solr_search','islandora_solr_search','a:0:{}','system',-1,0,0,0,0,3,0,2,15,169,0,0,0,0,0,0,0),('navigation',170,0,'islandora/solr/extended_form_field/add','islandora/solr/extended_form_field/add','','a:0:{}','system',-1,0,0,0,0,1,0,170,0,0,0,0,0,0,0,0,0),('navigation',171,0,'islandora/solr/extended_form_field/remove','islandora/solr/extended_form_field/remove','','a:0:{}','system',-1,0,0,0,0,1,0,171,0,0,0,0,0,0,0,0,0),('navigation',172,0,'migrate/books','migrate/books','Add new Islandora RDF relatationships to existing books','a:0:{}','system',0,0,0,0,0,1,0,172,0,0,0,0,0,0,0,0,0),('navigation',173,0,'fedora/book','fedora/book','Book view','a:0:{}','system',-1,0,0,0,0,1,0,173,0,0,0,0,0,0,0,0,0),('navigation',174,0,'mods2html/%','mods2html/%','','a:0:{}','system',-1,0,0,0,0,1,0,174,0,0,0,0,0,0,0,0,0),('navigation',175,0,'bookreader/setup','bookreader/setup','','a:0:{}','system',-1,0,0,0,0,1,0,175,0,0,0,0,0,0,0,0,0),('navigation',176,0,'fedora/book_viewer','fedora/book_viewer','Book viewer','a:0:{}','system',-1,0,0,0,0,1,0,176,0,0,0,0,0,0,0,0,0),('navigation',177,0,'islandora/collection','islandora/collection','Collection Management','a:0:{}','system',-1,0,0,0,0,1,0,177,0,0,0,0,0,0,0,0,0),('navigation',178,0,'islandora/book/borndigital','islandora/book/borndigital','','a:0:{}','system',-1,0,0,0,0,1,0,178,0,0,0,0,0,0,0,0,0),('navigation',179,0,'islandora/book/delete_book_files','islandora/book/delete_book_files','','a:0:{}','system',-1,0,0,0,0,1,0,179,0,0,0,0,0,0,0,0,0),('navigation',180,0,'bookreader/pagedata/%','bookreader/pagedata/%','','a:0:{}','system',-1,0,0,0,0,1,0,180,0,0,0,0,0,0,0,0,0),('navigation',181,0,'ocrsearch/%/%','ocrsearch/%/%','','a:0:{}','system',-1,0,0,0,0,1,0,181,0,0,0,0,0,0,0,0,0),('navigation',182,0,'islandora/book/updatepage','islandora/book/updatepage','','a:0:{}','system',-1,0,0,0,0,1,0,182,0,0,0,0,0,0,0,0,0),('navigation',183,0,'islandora/book/process_page_directory','islandora/book/process_page_directory','','a:0:{}','system',-1,0,0,0,0,1,0,183,0,0,0,0,0,0,0,0,0),('navigation',184,0,'islandora/book/process_file','islandora/book/process_file','','a:0:{}','system',-1,0,0,0,0,1,0,184,0,0,0,0,0,0,0,0,0),('navigation',185,0,'islandora/book/ocr','islandora/book/ocr','','a:0:{}','system',-1,0,0,0,0,1,0,185,0,0,0,0,0,0,0,0,0),('navigation',186,0,'islandora/book/upload','islandora/book/upload','','a:0:{}','system',-1,0,0,0,0,1,0,186,0,0,0,0,0,0,0,0,0),('navigation',187,0,'islandora/book/upload_setup','islandora/book/upload_setup','','a:0:{}','system',-1,0,0,0,0,1,0,187,0,0,0,0,0,0,0,0,0),('navigation',188,18,'admin/settings/islandora_collection_manager','admin/settings/islandora_collection_manager','Collection Manager Admin','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:37:\"Configure Islandora Collection Module\";}}','system',0,0,0,0,0,3,0,2,18,188,0,0,0,0,0,0,0),('navigation',189,18,'admin/settings/islandora_book','admin/settings/islandora_book','Islandora Book Admin','a:1:{s:10:\"attributes\";a:1:{s:5:\"title\";s:35:\"Configuration Islandora Book Module\";}}','system',0,0,0,0,0,3,0,2,18,189,0,0,0,0,0,0,0),('navigation',190,15,'admin/help/islandora_book','admin/help/islandora_book','islandora_book','a:0:{}','system',-1,0,0,0,0,3,0,2,15,190,0,0,0,0,0,0,0),('navigation',191,15,'admin/help/islandora_bookviewer','admin/help/islandora_bookviewer','islandora_bookviewer','a:0:{}','system',-1,0,0,0,0,3,0,2,15,191,0,0,0,0,0,0,0),('navigation',192,131,'admin/settings/fedora_repository/object_details_xslt','admin/settings/fedora_repository/object_details_xslt','','a:0:{}','system',-1,0,0,0,0,4,0,2,18,131,192,0,0,0,0,0,0),('navigation',193,131,'admin/settings/fedora_repository/object_details_table','admin/settings/fedora_repository/object_details_table','','a:0:{}','system',-1,0,0,0,0,4,0,2,18,131,193,0,0,0,0,0,0),('navigation',194,0,'bookreader/ocr/%/%','bookreader/ocr/%/%','','a:0:{}','system',-1,0,0,0,0,1,0,194,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `menu_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_router`
--

DROP TABLE IF EXISTS `menu_router`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_router` (
  `path` varchar(255) NOT NULL DEFAULT '',
  `load_functions` text NOT NULL,
  `to_arg_functions` text NOT NULL,
  `access_callback` varchar(255) NOT NULL DEFAULT '',
  `access_arguments` text,
  `page_callback` varchar(255) NOT NULL DEFAULT '',
  `page_arguments` text,
  `fit` int(11) NOT NULL DEFAULT '0',
  `number_parts` smallint(6) NOT NULL DEFAULT '0',
  `tab_parent` varchar(255) NOT NULL DEFAULT '',
  `tab_root` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_callback` varchar(255) NOT NULL DEFAULT '',
  `title_arguments` varchar(255) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `block_callback` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `position` varchar(255) NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  `file` mediumtext,
  PRIMARY KEY (`path`),
  KEY `fit` (`fit`),
  KEY `tab_parent` (`tab_parent`),
  KEY `tab_root_weight_title` (`tab_root`(64),`weight`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_router`
--

LOCK TABLES `menu_router` WRITE;
/*!40000 ALTER TABLE `menu_router` DISABLE KEYS */;
INSERT INTO `menu_router` VALUES ('admin','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_main_admin_page','a:0:{}',1,1,'','admin','Administer','t','',6,'','','',9,'modules/system/system.admin.inc'),('admin/build','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_menu_block_page','a:0:{}',3,2,'','admin/build','Site building','t','',6,'','Control how your site looks and feels.','right',-10,'modules/system/system.admin.inc'),('admin/build/block','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','block_admin_display','a:0:{}',7,3,'','admin/build/block','Blocks','t','',6,'','Configure what block content appears in your site\'s sidebars and other regions.','',0,'modules/block/block.admin.inc'),('admin/build/block/add','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','drupal_get_form','a:1:{i:0;s:20:\"block_add_block_form\";}',15,4,'admin/build/block','admin/build/block','Add block','t','',128,'','','',0,'modules/block/block.admin.inc'),('admin/build/block/configure','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','drupal_get_form','a:1:{i:0;s:21:\"block_admin_configure\";}',15,4,'','admin/build/block/configure','Configure block','t','',4,'','','',0,'modules/block/block.admin.inc'),('admin/build/block/delete','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','drupal_get_form','a:1:{i:0;s:16:\"block_box_delete\";}',15,4,'','admin/build/block/delete','Delete block','t','',4,'','','',0,'modules/block/block.admin.inc'),('admin/build/block/list','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','block_admin_display','a:0:{}',15,4,'admin/build/block','admin/build/block','List','t','',136,'','','',-10,'modules/block/block.admin.inc'),('admin/build/block/list/bluemarine','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:33:\"themes/bluemarine/bluemarine.info\";s:4:\"name\";s:10:\"bluemarine\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:10:\"Bluemarine\";s:11:\"description\";s:66:\"Table-based multi-column theme with a marine and ash color scheme.\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:27:\"themes/bluemarine/style.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:27:\"themes/bluemarine/script.js\";}s:10:\"screenshot\";s:32:\"themes/bluemarine/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:27:\"themes/bluemarine/style.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','block_admin_display','a:1:{i:0;s:10:\"bluemarine\";}',31,5,'admin/build/block/list','admin/build/block','Bluemarine','t','',128,'','','',0,'modules/block/block.admin.inc'),('admin/build/block/list/chameleon','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":11:{s:8:\"filename\";s:31:\"themes/chameleon/chameleon.info\";s:4:\"name\";s:9:\"chameleon\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:32:\"themes/chameleon/chameleon.theme\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:12:{s:4:\"name\";s:9:\"Chameleon\";s:11:\"description\";s:42:\"Minimalist tabled theme with light colors.\";s:7:\"regions\";a:2:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";}s:8:\"features\";a:4:{i:0;s:4:\"logo\";i:1;s:7:\"favicon\";i:2;s:4:\"name\";i:3;s:6:\"slogan\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:2:{s:9:\"style.css\";s:26:\"themes/chameleon/style.css\";s:10:\"common.css\";s:27:\"themes/chameleon/common.css\";}}s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:7:\"scripts\";a:1:{s:9:\"script.js\";s:26:\"themes/chameleon/script.js\";}s:10:\"screenshot\";s:31:\"themes/chameleon/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:2:{s:9:\"style.css\";s:26:\"themes/chameleon/style.css\";s:10:\"common.css\";s:27:\"themes/chameleon/common.css\";}}}}','block_admin_display','a:1:{i:0;s:9:\"chameleon\";}',31,5,'admin/build/block/list','admin/build/block','Chameleon','t','',128,'','','',0,'modules/block/block.admin.inc'),('admin/build/block/list/garland','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:27:\"themes/garland/garland.info\";s:4:\"name\";s:7:\"garland\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"1\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:7:\"Garland\";s:11:\"description\";s:66:\"Tableless, recolorable, multi-column, fluid width theme (default).\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:24:\"themes/garland/script.js\";}s:10:\"screenshot\";s:29:\"themes/garland/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','block_admin_display','a:1:{i:0;s:7:\"garland\";}',31,5,'admin/build/block/list','admin/build/block','Garland','t','',136,'','','',-10,'modules/block/block.admin.inc'),('admin/build/block/list/js','','','user_access','a:1:{i:0;s:17:\"administer blocks\";}','block_admin_display_js','a:0:{}',31,5,'','admin/build/block/list/js','JavaScript List Form','t','',4,'','','',0,'modules/block/block.admin.inc'),('admin/build/block/list/marvin','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:35:\"themes/chameleon/marvin/marvin.info\";s:4:\"name\";s:6:\"marvin\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:0:\"\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:6:\"Marvin\";s:11:\"description\";s:31:\"Boxy tabled theme in all grays.\";s:7:\"regions\";a:2:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";}s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:9:\"chameleon\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:33:\"themes/chameleon/marvin/style.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:33:\"themes/chameleon/marvin/script.js\";}s:10:\"screenshot\";s:38:\"themes/chameleon/marvin/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:33:\"themes/chameleon/marvin/style.css\";}}s:10:\"base_theme\";s:9:\"chameleon\";}}','block_admin_display','a:1:{i:0;s:6:\"marvin\";}',31,5,'admin/build/block/list','admin/build/block','Marvin','t','',128,'','','',0,'modules/block/block.admin.inc'),('admin/build/block/list/minnelli','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":13:{s:8:\"filename\";s:37:\"themes/garland/minnelli/minnelli.info\";s:4:\"name\";s:8:\"minnelli\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:14:{s:4:\"name\";s:8:\"Minnelli\";s:11:\"description\";s:56:\"Tableless, recolorable, multi-column, fixed width theme.\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:7:\"garland\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:12:\"minnelli.css\";s:36:\"themes/garland/minnelli/minnelli.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:33:\"themes/garland/minnelli/script.js\";}s:10:\"screenshot\";s:38:\"themes/garland/minnelli/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";s:6:\"engine\";s:11:\"phptemplate\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:12:\"minnelli.css\";s:36:\"themes/garland/minnelli/minnelli.css\";}}s:6:\"engine\";s:11:\"phptemplate\";s:10:\"base_theme\";s:7:\"garland\";}}','block_admin_display','a:1:{i:0;s:8:\"minnelli\";}',31,5,'admin/build/block/list','admin/build/block','Minnelli','t','',128,'','','',0,'modules/block/block.admin.inc'),('admin/build/block/list/pushbutton','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:33:\"themes/pushbutton/pushbutton.info\";s:4:\"name\";s:10:\"pushbutton\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:10:\"Pushbutton\";s:11:\"description\";s:52:\"Tabled, multi-column theme in blue and orange tones.\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:27:\"themes/pushbutton/style.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:27:\"themes/pushbutton/script.js\";}s:10:\"screenshot\";s:32:\"themes/pushbutton/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:27:\"themes/pushbutton/style.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','block_admin_display','a:1:{i:0;s:10:\"pushbutton\";}',31,5,'admin/build/block/list','admin/build/block','Pushbutton','t','',128,'','','',0,'modules/block/block.admin.inc'),('admin/build/block/list/stacks','','','_block_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:25:\"themes/stacks/stacks.info\";s:4:\"name\";s:6:\"stacks\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:6:\"Stacks\";s:11:\"description\";s:10:\"CDC Stacks\";s:7:\"version\";s:4:\"6.22\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1306357015\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:23:\"themes/stacks/style.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:23:\"themes/stacks/script.js\";}s:10:\"screenshot\";s:28:\"themes/stacks/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:23:\"themes/stacks/style.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','block_admin_display','a:1:{i:0;s:6:\"stacks\";}',31,5,'admin/build/block/list','admin/build/block','Stacks','t','',128,'','','',0,'modules/block/block.admin.inc'),('admin/build/menu','','','user_access','a:1:{i:0;s:15:\"administer menu\";}','menu_overview_page','a:0:{}',7,3,'','admin/build/menu','Menus','t','',6,'','Control your site\'s navigation menu, primary links and secondary links, as well as rename and reorganize menu items.','',0,'modules/menu/menu.admin.inc'),('admin/build/menu-customize/%','a:1:{i:3;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:2:{i:0;s:18:\"menu_overview_form\";i:1;i:3;}',14,4,'','admin/build/menu-customize/%','Customize menu','menu_overview_title','a:1:{i:0;i:3;}',4,'','','',0,'modules/menu/menu.admin.inc'),('admin/build/menu-customize/%/add','a:1:{i:3;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:4:{i:0;s:14:\"menu_edit_item\";i:1;s:3:\"add\";i:2;N;i:3;i:3;}',29,5,'admin/build/menu-customize/%','admin/build/menu-customize/%','Add item','t','',128,'','','',0,'modules/menu/menu.admin.inc'),('admin/build/menu-customize/%/delete','a:1:{i:3;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','menu_delete_menu_page','a:1:{i:0;i:3;}',29,5,'','admin/build/menu-customize/%/delete','Delete menu','t','',4,'','','',0,'modules/menu/menu.admin.inc'),('admin/build/menu-customize/%/edit','a:1:{i:3;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:3:{i:0;s:14:\"menu_edit_menu\";i:1;s:4:\"edit\";i:2;i:3;}',29,5,'admin/build/menu-customize/%','admin/build/menu-customize/%','Edit menu','t','',128,'','','',0,'modules/menu/menu.admin.inc'),('admin/build/menu-customize/%/list','a:1:{i:3;s:9:\"menu_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:2:{i:0;s:18:\"menu_overview_form\";i:1;i:3;}',29,5,'admin/build/menu-customize/%','admin/build/menu-customize/%','List items','t','',136,'','','',-10,'modules/menu/menu.admin.inc'),('admin/build/menu/add','','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:2:{i:0;s:14:\"menu_edit_menu\";i:1;s:3:\"add\";}',15,4,'admin/build/menu','admin/build/menu','Add menu','t','',128,'','','',0,'modules/menu/menu.admin.inc'),('admin/build/menu/item/%/delete','a:1:{i:4;s:14:\"menu_link_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','menu_item_delete_page','a:1:{i:0;i:4;}',61,6,'','admin/build/menu/item/%/delete','Delete menu item','t','',4,'','','',0,'modules/menu/menu.admin.inc'),('admin/build/menu/item/%/edit','a:1:{i:4;s:14:\"menu_link_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:4:{i:0;s:14:\"menu_edit_item\";i:1;s:4:\"edit\";i:2;i:4;i:3;N;}',61,6,'','admin/build/menu/item/%/edit','Edit menu item','t','',4,'','','',0,'modules/menu/menu.admin.inc'),('admin/build/menu/item/%/reset','a:1:{i:4;s:14:\"menu_link_load\";}','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:2:{i:0;s:23:\"menu_reset_item_confirm\";i:1;i:4;}',61,6,'','admin/build/menu/item/%/reset','Reset menu item','t','',4,'','','',0,'modules/menu/menu.admin.inc'),('admin/build/menu/list','','','user_access','a:1:{i:0;s:15:\"administer menu\";}','menu_overview_page','a:0:{}',15,4,'admin/build/menu','admin/build/menu','List menus','t','',136,'','','',-10,'modules/menu/menu.admin.inc'),('admin/build/menu/settings','','','user_access','a:1:{i:0;s:15:\"administer menu\";}','drupal_get_form','a:1:{i:0;s:14:\"menu_configure\";}',15,4,'admin/build/menu','admin/build/menu','Settings','t','',128,'','','',5,'modules/menu/menu.admin.inc'),('admin/build/modules','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:14:\"system_modules\";}',7,3,'','admin/build/modules','Modules','t','',6,'','Enable or disable add-on modules for your site.','',0,'modules/system/system.admin.inc'),('admin/build/modules/list','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:14:\"system_modules\";}',15,4,'admin/build/modules','admin/build/modules','List','t','',136,'','','',0,'modules/system/system.admin.inc'),('admin/build/modules/list/confirm','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:14:\"system_modules\";}',31,5,'','admin/build/modules/list/confirm','List','t','',4,'','','',0,'modules/system/system.admin.inc'),('admin/build/modules/uninstall','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:24:\"system_modules_uninstall\";}',15,4,'admin/build/modules','admin/build/modules','Uninstall','t','',128,'','','',0,'modules/system/system.admin.inc'),('admin/build/modules/uninstall/confirm','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:24:\"system_modules_uninstall\";}',31,5,'','admin/build/modules/uninstall/confirm','Uninstall','t','',4,'','','',0,'modules/system/system.admin.inc'),('admin/build/themes','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:2:{i:0;s:18:\"system_themes_form\";i:1;N;}',7,3,'','admin/build/themes','Themes','t','',6,'','Change which theme your site uses or allows users to set.','',0,'modules/system/system.admin.inc'),('admin/build/themes/select','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:2:{i:0;s:18:\"system_themes_form\";i:1;N;}',15,4,'admin/build/themes','admin/build/themes','List','t','',136,'','Select the default theme.','',-1,'modules/system/system.admin.inc'),('admin/build/themes/settings','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:21:\"system_theme_settings\";}',15,4,'admin/build/themes','admin/build/themes','Configure','t','',128,'','','',0,'modules/system/system.admin.inc'),('admin/build/themes/settings/bluemarine','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:33:\"themes/bluemarine/bluemarine.info\";s:4:\"name\";s:10:\"bluemarine\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:10:\"Bluemarine\";s:11:\"description\";s:66:\"Table-based multi-column theme with a marine and ash color scheme.\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:27:\"themes/bluemarine/style.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:27:\"themes/bluemarine/script.js\";}s:10:\"screenshot\";s:32:\"themes/bluemarine/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:27:\"themes/bluemarine/style.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:10:\"bluemarine\";}',31,5,'admin/build/themes/settings','admin/build/themes','Bluemarine','t','',128,'','','',0,'modules/system/system.admin.inc'),('admin/build/themes/settings/chameleon','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":11:{s:8:\"filename\";s:31:\"themes/chameleon/chameleon.info\";s:4:\"name\";s:9:\"chameleon\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:32:\"themes/chameleon/chameleon.theme\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:12:{s:4:\"name\";s:9:\"Chameleon\";s:11:\"description\";s:42:\"Minimalist tabled theme with light colors.\";s:7:\"regions\";a:2:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";}s:8:\"features\";a:4:{i:0;s:4:\"logo\";i:1;s:7:\"favicon\";i:2;s:4:\"name\";i:3;s:6:\"slogan\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:2:{s:9:\"style.css\";s:26:\"themes/chameleon/style.css\";s:10:\"common.css\";s:27:\"themes/chameleon/common.css\";}}s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:7:\"scripts\";a:1:{s:9:\"script.js\";s:26:\"themes/chameleon/script.js\";}s:10:\"screenshot\";s:31:\"themes/chameleon/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:2:{s:9:\"style.css\";s:26:\"themes/chameleon/style.css\";s:10:\"common.css\";s:27:\"themes/chameleon/common.css\";}}}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:9:\"chameleon\";}',31,5,'admin/build/themes/settings','admin/build/themes','Chameleon','t','',128,'','','',0,'modules/system/system.admin.inc'),('admin/build/themes/settings/garland','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:27:\"themes/garland/garland.info\";s:4:\"name\";s:7:\"garland\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"1\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:7:\"Garland\";s:11:\"description\";s:66:\"Tableless, recolorable, multi-column, fluid width theme (default).\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:24:\"themes/garland/script.js\";}s:10:\"screenshot\";s:29:\"themes/garland/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:7:\"garland\";}',31,5,'admin/build/themes/settings','admin/build/themes','Garland','t','',128,'','','',0,'modules/system/system.admin.inc'),('admin/build/themes/settings/global','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:21:\"system_theme_settings\";}',31,5,'admin/build/themes/settings','admin/build/themes','Global settings','t','',136,'','','',-1,'modules/system/system.admin.inc'),('admin/build/themes/settings/marvin','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:35:\"themes/chameleon/marvin/marvin.info\";s:4:\"name\";s:6:\"marvin\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:0:\"\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:6:\"Marvin\";s:11:\"description\";s:31:\"Boxy tabled theme in all grays.\";s:7:\"regions\";a:2:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";}s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:9:\"chameleon\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:33:\"themes/chameleon/marvin/style.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:33:\"themes/chameleon/marvin/script.js\";}s:10:\"screenshot\";s:38:\"themes/chameleon/marvin/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:33:\"themes/chameleon/marvin/style.css\";}}s:10:\"base_theme\";s:9:\"chameleon\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:6:\"marvin\";}',31,5,'admin/build/themes/settings','admin/build/themes','Marvin','t','',128,'','','',0,'modules/system/system.admin.inc'),('admin/build/themes/settings/minnelli','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":13:{s:8:\"filename\";s:37:\"themes/garland/minnelli/minnelli.info\";s:4:\"name\";s:8:\"minnelli\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:14:{s:4:\"name\";s:8:\"Minnelli\";s:11:\"description\";s:56:\"Tableless, recolorable, multi-column, fixed width theme.\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:7:\"garland\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:12:\"minnelli.css\";s:36:\"themes/garland/minnelli/minnelli.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:33:\"themes/garland/minnelli/script.js\";}s:10:\"screenshot\";s:38:\"themes/garland/minnelli/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";s:6:\"engine\";s:11:\"phptemplate\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:12:\"minnelli.css\";s:36:\"themes/garland/minnelli/minnelli.css\";}}s:6:\"engine\";s:11:\"phptemplate\";s:10:\"base_theme\";s:7:\"garland\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:8:\"minnelli\";}',31,5,'admin/build/themes/settings','admin/build/themes','Minnelli','t','',128,'','','',0,'modules/system/system.admin.inc'),('admin/build/themes/settings/pushbutton','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:33:\"themes/pushbutton/pushbutton.info\";s:4:\"name\";s:10:\"pushbutton\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:10:\"Pushbutton\";s:11:\"description\";s:52:\"Tabled, multi-column theme in blue and orange tones.\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:27:\"themes/pushbutton/style.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:27:\"themes/pushbutton/script.js\";}s:10:\"screenshot\";s:32:\"themes/pushbutton/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:27:\"themes/pushbutton/style.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:10:\"pushbutton\";}',31,5,'admin/build/themes/settings','admin/build/themes','Pushbutton','t','',128,'','','',0,'modules/system/system.admin.inc'),('admin/build/themes/settings/stacks','','','_system_themes_access','a:1:{i:0;O:8:\"stdClass\":12:{s:8:\"filename\";s:25:\"themes/stacks/stacks.info\";s:4:\"name\";s:6:\"stacks\";s:4:\"type\";s:5:\"theme\";s:5:\"owner\";s:45:\"themes/engines/phptemplate/phptemplate.engine\";s:6:\"status\";s:1:\"0\";s:8:\"throttle\";s:1:\"0\";s:9:\"bootstrap\";s:1:\"0\";s:14:\"schema_version\";s:2:\"-1\";s:6:\"weight\";s:1:\"0\";s:4:\"info\";a:13:{s:4:\"name\";s:6:\"Stacks\";s:11:\"description\";s:10:\"CDC Stacks\";s:7:\"version\";s:4:\"6.22\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1306357015\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:23:\"themes/stacks/style.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:23:\"themes/stacks/script.js\";}s:10:\"screenshot\";s:28:\"themes/stacks/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:23:\"themes/stacks/style.css\";}}s:6:\"engine\";s:11:\"phptemplate\";}}','drupal_get_form','a:2:{i:0;s:21:\"system_theme_settings\";i:1;s:6:\"stacks\";}',31,5,'admin/build/themes/settings','admin/build/themes','Stacks','t','',128,'','','',0,'modules/system/system.admin.inc'),('admin/by-module','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_by_module','a:0:{}',3,2,'admin','admin','By module','t','',128,'','','',2,'modules/system/system.admin.inc'),('admin/by-task','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_main_admin_page','a:0:{}',3,2,'admin','admin','By task','t','',136,'','','',0,'modules/system/system.admin.inc'),('admin/compact','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_compact_page','a:0:{}',3,2,'','admin/compact','Compact mode','t','',4,'','','',0,'modules/system/system.admin.inc'),('admin/content','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_menu_block_page','a:0:{}',3,2,'','admin/content','Content management','t','',6,'','Manage your site\'s content.','left',-10,'modules/system/system.admin.inc'),('admin/content/comment','','','user_access','a:1:{i:0;s:19:\"administer comments\";}','comment_admin','a:0:{}',7,3,'','admin/content/comment','Comments','t','',6,'','List and edit site comments and the comment moderation queue.','',0,'modules/comment/comment.admin.inc'),('admin/content/comment/approval','','','user_access','a:1:{i:0;s:19:\"administer comments\";}','comment_admin','a:1:{i:0;s:8:\"approval\";}',15,4,'admin/content/comment','admin/content/comment','Approval queue','t','',128,'','','',0,'modules/comment/comment.admin.inc'),('admin/content/comment/new','','','user_access','a:1:{i:0;s:19:\"administer comments\";}','comment_admin','a:0:{}',15,4,'admin/content/comment','admin/content/comment','Published comments','t','',136,'','','',-10,'modules/comment/comment.admin.inc'),('admin/content/model/%/forms','a:1:{i:3;N;}','','user_access','a:1:{i:0;s:23:\"Admin Form Associations\";}','islandora_content_model_get_form_names_ahah','a:1:{i:0;i:3;}',29,5,'','admin/content/model/%/forms','','t','',4,'','','',0,''),('admin/content/model/forms','','','user_access','a:1:{i:0;s:23:\"Admin Form Associations\";}','islandora_content_model_forms_list','a:0:{}',15,4,'','admin/content/model/forms','Form Associations','t','',6,'','Lists Content Models and the forms they are association with.','',0,''),('admin/content/model/forms/autocomplete','','','user_access','a:1:{i:0;s:23:\"Admin Form Associations\";}','islandora_content_model_forms_autocomplete','a:0:{}',31,5,'','admin/content/model/forms/autocomplete','Auto Complete List of Models.','t','',4,'','Lists Content Models.','',0,''),('admin/content/model/forms/remove/%','a:1:{i:5;N;}','','user_access','a:1:{i:0;s:23:\"Admin Form Associations\";}','islandora_content_model_forms_remove','a:1:{i:0;i:5;}',62,6,'','admin/content/model/forms/remove/%','Remove Form Association.','t','',4,'','Removes a associated form.','',0,''),('admin/content/model/forms/titles','','','user_access','a:1:{i:0;s:23:\"Admin Form Associations\";}','islandora_content_model_forms_ahah','a:0:{}',31,5,'','admin/content/model/forms/titles','List of elements to use as titles.','t','',4,'','Lists Elements in a form.','',0,''),('admin/content/node','','','user_access','a:1:{i:0;s:16:\"administer nodes\";}','drupal_get_form','a:1:{i:0;s:18:\"node_admin_content\";}',7,3,'','admin/content/node','Content','t','',6,'','View, edit, and delete your site\'s content.','',0,'modules/node/node.admin.inc'),('admin/content/node-settings','','','user_access','a:1:{i:0;s:16:\"administer nodes\";}','drupal_get_form','a:1:{i:0;s:14:\"node_configure\";}',7,3,'','admin/content/node-settings','Post settings','t','',6,'','Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.','',0,'modules/node/node.admin.inc'),('admin/content/node-settings/rebuild','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','drupal_get_form','a:1:{i:0;s:30:\"node_configure_rebuild_confirm\";}',15,4,'','admin/content/node-settings/rebuild','Rebuild permissions','t','',4,'','','',0,'modules/node/node.admin.inc'),('admin/content/node-type/page','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:14:\"node_type_form\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:4:\"page\";s:4:\"name\";s:4:\"Page\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:296:\"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:5:\"Title\";s:8:\"has_body\";s:1:\"1\";s:10:\"body_label\";s:4:\"Body\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:4:\"page\";}}',15,4,'','admin/content/node-type/page','Page','t','',4,'','','',0,'modules/node/content_types.inc'),('admin/content/node-type/page/delete','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:24:\"node_type_delete_confirm\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:4:\"page\";s:4:\"name\";s:4:\"Page\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:296:\"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:5:\"Title\";s:8:\"has_body\";s:1:\"1\";s:10:\"body_label\";s:4:\"Body\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:4:\"page\";}}',31,5,'','admin/content/node-type/page/delete','Delete','t','',4,'','','',0,'modules/node/content_types.inc'),('admin/content/node-type/page/edit','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:14:\"node_type_form\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:4:\"page\";s:4:\"name\";s:4:\"Page\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:296:\"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:5:\"Title\";s:8:\"has_body\";s:1:\"1\";s:10:\"body_label\";s:4:\"Body\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:4:\"page\";}}',31,5,'admin/content/node-type/page','admin/content/node-type/page','Edit','t','',136,'','','',0,'modules/node/content_types.inc'),('admin/content/node-type/story','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:14:\"node_type_form\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:5:\"story\";s:4:\"name\";s:5:\"Story\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:392:\"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site\'s initial home page, and provides the ability to post comments.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:5:\"Title\";s:8:\"has_body\";s:1:\"1\";s:10:\"body_label\";s:4:\"Body\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:5:\"story\";}}',15,4,'','admin/content/node-type/story','Story','t','',4,'','','',0,'modules/node/content_types.inc'),('admin/content/node-type/story/delete','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:24:\"node_type_delete_confirm\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:5:\"story\";s:4:\"name\";s:5:\"Story\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:392:\"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site\'s initial home page, and provides the ability to post comments.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:5:\"Title\";s:8:\"has_body\";s:1:\"1\";s:10:\"body_label\";s:4:\"Body\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:5:\"story\";}}',31,5,'','admin/content/node-type/story/delete','Delete','t','',4,'','','',0,'modules/node/content_types.inc'),('admin/content/node-type/story/edit','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:2:{i:0;s:14:\"node_type_form\";i:1;O:8:\"stdClass\":14:{s:4:\"type\";s:5:\"story\";s:4:\"name\";s:5:\"Story\";s:6:\"module\";s:4:\"node\";s:11:\"description\";s:392:\"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site\'s initial home page, and provides the ability to post comments.\";s:4:\"help\";s:0:\"\";s:9:\"has_title\";s:1:\"1\";s:11:\"title_label\";s:5:\"Title\";s:8:\"has_body\";s:1:\"1\";s:10:\"body_label\";s:4:\"Body\";s:14:\"min_word_count\";s:1:\"0\";s:6:\"custom\";s:1:\"1\";s:8:\"modified\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:9:\"orig_type\";s:5:\"story\";}}',31,5,'admin/content/node-type/story','admin/content/node-type/story','Edit','t','',136,'','','',0,'modules/node/content_types.inc'),('admin/content/node/overview','','','user_access','a:1:{i:0;s:16:\"administer nodes\";}','drupal_get_form','a:1:{i:0;s:18:\"node_admin_content\";}',15,4,'admin/content/node','admin/content/node','List','t','',136,'','','',-10,'modules/node/node.admin.inc'),('admin/content/rss-publishing','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:25:\"system_rss_feeds_settings\";}',7,3,'','admin/content/rss-publishing','RSS publishing','t','',6,'','Configure the number of items per feed and whether feeds should be titles/teasers/full-text.','',0,'modules/system/system.admin.inc'),('admin/content/taxonomy','','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:1:{i:0;s:30:\"taxonomy_overview_vocabularies\";}',7,3,'','admin/content/taxonomy','Taxonomy','t','',6,'','Manage tagging, categorization, and classification of your content.','',0,'modules/taxonomy/taxonomy.admin.inc'),('admin/content/taxonomy/%','a:1:{i:3;s:24:\"taxonomy_vocabulary_load\";}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:2:{i:0;s:23:\"taxonomy_overview_terms\";i:1;i:3;}',14,4,'','admin/content/taxonomy/%','List terms','t','',4,'','','',0,'modules/taxonomy/taxonomy.admin.inc'),('admin/content/taxonomy/%/add/term','a:1:{i:3;s:24:\"taxonomy_vocabulary_load\";}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','taxonomy_add_term_page','a:1:{i:0;i:3;}',59,6,'admin/content/taxonomy/%','admin/content/taxonomy/%','Add term','t','',128,'','','',0,'modules/taxonomy/taxonomy.admin.inc'),('admin/content/taxonomy/%/list','a:1:{i:3;s:24:\"taxonomy_vocabulary_load\";}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:2:{i:0;s:23:\"taxonomy_overview_terms\";i:1;i:3;}',29,5,'admin/content/taxonomy/%','admin/content/taxonomy/%','List','t','',136,'','','',-10,'modules/taxonomy/taxonomy.admin.inc'),('admin/content/taxonomy/add/vocabulary','','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:1:{i:0;s:24:\"taxonomy_form_vocabulary\";}',31,5,'admin/content/taxonomy','admin/content/taxonomy','Add vocabulary','t','',128,'','','',0,'modules/taxonomy/taxonomy.admin.inc'),('admin/content/taxonomy/edit/term','','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','taxonomy_admin_term_edit','a:0:{}',31,5,'','admin/content/taxonomy/edit/term','Edit term','t','',4,'','','',0,'modules/taxonomy/taxonomy.admin.inc'),('admin/content/taxonomy/edit/vocabulary/%','a:1:{i:5;s:24:\"taxonomy_vocabulary_load\";}','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','taxonomy_admin_vocabulary_edit','a:1:{i:0;i:5;}',62,6,'','admin/content/taxonomy/edit/vocabulary/%','Edit vocabulary','t','',4,'','','',0,'modules/taxonomy/taxonomy.admin.inc'),('admin/content/taxonomy/list','','','user_access','a:1:{i:0;s:19:\"administer taxonomy\";}','drupal_get_form','a:1:{i:0;s:30:\"taxonomy_overview_vocabularies\";}',15,4,'admin/content/taxonomy','admin/content/taxonomy','List','t','',136,'','','',-10,'modules/taxonomy/taxonomy.admin.inc'),('admin/content/types','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','node_overview_types','a:0:{}',7,3,'','admin/content/types','Content types','t','',6,'','Manage posts by content type, including default status, front page promotion, etc.','',0,'modules/node/content_types.inc'),('admin/content/types/add','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','drupal_get_form','a:1:{i:0;s:14:\"node_type_form\";}',15,4,'admin/content/types','admin/content/types','Add content type','t','',128,'','','',0,'modules/node/content_types.inc'),('admin/content/types/list','','','user_access','a:1:{i:0;s:24:\"administer content types\";}','node_overview_types','a:0:{}',15,4,'admin/content/types','admin/content/types','List','t','',136,'','','',-10,'modules/node/content_types.inc'),('admin/content/xml/form','','','user_access','a:1:{i:0;s:14:\"List XML Forms\";}','drupal_get_form','a:1:{i:0;s:21:\"xml_form_builder_main\";}',15,4,'','admin/content/xml/form','XML Form Builder','t','',6,'','Manage XML Based Forms.','',0,'sites/default/modules/islandora_xml_forms/builder/Main.inc'),('admin/content/xml/form/%/copy','a:1:{i:4;N;}','','user_access','a:1:{i:0;s:16:\"Create XML Forms\";}','drupal_get_form','a:2:{i:0;s:21:\"xml_form_builder_copy\";i:1;i:4;}',61,6,'','admin/content/xml/form/%/copy','Copy Form','t','',4,'','Copy an existing Form.','',0,'sites/default/modules/islandora_xml_forms/builder/Copy.inc'),('admin/content/xml/form/%/delete','a:1:{i:4;N;}','','user_access','a:1:{i:0;s:16:\"Delete XML Forms\";}','drupal_get_form','a:2:{i:0;s:23:\"xml_form_builder_delete\";i:1;i:4;}',61,6,'','admin/content/xml/form/%/delete','Delete Form','t','',4,'','Delete a Form.','',0,'sites/default/modules/islandora_xml_forms/builder/Delete.inc'),('admin/content/xml/form/%/edit','a:1:{i:4;N;}','','user_access','a:1:{i:0;s:14:\"Edit XML Forms\";}','xml_form_builder_edit','a:1:{i:0;i:4;}',61,6,'','admin/content/xml/form/%/edit','Edit Form','t','',4,'','Edit a Form.','',0,'sites/default/modules/islandora_xml_forms/builder/Edit.inc'),('admin/content/xml/form/%/edit/save','a:1:{i:4;N;}','','user_access','a:1:{i:0;s:14:\"Edit XML Forms\";}','xml_form_builder_edit_save','a:1:{i:0;i:4;}',123,7,'','admin/content/xml/form/%/edit/save','Edit Form','t','',4,'','Edit a Form.','',0,'sites/default/modules/islandora_xml_forms/builder/Edit.inc'),('admin/content/xml/form/%/export','a:1:{i:4;N;}','','user_access','a:1:{i:0;s:14:\"List XML Forms\";}','xml_form_builder_export','a:1:{i:0;i:4;}',61,6,'','admin/content/xml/form/%/export','Export Form','t','',4,'','Export a form.','',0,''),('admin/content/xml/form/%/view','a:1:{i:4;N;}','','user_access','a:1:{i:0;s:14:\"List XML Forms\";}','drupal_get_form','a:2:{i:0;s:24:\"xml_form_builder_preview\";i:1;i:4;}',61,6,'','admin/content/xml/form/%/view','Preview Form','t','',4,'','Preview a form.','',0,'sites/default/modules/islandora_xml_forms/builder/Preview.inc'),('admin/content/xml/form/create','','','user_access','a:1:{i:0;s:16:\"Create XML Forms\";}','drupal_get_form','a:1:{i:0;s:23:\"xml_form_builder_create\";}',31,5,'','admin/content/xml/form/create','Create Form','t','',4,'','Create a new Form.','',0,'sites/default/modules/islandora_xml_forms/builder/Create.inc'),('admin/help','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_main','a:0:{}',3,2,'','admin/help','Help','t','',6,'','','',9,'modules/help/help.admin.inc'),('admin/help/block','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/block','block','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/color','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/color','color','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/comment','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/comment','comment','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/dblog','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/dblog','dblog','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/fedora_repository','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/fedora_repository','fedora_repository','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/filter','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/filter','filter','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/help','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/help','help','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/islandora_book','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/islandora_book','islandora_book','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/islandora_bookviewer','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/islandora_bookviewer','islandora_bookviewer','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/islandora_bookviewer_search','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/islandora_bookviewer_search','islandora_bookviewer_search','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/islandora_solr_config','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/islandora_solr_config','islandora_solr_config','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/islandora_solr_search','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/islandora_solr_search','islandora_solr_search','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/menu','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/menu','menu','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/node','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/node','node','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/system','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/system','system','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/taxonomy','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/taxonomy','taxonomy','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/update','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/update','update','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/help/user','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','help_page','a:1:{i:0;i:2;}',7,3,'','admin/help/user','user','t','',4,'','','',0,'modules/help/help.admin.inc'),('admin/reports','','','user_access','a:1:{i:0;s:19:\"access site reports\";}','system_admin_menu_block_page','a:0:{}',3,2,'','admin/reports','Reports','t','',6,'','View reports from system logs and other status information.','left',5,'modules/system/system.admin.inc'),('admin/reports/access-denied','','','user_access','a:1:{i:0;s:19:\"access site reports\";}','dblog_top','a:1:{i:0;s:13:\"access denied\";}',7,3,'','admin/reports/access-denied','Top \'access denied\' errors','t','',6,'','View \'access denied\' errors (403s).','',0,'modules/dblog/dblog.admin.inc'),('admin/reports/dblog','','','user_access','a:1:{i:0;s:19:\"access site reports\";}','dblog_overview','a:0:{}',7,3,'','admin/reports/dblog','Recent log entries','t','',6,'','View events that have recently been logged.','',-1,'modules/dblog/dblog.admin.inc'),('admin/reports/event/%','a:1:{i:3;N;}','','user_access','a:1:{i:0;s:19:\"access site reports\";}','dblog_event','a:1:{i:0;i:3;}',14,4,'','admin/reports/event/%','Details','t','',4,'','','',0,'modules/dblog/dblog.admin.inc'),('admin/reports/page-not-found','','','user_access','a:1:{i:0;s:19:\"access site reports\";}','dblog_top','a:1:{i:0;s:14:\"page not found\";}',7,3,'','admin/reports/page-not-found','Top \'page not found\' errors','t','',6,'','View \'page not found\' errors (404s).','',0,'modules/dblog/dblog.admin.inc'),('admin/reports/status','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_status','a:0:{}',7,3,'','admin/reports/status','Status report','t','',6,'','Get a status report about your site\'s operation and any detected problems.','',10,'modules/system/system.admin.inc'),('admin/reports/status/php','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_php','a:0:{}',15,4,'','admin/reports/status/php','PHP','t','',4,'','','',0,'modules/system/system.admin.inc'),('admin/reports/status/run-cron','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_run_cron','a:0:{}',15,4,'','admin/reports/status/run-cron','Run cron','t','',4,'','','',0,'modules/system/system.admin.inc'),('admin/reports/status/sql','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_sql','a:0:{}',15,4,'','admin/reports/status/sql','SQL','t','',4,'','','',0,'modules/system/system.admin.inc'),('admin/reports/updates','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','update_status','a:0:{}',7,3,'','admin/reports/updates','Available updates','t','',6,'','Get a status report about available updates for your installed modules and themes.','',10,'modules/update/update.report.inc'),('admin/reports/updates/check','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','update_manual_status','a:0:{}',15,4,'','admin/reports/updates/check','Manual update check','t','',4,'','','',0,'modules/update/update.fetch.inc'),('admin/reports/updates/list','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','update_status','a:0:{}',15,4,'admin/reports/updates','admin/reports/updates','List','t','',136,'','','',0,'modules/update/update.report.inc'),('admin/reports/updates/settings','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:15:\"update_settings\";}',15,4,'admin/reports/updates','admin/reports/updates','Settings','t','',128,'','','',0,'modules/update/update.settings.inc'),('admin/settings','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_settings_overview','a:0:{}',3,2,'','admin/settings','Site configuration','t','',6,'','Adjust basic site configuration options.','right',-5,'modules/system/system.admin.inc'),('admin/settings/actions','','','user_access','a:1:{i:0;s:18:\"administer actions\";}','system_actions_manage','a:0:{}',7,3,'','admin/settings/actions','Actions','t','',6,'','Manage the actions defined for your site.','',0,''),('admin/settings/actions/configure','','','user_access','a:1:{i:0;s:18:\"administer actions\";}','drupal_get_form','a:1:{i:0;s:24:\"system_actions_configure\";}',15,4,'','admin/settings/actions/configure','Configure an advanced action','t','',4,'','','',0,''),('admin/settings/actions/delete/%','a:1:{i:4;s:12:\"actions_load\";}','','user_access','a:1:{i:0;s:18:\"administer actions\";}','drupal_get_form','a:2:{i:0;s:26:\"system_actions_delete_form\";i:1;i:4;}',30,5,'','admin/settings/actions/delete/%','Delete action','t','',4,'','Delete an action.','',0,''),('admin/settings/actions/manage','','','user_access','a:1:{i:0;s:18:\"administer actions\";}','system_actions_manage','a:0:{}',15,4,'admin/settings/actions','admin/settings/actions','Manage actions','t','',136,'','Manage the actions defined for your site.','',-2,''),('admin/settings/actions/orphan','','','user_access','a:1:{i:0;s:18:\"administer actions\";}','system_actions_remove_orphans','a:0:{}',15,4,'','admin/settings/actions/orphan','Remove orphans','t','',4,'','','',0,''),('admin/settings/admin','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:27:\"system_admin_theme_settings\";}',7,3,'','admin/settings/admin','Administration theme','t','',6,'system_admin_theme_settings','Settings for how your administrative pages should look.','left',0,'modules/system/system.admin.inc'),('admin/settings/clean-urls','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:25:\"system_clean_url_settings\";}',7,3,'','admin/settings/clean-urls','Clean URLs','t','',6,'','Enable or disable clean URLs for your site.','',0,'modules/system/system.admin.inc'),('admin/settings/clean-urls/check','','','1','a:0:{}','drupal_json','a:1:{i:0;a:1:{s:6:\"status\";b:1;}}',15,4,'','admin/settings/clean-urls/check','Clean URL check','t','',4,'','','',0,''),('admin/settings/date-time','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:25:\"system_date_time_settings\";}',7,3,'','admin/settings/date-time','Date and time','t','',6,'','Settings for how Drupal displays date and time, as well as the system\'s default timezone.','',0,'modules/system/system.admin.inc'),('admin/settings/date-time/lookup','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_date_time_lookup','a:0:{}',15,4,'','admin/settings/date-time/lookup','Date and time lookup','t','',4,'','','',0,'modules/system/system.admin.inc'),('admin/settings/error-reporting','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:31:\"system_error_reporting_settings\";}',7,3,'','admin/settings/error-reporting','Error reporting','t','',6,'','Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.','',0,'modules/system/system.admin.inc'),('admin/settings/fedora_repository','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:23:\"fedora_repository_admin\";}',7,3,'','admin/settings/fedora_repository','Islandora Configuration','t','',6,'','Configure Islandora\'s interaction with Fedora','',0,''),('admin/settings/fedora_repository/collection','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:23:\"fedora_repository_admin\";}',15,4,'admin/settings/fedora_repository','admin/settings/fedora_repository','Collection list','t','',136,'','Enter the Islandora collection information here.','',0,''),('admin/settings/fedora_repository/demoobjects','','','user_access','a:1:{i:0;s:22:\"add fedora datastreams\";}','fedora_repository_solution_packs_page','a:0:{}',15,4,'admin/settings/fedora_repository','admin/settings/fedora_repository','Solution Packs','t','',128,'','Install content models and collections required by installed solution packs.','',0,'sites/default/modules/fedora_repository/fedora_repository.solutionpacks.inc'),('admin/settings/fedora_repository/object_details_table','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:45:\"fedora_repository_object_details_table_config\";}',15,4,'','admin/settings/fedora_repository/object_details_table','','t','',4,'','','',0,'sites/default/modules/fedora_repository/ObjectDetails.inc'),('admin/settings/fedora_repository/object_details_xslt','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:44:\"fedora_repository_object_details_XSLT_config\";}',15,4,'','admin/settings/fedora_repository/object_details_xslt','','t','',4,'','','',0,'sites/default/modules/fedora_repository/ObjectDetails.inc'),('admin/settings/file-system','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:27:\"system_file_system_settings\";}',7,3,'','admin/settings/file-system','File system','t','',6,'','Tell Drupal where to store uploaded files and how they are accessed.','',0,'modules/system/system.admin.inc'),('admin/settings/filters','','','user_access','a:1:{i:0;s:18:\"administer filters\";}','drupal_get_form','a:1:{i:0;s:21:\"filter_admin_overview\";}',7,3,'','admin/settings/filters','Input formats','t','',6,'','Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.','',0,'modules/filter/filter.admin.inc'),('admin/settings/filters/%','a:1:{i:3;s:18:\"filter_format_load\";}','','user_access','a:1:{i:0;s:18:\"administer filters\";}','filter_admin_format_page','a:1:{i:0;i:3;}',14,4,'','admin/settings/filters/%','','filter_admin_format_title','a:1:{i:0;i:3;}',4,'','','',0,'modules/filter/filter.admin.inc'),('admin/settings/filters/%/configure','a:1:{i:3;s:18:\"filter_format_load\";}','','user_access','a:1:{i:0;s:18:\"administer filters\";}','filter_admin_configure_page','a:1:{i:0;i:3;}',29,5,'admin/settings/filters/%','admin/settings/filters/%','Configure','t','',128,'','','',1,'modules/filter/filter.admin.inc'),('admin/settings/filters/%/edit','a:1:{i:3;s:18:\"filter_format_load\";}','','user_access','a:1:{i:0;s:18:\"administer filters\";}','filter_admin_format_page','a:1:{i:0;i:3;}',29,5,'admin/settings/filters/%','admin/settings/filters/%','Edit','t','',136,'','','',0,'modules/filter/filter.admin.inc'),('admin/settings/filters/%/order','a:1:{i:3;s:18:\"filter_format_load\";}','','user_access','a:1:{i:0;s:18:\"administer filters\";}','filter_admin_order_page','a:1:{i:0;i:3;}',29,5,'admin/settings/filters/%','admin/settings/filters/%','Rearrange','t','',128,'','','',2,'modules/filter/filter.admin.inc'),('admin/settings/filters/add','','','user_access','a:1:{i:0;s:18:\"administer filters\";}','filter_admin_format_page','a:0:{}',15,4,'admin/settings/filters','admin/settings/filters','Add input format','t','',128,'','','',1,'modules/filter/filter.admin.inc'),('admin/settings/filters/delete','','','user_access','a:1:{i:0;s:18:\"administer filters\";}','drupal_get_form','a:1:{i:0;s:19:\"filter_admin_delete\";}',15,4,'','admin/settings/filters/delete','Delete input format','t','',4,'','','',0,'modules/filter/filter.admin.inc'),('admin/settings/filters/list','','','user_access','a:1:{i:0;s:18:\"administer filters\";}','drupal_get_form','a:1:{i:0;s:21:\"filter_admin_overview\";}',15,4,'admin/settings/filters','admin/settings/filters','List','t','',136,'','','',0,'modules/filter/filter.admin.inc'),('admin/settings/image-toolkit','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:29:\"system_image_toolkit_settings\";}',7,3,'','admin/settings/image-toolkit','Image toolkit','t','',6,'','Choose which image toolkit to use if you have installed optional toolkits.','',0,'modules/system/system.admin.inc'),('admin/settings/imageapi','','','user_access','a:1:{i:0;s:19:\"administer imageapi\";}','drupal_get_form','a:1:{i:0;s:17:\"imageapi_settings\";}',7,3,'','admin/settings/imageapi','ImageAPI','t','',6,'','Configure ImageAPI.','',0,''),('admin/settings/imageapi/config','','','user_access','a:1:{i:0;s:19:\"administer imageapi\";}','drupal_get_form','a:1:{i:0;s:25:\"imageapi_gd_settings_form\";}',15,4,'admin/settings/imageapi','admin/settings/imageapi','Configure','t','',128,'','','',0,''),('admin/settings/imageapi/config/imageapi_gd','','','user_access','a:1:{i:0;s:19:\"administer imageapi\";}','drupal_get_form','a:1:{i:0;s:25:\"imageapi_gd_settings_form\";}',31,5,'admin/settings/imageapi/config','admin/settings/imageapi','@name','t','a:1:{s:5:\"@name\";s:12:\"ImageAPI GD2\";}',136,'','','',0,''),('admin/settings/imageapi/config/imageapi_imagemagick','','','user_access','a:1:{i:0;s:19:\"administer imageapi\";}','drupal_get_form','a:1:{i:0;s:34:\"imageapi_imagemagick_settings_form\";}',31,5,'admin/settings/imageapi/config','admin/settings/imageapi','@name','t','a:1:{s:5:\"@name\";s:20:\"ImageAPI ImageMagick\";}',128,'','','',0,''),('admin/settings/imageapi/list','','','user_access','a:1:{i:0;s:19:\"administer imageapi\";}','drupal_get_form','a:1:{i:0;s:17:\"imageapi_settings\";}',15,4,'admin/settings/imageapi','admin/settings/imageapi','List','t','',136,'','','',-1,''),('admin/settings/islandora_book','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:29:\"islandora_book_admin_settings\";}',7,3,'','admin/settings/islandora_book','Islandora Book Admin','t','',6,'','Configuration Islandora Book Module','',0,'sites/default/modules/islandora_solution_pack_book/islandora_solution_pack_book/islandora_book.admin.inc'),('admin/settings/islandora_collection_manager','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:46:\"islandora_collection_management_admin_settings\";}',7,3,'','admin/settings/islandora_collection_manager','Collection Manager Admin','t','',6,'','Configure Islandora Collection Module','',0,''),('admin/settings/islandora_solr_search','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:29:\"islandora_solr_admin_settings\";}',7,3,'','admin/settings/islandora_solr_search','Islandora Solr Client','t','',6,'','Managing Islandora Solr Searching','',0,'sites/default/modules/islandora_solr_search/islandora_solr_search.admin.inc'),('admin/settings/jquery_update','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:22:\"jquery_update_settings\";}',7,3,'','admin/settings/jquery_update','jQuery Update','t','',6,'','Configure settings for jQuery Update module.','',0,''),('admin/settings/logging','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','system_logging_overview','a:0:{}',7,3,'','admin/settings/logging','Logging and alerts','t','',6,'','Settings for logging and alerts modules. Various modules can route Drupal\'s system events to different destination, such as syslog, database, email, ...etc.','',0,'modules/system/system.admin.inc'),('admin/settings/logging/dblog','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:20:\"dblog_admin_settings\";}',15,4,'','admin/settings/logging/dblog','Database logging','t','',6,'','Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.','',0,'modules/dblog/dblog.admin.inc'),('admin/settings/performance','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:27:\"system_performance_settings\";}',7,3,'','admin/settings/performance','Performance','t','',6,'','Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.','',0,'modules/system/system.admin.inc'),('admin/settings/site-information','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:32:\"system_site_information_settings\";}',7,3,'','admin/settings/site-information','Site information','t','',6,'','Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.','',0,'modules/system/system.admin.inc'),('admin/settings/site-maintenance','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:32:\"system_site_maintenance_settings\";}',7,3,'','admin/settings/site-maintenance','Site maintenance','t','',6,'','Take the site off-line for maintenance or bring it back online.','',0,'modules/system/system.admin.inc'),('admin/settings/tabs','','','user_access','a:1:{i:0;s:29:\"administer site configuration\";}','drupal_get_form','a:1:{i:0;s:19:\"tabs_admin_settings\";}',7,3,'','admin/settings/tabs','Tabs','t','',6,'','Configuration for tabs','',0,'sites/default/modules/tabs/tabs.admin.inc'),('admin/user','','','user_access','a:1:{i:0;s:27:\"access administration pages\";}','system_admin_menu_block_page','a:0:{}',3,2,'','admin/user','User management','t','',6,'','Manage your site\'s users, groups and access to site features.','left',0,'modules/system/system.admin.inc'),('admin/user/permissions','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','drupal_get_form','a:1:{i:0;s:15:\"user_admin_perm\";}',7,3,'','admin/user/permissions','Permissions','t','',6,'','Determine access to features by selecting permissions for roles.','',0,'modules/user/user.admin.inc'),('admin/user/roles','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','drupal_get_form','a:1:{i:0;s:19:\"user_admin_new_role\";}',7,3,'','admin/user/roles','Roles','t','',6,'','List, edit, or add user roles.','',0,'modules/user/user.admin.inc'),('admin/user/roles/edit','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','drupal_get_form','a:1:{i:0;s:15:\"user_admin_role\";}',15,4,'','admin/user/roles/edit','Edit role','t','',4,'','','',0,'modules/user/user.admin.inc'),('admin/user/rules','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','user_admin_access','a:0:{}',7,3,'','admin/user/rules','Access rules','t','',6,'','List and create rules to disallow usernames, e-mail addresses, and IP addresses.','',0,'modules/user/user.admin.inc'),('admin/user/rules/add','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','user_admin_access_add','a:0:{}',15,4,'admin/user/rules','admin/user/rules','Add rule','t','',128,'','','',0,'modules/user/user.admin.inc'),('admin/user/rules/check','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','user_admin_access_check','a:0:{}',15,4,'admin/user/rules','admin/user/rules','Check rules','t','',128,'','','',0,'modules/user/user.admin.inc'),('admin/user/rules/delete','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','drupal_get_form','a:1:{i:0;s:32:\"user_admin_access_delete_confirm\";}',15,4,'','admin/user/rules/delete','Delete rule','t','',4,'','','',0,'modules/user/user.admin.inc'),('admin/user/rules/edit','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','user_admin_access_edit','a:0:{}',15,4,'','admin/user/rules/edit','Edit rule','t','',4,'','','',0,'modules/user/user.admin.inc'),('admin/user/rules/list','','','user_access','a:1:{i:0;s:22:\"administer permissions\";}','user_admin_access','a:0:{}',15,4,'admin/user/rules','admin/user/rules','List','t','',136,'','','',-10,'modules/user/user.admin.inc'),('admin/user/settings','','','user_access','a:1:{i:0;s:16:\"administer users\";}','drupal_get_form','a:1:{i:0;s:19:\"user_admin_settings\";}',7,3,'','admin/user/settings','User settings','t','',6,'','Configure default behavior of users, including registration requirements, e-mails, and user pictures.','',0,'modules/user/user.admin.inc'),('admin/user/user','','','user_access','a:1:{i:0;s:16:\"administer users\";}','user_admin','a:1:{i:0;s:4:\"list\";}',7,3,'','admin/user/user','Users','t','',6,'','List, add, and edit users.','',0,'modules/user/user.admin.inc'),('admin/user/user/create','','','user_access','a:1:{i:0;s:16:\"administer users\";}','user_admin','a:1:{i:0;s:6:\"create\";}',15,4,'admin/user/user','admin/user/user','Add user','t','',128,'','','',0,'modules/user/user.admin.inc'),('admin/user/user/list','','','user_access','a:1:{i:0;s:16:\"administer users\";}','user_admin','a:1:{i:0;s:4:\"list\";}',15,4,'admin/user/user','admin/user/user','List','t','',136,'','','',-10,'modules/user/user.admin.inc'),('batch','','','1','a:0:{}','system_batch_page','a:0:{}',1,1,'','batch','','t','',4,'','','',0,'modules/system/system.admin.inc'),('bookreader/ocr/%/%','a:2:{i:2;N;i:3;N;}','','1','a:0:{}','islandora_bookviewer_get_ocr','a:2:{i:0;i:2;i:1;i:3;}',12,4,'','bookreader/ocr/%/%','','t','',4,'','','',0,''),('bookreader/pagedata/%','a:1:{i:2;N;}','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','islandora_bookviewer_get_page_data','a:1:{i:0;i:2;}',6,3,'','bookreader/pagedata/%','','t','',4,'','','',0,''),('bookreader/setup','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','islandora_bookviewer_setup','a:0:{}',3,2,'','bookreader/setup','','t','',4,'','','',0,''),('collection_policy.xsd','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','fedora_repository_display_schema','a:1:{i:0;s:21:\"collection_policy.xsd\";}',1,1,'','collection_policy.xsd','Islandora Content Model XML Schema Definition','t','',4,'','','',0,''),('comment/delete','','','user_access','a:1:{i:0;s:19:\"administer comments\";}','comment_delete','a:0:{}',3,2,'','comment/delete','Delete comment','t','',4,'','','',0,'modules/comment/comment.admin.inc'),('comment/edit','','','user_access','a:1:{i:0;s:13:\"post comments\";}','comment_edit','a:0:{}',3,2,'','comment/edit','Edit comment','t','',4,'','','',0,'modules/comment/comment.pages.inc'),('comment/reply/%','a:1:{i:2;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:4:\"view\";i:1;i:2;}','comment_reply','a:1:{i:0;i:2;}',6,3,'','comment/reply/%','Reply to comment','t','',4,'','','',0,'modules/comment/comment.pages.inc'),('fedora','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','repository_page','a:0:{}',1,1,'','fedora','','t','',4,'','','',0,''),('fedora/basket','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','fedora_repository_basket','a:0:{}',3,2,'','fedora/basket','Fedora Basket','t','',4,'','View and download objects added to your basket','',0,''),('fedora/book','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','islandora_book_create_book_view','a:0:{}',3,2,'','fedora/book','Book view','t','',4,'','','',0,''),('fedora/book_viewer','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','islandora_book_book_viewer','a:0:{}',3,2,'','fedora/book_viewer','Book viewer','t','',4,'','','',0,''),('fedora/imageapi','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','fedora_repository_image_manip','a:0:{}',3,2,'','fedora/imageapi','Image manipulation functions','t','',4,'','','',0,''),('fedora/ingestObject','','','user_access','a:1:{i:0;s:22:\"add fedora datastreams\";}','fedora_repository_ingest_object','a:0:{}',3,2,'','fedora/ingestObject','Ingest object','t','',4,'','','',0,''),('fedora/repository','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','repository_page','a:0:{}',3,2,'','fedora/repository','Digital Repository','t','',6,'','','',0,''),('fedora/repository/addStream','','','user_access','a:1:{i:0;s:22:\"add fedora datastreams\";}','add_stream','a:0:{}',7,3,'','fedora/repository/addStream','Add stream','t','',4,'','','',0,''),('fedora/repository/addToBasket','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','fedora_repository_add_to_basket','a:0:{}',7,3,'','fedora/repository/addToBasket','','t','',4,'','','',0,''),('fedora/repository/add_search_results_to_basket','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','fedora_repository_add_search_results_to_basket','a:0:{}',7,3,'','fedora/repository/add_search_results_to_basket','','t','',4,'','','',0,''),('fedora/repository/editmetadata','','','user_access','a:1:{i:0;s:21:\"edit fedora meta data\";}','fedora_repository_edit_qdc_page','a:0:{}',7,3,'','fedora/repository/editmetadata','Edit metadata','t','',4,'','','',0,''),('fedora/repository/list_terms','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','fedora_repository_list_terms','a:0:{}',7,3,'','fedora/repository/list_terms','List terms','t','',4,'','','',0,''),('fedora/repository/mnpl_advanced_search','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','fedora_repository_mnpl_advanced_search','a:0:{}',7,3,'','fedora/repository/mnpl_advanced_search','Repository advanced search','t','',4,'','','',0,''),('fedora/repository/object_download','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','fedora_object_as_attachment','a:0:{}',7,3,'','fedora/repository/object_download','Download object','t','',4,'','','',0,''),('fedora/repository/purgeObject','','','user_access','a:1:{i:0;s:29:\"purge objects and datastreams\";}','fedora_repository_purge_object','a:0:{}',7,3,'','fedora/repository/purgeObject','Purge object','t','',4,'','','',0,''),('fedora/repository/purgeStream','','','user_access','a:1:{i:0;s:29:\"purge objects and datastreams\";}','fedora_repository_purge_stream','a:0:{}',7,3,'','fedora/repository/purgeStream','Purge data stream','t','',4,'','','',0,''),('fedora/repository/removeFromBasket','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','fedora_repository_remove_from_basket','a:0:{}',7,3,'','fedora/repository/removeFromBasket','','t','',4,'','','',0,''),('fedora/repository/replaceStream','','','user_access','a:1:{i:0;s:22:\"add fedora datastreams\";}','fedora_repository_replace_stream','a:0:{}',7,3,'','fedora/repository/replaceStream','Replace Stream','t','',4,'','','',0,''),('fedora/repository/service','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','repository_service','a:0:{}',7,3,'','fedora/repository/service','','t','',4,'','','',0,''),('filter/tips','','','1','a:0:{}','filter_tips_long','a:0:{}',3,2,'','filter/tips','Compose tips','t','',20,'','','',0,'modules/filter/filter.pages.inc'),('gsearch','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','gsearch','a:0:{}',1,1,'','gsearch','','t','',4,'','','',0,''),('islandora/book/borndigital','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','create_borndigital','a:0:{}',7,3,'','islandora/book/borndigital','','t','',4,'','','',0,'sites/default/modules/islandora_solution_pack_book/islandora_solution_pack_book/management/born_digital.inc'),('islandora/book/delete_book_files','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','delete_book_page_files','a:0:{}',7,3,'','islandora/book/delete_book_files','','t','',4,'','','',0,'sites/default/modules/islandora_solution_pack_book/islandora_solution_pack_book/pageload/upload_frame.inc'),('islandora/book/ocr','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','update_ocr_div','a:0:{}',7,3,'','islandora/book/ocr','','t','',4,'','','',0,'sites/default/modules/islandora_solution_pack_book/islandora_solution_pack_book/islandora_book.admin.inc'),('islandora/book/process_file','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','process_file','a:0:{}',7,3,'','islandora/book/process_file','','t','',4,'','','',0,'sites/default/modules/islandora_solution_pack_book/islandora_solution_pack_book/pageload/upload_frame.inc'),('islandora/book/process_page_directory','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','prep_add_form','a:0:{}',7,3,'','islandora/book/process_page_directory','','t','',4,'','','',0,'sites/default/modules/islandora_solution_pack_book/islandora_solution_pack_book/pageload/prepare_add_pages_form.inc'),('islandora/book/updatepage','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','page_management_wrapper','a:0:{}',7,3,'','islandora/book/updatepage','','t','',4,'','','',0,'sites/default/modules/islandora_solution_pack_book/islandora_solution_pack_book/ObjectManager.inc'),('islandora/book/upload','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','upload_pages','a:0:{}',7,3,'','islandora/book/upload','','t','',4,'','','',0,'sites/default/modules/islandora_solution_pack_book/islandora_solution_pack_book/pageload/upload_frame.inc'),('islandora/book/upload_setup','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','upload_setup','a:0:{}',7,3,'','islandora/book/upload_setup','','t','',4,'','','',0,'sites/default/modules/islandora_solution_pack_book/islandora_solution_pack_book/pageload/upload_frame.inc'),('islandora/collection','','','user_access','a:1:{i:0;s:18:\"manage collections\";}','collection_management_wrapper','a:0:{}',3,2,'','islandora/collection','Collection Management','t','',4,'','','',0,''),('islandora/form/update','','','user_access','a:1:{i:0;s:23:\"Admin Form Associations\";}','islandora_content_model_update_form_choice','a:0:{}',7,3,'','islandora/form/update','','t','',4,'','','',0,'sites/default/modules/islandora_content_model_forms/IngestObjectMetadataForm.inc'),('islandora/solr/extended_form_field/add','','','user_access','a:1:{i:0;s:14:\"access content\";}','_islandora_extended_search_add_field','a:0:{}',15,4,'','islandora/solr/extended_form_field/add','','t','',4,'','','',0,''),('islandora/solr/extended_form_field/remove','','','user_access','a:1:{i:0;s:14:\"access content\";}','_islandora_extended_search_remove_field','a:0:{}',15,4,'','islandora/solr/extended_form_field/remove','','t','',4,'','','',0,''),('islandora/solr/process','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','update_solr_url_div','a:0:{}',7,3,'','islandora/solr/process','','t','',4,'','','',0,'sites/default/modules/islandora_solr_search/islandora_solr_search.admin.inc'),('islandora/solr/search','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','islandora_solr_search','a:0:{}',7,3,'','islandora/solr/search','','t','',4,'','','',0,''),('islandoracm.xsd','','','user_access','a:1:{i:0;s:22:\"view fedora collection\";}','fedora_repository_display_schema','a:1:{i:0;s:15:\"islandoracm.xsd\";}',1,1,'','islandoracm.xsd','Islandora Content Model XML Schema Definition','t','',4,'','','',0,''),('logout','','','user_is_logged_in','a:0:{}','user_logout','a:0:{}',1,1,'','logout','Log out','t','',6,'','','',10,'modules/user/user.pages.inc'),('migrate/books','','','user_access','a:1:{i:0;s:17:\"migrate all books\";}','drupal_get_form','a:1:{i:0;s:31:\"migrate_books_confirmation_form\";}',3,2,'','migrate/books','Add new Islandora RDF relatationships to existing books','t','',6,'','','',0,''),('mods2html/%','a:1:{i:1;N;}','','1','a:0:{}','islandora_bookviewer_get_mods','a:1:{i:0;i:1;}',2,2,'','mods2html/%','','t','',4,'','','',0,''),('node','','','user_access','a:1:{i:0;s:14:\"access content\";}','node_page_default','a:0:{}',1,1,'','node','Content','t','',4,'','','',0,''),('node/%','a:1:{i:1;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:4:\"view\";i:1;i:1;}','node_page_view','a:1:{i:0;i:1;}',2,2,'','node/%','','node_page_title','a:1:{i:0;i:1;}',4,'','','',0,''),('node/%/delete','a:1:{i:1;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:6:\"delete\";i:1;i:1;}','drupal_get_form','a:2:{i:0;s:19:\"node_delete_confirm\";i:1;i:1;}',5,3,'','node/%/delete','Delete','t','',4,'','','',1,'modules/node/node.pages.inc'),('node/%/edit','a:1:{i:1;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:6:\"update\";i:1;i:1;}','node_page_edit','a:1:{i:0;i:1;}',5,3,'node/%','node/%','Edit','t','',128,'','','',1,'modules/node/node.pages.inc'),('node/%/revisions','a:1:{i:1;s:9:\"node_load\";}','','_node_revision_access','a:1:{i:0;i:1;}','node_revision_overview','a:1:{i:0;i:1;}',5,3,'node/%','node/%','Revisions','t','',128,'','','',2,'modules/node/node.pages.inc'),('node/%/revisions/%/delete','a:2:{i:1;a:1:{s:9:\"node_load\";a:1:{i:0;i:3;}}i:3;N;}','','_node_revision_access','a:2:{i:0;i:1;i:1;s:6:\"delete\";}','drupal_get_form','a:2:{i:0;s:28:\"node_revision_delete_confirm\";i:1;i:1;}',21,5,'','node/%/revisions/%/delete','Delete earlier revision','t','',4,'','','',0,'modules/node/node.pages.inc'),('node/%/revisions/%/revert','a:2:{i:1;a:1:{s:9:\"node_load\";a:1:{i:0;i:3;}}i:3;N;}','','_node_revision_access','a:2:{i:0;i:1;i:1;s:6:\"update\";}','drupal_get_form','a:2:{i:0;s:28:\"node_revision_revert_confirm\";i:1;i:1;}',21,5,'','node/%/revisions/%/revert','Revert to earlier revision','t','',4,'','','',0,'modules/node/node.pages.inc'),('node/%/revisions/%/view','a:2:{i:1;a:1:{s:9:\"node_load\";a:1:{i:0;i:3;}}i:3;N;}','','_node_revision_access','a:1:{i:0;i:1;}','node_show','a:3:{i:0;i:1;i:1;N;i:2;b:1;}',21,5,'','node/%/revisions/%/view','Revisions','t','',4,'','','',0,''),('node/%/view','a:1:{i:1;s:9:\"node_load\";}','','node_access','a:2:{i:0;s:4:\"view\";i:1;i:1;}','node_page_view','a:1:{i:0;i:1;}',5,3,'node/%','node/%','View','t','',136,'','','',-10,''),('node/add','','','_node_add_access','a:0:{}','node_add_page','a:0:{}',3,2,'','node/add','Create content','t','',6,'','','',1,'modules/node/node.pages.inc'),('node/add/page','','','node_access','a:2:{i:0;s:6:\"create\";i:1;s:4:\"page\";}','node_add','a:1:{i:0;i:2;}',7,3,'','node/add/page','Page','check_plain','',6,'','A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.','',0,'modules/node/node.pages.inc'),('node/add/story','','','node_access','a:2:{i:0;s:6:\"create\";i:1;s:5:\"story\";}','node_add','a:1:{i:0;i:2;}',7,3,'','node/add/story','Story','check_plain','',6,'','A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site\'s initial home page, and provides the ability to post comments.','',0,'modules/node/node.pages.inc'),('objective/forms/test/%','a:1:{i:3;N;}','','user_access','a:1:{i:0;s:14:\"access content\";}','objective_forms_test','a:1:{i:0;i:3;}',14,4,'','objective/forms/test/%','Test Form Used By SimpleTest','t','',4,'','menu_item_description','',0,''),('ocrsearch/%/%','a:2:{i:1;N;i:2;N;}','','1','a:0:{}','islandora_bookviewer_ocr_search','a:2:{i:0;i:1;i:1;i:2;}',4,3,'','ocrsearch/%/%','','t','',4,'','','',0,''),('rss.xml','','','user_access','a:1:{i:0;s:14:\"access content\";}','node_feed','a:0:{}',1,1,'','rss.xml','RSS feed','t','',4,'','','',0,''),('schema/%','a:1:{i:1;N;}','','user_access','a:1:{i:0;s:14:\"access content\";}','xml_forms_get_schema','a:1:{i:0;i:1;}',2,2,'','schema/%','schema','t','',4,'','schema','',0,''),('system/files','','','1','a:0:{}','file_download','a:0:{}',3,2,'','system/files','File download','t','',4,'','','',0,''),('taxonomy/autocomplete','','','user_access','a:1:{i:0;s:14:\"access content\";}','taxonomy_autocomplete','a:0:{}',3,2,'','taxonomy/autocomplete','Autocomplete taxonomy','t','',4,'','','',0,'modules/taxonomy/taxonomy.pages.inc'),('taxonomy/term/%','a:1:{i:2;N;}','','user_access','a:1:{i:0;s:14:\"access content\";}','taxonomy_term_page','a:1:{i:0;i:2;}',6,3,'','taxonomy/term/%','Taxonomy term','t','',4,'','','',0,'modules/taxonomy/taxonomy.pages.inc'),('user','','','1','a:0:{}','user_page','a:0:{}',1,1,'','user','User account','t','',4,'','','',0,'modules/user/user.pages.inc'),('user/%','a:1:{i:1;s:22:\"user_uid_optional_load\";}','a:1:{i:1;s:24:\"user_uid_optional_to_arg\";}','user_view_access','a:1:{i:0;i:1;}','user_view','a:1:{i:0;i:1;}',2,2,'','user/%','My account','user_page_title','a:1:{i:0;i:1;}',6,'','','',0,'modules/user/user.pages.inc'),('user/%/delete','a:1:{i:1;s:9:\"user_load\";}','','user_delete_access','a:1:{i:0;i:1;}','drupal_get_form','a:2:{i:0;s:19:\"user_confirm_delete\";i:1;i:1;}',5,3,'','user/%/delete','Delete','t','',4,'','','',0,'modules/user/user.pages.inc'),('user/%/edit','a:1:{i:1;a:1:{s:18:\"user_category_load\";a:2:{i:0;s:4:\"%map\";i:1;s:6:\"%index\";}}}','','user_edit_access','a:1:{i:0;i:1;}','user_edit','a:1:{i:0;i:1;}',5,3,'user/%','user/%','Edit','t','',128,'','','',0,'modules/user/user.pages.inc'),('user/%/edit/account','a:1:{i:1;a:1:{s:18:\"user_category_load\";a:2:{i:0;s:4:\"%map\";i:1;s:6:\"%index\";}}}','','user_edit_access','a:1:{i:0;i:1;}','user_edit','a:1:{i:0;i:1;}',11,4,'user/%/edit','user/%','Account','t','',136,'','','',0,'modules/user/user.pages.inc'),('user/%/view','a:1:{i:1;s:9:\"user_load\";}','','user_view_access','a:1:{i:0;i:1;}','user_view','a:1:{i:0;i:1;}',5,3,'user/%','user/%','View','t','',136,'','','',-10,'modules/user/user.pages.inc'),('user/autocomplete','','','user_access','a:1:{i:0;s:20:\"access user profiles\";}','user_autocomplete','a:0:{}',3,2,'','user/autocomplete','User autocomplete','t','',4,'','','',0,'modules/user/user.pages.inc'),('user/login','','','user_is_anonymous','a:0:{}','user_page','a:0:{}',3,2,'user','user','Log in','t','',136,'','','',0,'modules/user/user.pages.inc'),('user/password','','','user_is_anonymous','a:0:{}','drupal_get_form','a:1:{i:0;s:9:\"user_pass\";}',3,2,'user','user','Request new password','t','',128,'','','',0,'modules/user/user.pages.inc'),('user/register','','','user_register_access','a:0:{}','drupal_get_form','a:1:{i:0;s:13:\"user_register\";}',3,2,'user','user','Create new account','t','',128,'','','',0,'modules/user/user.pages.inc'),('user/reset/%/%/%','a:3:{i:2;N;i:3;N;i:4;N;}','','1','a:0:{}','drupal_get_form','a:4:{i:0;s:15:\"user_pass_reset\";i:1;i:2;i:2;i:3;i:3;i:4;}',24,5,'','user/reset/%/%/%','Reset password','t','',4,'','','',0,'modules/user/user.pages.inc'),('xml/form/elements/ahah/duplicate/%','a:1:{i:5;N;}','','user_access','a:1:{i:0;s:14:\"access content\";}','Element::Duplicate','a:2:{i:0;i:5;i:1;i:6;}',62,6,'','xml/form/elements/ahah/duplicate/%','Duplicate a Form Element','t','',4,'','AHAH callback','',0,'sites/default/modules/islandora_xml_forms/elements/includes//Element.inc'),('xml/form/elements/ahah/rebuild/%','a:1:{i:5;N;}','','user_access','a:1:{i:0;s:14:\"access content\";}','Element::Rebuild','a:1:{i:0;i:5;}',62,6,'','xml/form/elements/ahah/rebuild/%','Rebuild the form.','t','',4,'','AHAH callback','',0,'sites/default/modules/islandora_xml_forms/elements/includes//Element.inc'),('xml/form/elements/ahah/remove/%','a:1:{i:5;N;}','','user_access','a:1:{i:0;s:14:\"access content\";}','Element::Remove','a:2:{i:0;i:5;i:1;i:6;}',62,6,'','xml/form/elements/ahah/remove/%','Remove a Form Element','t','',4,'','AHAH callback','',0,'sites/default/modules/islandora_xml_forms/elements/includes//Element.inc'),('xml/form/elements/ahah/tag/add/%','a:1:{i:6;N;}','','user_access','a:1:{i:0;s:14:\"access content\";}','Tag::Add','a:1:{i:0;i:6;}',126,7,'','xml/form/elements/ahah/tag/add/%','Add a tag to the form, with the value submited for this first.','t','',4,'','AHAH callback','',0,'sites/default/modules/islandora_xml_forms/elements/includes//Tag.inc'),('xml/form/elements/ahah/tag/edit/%','a:1:{i:6;N;}','','user_access','a:1:{i:0;s:14:\"access content\";}','Tag::Edit','a:1:{i:0;i:6;}',126,7,'','xml/form/elements/ahah/tag/edit/%','Edit a tag.','t','',4,'','AHAH callback','',0,'sites/default/modules/islandora_xml_forms/elements/includes//Tag.inc'),('xml/form/elements/ahah/tag/remove/%','a:1:{i:6;N;}','','user_access','a:1:{i:0;s:14:\"access content\";}','Tag::Remove','a:1:{i:0;i:6;}',126,7,'','xml/form/elements/ahah/tag/remove/%','Remove a tag.','t','',4,'','AHAH callback','',0,'sites/default/modules/islandora_xml_forms/elements/includes//Tag.inc'),('xml/form/elements/ahah/validate','','','user_access','a:1:{i:0;s:14:\"access content\";}','xml_form_elements_ahah_validate_form','a:0:{}',31,5,'','xml/form/elements/ahah/validate','Validate','t','',4,'','AHAH callback','',0,'sites/default/modules/islandora_xml_forms/elements/includes//Validate.inc'),('xml/form/elements/ahah/validate/%','a:1:{i:5;N;}','','user_access','a:1:{i:0;s:14:\"access content\";}','Element::Validate','a:1:{i:0;i:5;}',62,6,'','xml/form/elements/ahah/validate/%','Validate a Element','t','',4,'','AHAH callback','',0,'sites/default/modules/islandora_xml_forms/elements/includes//Element.inc');
/*!40000 ALTER TABLE `menu_router` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node` (
  `nid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  `language` varchar(12) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created` int(11) NOT NULL DEFAULT '0',
  `changed` int(11) NOT NULL DEFAULT '0',
  `comment` int(11) NOT NULL DEFAULT '0',
  `promote` int(11) NOT NULL DEFAULT '0',
  `moderate` int(11) NOT NULL DEFAULT '0',
  `sticky` int(11) NOT NULL DEFAULT '0',
  `tnid` int(10) unsigned NOT NULL DEFAULT '0',
  `translate` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`),
  UNIQUE KEY `vid` (`vid`),
  KEY `node_changed` (`changed`),
  KEY `node_created` (`created`),
  KEY `node_moderate` (`moderate`),
  KEY `node_promote_status` (`promote`,`status`),
  KEY `node_status_type` (`status`,`type`,`nid`),
  KEY `node_title_type` (`title`,`type`(4)),
  KEY `node_type` (`type`(4)),
  KEY `uid` (`uid`),
  KEY `tnid` (`tnid`),
  KEY `translate` (`translate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_access`
--

DROP TABLE IF EXISTS `node_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_access` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `realm` varchar(255) NOT NULL DEFAULT '',
  `grant_view` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grant_update` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grant_delete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`,`gid`,`realm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_access`
--

LOCK TABLES `node_access` WRITE;
/*!40000 ALTER TABLE `node_access` DISABLE KEYS */;
INSERT INTO `node_access` VALUES (0,0,'all',1,0,0);
/*!40000 ALTER TABLE `node_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_comment_statistics`
--

DROP TABLE IF EXISTS `node_comment_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_comment_statistics` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_timestamp` int(11) NOT NULL DEFAULT '0',
  `last_comment_name` varchar(60) DEFAULT NULL,
  `last_comment_uid` int(11) NOT NULL DEFAULT '0',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`),
  KEY `node_comment_timestamp` (`last_comment_timestamp`),
  KEY `comment_count` (`comment_count`),
  KEY `last_comment_uid` (`last_comment_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_comment_statistics`
--

LOCK TABLES `node_comment_statistics` WRITE;
/*!40000 ALTER TABLE `node_comment_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `node_comment_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_counter`
--

DROP TABLE IF EXISTS `node_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_counter` (
  `nid` int(11) NOT NULL DEFAULT '0',
  `totalcount` bigint(20) unsigned NOT NULL DEFAULT '0',
  `daycount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_counter`
--

LOCK TABLES `node_counter` WRITE;
/*!40000 ALTER TABLE `node_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `node_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_revisions`
--

DROP TABLE IF EXISTS `node_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_revisions` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `body` longtext NOT NULL,
  `teaser` longtext NOT NULL,
  `log` longtext NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `format` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_revisions`
--

LOCK TABLES `node_revisions` WRITE;
/*!40000 ALTER TABLE `node_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `node_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_type`
--

DROP TABLE IF EXISTS `node_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_type` (
  `type` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `module` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `help` mediumtext NOT NULL,
  `has_title` tinyint(3) unsigned NOT NULL,
  `title_label` varchar(255) NOT NULL DEFAULT '',
  `has_body` tinyint(3) unsigned NOT NULL,
  `body_label` varchar(255) NOT NULL DEFAULT '',
  `min_word_count` smallint(5) unsigned NOT NULL,
  `custom` tinyint(4) NOT NULL DEFAULT '0',
  `modified` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `orig_type` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_type`
--

LOCK TABLES `node_type` WRITE;
/*!40000 ALTER TABLE `node_type` DISABLE KEYS */;
INSERT INTO `node_type` VALUES ('page','Page','node','A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site\'s initial home page.','',1,'Title',1,'Body',0,1,1,0,'page'),('story','Story','node','A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site\'s initial home page, and provides the ability to post comments.','',1,'Title',1,'Body',0,1,1,0,'story');
/*!40000 ALTER TABLE `node_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `perm` longtext,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,1,'access content',0),(2,2,'access comments, access content, post comments, post comments without approval',0);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'anonymous user'),(2,'authenticated user');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semaphore`
--

DROP TABLE IF EXISTS `semaphore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semaphore` (
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `expire` double NOT NULL,
  PRIMARY KEY (`name`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semaphore`
--

LOCK TABLES `semaphore` WRITE;
/*!40000 ALTER TABLE `semaphore` DISABLE KEYS */;
/*!40000 ALTER TABLE `semaphore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `uid` int(10) unsigned NOT NULL,
  `sid` varchar(64) NOT NULL DEFAULT '',
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `cache` int(11) NOT NULL DEFAULT '0',
  `session` longtext,
  PRIMARY KEY (`sid`),
  KEY `timestamp` (`timestamp`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,'2r8pvva504tleimtup7u926ls4','127.0.0.1',1347884244,0,'islandora_soapcookies|N;updates_remaining|a:0:{}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system`
--

DROP TABLE IF EXISTS `system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system` (
  `filename` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `owner` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `throttle` tinyint(4) NOT NULL DEFAULT '0',
  `bootstrap` int(11) NOT NULL DEFAULT '0',
  `schema_version` smallint(6) NOT NULL DEFAULT '-1',
  `weight` int(11) NOT NULL DEFAULT '0',
  `info` text,
  PRIMARY KEY (`filename`),
  KEY `modules` (`type`(12),`status`,`weight`,`filename`),
  KEY `bootstrap` (`type`(12),`status`,`bootstrap`,`weight`,`filename`),
  KEY `type_name` (`type`(12),`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system`
--

LOCK TABLES `system` WRITE;
/*!40000 ALTER TABLE `system` DISABLE KEYS */;
INSERT INTO `system` VALUES ('modules/aggregator/aggregator.module','aggregator','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:10:\"Aggregator\";s:11:\"description\";s:57:\"Aggregates syndicated content (RSS, RDF, and Atom feeds).\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/block/block.module','block','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:5:\"Block\";s:11:\"description\";s:62:\"Controls the boxes that are displayed around the main content.\";s:7:\"package\";s:15:\"Core - required\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/blog/blog.module','blog','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Blog\";s:11:\"description\";s:69:\"Enables keeping easily and regularly updated user web pages or blogs.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/blogapi/blogapi.module','blogapi','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:8:\"Blog API\";s:11:\"description\";s:79:\"Allows users to post content using applications that support XML-RPC blog APIs.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/book/book.module','book','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Book\";s:11:\"description\";s:63:\"Allows users to structure site pages in a hierarchy or outline.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/color/color.module','color','module','',1,0,0,6001,0,'a:10:{s:4:\"name\";s:5:\"Color\";s:11:\"description\";s:61:\"Allows the user to change the color scheme of certain themes.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/comment/comment.module','comment','module','',1,0,0,6005,0,'a:10:{s:4:\"name\";s:7:\"Comment\";s:11:\"description\";s:57:\"Allows users to comment on and discuss published content.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/contact/contact.module','contact','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:7:\"Contact\";s:11:\"description\";s:61:\"Enables the use of both personal and site-wide contact forms.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/dblog/dblog.module','dblog','module','',1,0,0,6000,0,'a:10:{s:4:\"name\";s:16:\"Database logging\";s:11:\"description\";s:47:\"Logs and records system events to the database.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/filter/filter.module','filter','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:6:\"Filter\";s:11:\"description\";s:60:\"Handles the filtering of content in preparation for display.\";s:7:\"package\";s:15:\"Core - required\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/forum/forum.module','forum','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:5:\"Forum\";s:11:\"description\";s:50:\"Enables threaded discussions about general topics.\";s:12:\"dependencies\";a:2:{i:0;s:8:\"taxonomy\";i:1;s:7:\"comment\";}s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/help/help.module','help','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:4:\"Help\";s:11:\"description\";s:35:\"Manages the display of online help.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/locale/locale.module','locale','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:6:\"Locale\";s:11:\"description\";s:119:\"Adds language handling functionality and enables the translation of the user interface to languages other than English.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/menu/menu.module','menu','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:4:\"Menu\";s:11:\"description\";s:60:\"Allows administrators to customize the site navigation menu.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/node/node.module','node','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:4:\"Node\";s:11:\"description\";s:66:\"Allows content to be submitted to the site and displayed on pages.\";s:7:\"package\";s:15:\"Core - required\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/openid/openid.module','openid','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:6:\"OpenID\";s:11:\"description\";s:48:\"Allows users to log into your site using OpenID.\";s:7:\"version\";s:4:\"6.26\";s:7:\"package\";s:15:\"Core - optional\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/path/path.module','path','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Path\";s:11:\"description\";s:28:\"Allows users to rename URLs.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/php/php.module','php','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:10:\"PHP filter\";s:11:\"description\";s:50:\"Allows embedded PHP code/snippets to be evaluated.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/ping/ping.module','ping','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Ping\";s:11:\"description\";s:51:\"Alerts other sites when your site has been updated.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/poll/poll.module','poll','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:4:\"Poll\";s:11:\"description\";s:95:\"Allows your site to capture votes on different topics in the form of multiple choice questions.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/profile/profile.module','profile','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:7:\"Profile\";s:11:\"description\";s:36:\"Supports configurable user profiles.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/search/search.module','search','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:6:\"Search\";s:11:\"description\";s:36:\"Enables site-wide keyword searching.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/statistics/statistics.module','statistics','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:10:\"Statistics\";s:11:\"description\";s:37:\"Logs access statistics for your site.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/syslog/syslog.module','syslog','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:6:\"Syslog\";s:11:\"description\";s:41:\"Logs and records system events to syslog.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/system/system.module','system','module','',1,0,0,6055,0,'a:10:{s:4:\"name\";s:6:\"System\";s:11:\"description\";s:54:\"Handles general site configuration for administrators.\";s:7:\"package\";s:15:\"Core - required\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/taxonomy/taxonomy.module','taxonomy','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:8:\"Taxonomy\";s:11:\"description\";s:38:\"Enables the categorization of content.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/throttle/throttle.module','throttle','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:8:\"Throttle\";s:11:\"description\";s:66:\"Handles the auto-throttling mechanism, to control site congestion.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/tracker/tracker.module','tracker','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:7:\"Tracker\";s:11:\"description\";s:43:\"Enables tracking of recent posts for users.\";s:12:\"dependencies\";a:1:{i:0;s:7:\"comment\";}s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/translation/translation.module','translation','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:19:\"Content translation\";s:11:\"description\";s:57:\"Allows content to be translated into different languages.\";s:12:\"dependencies\";a:1:{i:0;s:6:\"locale\";}s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/trigger/trigger.module','trigger','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:7:\"Trigger\";s:11:\"description\";s:90:\"Enables actions to be fired on certain system events, such as when new content is created.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/update/update.module','update','module','',1,0,0,6000,0,'a:10:{s:4:\"name\";s:13:\"Update status\";s:11:\"description\";s:88:\"Checks the status of available updates for Drupal and your installed modules and themes.\";s:7:\"version\";s:4:\"6.26\";s:7:\"package\";s:15:\"Core - optional\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/upload/upload.module','upload','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:6:\"Upload\";s:11:\"description\";s:51:\"Allows users to upload and attach files to content.\";s:7:\"package\";s:15:\"Core - optional\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('modules/user/user.module','user','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:4:\"User\";s:11:\"description\";s:47:\"Manages the user registration and login system.\";s:7:\"package\";s:15:\"Core - required\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/smtp/phpmailer/phpmailer.module','phpmailer','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:9:\"PHPMailer\";s:11:\"description\";s:58:\"Integrates the PHPMailer library for SMTP e-mail delivery.\";s:7:\"package\";s:4:\"Mail\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.2\";s:7:\"project\";s:9:\"phpmailer\";s:9:\"datestamp\";s:10:\"1278512108\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/all/modules/smtp/smtp.module','smtp','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:27:\"SMTP Authentication Support\";s:11:\"description\";s:72:\"Allows the sending of site e-mail through an SMTP server of your choice.\";s:4:\"core\";s:3:\"6.x\";s:7:\"package\";s:4:\"Mail\";s:3:\"php\";s:5:\"4.0.0\";s:7:\"version\";s:13:\"6.x-1.0-beta5\";s:7:\"project\";s:4:\"smtp\";s:9:\"datestamp\";s:10:\"1280945778\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}}'),('sites/default/modules/Aboutus/Aboutus.module','Aboutus','module','',0,0,0,-1,0,'a:7:{s:4:\"name\";s:8:\"About us\";s:11:\"description\";s:29:\"About us page for the Stacks.\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/admin_menu/admin_menu.module','admin_menu','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:19:\"Administration menu\";s:11:\"description\";s:123:\"Provides a dropdown menu to most administrative tasks and other common destinations (to users with the proper permissions).\";s:7:\"package\";s:14:\"Administration\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.8\";s:7:\"project\";s:10:\"admin_menu\";s:9:\"datestamp\";s:10:\"1308238014\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/advanced_help/advanced_help.module','advanced_help','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:13:\"Advanced help\";s:11:\"description\";s:38:\"Allow advanced help and documentation.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:13:\"advanced_help\";s:9:\"datestamp\";s:10:\"1238954409\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/advanced_help/help_example/help_example.module','help_example','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:21:\"Advanced help example\";s:11:\"description\";s:62:\"A example help module to demonstrate the advanced help module.\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:1:{i:0;s:13:\"advanced_help\";}s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:13:\"advanced_help\";s:9:\"datestamp\";s:10:\"1238954409\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/apachesolr_facetbuilder/apachesolr_facetbuilder.module','apachesolr_facetbuilder','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:25:\"Apache Solr Facet Builder\";s:11:\"description\";s:56:\"Build custom Solr search facets with the UI using Views.\";s:12:\"dependencies\";a:2:{i:0;s:10:\"apachesolr\";i:1;s:5:\"views\";}s:7:\"package\";s:11:\"Apache Solr\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:11:\"6.x-1.x-dev\";s:7:\"project\";s:23:\"apachesolr_facetbuilder\";s:9:\"datestamp\";s:10:\"1298618838\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/Authors/Authors.module','Authors','module','',0,0,0,-1,0,'a:7:{s:4:\"name\";s:7:\"Authors\";s:11:\"description\";s:24:\"Shows a list of Authors.\";s:12:\"dependencies\";a:1:{i:0;s:17:\"fedora_repository\";}s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/Collections/Collections.module','Collections','module','',0,0,0,-1,0,'a:7:{s:4:\"name\";s:11:\"Collections\";s:12:\"dependencies\";a:1:{i:0;s:17:\"fedora_repository\";}s:11:\"description\";s:32:\"Collections page for the Stacks.\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/common/common.module','common','module','',0,0,0,-1,0,'a:7:{s:4:\"name\";s:12:\"common files\";s:11:\"description\";s:53:\"This module contains files used by different modules.\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/Contactus/Contactus.module','Contactus','module','',0,0,0,-1,0,'a:7:{s:4:\"name\";s:18:\"Contact CDC Stacks\";s:11:\"description\";s:31:\"Contact us page for the Stacks.\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/emic_cwrc/emic_cwrc.module','emic_cwrc','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:24:\"Emic CWRC Implementation\";s:11:\"description\";s:41:\"Adds access to CWRCWriter annotation tool\";s:12:\"dependencies\";a:2:{i:0;s:17:\"fedora_repository\";i:1;s:14:\"islandora_book\";}s:7:\"package\";s:10:\"Emic Tools\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/fedora_repository/fedora_repository.module','fedora_repository','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:20:\"Islandora Repository\";s:12:\"dependencies\";a:3:{i:0;s:8:\"imageapi\";i:1;s:4:\"tabs\";i:2;s:29:\"islandora_content_model_forms\";}s:11:\"description\";s:45:\"Shows a list of items in a fedora collection.\";s:7:\"package\";s:9:\"Islandora\";s:7:\"version\";s:10:\"6.x-12.2.0\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/fedora_repository/plugins/fedora_imageapi.module','fedora_imageapi','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:15:\"Fedora ImageAPI\";s:11:\"description\";s:56:\"Adds image manipulation support through a REST interface\";s:7:\"package\";s:22:\"Islandora Dependencies\";s:12:\"dependencies\";a:2:{i:0;s:17:\"fedora_repository\";i:1;s:8:\"imageapi\";}s:7:\"version\";s:10:\"6.x-12.2.0\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/filefield_paths/filefield_paths.module','filefield_paths','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:15:\"FileField Paths\";s:11:\"description\";s:68:\"Adds improved Token based file sorting and renaming functionalities.\";s:12:\"dependencies\";a:1:{i:0;s:5:\"token\";}s:7:\"package\";s:15:\"FileField Paths\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.4\";s:7:\"project\";s:15:\"filefield_paths\";s:9:\"datestamp\";s:10:\"1263190506\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/globalredirect/globalredirect.module','globalredirect','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:15:\"Global Redirect\";s:11:\"description\";s:129:\"Searches for an alias of the current URL and 301 redirects if found. Stops duplicate content arising when path module is enabled.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.5\";s:7:\"project\";s:14:\"globalredirect\";s:9:\"datestamp\";s:10:\"1339752680\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/gsearch/gsearch.module','gsearch','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:7:\"gsearch\";s:12:\"dependencies\";a:2:{i:0;s:17:\"fedora_repository\";i:1;s:21:\"islandora_solr_search\";}s:11:\"description\";s:21:\"searches a solr index\";s:7:\"package\";s:16:\"Islandora Search\";s:7:\"version\";s:4:\"11.3\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/image/contrib/image_attach/image_attach.module','image_attach','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:12:\"Image Attach\";s:11:\"description\";s:60:\"Allows easy attaching of image nodes to other content types.\";s:7:\"package\";s:5:\"Image\";s:12:\"dependencies\";a:1:{i:0;s:5:\"image\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:5:\"image\";s:9:\"datestamp\";s:10:\"1332228655\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/image/contrib/image_gallery/image_gallery.module','image_gallery','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:13:\"Image Gallery\";s:11:\"description\";s:69:\"Allows sorting and displaying of image galleries based on categories.\";s:7:\"package\";s:5:\"Image\";s:12:\"dependencies\";a:2:{i:0;s:5:\"image\";i:1;s:8:\"taxonomy\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:5:\"image\";s:9:\"datestamp\";s:10:\"1332228655\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/image/contrib/image_import/image_import.module','image_import','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:12:\"Image Import\";s:11:\"description\";s:71:\"Allows batches of images to be imported from a directory on the server.\";s:7:\"package\";s:5:\"Image\";s:12:\"dependencies\";a:1:{i:0;s:5:\"image\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:5:\"image\";s:9:\"datestamp\";s:10:\"1332228655\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/image/contrib/image_im_advanced/image_im_advanced.module','image_im_advanced','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:28:\"ImageMagick Advanced Options\";s:11:\"description\";s:55:\"Adds advanced options to the ImageMagick image toolkit.\";s:7:\"package\";s:5:\"Image\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:5:\"image\";s:9:\"datestamp\";s:10:\"1332228655\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/image/image.module','image','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:5:\"Image\";s:11:\"description\";s:49:\"Allows uploading, resizing and viewing of images.\";s:7:\"package\";s:5:\"Image\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.2\";s:7:\"project\";s:5:\"image\";s:9:\"datestamp\";s:10:\"1332228655\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/imageapi/imageapi.module','imageapi','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:8:\"ImageAPI\";s:11:\"description\";s:38:\"ImageAPI supporting multiple toolkits.\";s:7:\"package\";s:10:\"ImageCache\";s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.1\";s:7:\"version\";s:8:\"6.x-1.10\";s:7:\"project\";s:8:\"imageapi\";s:9:\"datestamp\";s:10:\"1305563215\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}}'),('sites/default/modules/imageapi/imageapi_gd.module','imageapi_gd','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:12:\"ImageAPI GD2\";s:11:\"description\";s:49:\"Uses PHP\'s built-in GD2 image processing support.\";s:7:\"package\";s:10:\"ImageCache\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.10\";s:7:\"project\";s:8:\"imageapi\";s:9:\"datestamp\";s:10:\"1305563215\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/imageapi/imageapi_imagemagick.module','imageapi_imagemagick','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:20:\"ImageAPI ImageMagick\";s:11:\"description\";s:33:\"Command Line ImageMagick support.\";s:7:\"package\";s:10:\"ImageCache\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.10\";s:7:\"project\";s:8:\"imageapi\";s:9:\"datestamp\";s:10:\"1305563215\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/imce/imce.module','imce','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:4:\"IMCE\";s:11:\"description\";s:82:\"An image/file uploader and browser supporting personal directories and user quota.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.3\";s:7:\"project\";s:4:\"imce\";s:9:\"datestamp\";s:10:\"1319104233\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/imce_wysiwyg/imce_wysiwyg.module','imce_wysiwyg','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:23:\"IMCE Wysiwyg API bridge\";s:11:\"description\";s:82:\"Makes IMCE available as plugin for client-side editors integrated via Wysiwyg API.\";s:7:\"package\";s:14:\"User interface\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:2:{i:0;s:4:\"imce\";i:1;s:7:\"wysiwyg\";}s:7:\"version\";s:7:\"6.x-1.1\";s:7:\"project\";s:12:\"imce_wysiwyg\";s:9:\"datestamp\";s:10:\"1268433606\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/islandora_batch_ingest/islandora_batch_ingest.module','islandora_batch_ingest','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:22:\"Islandora Batch Ingest\";s:11:\"description\";s:52:\"Adds tab to Collection View allowing batch ingestion\";s:12:\"dependencies\";a:1:{i:0;s:17:\"fedora_repository\";}s:7:\"package\";s:15:\"Islandora Tools\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:10:\"6.x-12.1.0\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/islandora_bookreader/islandora_bookviewer.module','islandora_bookviewer','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:20:\"islandora_bookviewer\";s:12:\"dependencies\";a:3:{i:0;s:17:\"fedora_repository\";i:1;s:4:\"tabs\";i:2;s:21:\"islandora_solr_search\";}s:11:\"description\";s:57:\"Islandora Bookviewer based on the archive.org bookviewer.\";s:7:\"package\";s:9:\"Islandora\";s:7:\"version\";s:10:\"6.x-12.2.0\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/islandora_bookreader/solr/islandora_bookviewer_search.module','islandora_bookviewer_search','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:35:\"Islandora Bookviewer customizations\";s:11:\"description\";s:32:\"Customizes Islandora solr search\";s:12:\"dependencies\";a:1:{i:0;s:21:\"islandora_solr_search\";}s:7:\"package\";s:16:\"Islandora Search\";s:7:\"version\";s:10:\"6.x-12.2.0\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/islandora_collection_manager/islandora_collection_manager.module','islandora_collection_manager','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:28:\"Islandora Collection Manager\";s:11:\"description\";s:44:\"Provides additional tabs in Collection views\";s:12:\"dependencies\";a:1:{i:0;s:17:\"fedora_repository\";}s:7:\"package\";s:15:\"Islandora Tools\";s:7:\"version\";s:10:\"6.x-12.2.0\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/islandora_content_model_forms/islandora_content_model_forms.module','islandora_content_model_forms','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:29:\"Islandora Content Model Forms\";s:11:\"description\";s:58:\"Defines associations between XML Forms and Content Models.\";s:12:\"dependencies\";a:1:{i:0;s:9:\"xml_forms\";}s:7:\"package\";s:22:\"Islandora Dependencies\";s:7:\"version\";s:10:\"6.x-12.2.0\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/islandora_solr_search/extended_search_form/islandora_extended_search_form.module','islandora_extended_search_form','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:25:\"Islandora Extended Search\";s:12:\"dependencies\";a:2:{i:0;s:21:\"islandora_solr_search\";i:1;s:7:\"php_lib\";}s:11:\"description\";s:35:\"An improved \'Advanced Search\' form.\";s:7:\"package\";s:16:\"Islandora Search\";s:7:\"version\";s:10:\"6.x-12.2.0\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/islandora_solr_search/islandora_solr_config/islandora_solr_config.module','islandora_solr_config','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:35:\"Islandora Solr Sample Configuration\";s:11:\"description\";s:32:\"Customizes Islandora solr search\";s:12:\"dependencies\";a:1:{i:0;s:21:\"islandora_solr_search\";}s:7:\"package\";s:16:\"Islandora Search\";s:7:\"version\";s:10:\"6.x-12.2.0\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/islandora_solr_search/islandora_solr_search.module','islandora_solr_search','module','',1,0,1,6000,0,'a:8:{s:4:\"name\";s:21:\"Islandora Solr Search\";s:12:\"dependencies\";a:1:{i:0;s:17:\"fedora_repository\";}s:11:\"description\";s:21:\"searches a solr index\";s:7:\"package\";s:16:\"Islandora Search\";s:7:\"version\";s:10:\"6.x-12.2.0\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/islandora_solution_pack_audio/islandora_solution_pack_audio/islandora_audio_sp.module','islandora_audio_sp','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:29:\"Islandora Audio Solution Pack\";s:11:\"description\";s:66:\"Islandora configurations for persisting and retrieving audio files\";s:12:\"dependencies\";a:4:{i:0;s:17:\"fedora_repository\";i:1;s:8:\"swftools\";i:2;s:12:\"swftools_jw5\";i:3;s:19:\"swftools_swfobject2\";}s:7:\"package\";s:23:\"Islandora Solution Pack\";s:7:\"version\";s:10:\"6.x-12.1.0\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/islandora_solution_pack_book/islandora_solution_pack_book/islandora_book.module','islandora_book','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:28:\"Islandora Book Solution Pack\";s:11:\"description\";s:23:\"Provides book interface\";s:7:\"package\";s:23:\"Islandora Solution Pack\";s:12:\"dependencies\";a:5:{i:0;s:17:\"fedora_repository\";i:1;s:9:\"xml_forms\";i:2;s:29:\"islandora_content_model_forms\";i:3;s:28:\"islandora_collection_manager\";i:4;s:20:\"islandora_bookviewer\";}s:7:\"version\";s:10:\"6.x-12.2.0\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/islandora_solution_pack_book/islandora_solution_pack_book/migration_tools/migrate_books.module','migrate_books','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:13:\"Migrate Books\";s:11:\"description\";s:63:\"Will safely add new isPageOf and isPageNumber to existing books\";s:12:\"dependencies\";a:2:{i:0;s:17:\"fedora_repository\";i:1;s:14:\"islandora_book\";}s:7:\"package\";s:9:\"Islandora\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/islandora_solution_pack_image/islandora_solution_pack_image/islandora_image_sp.module','islandora_image_sp','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:35:\"Islandora Basic image Solution Pack\";s:11:\"description\";s:67:\"Islandora configurations for persisting and retrieving basic images\";s:12:\"dependencies\";a:2:{i:0;s:17:\"fedora_repository\";i:1;s:20:\"imageapi_imagemagick\";}s:7:\"package\";s:23:\"Islandora Solution Pack\";s:7:\"version\";s:10:\"6.x-12.2.0\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/islandora_solution_pack_large_image/islandora_solution_pack_large_image/islandora_large_image_sp.module','islandora_large_image_sp','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:35:\"Islandora Large Image Solution Pack\";s:11:\"description\";s:67:\"Islandora configurations for persisting and retrieving large images\";s:12:\"dependencies\";a:1:{i:0;s:17:\"fedora_repository\";}s:7:\"package\";s:23:\"Islandora Solution Pack\";s:7:\"version\";s:10:\"6.x-12.2.0\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/islandora_solution_pack_pdf/islandora_pdf_sp.module','islandora_pdf_sp','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:27:\"Islandora PDF Solution Pack\";s:11:\"description\";s:64:\"Islandora configurations for persisting and retrieving pdf files\";s:12:\"dependencies\";a:1:{i:0;s:17:\"fedora_repository\";}s:7:\"package\";s:23:\"Islandora Solution Pack\";s:7:\"version\";s:10:\"6.x-12.1.0\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/islandora_solution_pack_video/islandora_solution_pack_video/islandora_video_sp.module','islandora_video_sp','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:29:\"Islandora Video Solution Pack\";s:11:\"description\";s:66:\"Islandora configurations for persisting and displaying video files\";s:12:\"dependencies\";a:2:{i:0;s:17:\"fedora_repository\";i:1;s:8:\"swftools\";}s:7:\"package\";s:23:\"Islandora Solution Pack\";s:7:\"version\";s:10:\"6.x-12.1.0\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/islandora_xml_forms/api/schema/xml_schema_api.module','xml_schema_api','module','',1,0,0,0,0,'a:9:{s:4:\"name\";s:24:\"Islandora XML Schema API\";s:11:\"description\";s:102:\"Provides functions and classes that allow for effective use of information stored within XML Schema\'s.\";s:5:\"files\";a:1:{i:0;s:17:\"tests/Schema.test\";}s:12:\"dependencies\";a:1:{i:0;s:7:\"php_lib\";}s:7:\"package\";s:22:\"Islandora Dependencies\";s:7:\"version\";s:10:\"6.x-12.2.0\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/islandora_xml_forms/api/xml_form_api.module','xml_form_api','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:22:\"Islandora XML Form API\";s:11:\"description\";s:90:\"Generates Drupal Forms from an XML definition. Create/Edit XML documents via Drupal forms.\";s:7:\"package\";s:22:\"Islandora Dependencies\";s:12:\"dependencies\";a:2:{i:0;s:15:\"objective_forms\";i:1;s:14:\"xml_schema_api\";}s:7:\"version\";s:10:\"6.x-12.2.0\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/islandora_xml_forms/builder/xml_form_builder.module','xml_form_builder','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:26:\"Islandora XML Form Builder\";s:11:\"description\";s:86:\"Provides an interface for Creating/Editing/Copying/Deleting/Exporting XML Based Forms.\";s:7:\"package\";s:15:\"Islandora Tools\";s:12:\"dependencies\";a:1:{i:0;s:12:\"xml_form_api\";}s:7:\"version\";s:10:\"6.x-12.2.0\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/islandora_xml_forms/elements/xml_form_elements.module','xml_form_elements','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:27:\"Islandora XML Form Elements\";s:11:\"description\";s:65:\"Defines custom elements to be used in conjunction with XML Forms.\";s:7:\"package\";s:22:\"Islandora Dependencies\";s:12:\"dependencies\";a:3:{i:0;s:12:\"xml_form_api\";i:1;s:13:\"jquery_update\";i:2;s:9:\"jquery_ui\";}s:7:\"version\";s:10:\"6.x-12.2.0\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/islandora_xml_forms/xml_forms.module','xml_forms','module','',1,0,0,0,0,'a:8:{s:4:\"name\";s:19:\"Islandora XML Forms\";s:11:\"description\";s:77:\"Build/Store/Render drupal forms that allow for the manipulation of XML files.\";s:12:\"dependencies\";a:3:{i:0;s:12:\"xml_form_api\";i:1;s:16:\"xml_form_builder\";i:2;s:17:\"xml_form_elements\";}s:7:\"package\";s:15:\"Islandora Tools\";s:7:\"version\";s:10:\"6.x-12.2.0\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/jquery_ui/jquery_ui.module','jquery_ui','module','',1,0,0,0,0,'a:10:{s:4:\"name\";s:9:\"jQuery UI\";s:11:\"description\";s:55:\"Provides the jQuery UI plug-in to other Drupal modules.\";s:7:\"package\";s:14:\"User interface\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-1.5\";s:7:\"project\";s:9:\"jquery_ui\";s:9:\"datestamp\";s:10:\"1308323216\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/jquery_update/jquery_update.module','jquery_update','module','',1,0,0,6200,99,'a:10:{s:4:\"name\";s:13:\"jQuery Update\";s:11:\"description\";s:51:\"Updates Drupal to use the latest version of jQuery.\";s:7:\"package\";s:14:\"User interface\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:14:\"6.x-2.0-alpha1\";s:7:\"project\";s:13:\"jquery_update\";s:9:\"datestamp\";s:10:\"1272041110\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/objective_forms/objective_forms.module','objective_forms','module','',1,0,0,0,0,'a:9:{s:4:\"name\";s:15:\"Objective Forms\";s:11:\"description\";s:80:\"Provides functions and classes that allow Drupal Forms to be treated as objects.\";s:5:\"files\";a:1:{i:0;s:15:\"tests/form.test\";}s:12:\"dependencies\";a:1:{i:0;s:7:\"php_lib\";}s:7:\"package\";s:22:\"Islandora Dependencies\";s:7:\"version\";s:10:\"6.x-12.1.0\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/ObjectView/ObjectView.module','ObjectView','module','',0,0,0,-1,0,'a:7:{s:4:\"name\";s:10:\"ObjectView\";s:11:\"description\";s:33:\"Display the Document Detail page.\";s:12:\"dependencies\";a:1:{i:0;s:17:\"fedora_repository\";}s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/og/modules/og_access/og_access.module','og_access','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:29:\"Organic groups access control\";s:11:\"description\";s:59:\"Enable access control for private posts and private groups.\";s:7:\"package\";s:14:\"Organic groups\";s:12:\"dependencies\";a:1:{i:0;s:2:\"og\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.3\";s:7:\"project\";s:2:\"og\";s:9:\"datestamp\";s:10:\"1332958249\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/og/modules/og_actions/og_actions.module','og_actions','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:22:\"Organic groups actions\";s:11:\"description\";s:57:\"Provides actions for use with Organic Groups and Trigger.\";s:7:\"package\";s:14:\"Organic groups\";s:12:\"dependencies\";a:1:{i:0;s:2:\"og\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.3\";s:7:\"project\";s:2:\"og\";s:9:\"datestamp\";s:10:\"1332958249\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/og/modules/og_notifications/og_notifications.module','og_notifications','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:28:\"Organic Groups Notifications\";s:11:\"description\";s:69:\"Allows users to receive notifications and subscribe to group content.\";s:7:\"package\";s:14:\"Organic groups\";s:12:\"dependencies\";a:6:{i:0;s:2:\"og\";i:1;s:13:\"notifications\";i:2;s:21:\"notifications_content\";i:3;s:18:\"notifications_lite\";i:4;s:9:\"messaging\";i:5;s:5:\"token\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.3\";s:7:\"project\";s:2:\"og\";s:9:\"datestamp\";s:10:\"1332958249\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/og/modules/og_views/og_views.module','og_views','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:32:\"Organic groups Views integration\";s:11:\"description\";s:85:\"<strong>Highly recommended.</strong>. Use Views to search and display organic groups.\";s:7:\"package\";s:14:\"Organic groups\";s:12:\"dependencies\";a:2:{i:0;s:2:\"og\";i:1;s:5:\"views\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.3\";s:7:\"project\";s:2:\"og\";s:9:\"datestamp\";s:10:\"1332958249\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/og/og.module','og','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:14:\"Organic groups\";s:11:\"description\";s:106:\"Enable users to create and manage groups.  OG Views integration module is recommended for best experience.\";s:7:\"package\";s:14:\"Organic groups\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.3\";s:7:\"project\";s:2:\"og\";s:9:\"datestamp\";s:10:\"1332958249\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/onthisdate/onthisdate.module','onthisdate','module','',0,0,0,-1,0,'a:7:{s:4:\"name\";s:12:\"On this date\";s:11:\"description\";s:64:\"A block module that lists links to content created one week ago.\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/php_lib/php_lib.module','php_lib','module','',1,0,0,0,0,'a:9:{s:4:\"name\";s:7:\"PHP Lib\";s:11:\"description\";s:95:\"A collection of interfaces classes and functions that can be used in a variety of environments.\";s:5:\"files\";a:1:{i:0;s:16:\"tests/Array.test\";}s:7:\"version\";s:10:\"6.x-12.2.0\";s:7:\"package\";s:22:\"Islandora Dependencies\";s:4:\"core\";s:3:\"6.x\";s:3:\"php\";s:3:\"5.2\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}}'),('sites/default/modules/RecentAdditions/RecentAdditions.module','RecentAdditions','module','',0,0,0,-1,0,'a:7:{s:4:\"name\";s:16:\"Recent Additions\";s:12:\"dependencies\";a:1:{i:0;s:17:\"fedora_repository\";}s:11:\"description\";s:37:\"Recent Additions page for the Stacks.\";s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/tabs/docs/tabsexample.module','tabsexample','module','',0,0,0,-1,0,'a:8:{s:4:\"name\";s:12:\"Tabs Example\";s:11:\"description\";s:71:\"An example tabs implementation. Access the sample tabs at /tabsexample.\";s:7:\"package\";s:14:\"User Interface\";s:12:\"dependencies\";a:1:{i:0;s:4:\"tabs\";}s:4:\"core\";s:3:\"6.x\";s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/tabs/tabs.module','tabs','module','',1,0,0,6000,0,'a:7:{s:4:\"name\";s:4:\"Tabs\";s:11:\"description\";s:42:\"A helper module for creating tabbed pages.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:10:\"6.x-12.2.0\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/token/tests/token_test.module','token_test','module','',0,0,0,-1,0,'a:12:{s:4:\"name\";s:10:\"Token Test\";s:11:\"description\";s:39:\"Testing module for token functionality.\";s:7:\"package\";s:7:\"Testing\";s:4:\"core\";s:3:\"6.x\";s:5:\"files\";a:1:{i:0;s:17:\"token_test.module\";}s:6:\"hidden\";b:1;s:7:\"version\";s:8:\"6.x-1.18\";s:7:\"project\";s:5:\"token\";s:9:\"datestamp\";s:10:\"1320336935\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/token/token.module','token','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:5:\"Token\";s:11:\"description\";s:79:\"Provides a shared API for replacement of textual placeholders with actual data.\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.18\";s:7:\"project\";s:5:\"token\";s:9:\"datestamp\";s:10:\"1320336935\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/token/tokenSTARTER.module','tokenSTARTER','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:12:\"TokenSTARTER\";s:11:\"description\";s:72:\"Provides additional tokens and a base on which to build your own tokens.\";s:12:\"dependencies\";a:1:{i:0;s:5:\"token\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.18\";s:7:\"project\";s:5:\"token\";s:9:\"datestamp\";s:10:\"1320336935\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/token/token_actions.module','token_actions','module','',0,0,0,-1,0,'a:9:{s:4:\"name\";s:13:\"Token actions\";s:11:\"description\";s:73:\"Provides enhanced versions of core Drupal actions using the Token module.\";s:12:\"dependencies\";a:1:{i:0;s:5:\"token\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-1.18\";s:7:\"project\";s:5:\"token\";s:9:\"datestamp\";s:10:\"1320336935\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/views/views.module','views','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:5:\"Views\";s:11:\"description\";s:55:\"Create customized lists and queries from your database.\";s:7:\"package\";s:5:\"Views\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-2.16\";s:7:\"project\";s:5:\"views\";s:9:\"datestamp\";s:10:\"1321305946\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/views/views_export/views_export.module','views_export','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:14:\"Views exporter\";s:11:\"description\";s:40:\"Allows exporting multiple views at once.\";s:7:\"package\";s:5:\"Views\";s:12:\"dependencies\";a:1:{i:0;s:5:\"views\";}s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:8:\"6.x-2.16\";s:7:\"project\";s:5:\"views\";s:9:\"datestamp\";s:10:\"1321305946\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/views/views_ui.module','views_ui','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:8:\"Views UI\";s:11:\"description\";s:93:\"Administrative interface to views. Without this module, you cannot create or edit your views.\";s:7:\"package\";s:5:\"Views\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:1:{i:0;s:5:\"views\";}s:7:\"version\";s:8:\"6.x-2.16\";s:7:\"project\";s:5:\"views\";s:9:\"datestamp\";s:10:\"1321305946\";s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/Welcome/Welcome.module','Welcome','module','',0,0,0,-1,0,'a:7:{s:4:\"name\";s:12:\"Welcome Page\";s:11:\"description\";s:28:\"The Welcome page for Stacks.\";s:4:\"core\";s:3:\"6.x\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:7:\"version\";N;s:3:\"php\";s:5:\"4.3.5\";}'),('sites/default/modules/wysiwyg/wysiwyg.module','wysiwyg','module','',0,0,0,-1,0,'a:10:{s:4:\"name\";s:7:\"Wysiwyg\";s:11:\"description\";s:55:\"Allows users to edit contents with client-side editors.\";s:7:\"package\";s:14:\"User interface\";s:4:\"core\";s:3:\"6.x\";s:7:\"version\";s:7:\"6.x-2.4\";s:7:\"project\";s:7:\"wysiwyg\";s:9:\"datestamp\";s:10:\"1308450722\";s:12:\"dependencies\";a:0:{}s:10:\"dependents\";a:0:{}s:3:\"php\";s:5:\"4.3.5\";}'),('themes/bluemarine/bluemarine.info','bluemarine','theme','themes/engines/phptemplate/phptemplate.engine',0,0,0,-1,0,'a:13:{s:4:\"name\";s:10:\"Bluemarine\";s:11:\"description\";s:66:\"Table-based multi-column theme with a marine and ash color scheme.\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:27:\"themes/bluemarine/style.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:27:\"themes/bluemarine/script.js\";}s:10:\"screenshot\";s:32:\"themes/bluemarine/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}'),('themes/chameleon/chameleon.info','chameleon','theme','themes/chameleon/chameleon.theme',0,0,0,-1,0,'a:12:{s:4:\"name\";s:9:\"Chameleon\";s:11:\"description\";s:42:\"Minimalist tabled theme with light colors.\";s:7:\"regions\";a:2:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";}s:8:\"features\";a:4:{i:0;s:4:\"logo\";i:1;s:7:\"favicon\";i:2;s:4:\"name\";i:3;s:6:\"slogan\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:2:{s:9:\"style.css\";s:26:\"themes/chameleon/style.css\";s:10:\"common.css\";s:27:\"themes/chameleon/common.css\";}}s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:7:\"scripts\";a:1:{s:9:\"script.js\";s:26:\"themes/chameleon/script.js\";}s:10:\"screenshot\";s:31:\"themes/chameleon/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}'),('themes/chameleon/marvin/marvin.info','marvin','theme','',0,0,0,-1,0,'a:13:{s:4:\"name\";s:6:\"Marvin\";s:11:\"description\";s:31:\"Boxy tabled theme in all grays.\";s:7:\"regions\";a:2:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";}s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:9:\"chameleon\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:33:\"themes/chameleon/marvin/style.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:33:\"themes/chameleon/marvin/script.js\";}s:10:\"screenshot\";s:38:\"themes/chameleon/marvin/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}'),('themes/garland/garland.info','garland','theme','themes/engines/phptemplate/phptemplate.engine',1,0,0,-1,0,'a:13:{s:4:\"name\";s:7:\"Garland\";s:11:\"description\";s:66:\"Tableless, recolorable, multi-column, fluid width theme (default).\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:11:\"stylesheets\";a:2:{s:3:\"all\";a:1:{s:9:\"style.css\";s:24:\"themes/garland/style.css\";}s:5:\"print\";a:1:{s:9:\"print.css\";s:24:\"themes/garland/print.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:24:\"themes/garland/script.js\";}s:10:\"screenshot\";s:29:\"themes/garland/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}'),('themes/garland/minnelli/minnelli.info','minnelli','theme','themes/engines/phptemplate/phptemplate.engine',0,0,0,-1,0,'a:14:{s:4:\"name\";s:8:\"Minnelli\";s:11:\"description\";s:56:\"Tableless, recolorable, multi-column, fixed width theme.\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:10:\"base theme\";s:7:\"garland\";s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:12:\"minnelli.css\";s:36:\"themes/garland/minnelli/minnelli.css\";}}s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:33:\"themes/garland/minnelli/script.js\";}s:10:\"screenshot\";s:38:\"themes/garland/minnelli/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";s:6:\"engine\";s:11:\"phptemplate\";}'),('themes/pushbutton/pushbutton.info','pushbutton','theme','themes/engines/phptemplate/phptemplate.engine',0,0,0,-1,0,'a:13:{s:4:\"name\";s:10:\"Pushbutton\";s:11:\"description\";s:52:\"Tabled, multi-column theme in blue and orange tones.\";s:7:\"version\";s:4:\"6.26\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1335977158\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:27:\"themes/pushbutton/style.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:27:\"themes/pushbutton/script.js\";}s:10:\"screenshot\";s:32:\"themes/pushbutton/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}'),('themes/stacks/stacks.info','stacks','theme','themes/engines/phptemplate/phptemplate.engine',0,0,0,-1,0,'a:13:{s:4:\"name\";s:6:\"Stacks\";s:11:\"description\";s:10:\"CDC Stacks\";s:7:\"version\";s:4:\"6.22\";s:4:\"core\";s:3:\"6.x\";s:6:\"engine\";s:11:\"phptemplate\";s:7:\"project\";s:6:\"drupal\";s:9:\"datestamp\";s:10:\"1306357015\";s:7:\"regions\";a:5:{s:4:\"left\";s:12:\"Left sidebar\";s:5:\"right\";s:13:\"Right sidebar\";s:7:\"content\";s:7:\"Content\";s:6:\"header\";s:6:\"Header\";s:6:\"footer\";s:6:\"Footer\";}s:8:\"features\";a:10:{i:0;s:20:\"comment_user_picture\";i:1;s:7:\"favicon\";i:2;s:7:\"mission\";i:3;s:4:\"logo\";i:4;s:4:\"name\";i:5;s:17:\"node_user_picture\";i:6;s:6:\"search\";i:7;s:6:\"slogan\";i:8;s:13:\"primary_links\";i:9;s:15:\"secondary_links\";}s:11:\"stylesheets\";a:1:{s:3:\"all\";a:1:{s:9:\"style.css\";s:23:\"themes/stacks/style.css\";}}s:7:\"scripts\";a:1:{s:9:\"script.js\";s:23:\"themes/stacks/script.js\";}s:10:\"screenshot\";s:28:\"themes/stacks/screenshot.png\";s:3:\"php\";s:5:\"4.3.5\";}');
/*!40000 ALTER TABLE `system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_data`
--

DROP TABLE IF EXISTS `term_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_data` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `taxonomy_tree` (`vid`,`weight`,`name`),
  KEY `vid_name` (`vid`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_data`
--

LOCK TABLES `term_data` WRITE;
/*!40000 ALTER TABLE `term_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_hierarchy`
--

DROP TABLE IF EXISTS `term_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_hierarchy` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `parent` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`parent`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_hierarchy`
--

LOCK TABLES `term_hierarchy` WRITE;
/*!40000 ALTER TABLE `term_hierarchy` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_node`
--

DROP TABLE IF EXISTS `term_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_node` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`vid`),
  KEY `vid` (`vid`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_node`
--

LOCK TABLES `term_node` WRITE;
/*!40000 ALTER TABLE `term_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_relation`
--

DROP TABLE IF EXISTS `term_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_relation` (
  `trid` int(11) NOT NULL AUTO_INCREMENT,
  `tid1` int(10) unsigned NOT NULL DEFAULT '0',
  `tid2` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`trid`),
  UNIQUE KEY `tid1_tid2` (`tid1`,`tid2`),
  KEY `tid2` (`tid2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_relation`
--

LOCK TABLES `term_relation` WRITE;
/*!40000 ALTER TABLE `term_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_synonym`
--

DROP TABLE IF EXISTS `term_synonym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_synonym` (
  `tsid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`tsid`),
  KEY `tid` (`tid`),
  KEY `name_tid` (`name`,`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_synonym`
--

LOCK TABLES `term_synonym` WRITE;
/*!40000 ALTER TABLE `term_synonym` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_synonym` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_alias`
--

DROP TABLE IF EXISTS `url_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_alias` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `src` varchar(128) NOT NULL DEFAULT '',
  `dst` varchar(128) NOT NULL DEFAULT '',
  `language` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  UNIQUE KEY `dst_language_pid` (`dst`,`language`,`pid`),
  KEY `src_language_pid` (`src`,`language`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_alias`
--

LOCK TABLES `url_alias` WRITE;
/*!40000 ALTER TABLE `url_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `pass` varchar(32) NOT NULL DEFAULT '',
  `mail` varchar(64) DEFAULT '',
  `mode` tinyint(4) NOT NULL DEFAULT '0',
  `sort` tinyint(4) DEFAULT '0',
  `threshold` tinyint(4) DEFAULT '0',
  `theme` varchar(255) NOT NULL DEFAULT '',
  `signature` varchar(255) NOT NULL DEFAULT '',
  `signature_format` smallint(6) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `login` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(8) DEFAULT NULL,
  `language` varchar(12) NOT NULL DEFAULT '',
  `picture` varchar(255) NOT NULL DEFAULT '',
  `init` varchar(64) DEFAULT '',
  `data` longtext,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`),
  KEY `access` (`access`),
  KEY `created` (`created`),
  KEY `mail` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,'','','',0,0,0,'','',0,0,0,0,0,NULL,'','','',NULL),(1,'${drupal_mysql_db_user}','${durpal_mysql_pw_hash}','${drupal_admin_email}',0,0,0,'','',0,1347394950,1347884235,1347480552,1,NULL,'','','${drupal_admin_email}','a:0:{}');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variable`
--

DROP TABLE IF EXISTS `variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variable` (
  `name` varchar(128) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variable`
--

LOCK TABLES `variable` WRITE;
/*!40000 ALTER TABLE `variable` DISABLE KEYS */;
INSERT INTO `variable` VALUES ('clean_url','s:1:\"1\";'),('comment_page','i:0;'),('cron_last','i:1347643237;'),('css_js_query_string','s:20:\"xVpa0000000000000000\";'),('date_default_timezone','s:6:\"-14400\";'),('drupal_http_request_fails','b:0;'),('drupal_private_key','s:64:\"ae1a851afe4f83df3d990bb2da0c83e0cbff0dcf7b6576f09e35e9fea24c4a50\";'),('file_directory_temp','s:15:\"C:\\Windows\\Temp\";'),('filter_html_1','i:1;'),('install_profile','s:7:\"default\";'),('install_task','s:4:\"done\";'),('install_time','i:1347395035;'),('javascript_parsed','a:0:{}'),('jquery_update_replace','b:1;'),('menu_expanded','a:0:{}'),('menu_masks','a:21:{i:0;i:126;i:1;i:123;i:2;i:62;i:3;i:61;i:4;i:59;i:5;i:31;i:6;i:30;i:7;i:29;i:8;i:24;i:9;i:21;i:10;i:15;i:11;i:14;i:12;i:12;i:13;i:11;i:14;i:7;i:15;i:6;i:16;i:5;i:17;i:4;i:18;i:3;i:19;i:2;i:20;i:1;}'),('node_options_forum','a:1:{i:0;s:6:\"status\";}'),('node_options_page','a:1:{i:0;s:6:\"status\";}'),('site_mail','s:14:\"${drupal_admin_email}\";'),('site_name','s:9:\"localhost\";'),('theme_default','s:7:\"garland\";'),('theme_settings','a:1:{s:21:\"toggle_node_info_page\";b:0;}'),('update_last_check','i:1347643232;'),('user_email_verification','b:1;');
/*!40000 ALTER TABLE `variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vocabulary`
--

DROP TABLE IF EXISTS `vocabulary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vocabulary` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `help` varchar(255) NOT NULL DEFAULT '',
  `relations` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hierarchy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `multiple` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `tags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) NOT NULL DEFAULT '',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  KEY `list` (`weight`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vocabulary`
--

LOCK TABLES `vocabulary` WRITE;
/*!40000 ALTER TABLE `vocabulary` DISABLE KEYS */;
/*!40000 ALTER TABLE `vocabulary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vocabulary_node_types`
--

DROP TABLE IF EXISTS `vocabulary_node_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vocabulary_node_types` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`type`,`vid`),
  KEY `vid` (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vocabulary_node_types`
--

LOCK TABLES `vocabulary_node_types` WRITE;
/*!40000 ALTER TABLE `vocabulary_node_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `vocabulary_node_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchdog`
--

DROP TABLE IF EXISTS `watchdog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchdog` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(128) NOT NULL DEFAULT '',
  `message` longtext NOT NULL,
  `variables` longtext NOT NULL,
  `severity` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '',
  `location` text NOT NULL,
  `referer` text,
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wid`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xml_forms`
--

DROP TABLE IF EXISTS `xml_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xml_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `form` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;