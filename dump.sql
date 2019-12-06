-- MariaDB dump 10.17  Distrib 10.4.10-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	10.4.10-MariaDB-1:10.4.10+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `madmin_cache`
--

DROP TABLE IF EXISTS `madmin_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `madmin_cache` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `siteid` int(11) DEFAULT NULL,
  `expire` datetime DEFAULT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unq_macac_id_siteid` (`id`,`siteid`),
  KEY `idx_majob_expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `madmin_cache`
--

LOCK TABLES `madmin_cache` WRITE;
/*!40000 ALTER TABLE `madmin_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `madmin_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `madmin_cache_tag`
--

DROP TABLE IF EXISTS `madmin_cache_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `madmin_cache_tag` (
  `tid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tsiteid` int(11) DEFAULT NULL,
  `tname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unq_macacta_tid_tsid_tname` (`tid`,`tsiteid`,`tname`),
  KEY `fk_macac_tid_tsid` (`tid`,`tsiteid`),
  CONSTRAINT `fk_macac_tid_tsid` FOREIGN KEY (`tid`, `tsiteid`) REFERENCES `madmin_cache` (`id`, `siteid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `madmin_cache_tag`
--

LOCK TABLES `madmin_cache_tag` WRITE;
/*!40000 ALTER TABLE `madmin_cache_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `madmin_cache_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `madmin_job`
--

DROP TABLE IF EXISTS `madmin_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `madmin_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parameter` text COLLATE utf8_unicode_ci NOT NULL,
  `result` text COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_majob_sid_ctime` (`siteid`,`ctime`),
  KEY `idx_majob_sid_status` (`siteid`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `madmin_job`
--

LOCK TABLES `madmin_job` WRITE;
/*!40000 ALTER TABLE `madmin_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `madmin_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `madmin_log`
--

DROP TABLE IF EXISTS `madmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `madmin_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) DEFAULT NULL,
  `facility` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL,
  `priority` smallint(6) NOT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `request` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_malog_sid_time_facility_prio` (`siteid`,`timestamp`,`facility`,`priority`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `madmin_log`
--

LOCK TABLES `madmin_log` WRITE;
/*!40000 ALTER TABLE `madmin_log` DISABLE KEYS */;
INSERT INTO `madmin_log` VALUES (1,1,'client/html','2019-12-06 00:28:24',4,'No catalog node for ID \"\"','d827d3a016501ee2163e39631f94b096'),(2,1,'client/html','2019-12-06 00:28:24',4,'#0 [internal function]: Aimeos\\MShop\\Catalog\\Manager\\Standard->getTree(NULL, Array, 1, Object(Aimeos\\MW\\Criteria\\SQL))\n#1 /app/vendor/aimeos/aimeos-core/lib/mshoplib/src/MShop/Common/Manager/Decorator/Base.php(51): call_user_func_array(Array, Array)\n#2 /app/ext/ai-controller-frontend/controller/frontend/src/Controller/Frontend/Catalog/Standard.php(133): Aimeos\\MShop\\Common\\Manager\\Decorator\\Base->__call(\'getTree\', Array)\n#3 /app/ext/ai-client-html/client/html/src/Client/Html/Catalog/Filter/Tree/Standard.php(258): Aimeos\\Controller\\Frontend\\Catalog\\Standard->getTree(1)\n#4 /app/ext/ai-client-html/client/html/src/Client/Html/Base.php(67): Aimeos\\Client\\Html\\Catalog\\Filter\\Tree\\Standard->addData(Object(Aimeos\\MW\\View\\Standard), Array, NULL)\n#5 /app/ext/ai-client-html/client/html/src/Client/Html/Catalog/Filter/Standard.php(560): Aimeos\\Client\\Html\\Base->addData(Object(Aimeos\\MW\\View\\Standard), Array, NULL)\n#6 /app/ext/ai-client-html/client/html/src/Client/Html/Catalog/Filter/Standard.php(274): Aimeos\\Client\\Html\\Catalog\\Filter\\Standard->addData(Object(Aimeos\\MW\\View\\Standard), Array, NULL)\n#7 /app/vendor/aimeos/aimeos-laravel/src/Aimeos/Shop/Controller/CatalogController.php(72): Aimeos\\Client\\Html\\Catalog\\Filter\\Standard->getHeader()\n#8 [internal function]: Aimeos\\Shop\\Controller\\CatalogController->listAction()\n#9 /app/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#10 /app/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'listAction\', Array)\n#11 /app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Aimeos\\Shop\\Controller\\CatalogController), \'listAction\')\n#12 /app/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#13 /app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(680): Illuminate\\Routing\\Route->run()\n#14 /app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#15 /app/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#16 /app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 /app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/VerifyCsrfToken.php(76): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Foundation\\Http\\Middleware\\VerifyCsrfToken->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#19 /app/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#20 /app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#21 /app/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#22 /app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 /app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#25 /app/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(66): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#26 /app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#27 /app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(682): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 /app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(657): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#30 /app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(623): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#31 /app/vendor/laravel/framework/src/Illuminate/Routing/Router.php(612): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#32 /app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#33 /app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#34 /app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 /app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/TransformsRequest.php(21): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Foundation\\Http\\Middleware\\TransformsRequest->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 /app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/ValidatePostSize.php(27): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Foundation\\Http\\Middleware\\ValidatePostSize->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 /app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 /app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 /app/vendor/fideloper/proxy/src/TrustProxies.php(57): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 /app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Fideloper\\Proxy\\TrustProxies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 /app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 /app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#46 /app/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#47 /app/public/index.php(55): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#48 /app/server.php(21): require_once(\'/app/public/ind...\')\n#49 {main}','d827d3a016501ee2163e39631f94b096');
/*!40000 ALTER TABLE `madmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `madmin_queue`
--

DROP TABLE IF EXISTS `madmin_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `madmin_queue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cname` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `rtime` datetime NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_maque_queue_cname_rtime` (`queue`,`cname`,`rtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `madmin_queue`
--

LOCK TABLES `madmin_queue` WRITE;
/*!40000 ALTER TABLE `madmin_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `madmin_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_attribute`
--

DROP TABLE IF EXISTS `mshop_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `key` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msatt_sid_dom_type_code` (`siteid`,`domain`,`type`,`code`),
  KEY `idx_msatt_sid_dom_stat_typ_pos` (`siteid`,`domain`,`status`,`type`,`pos`),
  KEY `idx_msatt_sid_status` (`siteid`,`status`),
  KEY `idx_msatt_sid_label` (`siteid`,`label`),
  KEY `idx_msatt_sid_code` (`siteid`,`code`),
  KEY `idx_msatt_sid_type` (`siteid`,`type`),
  KEY `idx_msatt_sid_key` (`siteid`,`key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_attribute`
--

LOCK TABLES `mshop_attribute` WRITE;
/*!40000 ALTER TABLE `mshop_attribute` DISABLE KEYS */;
INSERT INTO `mshop_attribute` VALUES (1,1,'4100fb04be86c08d499976fbf06e424d','price','product','custom','Custom product price',0,1,'2019-12-06 00:27:54','2019-12-06 00:27:54','core:setup'),(2,1,'5c092970859caca7a5d536f3882d8607','material','product','fiberglass','Fiberglass',0,1,'2019-12-06 00:37:51','2019-12-06 00:37:51','martinfer.69@gmail.com'),(3,1,'a13a90c4122aa5bb34f7a5d5a87f26bf','material','product','carbonfiber','Carbon fiber',0,1,'2019-12-06 00:38:35','2019-12-06 00:38:35','martinfer.69@gmail.com');
/*!40000 ALTER TABLE `mshop_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_attribute_list`
--

DROP TABLE IF EXISTS `mshop_attribute_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_attribute_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `key` varchar(134) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `refid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msattli_pid_sid_dm_ty_rid` (`parentid`,`siteid`,`domain`,`type`,`refid`),
  KEY `idx_msattli_sid_key` (`siteid`,`key`),
  KEY `fk_msattli_pid` (`parentid`),
  CONSTRAINT `fk_msattli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_attribute_list`
--

LOCK TABLES `mshop_attribute_list` WRITE;
/*!40000 ALTER TABLE `mshop_attribute_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_attribute_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_attribute_list_type`
--

DROP TABLE IF EXISTS `mshop_attribute_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_attribute_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msattlity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msattlity_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msattlity_sid_label` (`siteid`,`label`),
  KEY `idx_msattlity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_attribute_list_type`
--

LOCK TABLES `mshop_attribute_list_type` WRITE;
/*!40000 ALTER TABLE `mshop_attribute_list_type` DISABLE KEYS */;
INSERT INTO `mshop_attribute_list_type` VALUES (1,1,'attribute','default','Standard',0,1,'2019-12-06 00:27:45','2019-12-06 00:27:45','core:setup'),(2,1,'catalog','default','Standard',0,1,'2019-12-06 00:27:45','2019-12-06 00:27:45','core:setup'),(3,1,'media','default','Standard',0,1,'2019-12-06 00:27:45','2019-12-06 00:27:45','core:setup'),(4,1,'price','default','Standard',0,1,'2019-12-06 00:27:45','2019-12-06 00:27:45','core:setup'),(5,1,'product','default','Standard',0,1,'2019-12-06 00:27:45','2019-12-06 00:27:45','core:setup'),(6,1,'service','default','Standard',0,1,'2019-12-06 00:27:45','2019-12-06 00:27:45','core:setup'),(7,1,'text','default','Standard',0,1,'2019-12-06 00:27:45','2019-12-06 00:27:45','core:setup');
/*!40000 ALTER TABLE `mshop_attribute_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_attribute_property`
--

DROP TABLE IF EXISTS `mshop_attribute_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_attribute_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `key` varchar(103) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `langid` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msattpr_sid_ty_lid_value` (`parentid`,`siteid`,`type`,`langid`,`value`),
  KEY `fk_msattpr_sid_key` (`siteid`,`key`),
  KEY `fk_msattpr_pid` (`parentid`),
  CONSTRAINT `fk_msattpr_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_attribute_property`
--

LOCK TABLES `mshop_attribute_property` WRITE;
/*!40000 ALTER TABLE `mshop_attribute_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_attribute_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_attribute_property_type`
--

DROP TABLE IF EXISTS `mshop_attribute_property_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_attribute_property_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msattprty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msattprty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msattprty_sid_label` (`siteid`,`label`),
  KEY `idx_msattprty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_attribute_property_type`
--

LOCK TABLES `mshop_attribute_property_type` WRITE;
/*!40000 ALTER TABLE `mshop_attribute_property_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_attribute_property_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_attribute_type`
--

DROP TABLE IF EXISTS `mshop_attribute_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_attribute_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msattty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msattty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msattty_sid_label` (`siteid`,`label`),
  KEY `idx_msattty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_attribute_type`
--

LOCK TABLES `mshop_attribute_type` WRITE;
/*!40000 ALTER TABLE `mshop_attribute_type` DISABLE KEYS */;
INSERT INTO `mshop_attribute_type` VALUES (1,1,'product','color','Color',0,1,'2019-12-06 00:27:44','2019-12-06 00:27:44','core:setup'),(2,1,'product','size','Size',0,1,'2019-12-06 00:27:44','2019-12-06 00:27:44','core:setup'),(3,1,'product','width','Width',0,1,'2019-12-06 00:27:45','2019-12-06 00:27:45','core:setup'),(4,1,'product','length','Length',0,1,'2019-12-06 00:27:45','2019-12-06 00:27:45','core:setup'),(5,1,'product','print','Print',0,1,'2019-12-06 00:27:45','2019-12-06 00:27:45','core:setup'),(6,1,'product','sticker','Sticker',0,1,'2019-12-06 00:27:45','2019-12-06 00:27:45','core:setup'),(7,1,'product','download','Download',0,1,'2019-12-06 00:27:45','2019-12-06 00:27:45','core:setup'),(8,1,'product','price','Price',0,1,'2019-12-06 00:27:45','2019-12-06 00:27:45','core:setup'),(9,1,'product','text','Text',0,1,'2019-12-06 00:27:45','2019-12-06 00:27:45','core:setup'),(10,1,'product','date','Date',0,1,'2019-12-06 00:27:45','2019-12-06 00:27:45','core:setup'),(11,1,'product','interval','Interval',0,1,'2019-12-06 00:27:45','2019-12-06 00:27:45','core:setup'),(12,1,'product','material','Material',0,1,'2019-12-06 00:37:06','2019-12-06 00:37:06','martinfer.69@gmail.com');
/*!40000 ALTER TABLE `mshop_attribute_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_catalog`
--

DROP TABLE IF EXISTS `mshop_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) DEFAULT NULL,
  `siteid` int(11) NOT NULL,
  `level` smallint(6) NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `nleft` int(11) NOT NULL,
  `nright` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscat_sid_code` (`siteid`,`code`),
  KEY `idx_mscat_sid_nlt_nrt_lvl_pid` (`siteid`,`nleft`,`nright`,`level`,`parentid`),
  KEY `idx_mscat_sid_status` (`siteid`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_catalog`
--

LOCK TABLES `mshop_catalog` WRITE;
/*!40000 ALTER TABLE `mshop_catalog` DISABLE KEYS */;
INSERT INTO `mshop_catalog` VALUES (1,0,1,0,'main','Main','[]',1,6,1,'2019-12-06 00:32:32','2019-12-06 00:31:45','martinfer.69@gmail.com',''),(2,1,1,1,'engine','Engine','[]',2,3,1,'2019-12-06 00:32:22','2019-12-06 00:32:22','martinfer.69@gmail.com',''),(3,1,1,1,'trailer','Trailer','[]',4,5,1,'2019-12-06 00:32:49','2019-12-06 00:32:49','martinfer.69@gmail.com','');
/*!40000 ALTER TABLE `mshop_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_catalog_list`
--

DROP TABLE IF EXISTS `mshop_catalog_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_catalog_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `key` varchar(134) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `refid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscatli_pid_sid_dm_ty_rid` (`parentid`,`siteid`,`domain`,`type`,`refid`),
  KEY `idx_mscatli_sid_key` (`siteid`,`key`),
  KEY `fk_mscatli_pid` (`parentid`),
  CONSTRAINT `fk_mscatli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_catalog_list`
--

LOCK TABLES `mshop_catalog_list` WRITE;
/*!40000 ALTER TABLE `mshop_catalog_list` DISABLE KEYS */;
INSERT INTO `mshop_catalog_list` VALUES (1,3,1,'product|default|1','default','product','1',NULL,NULL,'[]',0,1,'2019-12-06 00:45:50','2019-12-06 00:45:50','martinfer.69@gmail.com'),(2,3,1,'product|default|2','default','product','2',NULL,NULL,'[]',0,1,'2019-12-06 00:46:28','2019-12-06 00:46:28','martinfer.69@gmail.com');
/*!40000 ALTER TABLE `mshop_catalog_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_catalog_list_type`
--

DROP TABLE IF EXISTS `mshop_catalog_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_catalog_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscatlity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_mscatlity_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_mscatlity_sid_label` (`siteid`,`label`),
  KEY `idx_mscatlity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_catalog_list_type`
--

LOCK TABLES `mshop_catalog_list_type` WRITE;
/*!40000 ALTER TABLE `mshop_catalog_list_type` DISABLE KEYS */;
INSERT INTO `mshop_catalog_list_type` VALUES (1,1,'attribute','default','Standard',0,1,'2019-12-06 00:27:45','2019-12-06 00:27:45','core:setup'),(2,1,'catalog','default','Standard',0,1,'2019-12-06 00:27:45','2019-12-06 00:27:45','core:setup'),(3,1,'media','default','Standard',0,1,'2019-12-06 00:27:45','2019-12-06 00:27:45','core:setup'),(4,1,'price','default','Standard',0,1,'2019-12-06 00:27:46','2019-12-06 00:27:46','core:setup'),(5,1,'product','default','Standard',0,1,'2019-12-06 00:27:46','2019-12-06 00:27:46','core:setup'),(6,1,'service','default','Standard',0,1,'2019-12-06 00:27:46','2019-12-06 00:27:46','core:setup'),(7,1,'text','default','Standard',0,1,'2019-12-06 00:27:46','2019-12-06 00:27:46','core:setup'),(8,1,'product','promotion','Promotion',0,1,'2019-12-06 00:27:46','2019-12-06 00:27:46','core:setup');
/*!40000 ALTER TABLE `mshop_catalog_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_coupon`
--

DROP TABLE IF EXISTS `mshop_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mscou_sid_stat_start_end` (`siteid`,`status`,`start`,`end`),
  KEY `idx_mscou_sid_provider` (`siteid`,`provider`),
  KEY `idx_mscou_sid_label` (`siteid`,`label`),
  KEY `idx_mscou_sid_start` (`siteid`,`start`),
  KEY `idx_mscou_sid_end` (`siteid`,`end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_coupon`
--

LOCK TABLES `mshop_coupon` WRITE;
/*!40000 ALTER TABLE `mshop_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_coupon_code`
--

DROP TABLE IF EXISTS `mshop_coupon_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_coupon_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(11) DEFAULT 0,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `ref` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscouco_sid_code` (`siteid`,`code`),
  KEY `idx_mscouco_sid_ct_start_end` (`siteid`,`count`,`start`,`end`),
  KEY `idx_mscouco_sid_start` (`siteid`,`start`),
  KEY `idx_mscouco_sid_end` (`siteid`,`end`),
  KEY `fk_mscouco_pid` (`parentid`),
  CONSTRAINT `fk_mscouco_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_coupon` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_coupon_code`
--

LOCK TABLES `mshop_coupon_code` WRITE;
/*!40000 ALTER TABLE `mshop_coupon_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_coupon_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_customer`
--

DROP TABLE IF EXISTS `mshop_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `salutation` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `vatid` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `address1` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `address2` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `address3` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `postal` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `langid` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `countryid` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `telefax` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `vdate` date DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscus_sid_code` (`siteid`,`code`),
  KEY `idx_mscus_sid_langid` (`siteid`,`langid`),
  KEY `idx_mscus_sid_last_first` (`siteid`,`lastname`,`firstname`),
  KEY `idx_mscus_sid_post_addr1` (`siteid`,`postal`,`address1`),
  KEY `idx_mscus_sid_post_city` (`siteid`,`postal`,`city`),
  KEY `idx_mscus_sid_city` (`siteid`,`city`),
  KEY `idx_mscus_sid_email` (`siteid`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_customer`
--

LOCK TABLES `mshop_customer` WRITE;
/*!40000 ALTER TABLE `mshop_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_customer_address`
--

DROP TABLE IF EXISTS `mshop_customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_customer_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) DEFAULT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `vatid` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `salutation` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `address1` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `address2` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `address3` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `postal` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `langid` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `countryid` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `telefax` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `pos` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mscusad_pid` (`parentid`),
  KEY `idx_mscusad_langid` (`langid`),
  KEY `idx_mscusad_sid_last_first` (`siteid`,`lastname`,`firstname`),
  KEY `idx_mscusad_sid_post_addr1` (`siteid`,`postal`,`address1`),
  KEY `idx_mscusad_sid_post_ci` (`siteid`,`postal`,`city`),
  KEY `idx_mscusad_sid_city` (`siteid`,`city`),
  KEY `idx_mscusad_sid_email` (`siteid`,`email`),
  CONSTRAINT `fk_mscusad_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_customer_address`
--

LOCK TABLES `mshop_customer_address` WRITE;
/*!40000 ALTER TABLE `mshop_customer_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_customer_group`
--

DROP TABLE IF EXISTS `mshop_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_customer_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) DEFAULT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscusgr_sid_code` (`siteid`,`code`),
  KEY `idx_mscusgr_sid_label` (`siteid`,`label`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_customer_group`
--

LOCK TABLES `mshop_customer_group` WRITE;
/*!40000 ALTER TABLE `mshop_customer_group` DISABLE KEYS */;
INSERT INTO `mshop_customer_group` VALUES (1,1,'admin','Administrator','2019-12-06 00:27:54','2019-12-06 00:27:54','core:setup'),(2,1,'editor','Editor','2019-12-06 00:27:54','2019-12-06 00:27:54','core:setup');
/*!40000 ALTER TABLE `mshop_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_customer_list`
--

DROP TABLE IF EXISTS `mshop_customer_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_customer_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `key` varchar(134) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `refid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscusli_pid_sid_dm_ty_rid` (`parentid`,`siteid`,`domain`,`type`,`refid`),
  KEY `idx_mscusli_sid_key` (`siteid`,`key`),
  KEY `fk_mscusli_pid` (`parentid`),
  CONSTRAINT `fk_mscusli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_customer_list`
--

LOCK TABLES `mshop_customer_list` WRITE;
/*!40000 ALTER TABLE `mshop_customer_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_customer_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_customer_list_type`
--

DROP TABLE IF EXISTS `mshop_customer_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_customer_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mscuslity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_mscuslity_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_mscuslity_sid_label` (`siteid`,`label`),
  KEY `idx_mscuslity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_customer_list_type`
--

LOCK TABLES `mshop_customer_list_type` WRITE;
/*!40000 ALTER TABLE `mshop_customer_list_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_customer_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_customer_property`
--

DROP TABLE IF EXISTS `mshop_customer_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_customer_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `key` varchar(103) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `langid` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mcuspr_sid_ty_lid_value` (`parentid`,`siteid`,`type`,`langid`,`value`),
  KEY `fk_mscuspr_sid_key` (`siteid`,`key`),
  KEY `fk_mcuspr_pid` (`parentid`),
  CONSTRAINT `fk_mcuspr_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_customer_property`
--

LOCK TABLES `mshop_customer_property` WRITE;
/*!40000 ALTER TABLE `mshop_customer_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_customer_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_customer_property_type`
--

DROP TABLE IF EXISTS `mshop_customer_property_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_customer_property_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mcusprty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_mcusprty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_mcusprty_sid_label` (`siteid`,`label`),
  KEY `idx_mcusprty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_customer_property_type`
--

LOCK TABLES `mshop_customer_property_type` WRITE;
/*!40000 ALTER TABLE `mshop_customer_property_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_customer_property_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_index_attribute`
--

DROP TABLE IF EXISTS `mshop_index_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_index_attribute` (
  `prodid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `attrid` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `listtype` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  UNIQUE KEY `unq_msindat_p_s_aid_lt` (`prodid`,`siteid`,`attrid`,`listtype`),
  KEY `idx_msindat_p_s_lt_t_c` (`prodid`,`siteid`,`listtype`,`type`,`code`),
  KEY `idx_msindat_s_at_lt` (`siteid`,`attrid`,`listtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_index_attribute`
--

LOCK TABLES `mshop_index_attribute` WRITE;
/*!40000 ALTER TABLE `mshop_index_attribute` DISABLE KEYS */;
INSERT INTO `mshop_index_attribute` VALUES (1,1,'3','variant','material','carbonfiber','2019-12-06 00:46:00'),(2,1,'2','variant','material','fiberglass','2019-12-06 00:46:28');
/*!40000 ALTER TABLE `mshop_index_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_index_catalog`
--

DROP TABLE IF EXISTS `mshop_index_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_index_catalog` (
  `prodid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `catid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `listtype` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL,
  `mtime` datetime NOT NULL,
  UNIQUE KEY `unq_msindca_p_s_cid_lt_po` (`prodid`,`siteid`,`catid`,`listtype`,`pos`),
  KEY `idx_msindca_s_ca_lt_po` (`siteid`,`catid`,`listtype`,`pos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_index_catalog`
--

LOCK TABLES `mshop_index_catalog` WRITE;
/*!40000 ALTER TABLE `mshop_index_catalog` DISABLE KEYS */;
INSERT INTO `mshop_index_catalog` VALUES (1,1,'3','default',0,'2019-12-06 00:46:00'),(2,1,'3','default',0,'2019-12-06 00:46:28');
/*!40000 ALTER TABLE `mshop_index_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_index_price`
--

DROP TABLE IF EXISTS `mshop_index_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_index_price` (
  `prodid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `currencyid` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `value` decimal(12,2) NOT NULL,
  `mtime` datetime NOT NULL,
  UNIQUE KEY `unq_msindpr_pid_sid_cid` (`prodid`,`siteid`,`currencyid`),
  KEY `idx_msindpr_sid_cid_val` (`siteid`,`currencyid`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_index_price`
--

LOCK TABLES `mshop_index_price` WRITE;
/*!40000 ALTER TABLE `mshop_index_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_index_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_index_supplier`
--

DROP TABLE IF EXISTS `mshop_index_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_index_supplier` (
  `prodid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `supid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `listtype` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL,
  `mtime` datetime NOT NULL,
  UNIQUE KEY `unq_msindsup_p_sid_supid_lt_po` (`prodid`,`siteid`,`supid`,`listtype`,`pos`),
  KEY `idx_msindsup_sid_supid_lt_po` (`siteid`,`supid`,`listtype`,`pos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_index_supplier`
--

LOCK TABLES `mshop_index_supplier` WRITE;
/*!40000 ALTER TABLE `mshop_index_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_index_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_index_text`
--

DROP TABLE IF EXISTS `mshop_index_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_index_text` (
  `prodid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `langid` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(240) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(240) COLLATE utf8_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  UNIQUE KEY `unq_msindte_pid_sid_lid_url` (`prodid`,`siteid`,`langid`,`url`),
  KEY `idx_msindte_pid_sid_lid_name` (`prodid`,`siteid`,`langid`,`name`),
  FULLTEXT KEY `idx_msindte_content` (`content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_index_text`
--

LOCK TABLES `mshop_index_text` WRITE;
/*!40000 ALTER TABLE `mshop_index_text` DISABLE KEYS */;
INSERT INTO `mshop_index_text` VALUES (1,1,'de','Trailer_top_1','Trailer top 1','trailer1 trailer top 1','2019-12-06 00:46:00'),(1,1,'en','Trailer_top_1','Trailer top 1','trailer1 trailer top 1','2019-12-06 00:46:00'),(2,1,'en','Trailer_top_2','Trailer top 2','trailer2 trailer top 2','2019-12-06 00:46:28'),(2,1,'de','Trailer_top_2','Trailer top 2','trailer2 trailer top 2','2019-12-06 00:46:28');
/*!40000 ALTER TABLE `mshop_index_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_locale`
--

DROP TABLE IF EXISTS `mshop_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_locale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `langid` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `currencyid` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msloc_sid_lang_curr` (`siteid`,`langid`,`currencyid`),
  KEY `idx_msloc_sid_curid` (`siteid`,`currencyid`),
  KEY `idx_msloc_sid_status` (`siteid`,`status`),
  KEY `idx_msloc_sid_pos` (`siteid`,`pos`),
  KEY `fk_msloc_siteid` (`siteid`),
  KEY `fk_msloc_langid` (`langid`),
  KEY `fk_msloc_currid` (`currencyid`),
  CONSTRAINT `fk_msloc_currid` FOREIGN KEY (`currencyid`) REFERENCES `mshop_locale_currency` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_msloc_langid` FOREIGN KEY (`langid`) REFERENCES `mshop_locale_language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_msloc_siteid` FOREIGN KEY (`siteid`) REFERENCES `mshop_locale_site` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_locale`
--

LOCK TABLES `mshop_locale` WRITE;
/*!40000 ALTER TABLE `mshop_locale` DISABLE KEYS */;
INSERT INTO `mshop_locale` VALUES (1,1,'en','EUR',0,1,'2019-12-06 00:27:43','2019-12-06 00:27:43','core:setup'),(2,1,'en','USD',1,1,'2019-12-06 00:27:43','2019-12-06 00:27:43','core:setup'),(3,1,'de','EUR',2,1,'2019-12-06 00:27:43','2019-12-06 00:27:43','core:setup');
/*!40000 ALTER TABLE `mshop_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_locale_currency`
--

DROP TABLE IF EXISTS `mshop_locale_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_locale_currency` (
  `id` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `siteid` int(11) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msloccu_sid_status` (`siteid`,`status`),
  KEY `idx_mslocla_label` (`siteid`,`label`),
  KEY `fk_msloccu_siteid` (`siteid`),
  CONSTRAINT `fk_msloccu_siteid` FOREIGN KEY (`siteid`) REFERENCES `mshop_locale_site` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_locale_currency`
--

LOCK TABLES `mshop_locale_currency` WRITE;
/*!40000 ALTER TABLE `mshop_locale_currency` DISABLE KEYS */;
INSERT INTO `mshop_locale_currency` VALUES ('AED',NULL,'United Arab Emirates dirham',0,'2019-12-06 00:27:31','2019-12-06 00:27:31','aimeos:setup'),('AFN',NULL,'Afghan afghani',0,'2019-12-06 00:27:31','2019-12-06 00:27:31','aimeos:setup'),('ALL',NULL,'Albanian Lek',0,'2019-12-06 00:27:31','2019-12-06 00:27:31','aimeos:setup'),('AMD',NULL,'Armenian Dram',0,'2019-12-06 00:27:31','2019-12-06 00:27:31','aimeos:setup'),('ANG',NULL,'Netherlands Antillean gulden',0,'2019-12-06 00:27:31','2019-12-06 00:27:31','aimeos:setup'),('AOA',NULL,'Angolan Kwanza',0,'2019-12-06 00:27:32','2019-12-06 00:27:32','aimeos:setup'),('ARS',NULL,'Argentine Peso',0,'2019-12-06 00:27:32','2019-12-06 00:27:32','aimeos:setup'),('AUD',NULL,'Australian Dollar',0,'2019-12-06 00:27:32','2019-12-06 00:27:32','aimeos:setup'),('AWG',NULL,'Aruban Guilder',0,'2019-12-06 00:27:32','2019-12-06 00:27:32','aimeos:setup'),('AZN',NULL,'Azerbaijani Manat',0,'2019-12-06 00:27:32','2019-12-06 00:27:32','aimeos:setup'),('BAM',NULL,'Bosnia-Herzegovina Conv. Mark',0,'2019-12-06 00:27:32','2019-12-06 00:27:32','aimeos:setup'),('BBD',NULL,'Barbados Dollar',0,'2019-12-06 00:27:32','2019-12-06 00:27:32','aimeos:setup'),('BDT',NULL,'Bangladeshi taka',0,'2019-12-06 00:27:32','2019-12-06 00:27:32','aimeos:setup'),('BGN',NULL,'Bulgarian Lev',0,'2019-12-06 00:27:32','2019-12-06 00:27:32','aimeos:setup'),('BHD',NULL,'Bahraini Dinar',0,'2019-12-06 00:27:32','2019-12-06 00:27:32','aimeos:setup'),('BIF',NULL,'Burundi Franc',0,'2019-12-06 00:27:32','2019-12-06 00:27:32','aimeos:setup'),('BMD',NULL,'Bermuda Dollar',0,'2019-12-06 00:27:32','2019-12-06 00:27:32','aimeos:setup'),('BND',NULL,'Brunei Dollar',0,'2019-12-06 00:27:32','2019-12-06 00:27:32','aimeos:setup'),('BOB',NULL,'Boliviano',0,'2019-12-06 00:27:32','2019-12-06 00:27:32','aimeos:setup'),('BRL',NULL,'Brazilian Real',0,'2019-12-06 00:27:32','2019-12-06 00:27:32','aimeos:setup'),('BSD',NULL,'Bahamian Dollar',0,'2019-12-06 00:27:32','2019-12-06 00:27:32','aimeos:setup'),('BTN',NULL,'Bhutanese Ngultrum',0,'2019-12-06 00:27:32','2019-12-06 00:27:32','aimeos:setup'),('BWP',NULL,'Botswana pula',0,'2019-12-06 00:27:32','2019-12-06 00:27:32','aimeos:setup'),('BYR',NULL,'Belarussian Ruble',0,'2019-12-06 00:27:32','2019-12-06 00:27:32','aimeos:setup'),('BZD',NULL,'Belize Dollar',0,'2019-12-06 00:27:32','2019-12-06 00:27:32','aimeos:setup'),('CAD',NULL,'Canadian Dollar',0,'2019-12-06 00:27:33','2019-12-06 00:27:33','aimeos:setup'),('CDF',NULL,'Congolese franc',0,'2019-12-06 00:27:33','2019-12-06 00:27:33','aimeos:setup'),('CHF',NULL,'Swiss franc',0,'2019-12-06 00:27:33','2019-12-06 00:27:33','aimeos:setup'),('CLP',NULL,'Chilean Peso',0,'2019-12-06 00:27:33','2019-12-06 00:27:33','aimeos:setup'),('CNY',NULL,'Chinese Yuan Renminbi',1,'2019-12-06 00:27:33','2019-12-06 00:27:33','aimeos:setup'),('COP',NULL,'Colombian Peso',0,'2019-12-06 00:27:33','2019-12-06 00:27:33','aimeos:setup'),('CRC',NULL,'Costa Rican colón',0,'2019-12-06 00:27:33','2019-12-06 00:27:33','aimeos:setup'),('CUP',NULL,'Cuban peso',0,'2019-12-06 00:27:33','2019-12-06 00:27:33','aimeos:setup'),('CVE',NULL,'Cape Verde Escudo',0,'2019-12-06 00:27:33','2019-12-06 00:27:33','aimeos:setup'),('CZK',NULL,'Czech koruna',0,'2019-12-06 00:27:33','2019-12-06 00:27:33','aimeos:setup'),('DJF',NULL,'Djibouti franc',0,'2019-12-06 00:27:33','2019-12-06 00:27:33','aimeos:setup'),('DKK',NULL,'Danish krone',0,'2019-12-06 00:27:33','2019-12-06 00:27:33','aimeos:setup'),('DOP',NULL,'Dominican peso',0,'2019-12-06 00:27:33','2019-12-06 00:27:33','aimeos:setup'),('DZD',NULL,'Algerian Dinar',0,'2019-12-06 00:27:33','2019-12-06 00:27:33','aimeos:setup'),('EGP',NULL,'Egyptian pound',0,'2019-12-06 00:27:33','2019-12-06 00:27:33','aimeos:setup'),('ERN',NULL,'Eritrean nakfa',0,'2019-12-06 00:27:33','2019-12-06 00:27:33','aimeos:setup'),('ETB',NULL,'Ethiopian birr',0,'2019-12-06 00:27:34','2019-12-06 00:27:34','aimeos:setup'),('EUR',NULL,'Euro',1,'2019-12-06 00:27:34','2019-12-06 00:27:34','aimeos:setup'),('FJD',NULL,'Fijian dollar',0,'2019-12-06 00:27:34','2019-12-06 00:27:34','aimeos:setup'),('FKP',NULL,'Falkland Islands pound',0,'2019-12-06 00:27:34','2019-12-06 00:27:34','aimeos:setup'),('GBP',NULL,'Pound sterling',0,'2019-12-06 00:27:34','2019-12-06 00:27:34','aimeos:setup'),('GEL',NULL,'Georgian lari',0,'2019-12-06 00:27:34','2019-12-06 00:27:34','aimeos:setup'),('GHC',NULL,'Ghanaian cedi',0,'2019-12-06 00:27:34','2019-12-06 00:27:34','aimeos:setup'),('GIP',NULL,'Gibraltar pound',0,'2019-12-06 00:27:34','2019-12-06 00:27:34','aimeos:setup'),('GMD',NULL,'Gambian dalasi',0,'2019-12-06 00:27:34','2019-12-06 00:27:34','aimeos:setup'),('GNF',NULL,'Guinea Franc',0,'2019-12-06 00:27:34','2019-12-06 00:27:34','aimeos:setup'),('GTQ',NULL,'Guatemalan quetzal',0,'2019-12-06 00:27:34','2019-12-06 00:27:34','aimeos:setup'),('GYD',NULL,'Guyana Dollar',0,'2019-12-06 00:27:34','2019-12-06 00:27:34','aimeos:setup'),('HKD',NULL,'Hong Kong dollar',0,'2019-12-06 00:27:34','2019-12-06 00:27:34','aimeos:setup'),('HNL',NULL,'Honduran lempira',0,'2019-12-06 00:27:34','2019-12-06 00:27:34','aimeos:setup'),('HRK',NULL,'Croatian kuna',0,'2019-12-06 00:27:34','2019-12-06 00:27:34','aimeos:setup'),('HTG',NULL,'Haitian gourde',0,'2019-12-06 00:27:34','2019-12-06 00:27:34','aimeos:setup'),('HUF',NULL,'Hungarian forint',0,'2019-12-06 00:27:34','2019-12-06 00:27:34','aimeos:setup'),('IDR',NULL,'Indonesian rupiah',0,'2019-12-06 00:27:34','2019-12-06 00:27:34','aimeos:setup'),('ILS',NULL,'New Israeli Sheqel',0,'2019-12-06 00:27:34','2019-12-06 00:27:34','aimeos:setup'),('INR',NULL,'Indian rupee',0,'2019-12-06 00:27:34','2019-12-06 00:27:34','aimeos:setup'),('IQD',NULL,'Iraqi dinar',0,'2019-12-06 00:27:34','2019-12-06 00:27:34','aimeos:setup'),('IRR',NULL,'Iranian rial',0,'2019-12-06 00:27:35','2019-12-06 00:27:35','aimeos:setup'),('ISK',NULL,'Icelandic króna',0,'2019-12-06 00:27:35','2019-12-06 00:27:35','aimeos:setup'),('JMD',NULL,'Jamaican dollar',0,'2019-12-06 00:27:35','2019-12-06 00:27:35','aimeos:setup'),('JOD',NULL,'Jordanian dinar',0,'2019-12-06 00:27:35','2019-12-06 00:27:35','aimeos:setup'),('JPY',NULL,'Japanese yen',0,'2019-12-06 00:27:35','2019-12-06 00:27:35','aimeos:setup'),('KES',NULL,'Kenyan shilling',0,'2019-12-06 00:27:35','2019-12-06 00:27:35','aimeos:setup'),('KGS',NULL,'Kyrgyzstani som',0,'2019-12-06 00:27:35','2019-12-06 00:27:35','aimeos:setup'),('KHR',NULL,'Cambodian riel',0,'2019-12-06 00:27:35','2019-12-06 00:27:35','aimeos:setup'),('KMF',NULL,'Comorian Franc',0,'2019-12-06 00:27:35','2019-12-06 00:27:35','aimeos:setup'),('KPW',NULL,'North Korean won',0,'2019-12-06 00:27:35','2019-12-06 00:27:35','aimeos:setup'),('KRW',NULL,'South Corean won',0,'2019-12-06 00:27:35','2019-12-06 00:27:35','aimeos:setup'),('KWD',NULL,'Kuwaiti dinar',0,'2019-12-06 00:27:35','2019-12-06 00:27:35','aimeos:setup'),('KYD',NULL,'Cayman Islands Dollar',0,'2019-12-06 00:27:35','2019-12-06 00:27:35','aimeos:setup'),('KZT',NULL,'Kazakhstani tenge',0,'2019-12-06 00:27:35','2019-12-06 00:27:35','aimeos:setup'),('LAK',NULL,'Lao kip',0,'2019-12-06 00:27:35','2019-12-06 00:27:35','aimeos:setup'),('LBP',NULL,'Lebanese pound',0,'2019-12-06 00:27:35','2019-12-06 00:27:35','aimeos:setup'),('LKR',NULL,'Sri Lankan rupee',0,'2019-12-06 00:27:35','2019-12-06 00:27:35','aimeos:setup'),('LRD',NULL,'Liberian dollar',0,'2019-12-06 00:27:35','2019-12-06 00:27:35','aimeos:setup'),('LSL',NULL,'Lesotho loti',0,'2019-12-06 00:27:35','2019-12-06 00:27:35','aimeos:setup'),('LTL',NULL,'Lithuanian litas',0,'2019-12-06 00:27:35','2019-12-06 00:27:35','aimeos:setup'),('LVL',NULL,'Latvian lats',0,'2019-12-06 00:27:35','2019-12-06 00:27:35','aimeos:setup'),('LYD',NULL,'Libyan dinar',0,'2019-12-06 00:27:35','2019-12-06 00:27:35','aimeos:setup'),('MAD',NULL,'Moroccan dirham',0,'2019-12-06 00:27:36','2019-12-06 00:27:36','aimeos:setup'),('MDL',NULL,'Moldovan leu',0,'2019-12-06 00:27:36','2019-12-06 00:27:36','aimeos:setup'),('MGA',NULL,'Malagasy ariary',0,'2019-12-06 00:27:36','2019-12-06 00:27:36','aimeos:setup'),('MKD',NULL,'Macedonian denar',0,'2019-12-06 00:27:36','2019-12-06 00:27:36','aimeos:setup'),('MMK',NULL,'Myanmar kyat',0,'2019-12-06 00:27:36','2019-12-06 00:27:36','aimeos:setup'),('MNT',NULL,'Mongolian tugrug',0,'2019-12-06 00:27:36','2019-12-06 00:27:36','aimeos:setup'),('MOP',NULL,'Macanese pataca',0,'2019-12-06 00:27:36','2019-12-06 00:27:36','aimeos:setup'),('MRO',NULL,'Mauritanian ouguiya',0,'2019-12-06 00:27:36','2019-12-06 00:27:36','aimeos:setup'),('MUR',NULL,'Mauritian rupee',0,'2019-12-06 00:27:36','2019-12-06 00:27:36','aimeos:setup'),('MVR',NULL,'Maldivian rufiyaa',0,'2019-12-06 00:27:36','2019-12-06 00:27:36','aimeos:setup'),('MWK',NULL,'Malawian kwacha',0,'2019-12-06 00:27:36','2019-12-06 00:27:36','aimeos:setup'),('MXN',NULL,'Mexican peso',0,'2019-12-06 00:27:36','2019-12-06 00:27:36','aimeos:setup'),('MYR',NULL,'Malaysian ringgit',0,'2019-12-06 00:27:36','2019-12-06 00:27:36','aimeos:setup'),('MZM',NULL,'Mozambican metical',0,'2019-12-06 00:27:36','2019-12-06 00:27:36','aimeos:setup'),('NAD',NULL,'Namibian dollar',0,'2019-12-06 00:27:36','2019-12-06 00:27:36','aimeos:setup'),('NGN',NULL,'Nigerian naira',0,'2019-12-06 00:27:36','2019-12-06 00:27:36','aimeos:setup'),('NIO',NULL,'Nicaraguan córdoba',0,'2019-12-06 00:27:36','2019-12-06 00:27:36','aimeos:setup'),('NOK',NULL,'Norvegian krone',0,'2019-12-06 00:27:36','2019-12-06 00:27:36','aimeos:setup'),('NPR',NULL,'Nepalese rupee',0,'2019-12-06 00:27:36','2019-12-06 00:27:36','aimeos:setup'),('NZD',NULL,'New Zealand dollar',0,'2019-12-06 00:27:36','2019-12-06 00:27:36','aimeos:setup'),('OMR',NULL,'Omani rial',0,'2019-12-06 00:27:36','2019-12-06 00:27:36','aimeos:setup'),('PAB',NULL,'Panamanian balboa',0,'2019-12-06 00:27:37','2019-12-06 00:27:37','aimeos:setup'),('PEN',NULL,'Peruvian nuevo sol',0,'2019-12-06 00:27:37','2019-12-06 00:27:37','aimeos:setup'),('PGK',NULL,'Papua New Guinean kina',0,'2019-12-06 00:27:37','2019-12-06 00:27:37','aimeos:setup'),('PHP',NULL,'Philippine peso',0,'2019-12-06 00:27:37','2019-12-06 00:27:37','aimeos:setup'),('PKR',NULL,'Pakistani rupee',0,'2019-12-06 00:27:37','2019-12-06 00:27:37','aimeos:setup'),('PLN',NULL,'Polish złoty',0,'2019-12-06 00:27:37','2019-12-06 00:27:37','aimeos:setup'),('PYG',NULL,'Paraguayan guaraní',0,'2019-12-06 00:27:37','2019-12-06 00:27:37','aimeos:setup'),('QAR',NULL,'Qatari riyal',0,'2019-12-06 00:27:37','2019-12-06 00:27:37','aimeos:setup'),('RON',NULL,'Romanian leu',0,'2019-12-06 00:27:37','2019-12-06 00:27:37','aimeos:setup'),('RSD',NULL,'Serbian dinar',0,'2019-12-06 00:27:37','2019-12-06 00:27:37','aimeos:setup'),('RUB',NULL,'Russian ruble',1,'2019-12-06 00:27:37','2019-12-06 00:27:37','aimeos:setup'),('RWF',NULL,'Rwandan franc',0,'2019-12-06 00:27:37','2019-12-06 00:27:37','aimeos:setup'),('SAR',NULL,'Saudi riyal',0,'2019-12-06 00:27:37','2019-12-06 00:27:37','aimeos:setup'),('SBD',NULL,'Solomon Islands dollar',0,'2019-12-06 00:27:37','2019-12-06 00:27:37','aimeos:setup'),('SCR',NULL,'Seychelles rupee',0,'2019-12-06 00:27:37','2019-12-06 00:27:37','aimeos:setup'),('SDG',NULL,'Sudanese pound',0,'2019-12-06 00:27:37','2019-12-06 00:27:37','aimeos:setup'),('SEK',NULL,'Swedish krona',0,'2019-12-06 00:27:37','2019-12-06 00:27:37','aimeos:setup'),('SGD',NULL,'Singapore dollar',0,'2019-12-06 00:27:37','2019-12-06 00:27:37','aimeos:setup'),('SHP',NULL,'Saint Helena pound',0,'2019-12-06 00:27:38','2019-12-06 00:27:38','aimeos:setup'),('SLL',NULL,'Sierra Leonean leone',0,'2019-12-06 00:27:38','2019-12-06 00:27:38','aimeos:setup'),('SOS',NULL,'Somali shilling',0,'2019-12-06 00:27:38','2019-12-06 00:27:38','aimeos:setup'),('SRD',NULL,'Suriname dollar',0,'2019-12-06 00:27:38','2019-12-06 00:27:38','aimeos:setup'),('STD',NULL,'São Tomé and Príncipe dobra',0,'2019-12-06 00:27:38','2019-12-06 00:27:38','aimeos:setup'),('SYP',NULL,'Syrian pound',0,'2019-12-06 00:27:38','2019-12-06 00:27:38','aimeos:setup'),('SZL',NULL,'Swazi lilangeni',0,'2019-12-06 00:27:38','2019-12-06 00:27:38','aimeos:setup'),('THB',NULL,'Baht',0,'2019-12-06 00:27:38','2019-12-06 00:27:38','aimeos:setup'),('TJS',NULL,'Tajikistani somoni',0,'2019-12-06 00:27:38','2019-12-06 00:27:38','aimeos:setup'),('TMT',NULL,'Turkmenistani manat',0,'2019-12-06 00:27:38','2019-12-06 00:27:38','aimeos:setup'),('TND',NULL,'Tunisian dinar',0,'2019-12-06 00:27:38','2019-12-06 00:27:38','aimeos:setup'),('TOP',NULL,'Tongan pa\'anga',0,'2019-12-06 00:27:38','2019-12-06 00:27:38','aimeos:setup'),('TRY',NULL,'Turkish new lira',0,'2019-12-06 00:27:38','2019-12-06 00:27:38','aimeos:setup'),('TTD',NULL,'Trinidad and Tobago dollar',0,'2019-12-06 00:27:38','2019-12-06 00:27:38','aimeos:setup'),('TWD',NULL,'New Taiwan dollar',0,'2019-12-06 00:27:38','2019-12-06 00:27:38','aimeos:setup'),('TZS',NULL,'Tanzanian shilling',0,'2019-12-06 00:27:38','2019-12-06 00:27:38','aimeos:setup'),('UAH',NULL,'Ukrainian hryvnia',0,'2019-12-06 00:27:38','2019-12-06 00:27:38','aimeos:setup'),('UGX',NULL,'Ugandan shilling',0,'2019-12-06 00:27:39','2019-12-06 00:27:39','aimeos:setup'),('USD',NULL,'US dollar',1,'2019-12-06 00:27:39','2019-12-06 00:27:39','aimeos:setup'),('UYU',NULL,'Uruguayan peso',0,'2019-12-06 00:27:39','2019-12-06 00:27:39','aimeos:setup'),('UZS',NULL,'Uzbekistani som',0,'2019-12-06 00:27:39','2019-12-06 00:27:39','aimeos:setup'),('VEF',NULL,'Venezuelan bolivar',0,'2019-12-06 00:27:39','2019-12-06 00:27:39','aimeos:setup'),('VND',NULL,'Vietnamese dong',0,'2019-12-06 00:27:39','2019-12-06 00:27:39','aimeos:setup'),('VUV',NULL,'Vatu',0,'2019-12-06 00:27:39','2019-12-06 00:27:39','aimeos:setup'),('WST',NULL,'Samoan tala',0,'2019-12-06 00:27:39','2019-12-06 00:27:39','aimeos:setup'),('XAF',NULL,'CFA Franc BEAC',0,'2019-12-06 00:27:39','2019-12-06 00:27:39','aimeos:setup'),('XCD',NULL,'East Caribbean dollar',0,'2019-12-06 00:27:39','2019-12-06 00:27:39','aimeos:setup'),('XOF',NULL,'CFA Franc BCEAO',0,'2019-12-06 00:27:39','2019-12-06 00:27:39','aimeos:setup'),('XPF',NULL,'CFP Franc',0,'2019-12-06 00:27:39','2019-12-06 00:27:39','aimeos:setup'),('YER',NULL,'Yemeni rial',0,'2019-12-06 00:27:39','2019-12-06 00:27:39','aimeos:setup'),('ZAR',NULL,'South African rand',0,'2019-12-06 00:27:39','2019-12-06 00:27:39','aimeos:setup'),('ZMW',NULL,'Zambian kwacha',0,'2019-12-06 00:27:39','2019-12-06 00:27:39','aimeos:setup'),('ZWL',NULL,'Zimbabwean dollar',0,'2019-12-06 00:27:39','2019-12-06 00:27:39','aimeos:setup');
/*!40000 ALTER TABLE `mshop_locale_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_locale_language`
--

DROP TABLE IF EXISTS `mshop_locale_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_locale_language` (
  `id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `siteid` int(11) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mslocla_sid_status` (`siteid`,`status`),
  KEY `idx_mslocla_sid_label` (`siteid`,`label`),
  KEY `fk_mslocla_siteid` (`siteid`),
  CONSTRAINT `fk_mslocla_siteid` FOREIGN KEY (`siteid`) REFERENCES `mshop_locale_site` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_locale_language`
--

LOCK TABLES `mshop_locale_language` WRITE;
/*!40000 ALTER TABLE `mshop_locale_language` DISABLE KEYS */;
INSERT INTO `mshop_locale_language` VALUES ('aa',NULL,'Afar',0,'2019-12-06 00:27:22','2019-12-06 00:27:22','aimeos:setup'),('ab',NULL,'Abkhazian',0,'2019-12-06 00:27:22','2019-12-06 00:27:22','aimeos:setup'),('af',NULL,'Afrikaans',0,'2019-12-06 00:27:22','2019-12-06 00:27:22','aimeos:setup'),('ak',NULL,'Akan',0,'2019-12-06 00:27:22','2019-12-06 00:27:22','aimeos:setup'),('am',NULL,'Amharic',0,'2019-12-06 00:27:22','2019-12-06 00:27:22','aimeos:setup'),('an',NULL,'Aragonese',0,'2019-12-06 00:27:22','2019-12-06 00:27:22','aimeos:setup'),('ar',NULL,'Arabic',1,'2019-12-06 00:27:22','2019-12-06 00:27:22','aimeos:setup'),('as',NULL,'Assamese',0,'2019-12-06 00:27:22','2019-12-06 00:27:22','aimeos:setup'),('av',NULL,'Avar',0,'2019-12-06 00:27:22','2019-12-06 00:27:22','aimeos:setup'),('ay',NULL,'Aymara',0,'2019-12-06 00:27:22','2019-12-06 00:27:22','aimeos:setup'),('az',NULL,'Azerbaijani',0,'2019-12-06 00:27:22','2019-12-06 00:27:22','aimeos:setup'),('ba',NULL,'Bashkir',0,'2019-12-06 00:27:22','2019-12-06 00:27:22','aimeos:setup'),('be',NULL,'Belarusian',0,'2019-12-06 00:27:22','2019-12-06 00:27:22','aimeos:setup'),('bg',NULL,'Bulgarian',0,'2019-12-06 00:27:22','2019-12-06 00:27:22','aimeos:setup'),('bh',NULL,'Bihari',0,'2019-12-06 00:27:22','2019-12-06 00:27:22','aimeos:setup'),('bi',NULL,'Bislama',0,'2019-12-06 00:27:22','2019-12-06 00:27:22','aimeos:setup'),('bm',NULL,'Bambara',0,'2019-12-06 00:27:22','2019-12-06 00:27:22','aimeos:setup'),('bn',NULL,'Bengali',1,'2019-12-06 00:27:22','2019-12-06 00:27:22','aimeos:setup'),('bo',NULL,'Tibetan',0,'2019-12-06 00:27:22','2019-12-06 00:27:22','aimeos:setup'),('br',NULL,'Breton',0,'2019-12-06 00:27:22','2019-12-06 00:27:22','aimeos:setup'),('bs',NULL,'Bosnian',0,'2019-12-06 00:27:23','2019-12-06 00:27:23','aimeos:setup'),('ca',NULL,'Catalan',0,'2019-12-06 00:27:23','2019-12-06 00:27:23','aimeos:setup'),('ce',NULL,'Chechen',0,'2019-12-06 00:27:23','2019-12-06 00:27:23','aimeos:setup'),('ch',NULL,'Chamorro',0,'2019-12-06 00:27:23','2019-12-06 00:27:23','aimeos:setup'),('co',NULL,'Corsican',0,'2019-12-06 00:27:23','2019-12-06 00:27:23','aimeos:setup'),('cr',NULL,'Cree',0,'2019-12-06 00:27:23','2019-12-06 00:27:23','aimeos:setup'),('cs',NULL,'Czech',0,'2019-12-06 00:27:23','2019-12-06 00:27:23','aimeos:setup'),('cu',NULL,'Church Slavonic',0,'2019-12-06 00:27:23','2019-12-06 00:27:23','aimeos:setup'),('cv',NULL,'Chuvash',0,'2019-12-06 00:27:23','2019-12-06 00:27:23','aimeos:setup'),('cy',NULL,'Welsh',0,'2019-12-06 00:27:23','2019-12-06 00:27:23','aimeos:setup'),('da',NULL,'Danish',0,'2019-12-06 00:27:23','2019-12-06 00:27:23','aimeos:setup'),('de',NULL,'German',1,'2019-12-06 00:27:23','2019-12-06 00:27:23','aimeos:setup'),('dv',NULL,'Dhivehi',0,'2019-12-06 00:27:23','2019-12-06 00:27:23','aimeos:setup'),('dz',NULL,'Dzongkha',0,'2019-12-06 00:27:23','2019-12-06 00:27:23','aimeos:setup'),('ee',NULL,'Ewe',0,'2019-12-06 00:27:23','2019-12-06 00:27:23','aimeos:setup'),('el',NULL,'Greek',0,'2019-12-06 00:27:23','2019-12-06 00:27:23','aimeos:setup'),('en',NULL,'English',1,'2019-12-06 00:27:23','2019-12-06 00:27:23','aimeos:setup'),('eo',NULL,'Esperanto',0,'2019-12-06 00:27:23','2019-12-06 00:27:23','aimeos:setup'),('es',NULL,'Spanish',1,'2019-12-06 00:27:23','2019-12-06 00:27:23','aimeos:setup'),('et',NULL,'Estonian',0,'2019-12-06 00:27:23','2019-12-06 00:27:23','aimeos:setup'),('eu',NULL,'Basque',0,'2019-12-06 00:27:24','2019-12-06 00:27:24','aimeos:setup'),('fa',NULL,'Persian',0,'2019-12-06 00:27:24','2019-12-06 00:27:24','aimeos:setup'),('fa_IR',NULL,'Persian (Iran)',0,'2019-12-06 00:27:24','2019-12-06 00:27:24','aimeos:setup'),('ff',NULL,'Fula',0,'2019-12-06 00:27:24','2019-12-06 00:27:24','aimeos:setup'),('fi',NULL,'Finnish',0,'2019-12-06 00:27:24','2019-12-06 00:27:24','aimeos:setup'),('fj',NULL,'Fijian',0,'2019-12-06 00:27:24','2019-12-06 00:27:24','aimeos:setup'),('fo',NULL,'Faeroese',0,'2019-12-06 00:27:24','2019-12-06 00:27:24','aimeos:setup'),('fr',NULL,'French',1,'2019-12-06 00:27:24','2019-12-06 00:27:24','aimeos:setup'),('fy',NULL,'Frisian',0,'2019-12-06 00:27:24','2019-12-06 00:27:24','aimeos:setup'),('ga',NULL,'Irish',0,'2019-12-06 00:27:24','2019-12-06 00:27:24','aimeos:setup'),('gd',NULL,'Scottish Gaelic',0,'2019-12-06 00:27:24','2019-12-06 00:27:24','aimeos:setup'),('gl',NULL,'Galician',0,'2019-12-06 00:27:24','2019-12-06 00:27:24','aimeos:setup'),('gn',NULL,'Guaraní',0,'2019-12-06 00:27:24','2019-12-06 00:27:24','aimeos:setup'),('gu',NULL,'Gujarati',0,'2019-12-06 00:27:24','2019-12-06 00:27:24','aimeos:setup'),('gv',NULL,'Manx',0,'2019-12-06 00:27:24','2019-12-06 00:27:24','aimeos:setup'),('ha',NULL,'Hausa',0,'2019-12-06 00:27:24','2019-12-06 00:27:24','aimeos:setup'),('he',NULL,'Hebrew',0,'2019-12-06 00:27:24','2019-12-06 00:27:24','aimeos:setup'),('hi',NULL,'Hindi',1,'2019-12-06 00:27:24','2019-12-06 00:27:24','aimeos:setup'),('ho',NULL,'Hiri motu',0,'2019-12-06 00:27:24','2019-12-06 00:27:24','aimeos:setup'),('hr',NULL,'Croatian',0,'2019-12-06 00:27:24','2019-12-06 00:27:24','aimeos:setup'),('ht',NULL,'Haïtian Creole',0,'2019-12-06 00:27:25','2019-12-06 00:27:25','aimeos:setup'),('hu',NULL,'Hungarian',0,'2019-12-06 00:27:25','2019-12-06 00:27:25','aimeos:setup'),('hy',NULL,'Armenian',0,'2019-12-06 00:27:25','2019-12-06 00:27:25','aimeos:setup'),('hz',NULL,'Herero',0,'2019-12-06 00:27:25','2019-12-06 00:27:25','aimeos:setup'),('ia',NULL,'Interlingua',0,'2019-12-06 00:27:25','2019-12-06 00:27:25','aimeos:setup'),('id',NULL,'Indonesian',0,'2019-12-06 00:27:25','2019-12-06 00:27:25','aimeos:setup'),('ie',NULL,'Interlingue',0,'2019-12-06 00:27:25','2019-12-06 00:27:25','aimeos:setup'),('ig',NULL,'Igbo',0,'2019-12-06 00:27:25','2019-12-06 00:27:25','aimeos:setup'),('ii',NULL,'Yi',0,'2019-12-06 00:27:25','2019-12-06 00:27:25','aimeos:setup'),('ik',NULL,'Inupiaq',0,'2019-12-06 00:27:25','2019-12-06 00:27:25','aimeos:setup'),('io',NULL,'Ido',0,'2019-12-06 00:27:25','2019-12-06 00:27:25','aimeos:setup'),('is',NULL,'Icelandic',0,'2019-12-06 00:27:25','2019-12-06 00:27:25','aimeos:setup'),('it',NULL,'Italian',0,'2019-12-06 00:27:25','2019-12-06 00:27:25','aimeos:setup'),('iu',NULL,'Inuktitut',0,'2019-12-06 00:27:25','2019-12-06 00:27:25','aimeos:setup'),('ja',NULL,'Japanese',1,'2019-12-06 00:27:25','2019-12-06 00:27:25','aimeos:setup'),('jv',NULL,'Javanese',0,'2019-12-06 00:27:26','2019-12-06 00:27:26','aimeos:setup'),('ka',NULL,'Georgian',0,'2019-12-06 00:27:26','2019-12-06 00:27:26','aimeos:setup'),('kg',NULL,'Kongo',0,'2019-12-06 00:27:26','2019-12-06 00:27:26','aimeos:setup'),('ki',NULL,'Kikuyu',0,'2019-12-06 00:27:26','2019-12-06 00:27:26','aimeos:setup'),('kj',NULL,'Kuanyama',0,'2019-12-06 00:27:26','2019-12-06 00:27:26','aimeos:setup'),('kk',NULL,'Kazakh',0,'2019-12-06 00:27:26','2019-12-06 00:27:26','aimeos:setup'),('kl',NULL,'Greenlandic',0,'2019-12-06 00:27:26','2019-12-06 00:27:26','aimeos:setup'),('km',NULL,'Khmer',0,'2019-12-06 00:27:26','2019-12-06 00:27:26','aimeos:setup'),('kn',NULL,'Kannada',0,'2019-12-06 00:27:26','2019-12-06 00:27:26','aimeos:setup'),('ko',NULL,'Korean',0,'2019-12-06 00:27:26','2019-12-06 00:27:26','aimeos:setup'),('kr',NULL,'Kanuri',0,'2019-12-06 00:27:26','2019-12-06 00:27:26','aimeos:setup'),('ks',NULL,'Kashmiri',0,'2019-12-06 00:27:26','2019-12-06 00:27:26','aimeos:setup'),('ku',NULL,'Kurdish',0,'2019-12-06 00:27:27','2019-12-06 00:27:27','aimeos:setup'),('kv',NULL,'Komi',0,'2019-12-06 00:27:27','2019-12-06 00:27:27','aimeos:setup'),('kw',NULL,'Cornish',0,'2019-12-06 00:27:27','2019-12-06 00:27:27','aimeos:setup'),('ky',NULL,'Kirghiz',0,'2019-12-06 00:27:27','2019-12-06 00:27:27','aimeos:setup'),('lb',NULL,'Luxembourgish',0,'2019-12-06 00:27:27','2019-12-06 00:27:27','aimeos:setup'),('lg',NULL,'Luganda',0,'2019-12-06 00:27:27','2019-12-06 00:27:27','aimeos:setup'),('li',NULL,'Limburgish',0,'2019-12-06 00:27:27','2019-12-06 00:27:27','aimeos:setup'),('ln',NULL,'Lingala',0,'2019-12-06 00:27:27','2019-12-06 00:27:27','aimeos:setup'),('lo',NULL,'Lao',0,'2019-12-06 00:27:27','2019-12-06 00:27:27','aimeos:setup'),('lt',NULL,'Lithuanian',0,'2019-12-06 00:27:27','2019-12-06 00:27:27','aimeos:setup'),('lu',NULL,'Luba-Katanga',0,'2019-12-06 00:27:27','2019-12-06 00:27:27','aimeos:setup'),('lv',NULL,'Latvian',0,'2019-12-06 00:27:27','2019-12-06 00:27:27','aimeos:setup'),('mg',NULL,'Malagasy',0,'2019-12-06 00:27:27','2019-12-06 00:27:27','aimeos:setup'),('mh',NULL,'Marshallese',0,'2019-12-06 00:27:27','2019-12-06 00:27:27','aimeos:setup'),('mi',NULL,'Māori',0,'2019-12-06 00:27:27','2019-12-06 00:27:27','aimeos:setup'),('mk',NULL,'Macedonian',0,'2019-12-06 00:27:27','2019-12-06 00:27:27','aimeos:setup'),('ml',NULL,'Malayalam',0,'2019-12-06 00:27:27','2019-12-06 00:27:27','aimeos:setup'),('mn',NULL,'Mongolian',0,'2019-12-06 00:27:27','2019-12-06 00:27:27','aimeos:setup'),('mo',NULL,'Moldavian',0,'2019-12-06 00:27:27','2019-12-06 00:27:27','aimeos:setup'),('mr',NULL,'Marathi',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('ms',NULL,'Malay',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('mt',NULL,'Maltese',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('my',NULL,'Burmese',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('na',NULL,'Nauru',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('nb',NULL,'Norwegian Bokmål',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('nd',NULL,'North Ndebele',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('ne',NULL,'Nepali',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('ng',NULL,'Ndonga',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('nl',NULL,'Dutch',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('nl_BE',NULL,'Dutch (Belgium)',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('nn',NULL,'Norwegian Nynorsk',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('no',NULL,'Norwegian',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('nr',NULL,'South Ndebele',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('nv',NULL,'Navajo',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('ny',NULL,'Chichewa',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('oc',NULL,'Occitan',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('oj',NULL,'Ojibwa',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('om',NULL,'Oromo',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('or',NULL,'Oriya',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('os',NULL,'Ossetic',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('pa',NULL,'Punjabi',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('pi',NULL,'Pali',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('pl',NULL,'Polish',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('ps',NULL,'Pashto',0,'2019-12-06 00:27:28','2019-12-06 00:27:28','aimeos:setup'),('pt',NULL,'Portuguese',1,'2019-12-06 00:27:29','2019-12-06 00:27:29','aimeos:setup'),('qu',NULL,'Quechua',0,'2019-12-06 00:27:29','2019-12-06 00:27:29','aimeos:setup'),('rm',NULL,'Rhaeto-Romance',0,'2019-12-06 00:27:29','2019-12-06 00:27:29','aimeos:setup'),('rn',NULL,'Kirundi',0,'2019-12-06 00:27:29','2019-12-06 00:27:29','aimeos:setup'),('ro',NULL,'Romanian',0,'2019-12-06 00:27:29','2019-12-06 00:27:29','aimeos:setup'),('ru',NULL,'Russian',1,'2019-12-06 00:27:29','2019-12-06 00:27:29','aimeos:setup'),('rw',NULL,'Kinyarwanda',0,'2019-12-06 00:27:29','2019-12-06 00:27:29','aimeos:setup'),('sa',NULL,'Sanskrit',0,'2019-12-06 00:27:29','2019-12-06 00:27:29','aimeos:setup'),('sc',NULL,'Sardinian',0,'2019-12-06 00:27:29','2019-12-06 00:27:29','aimeos:setup'),('sd',NULL,'Sindhi',0,'2019-12-06 00:27:29','2019-12-06 00:27:29','aimeos:setup'),('se',NULL,'Northern Sami',0,'2019-12-06 00:27:29','2019-12-06 00:27:29','aimeos:setup'),('sg',NULL,'Sango',0,'2019-12-06 00:27:29','2019-12-06 00:27:29','aimeos:setup'),('si',NULL,'Sinhala',0,'2019-12-06 00:27:29','2019-12-06 00:27:29','aimeos:setup'),('sk',NULL,'Slovak',0,'2019-12-06 00:27:29','2019-12-06 00:27:29','aimeos:setup'),('sl',NULL,'Slovenian',0,'2019-12-06 00:27:29','2019-12-06 00:27:29','aimeos:setup'),('sm',NULL,'Samoan',0,'2019-12-06 00:27:29','2019-12-06 00:27:29','aimeos:setup'),('sn',NULL,'Shona',0,'2019-12-06 00:27:29','2019-12-06 00:27:29','aimeos:setup'),('so',NULL,'Somali',0,'2019-12-06 00:27:29','2019-12-06 00:27:29','aimeos:setup'),('sq',NULL,'Albanian',0,'2019-12-06 00:27:30','2019-12-06 00:27:30','aimeos:setup'),('sr',NULL,'Serbian',0,'2019-12-06 00:27:30','2019-12-06 00:27:30','aimeos:setup'),('sr_RS',NULL,'Serbian (Serbia)',0,'2019-12-06 00:27:30','2019-12-06 00:27:30','aimeos:setup'),('ss',NULL,'Swati',0,'2019-12-06 00:27:30','2019-12-06 00:27:30','aimeos:setup'),('st',NULL,'Sesotho',0,'2019-12-06 00:27:30','2019-12-06 00:27:30','aimeos:setup'),('su',NULL,'Sundanese',0,'2019-12-06 00:27:30','2019-12-06 00:27:30','aimeos:setup'),('sv',NULL,'Swedish',0,'2019-12-06 00:27:30','2019-12-06 00:27:30','aimeos:setup'),('sw',NULL,'Swahili',0,'2019-12-06 00:27:30','2019-12-06 00:27:30','aimeos:setup'),('ta',NULL,'Tamil',0,'2019-12-06 00:27:30','2019-12-06 00:27:30','aimeos:setup'),('te',NULL,'Telugu',0,'2019-12-06 00:27:30','2019-12-06 00:27:30','aimeos:setup'),('tg',NULL,'Tajik',0,'2019-12-06 00:27:30','2019-12-06 00:27:30','aimeos:setup'),('th',NULL,'Thai',0,'2019-12-06 00:27:30','2019-12-06 00:27:30','aimeos:setup'),('ti',NULL,'Tigrinya',0,'2019-12-06 00:27:30','2019-12-06 00:27:30','aimeos:setup'),('tk',NULL,'Turkmen',0,'2019-12-06 00:27:30','2019-12-06 00:27:30','aimeos:setup'),('tl',NULL,'Tagalog',0,'2019-12-06 00:27:30','2019-12-06 00:27:30','aimeos:setup'),('tn',NULL,'Setswana',0,'2019-12-06 00:27:30','2019-12-06 00:27:30','aimeos:setup'),('to',NULL,'Tongan',0,'2019-12-06 00:27:30','2019-12-06 00:27:30','aimeos:setup'),('tr',NULL,'Turkish',0,'2019-12-06 00:27:30','2019-12-06 00:27:30','aimeos:setup'),('tr_TR',NULL,'Turkish (Turkey)',0,'2019-12-06 00:27:30','2019-12-06 00:27:30','aimeos:setup'),('ts',NULL,'Tsonga',0,'2019-12-06 00:27:30','2019-12-06 00:27:30','aimeos:setup'),('tt',NULL,'Tatar',0,'2019-12-06 00:27:30','2019-12-06 00:27:30','aimeos:setup'),('tw',NULL,'Twi',0,'2019-12-06 00:27:31','2019-12-06 00:27:31','aimeos:setup'),('ty',NULL,'Tahitian',0,'2019-12-06 00:27:31','2019-12-06 00:27:31','aimeos:setup'),('ug',NULL,'Uyghur',0,'2019-12-06 00:27:31','2019-12-06 00:27:31','aimeos:setup'),('uk',NULL,'Ukrainian',0,'2019-12-06 00:27:31','2019-12-06 00:27:31','aimeos:setup'),('ur',NULL,'Urdu',0,'2019-12-06 00:27:31','2019-12-06 00:27:31','aimeos:setup'),('uz',NULL,'Uzbek',0,'2019-12-06 00:27:31','2019-12-06 00:27:31','aimeos:setup'),('ve',NULL,'Venda',0,'2019-12-06 00:27:31','2019-12-06 00:27:31','aimeos:setup'),('vi',NULL,'Vietnamese',0,'2019-12-06 00:27:31','2019-12-06 00:27:31','aimeos:setup'),('vo',NULL,'Volapük',0,'2019-12-06 00:27:31','2019-12-06 00:27:31','aimeos:setup'),('wa',NULL,'Walloon',0,'2019-12-06 00:27:31','2019-12-06 00:27:31','aimeos:setup'),('wo',NULL,'Wolof',0,'2019-12-06 00:27:31','2019-12-06 00:27:31','aimeos:setup'),('xh',NULL,'Xhosa',0,'2019-12-06 00:27:31','2019-12-06 00:27:31','aimeos:setup'),('yi',NULL,'Yiddish',0,'2019-12-06 00:27:31','2019-12-06 00:27:31','aimeos:setup'),('yo',NULL,'Yoruba',0,'2019-12-06 00:27:31','2019-12-06 00:27:31','aimeos:setup'),('za',NULL,'Zhuang',0,'2019-12-06 00:27:31','2019-12-06 00:27:31','aimeos:setup'),('zh',NULL,'Chinese',1,'2019-12-06 00:27:31','2019-12-06 00:27:31','aimeos:setup'),('zh_CN',NULL,'Chinese (China)',0,'2019-12-06 00:27:31','2019-12-06 00:27:31','aimeos:setup'),('zu',NULL,'Zulu',0,'2019-12-06 00:27:31','2019-12-06 00:27:31','aimeos:setup');
/*!40000 ALTER TABLE `mshop_locale_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_locale_site`
--

DROP TABLE IF EXISTS `mshop_locale_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_locale_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `level` smallint(6) NOT NULL,
  `nleft` int(11) NOT NULL,
  `nright` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mslocsi_code` (`code`),
  KEY `idx_mslocsi_nlt_nrt_lvl_pid` (`nleft`,`nright`,`level`,`parentid`),
  KEY `idx_mslocsi_level_status` (`level`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_locale_site`
--

LOCK TABLES `mshop_locale_site` WRITE;
/*!40000 ALTER TABLE `mshop_locale_site` DISABLE KEYS */;
INSERT INTO `mshop_locale_site` VALUES (1,0,'default','Default','[]',0,1,2,1,'2019-12-06 00:27:43','2019-12-06 00:27:43','core:setup');
/*!40000 ALTER TABLE `mshop_locale_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_media`
--

DROP TABLE IF EXISTS `mshop_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `langid` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `preview` text COLLATE utf8_unicode_ci NOT NULL,
  `mimetype` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msmed_sid_dom_langid` (`siteid`,`domain`,`langid`),
  KEY `idx_msmed_sid_dom_label` (`siteid`,`domain`,`label`),
  KEY `idx_msmed_sid_dom_mime` (`siteid`,`domain`,`mimetype`),
  KEY `idx_msmed_sid_dom_link` (`siteid`,`domain`,`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_media`
--

LOCK TABLES `mshop_media` WRITE;
/*!40000 ALTER TABLE `mshop_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_media_list`
--

DROP TABLE IF EXISTS `mshop_media_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_media_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `key` varchar(134) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `refid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msmedli_pid_sid_dm_ty_rid` (`parentid`,`siteid`,`domain`,`type`,`refid`),
  KEY `idx_msmedli_sid_key` (`siteid`,`key`),
  KEY `fk_msmedli_pid` (`parentid`),
  CONSTRAINT `fk_msmedli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_media_list`
--

LOCK TABLES `mshop_media_list` WRITE;
/*!40000 ALTER TABLE `mshop_media_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_media_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_media_list_type`
--

DROP TABLE IF EXISTS `mshop_media_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_media_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msmedlity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msmedlity_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msmedlity_sid_label` (`siteid`,`label`),
  KEY `idx_msmedlity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_media_list_type`
--

LOCK TABLES `mshop_media_list_type` WRITE;
/*!40000 ALTER TABLE `mshop_media_list_type` DISABLE KEYS */;
INSERT INTO `mshop_media_list_type` VALUES (1,1,'product','default','Standard',0,1,'2019-12-06 00:27:47','2019-12-06 00:27:47','core:setup'),(2,1,'attribute','default','Standard',0,1,'2019-12-06 00:27:47','2019-12-06 00:27:47','core:setup'),(3,1,'attribute','variant','Variant',0,1,'2019-12-06 00:27:47','2019-12-06 00:27:47','core:setup'),(4,1,'catalog','default','Standard',0,1,'2019-12-06 00:27:47','2019-12-06 00:27:47','core:setup'),(5,1,'media','default','Standard',0,1,'2019-12-06 00:27:47','2019-12-06 00:27:47','core:setup'),(6,1,'price','default','Standard',0,1,'2019-12-06 00:27:47','2019-12-06 00:27:47','core:setup'),(7,1,'service','default','Standard',0,1,'2019-12-06 00:27:48','2019-12-06 00:27:48','core:setup'),(8,1,'supplier','default','Standard',0,1,'2019-12-06 00:27:48','2019-12-06 00:27:48','core:setup'),(9,1,'text','default','Standard',0,1,'2019-12-06 00:27:48','2019-12-06 00:27:48','core:setup');
/*!40000 ALTER TABLE `mshop_media_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_media_property`
--

DROP TABLE IF EXISTS `mshop_media_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_media_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `key` varchar(103) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `langid` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msmedpr_sid_ty_lid_value` (`parentid`,`siteid`,`type`,`langid`,`value`),
  KEY `fk_msmedpr_sid_key` (`siteid`,`key`),
  KEY `fk_msmedpr_pid` (`parentid`),
  CONSTRAINT `fk_msmedpr_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_media_property`
--

LOCK TABLES `mshop_media_property` WRITE;
/*!40000 ALTER TABLE `mshop_media_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_media_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_media_property_type`
--

DROP TABLE IF EXISTS `mshop_media_property_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_media_property_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msmedprty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msmedprty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msmedprty_sid_label` (`siteid`,`label`),
  KEY `idx_msmedprty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_media_property_type`
--

LOCK TABLES `mshop_media_property_type` WRITE;
/*!40000 ALTER TABLE `mshop_media_property_type` DISABLE KEYS */;
INSERT INTO `mshop_media_property_type` VALUES (1,1,'media','name','Media title',0,1,'2019-12-06 00:27:48','2019-12-06 00:27:48','core:setup'),(2,1,'media','240','240px width',0,1,'2019-12-06 00:27:48','2019-12-06 00:27:48','core:setup'),(3,1,'media','720','720px width',0,1,'2019-12-06 00:27:48','2019-12-06 00:27:48','core:setup'),(4,1,'media','2160','2160px width',0,1,'2019-12-06 00:27:48','2019-12-06 00:27:48','core:setup');
/*!40000 ALTER TABLE `mshop_media_property_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_media_type`
--

DROP TABLE IF EXISTS `mshop_media_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_media_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msmedty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msmedty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msmedty_sid_label` (`siteid`,`label`),
  KEY `idx_msmedty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_media_type`
--

LOCK TABLES `mshop_media_type` WRITE;
/*!40000 ALTER TABLE `mshop_media_type` DISABLE KEYS */;
INSERT INTO `mshop_media_type` VALUES (1,1,'attribute','default','Standard',0,1,'2019-12-06 00:27:46','2019-12-06 00:27:46','core:setup'),(2,1,'attribute','icon','Icon',0,1,'2019-12-06 00:27:46','2019-12-06 00:27:46','core:setup'),(3,1,'catalog','default','Standard',0,1,'2019-12-06 00:27:46','2019-12-06 00:27:46','core:setup'),(4,1,'catalog','stage','Stage',0,1,'2019-12-06 00:27:46','2019-12-06 00:27:46','core:setup'),(5,1,'catalog','icon','Icon',0,1,'2019-12-06 00:27:46','2019-12-06 00:27:46','core:setup'),(6,1,'media','default','Standard',0,1,'2019-12-06 00:27:46','2019-12-06 00:27:46','core:setup'),(7,1,'price','default','Standard',0,1,'2019-12-06 00:27:46','2019-12-06 00:27:46','core:setup'),(8,1,'product','default','Standard',0,1,'2019-12-06 00:27:47','2019-12-06 00:27:47','core:setup'),(9,1,'product','download','Download',0,1,'2019-12-06 00:27:47','2019-12-06 00:27:47','core:setup'),(10,1,'service','default','Standard',0,1,'2019-12-06 00:27:47','2019-12-06 00:27:47','core:setup'),(11,1,'service','icon','Icon',0,1,'2019-12-06 00:27:47','2019-12-06 00:27:47','core:setup'),(12,1,'supplier','default','Standard',0,1,'2019-12-06 00:27:47','2019-12-06 00:27:47','core:setup'),(13,1,'text','default','Standard',0,1,'2019-12-06 00:27:47','2019-12-06 00:27:47','core:setup');
/*!40000 ALTER TABLE `mshop_media_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_order`
--

DROP TABLE IF EXISTS `mshop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `baseid` bigint(20) NOT NULL,
  `siteid` int(11) DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `datepayment` datetime DEFAULT NULL,
  `datedelivery` datetime DEFAULT NULL,
  `statuspayment` smallint(6) NOT NULL DEFAULT -1,
  `statusdelivery` smallint(6) NOT NULL DEFAULT -1,
  `relatedid` bigint(20) DEFAULT NULL,
  `cdate` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `cmonth` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `cweek` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `cwday` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `chour` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msord_sid_type` (`siteid`,`type`),
  KEY `idx_msord_sid_mtime_pstat` (`siteid`,`mtime`,`statuspayment`),
  KEY `idx_msord_sid_mtime_dstat` (`siteid`,`mtime`,`statusdelivery`),
  KEY `idx_msord_sid_dstatus` (`siteid`,`statusdelivery`),
  KEY `idx_msord_sid_ddate` (`siteid`,`datedelivery`),
  KEY `idx_msord_sid_pdate` (`siteid`,`datepayment`),
  KEY `idx_msord_sid_editor` (`siteid`,`editor`),
  KEY `idx_msord_sid_ctime` (`siteid`,`ctime`),
  KEY `idx_msord_sid_cdate` (`siteid`,`cdate`),
  KEY `idx_msord_sid_cmonth` (`siteid`,`cmonth`),
  KEY `idx_msord_sid_cweek` (`siteid`,`cweek`),
  KEY `idx_msord_sid_cwday` (`siteid`,`cwday`),
  KEY `idx_msord_sid_chour` (`siteid`,`chour`),
  KEY `fk_msord_baseid` (`baseid`),
  CONSTRAINT `fk_msord_baseid` FOREIGN KEY (`baseid`) REFERENCES `mshop_order_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_order`
--

LOCK TABLES `mshop_order` WRITE;
/*!40000 ALTER TABLE `mshop_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_order_base`
--

DROP TABLE IF EXISTS `mshop_order_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_order_base` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) DEFAULT NULL,
  `customerid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `sitecode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `langid` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `currencyid` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `costs` decimal(12,2) NOT NULL,
  `rebate` decimal(12,2) NOT NULL,
  `tax` decimal(14,4) NOT NULL,
  `taxflag` smallint(6) NOT NULL,
  `customerref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msordba_scode_custid` (`sitecode`,`customerid`),
  KEY `idx_msordba_sid_custid` (`siteid`,`customerid`),
  KEY `idx_msordba_sid_ctime` (`siteid`,`ctime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_order_base`
--

LOCK TABLES `mshop_order_base` WRITE;
/*!40000 ALTER TABLE `mshop_order_base` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_order_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_order_base_address`
--

DROP TABLE IF EXISTS `mshop_order_base_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_order_base_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `baseid` bigint(20) NOT NULL,
  `siteid` int(11) DEFAULT NULL,
  `addrid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `salutation` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `vatid` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `address1` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `address2` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `address3` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `postal` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `langid` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `countryid` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `telefax` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `longitude` decimal(8,6) DEFAULT NULL,
  `latitude` decimal(8,6) DEFAULT NULL,
  `pos` int(11) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msordbaad_bid_type` (`baseid`,`type`),
  KEY `idx_msordbaad_sid_bid_typ` (`siteid`,`baseid`,`type`),
  KEY `idx_msordbaad_bid_sid_lname` (`baseid`,`siteid`,`lastname`),
  KEY `idx_msordbaad_bid_sid_addr1` (`baseid`,`siteid`,`address1`),
  KEY `idx_msordbaad_bid_sid_postal` (`baseid`,`siteid`,`postal`),
  KEY `idx_msordbaad_bid_sid_city` (`baseid`,`siteid`,`city`),
  KEY `idx_msordbaad_bid_sid_email` (`baseid`,`siteid`,`email`),
  KEY `fk_msordbaad_baseid` (`baseid`),
  CONSTRAINT `fk_msordbaad_baseid` FOREIGN KEY (`baseid`) REFERENCES `mshop_order_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_order_base_address`
--

LOCK TABLES `mshop_order_base_address` WRITE;
/*!40000 ALTER TABLE `mshop_order_base_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_order_base_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_order_base_coupon`
--

DROP TABLE IF EXISTS `mshop_order_base_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_order_base_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `baseid` bigint(20) NOT NULL,
  `ordprodid` bigint(20) DEFAULT NULL,
  `siteid` int(11) DEFAULT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msordbaco_sid_bid_code` (`siteid`,`baseid`,`code`),
  KEY `fk_msordbaco_ordprodid` (`ordprodid`),
  KEY `fk_msordbaco_baseid` (`baseid`),
  CONSTRAINT `fk_msordbaco_baseid` FOREIGN KEY (`baseid`) REFERENCES `mshop_order_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_msordbaco_ordprodid` FOREIGN KEY (`ordprodid`) REFERENCES `mshop_order_base_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_order_base_coupon`
--

LOCK TABLES `mshop_order_base_coupon` WRITE;
/*!40000 ALTER TABLE `mshop_order_base_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_order_base_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_order_base_product`
--

DROP TABLE IF EXISTS `mshop_order_base_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_order_base_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `baseid` bigint(20) NOT NULL,
  `siteid` int(11) DEFAULT NULL,
  `ordprodid` bigint(20) DEFAULT NULL,
  `ordaddrid` bigint(20) DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `prodid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `prodcode` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `suppliercode` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `stocktype` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `mediaurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `target` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timeframe` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `quantity` int(11) NOT NULL,
  `currencyid` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `costs` decimal(12,2) NOT NULL,
  `rebate` decimal(12,2) NOT NULL,
  `tax` decimal(14,4) NOT NULL,
  `taxrate` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `taxflag` smallint(6) NOT NULL,
  `flags` int(11) NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT -1,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msordbapr_bid_pos` (`baseid`,`pos`),
  KEY `idx_msordbapr_sid_bid_pcd` (`siteid`,`baseid`,`prodcode`),
  KEY `idx_msordbapr_sid_ct_pid_bid` (`siteid`,`ctime`,`prodid`,`baseid`),
  KEY `fk_msordbapr_baseid` (`baseid`),
  CONSTRAINT `fk_msordbapr_baseid` FOREIGN KEY (`baseid`) REFERENCES `mshop_order_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_order_base_product`
--

LOCK TABLES `mshop_order_base_product` WRITE;
/*!40000 ALTER TABLE `mshop_order_base_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_order_base_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_order_base_product_attr`
--

DROP TABLE IF EXISTS `mshop_order_base_product_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_order_base_product_attr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ordprodid` bigint(20) NOT NULL,
  `siteid` int(11) DEFAULT NULL,
  `attrid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msordbaprat_oid_aid_ty_cd` (`ordprodid`,`attrid`,`type`,`code`),
  KEY `fk_msordbaprat_ordprodid` (`ordprodid`),
  KEY `idx_msordbaprat_si_cd_va` (`siteid`,`code`,`value`(16)),
  CONSTRAINT `fk_msordbaprat_ordprodid` FOREIGN KEY (`ordprodid`) REFERENCES `mshop_order_base_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_order_base_product_attr`
--

LOCK TABLES `mshop_order_base_product_attr` WRITE;
/*!40000 ALTER TABLE `mshop_order_base_product_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_order_base_product_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_order_base_service`
--

DROP TABLE IF EXISTS `mshop_order_base_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_order_base_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `baseid` bigint(20) NOT NULL,
  `siteid` int(11) DEFAULT NULL,
  `servid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mediaurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `currencyid` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `costs` decimal(12,2) NOT NULL,
  `rebate` decimal(12,2) NOT NULL,
  `tax` decimal(14,4) NOT NULL,
  `taxrate` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `taxflag` smallint(6) NOT NULL DEFAULT 1,
  `pos` int(11) NOT NULL DEFAULT 0,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msordbase_sid_bid_cd_typ` (`siteid`,`baseid`,`code`,`type`),
  KEY `idx_msordbase_sid_code_type` (`siteid`,`code`,`type`),
  KEY `fk_msordbase_baseid` (`baseid`),
  CONSTRAINT `fk_msordbase_baseid` FOREIGN KEY (`baseid`) REFERENCES `mshop_order_base` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_order_base_service`
--

LOCK TABLES `mshop_order_base_service` WRITE;
/*!40000 ALTER TABLE `mshop_order_base_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_order_base_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_order_base_service_attr`
--

DROP TABLE IF EXISTS `mshop_order_base_service_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_order_base_service_attr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ordservid` bigint(20) NOT NULL,
  `siteid` int(11) DEFAULT NULL,
  `attrid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msordbaseat_oid_aid_ty_cd` (`ordservid`,`attrid`,`type`,`code`),
  KEY `fk_msordbaseat_ordservid` (`ordservid`),
  KEY `idx_msordbaseat_si_cd_va` (`siteid`,`code`,`value`(16)),
  CONSTRAINT `fk_msordbaseat_ordservid` FOREIGN KEY (`ordservid`) REFERENCES `mshop_order_base_service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_order_base_service_attr`
--

LOCK TABLES `mshop_order_base_service_attr` WRITE;
/*!40000 ALTER TABLE `mshop_order_base_service_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_order_base_service_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_order_status`
--

DROP TABLE IF EXISTS `mshop_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_order_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parentid` bigint(20) NOT NULL,
  `siteid` int(11) DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_msordstatus_val_sid` (`siteid`,`parentid`,`type`,`value`),
  KEY `fk_msordst_pid` (`parentid`),
  CONSTRAINT `fk_msordst_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_order_status`
--

LOCK TABLES `mshop_order_status` WRITE;
/*!40000 ALTER TABLE `mshop_order_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_plugin`
--

DROP TABLE IF EXISTS `mshop_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_plugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msplu_sid_ty_prov` (`siteid`,`type`,`provider`),
  KEY `idx_msplu_sid_prov` (`siteid`,`provider`),
  KEY `idx_msplu_sid_status` (`siteid`,`status`),
  KEY `idx_msplu_sid_label` (`siteid`,`label`),
  KEY `idx_msplu_sid_pos` (`siteid`,`pos`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_plugin`
--

LOCK TABLES `mshop_plugin` WRITE;
/*!40000 ALTER TABLE `mshop_plugin` DISABLE KEYS */;
INSERT INTO `mshop_plugin` VALUES (1,1,'order','Updates delivery/payment options on basket change','ServicesUpdate','[]',0,1,'2019-12-06 00:27:53','2019-12-06 00:27:53','core:setup'),(2,1,'order','Adds addresses/delivery/payment to basket','Autofill','{\"address\":1,\"useorder\":1,\"orderaddress\":1,\"orderservice\":1,\"delivery\":1,\"payment\":0}',1,1,'2019-12-06 00:27:53','2019-12-06 00:27:53','core:setup'),(3,1,'order','Checks for required addresses (billing/delivery)','AddressesAvailable','{\"payment\":1,\"delivery\":\"\"}',2,1,'2019-12-06 00:27:53','2019-12-06 00:27:53','core:setup'),(4,1,'order','Checks for required services (delivery/payment)','ServicesAvailable','{\"payment\":1,\"delivery\":1}',3,1,'2019-12-06 00:27:53','2019-12-06 00:27:53','core:setup'),(5,1,'order','Checks for deleted products','ProductGone','[]',4,1,'2019-12-06 00:27:53','2019-12-06 00:27:53','core:setup'),(6,1,'order','Checks for changed product prices','ProductPrice','[]',5,1,'2019-12-06 00:27:53','2019-12-06 00:27:53','core:setup'),(7,1,'order','Checks for necessary basket limits','BasketLimits','{\"min-products\":1,\"max-products\":100,\"min-value\":{\"EUR\":\"1.00\"},\"max-value\":{\"EUR\":\"10000.00\"}}',6,0,'2019-12-06 00:27:54','2019-12-06 00:27:54','core:setup'),(8,1,'order','Limits maximum amount of products','ProductLimit','{\"single-number-max\":10,\"total-number-max\":100,\"single-value-max\":{\"EUR\":\"1000.00\"},\"total-value-max\":{\"EUR\":\"10000.00\"}}',7,0,'2019-12-06 00:27:54','2019-12-06 00:27:54','core:setup'),(9,1,'order','Free shipping above threshold','Shipping','{\"threshold\":{\"EUR\":\"1.00\"}}',8,0,'2019-12-06 00:27:54','2019-12-06 00:27:54','core:setup'),(10,1,'order','Coupon update','Coupon','[]',100,1,'2019-12-06 00:27:54','2019-12-06 00:27:54','core:setup'),(11,1,'order','Checks for products out of stock','ProductStock','[]',101,1,'2019-12-06 00:27:54','2019-12-06 00:27:54','core:setup');
/*!40000 ALTER TABLE `mshop_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_plugin_type`
--

DROP TABLE IF EXISTS `mshop_plugin_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_plugin_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mspluty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_mspluty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_mspluty_sid_label` (`siteid`,`label`),
  KEY `idx_mspluty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_plugin_type`
--

LOCK TABLES `mshop_plugin_type` WRITE;
/*!40000 ALTER TABLE `mshop_plugin_type` DISABLE KEYS */;
INSERT INTO `mshop_plugin_type` VALUES (1,1,'plugin','order','Order',0,1,'2019-12-06 00:27:48','2019-12-06 00:27:48','core:setup');
/*!40000 ALTER TABLE `mshop_plugin_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_price`
--

DROP TABLE IF EXISTS `mshop_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `currencyid` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `value` decimal(12,2) NOT NULL,
  `costs` decimal(12,2) NOT NULL,
  `rebate` decimal(12,2) NOT NULL,
  `taxrate` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mspri_sid_dom_currid` (`siteid`,`domain`,`currencyid`),
  KEY `idx_mspri_sid_dom_quantity` (`siteid`,`domain`,`quantity`),
  KEY `idx_mspri_sid_dom_value` (`siteid`,`domain`,`value`),
  KEY `idx_mspri_sid_dom_costs` (`siteid`,`domain`,`costs`),
  KEY `idx_mspri_sid_dom_rebate` (`siteid`,`domain`,`rebate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_price`
--

LOCK TABLES `mshop_price` WRITE;
/*!40000 ALTER TABLE `mshop_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_price_list`
--

DROP TABLE IF EXISTS `mshop_price_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_price_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `key` varchar(134) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `refid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msprili_pid_sid_dm_ty_rid` (`parentid`,`siteid`,`domain`,`type`,`refid`),
  KEY `idx_msprili_sid_key` (`siteid`,`key`),
  KEY `fk_msprili_pid` (`parentid`),
  CONSTRAINT `fk_msprili_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_price` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_price_list`
--

LOCK TABLES `mshop_price_list` WRITE;
/*!40000 ALTER TABLE `mshop_price_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_price_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_price_list_type`
--

DROP TABLE IF EXISTS `mshop_price_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_price_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msprility_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msprility_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msprility_sid_label` (`siteid`,`label`),
  KEY `idx_msprility_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_price_list_type`
--

LOCK TABLES `mshop_price_list_type` WRITE;
/*!40000 ALTER TABLE `mshop_price_list_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_price_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_price_property`
--

DROP TABLE IF EXISTS `mshop_price_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_price_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `key` varchar(103) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `langid` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mspripr_sid_ty_lid_value` (`parentid`,`siteid`,`type`,`langid`,`value`),
  KEY `fk_mspripr_sid_key` (`siteid`,`key`),
  KEY `fk_mspripr_pid` (`parentid`),
  CONSTRAINT `fk_mspripr_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_price` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_price_property`
--

LOCK TABLES `mshop_price_property` WRITE;
/*!40000 ALTER TABLE `mshop_price_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_price_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_price_property_type`
--

DROP TABLE IF EXISTS `mshop_price_property_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_price_property_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mspriprty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_mspriprty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_mspriprty_sid_label` (`siteid`,`label`),
  KEY `idx_mspriprty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_price_property_type`
--

LOCK TABLES `mshop_price_property_type` WRITE;
/*!40000 ALTER TABLE `mshop_price_property_type` DISABLE KEYS */;
INSERT INTO `mshop_price_property_type` VALUES (1,1,'price','taxrate-local','Local tax',0,1,'2019-12-06 00:27:48','2019-12-06 00:27:48','core:setup');
/*!40000 ALTER TABLE `mshop_price_property_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_price_type`
--

DROP TABLE IF EXISTS `mshop_price_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_price_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msprity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msprity_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msprity_sid_label` (`siteid`,`label`),
  KEY `idx_msprity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_price_type`
--

LOCK TABLES `mshop_price_type` WRITE;
/*!40000 ALTER TABLE `mshop_price_type` DISABLE KEYS */;
INSERT INTO `mshop_price_type` VALUES (1,1,'attribute','default','Standard',0,1,'2019-12-06 00:27:48','2019-12-06 00:27:48','core:setup'),(2,1,'service','default','Standard',0,1,'2019-12-06 00:27:48','2019-12-06 00:27:48','core:setup'),(3,1,'product','default','Standard',0,1,'2019-12-06 00:27:48','2019-12-06 00:27:48','core:setup');
/*!40000 ALTER TABLE `mshop_price_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_product`
--

DROP TABLE IF EXISTS `mshop_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `dataset` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mspro_siteid_code` (`siteid`,`code`),
  KEY `idx_mspro_id_sid_stat_st_end` (`id`,`siteid`,`status`,`start`,`end`),
  KEY `idx_mspro_sid_stat_st_end` (`siteid`,`status`,`start`,`end`),
  KEY `idx_mspro_sid_label` (`siteid`,`label`),
  KEY `idx_mspro_sid_start` (`siteid`,`start`),
  KEY `idx_mspro_sid_end` (`siteid`,`end`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_product`
--

LOCK TABLES `mshop_product` WRITE;
/*!40000 ALTER TABLE `mshop_product` DISABLE KEYS */;
INSERT INTO `mshop_product` VALUES (1,1,'','default','trailer1','Trailer top 1','[]',NULL,NULL,1,'2019-12-06 00:45:50','2019-12-06 00:45:50','martinfer.69@gmail.com',''),(2,1,'','default','trailer2','Trailer top 2','[]',NULL,NULL,1,'2019-12-06 00:46:28','2019-12-06 00:45:50','martinfer.69@gmail.com','');
/*!40000 ALTER TABLE `mshop_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_product_list`
--

DROP TABLE IF EXISTS `mshop_product_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_product_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `key` varchar(134) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `refid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msproli_pid_sid_dm_ty_rid` (`parentid`,`siteid`,`domain`,`type`,`refid`),
  KEY `idx_msproli_sid_key` (`siteid`,`key`),
  KEY `fk_msproli_pid` (`parentid`),
  CONSTRAINT `fk_msproli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_product_list`
--

LOCK TABLES `mshop_product_list` WRITE;
/*!40000 ALTER TABLE `mshop_product_list` DISABLE KEYS */;
INSERT INTO `mshop_product_list` VALUES (1,1,1,'attribute|variant|3','variant','attribute','3',NULL,NULL,'[]',0,1,'2019-12-06 00:45:50','2019-12-06 00:45:50','martinfer.69@gmail.com'),(2,2,1,'attribute|variant|2','variant','attribute','2',NULL,NULL,'[]',0,1,'2019-12-06 00:46:28','2019-12-06 00:46:28','martinfer.69@gmail.com');
/*!40000 ALTER TABLE `mshop_product_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_product_list_type`
--

DROP TABLE IF EXISTS `mshop_product_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_product_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msprolity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msprolity_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msprolity_sid_label` (`siteid`,`label`),
  KEY `idx_msprolity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_product_list_type`
--

LOCK TABLES `mshop_product_list_type` WRITE;
/*!40000 ALTER TABLE `mshop_product_list_type` DISABLE KEYS */;
INSERT INTO `mshop_product_list_type` VALUES (1,1,'attribute','default','Standard',0,1,'2019-12-06 00:27:49','2019-12-06 00:27:49','core:setup'),(2,1,'attribute','config','Configurable',0,1,'2019-12-06 00:27:49','2019-12-06 00:27:49','core:setup'),(3,1,'attribute','variant','Variant',0,1,'2019-12-06 00:27:49','2019-12-06 00:27:49','core:setup'),(4,1,'attribute','hidden','Hidden',0,1,'2019-12-06 00:27:49','2019-12-06 00:27:49','core:setup'),(5,1,'attribute','custom','Custom value',0,1,'2019-12-06 00:27:49','2019-12-06 00:27:49','core:setup'),(6,1,'catalog','default','Standard',0,1,'2019-12-06 00:27:49','2019-12-06 00:27:49','core:setup'),(7,1,'media','default','Standard',0,1,'2019-12-06 00:27:49','2019-12-06 00:27:49','core:setup'),(8,1,'price','default','Standard',0,1,'2019-12-06 00:27:49','2019-12-06 00:27:49','core:setup'),(9,1,'product','default','Standard',0,1,'2019-12-06 00:27:49','2019-12-06 00:27:49','core:setup'),(10,1,'product','suggestion','Suggestion',0,1,'2019-12-06 00:27:49','2019-12-06 00:27:49','core:setup'),(11,1,'product','bought-together','Bought together',0,1,'2019-12-06 00:27:49','2019-12-06 00:27:49','core:setup'),(12,1,'service','default','Standard',0,1,'2019-12-06 00:27:49','2019-12-06 00:27:49','core:setup'),(13,1,'supplier','default','Standard',0,1,'2019-12-06 00:27:49','2019-12-06 00:27:49','core:setup'),(14,1,'tag','default','Standard',0,1,'2019-12-06 00:27:49','2019-12-06 00:27:49','core:setup'),(15,1,'text','default','Standard',0,1,'2019-12-06 00:27:49','2019-12-06 00:27:49','core:setup');
/*!40000 ALTER TABLE `mshop_product_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_product_property`
--

DROP TABLE IF EXISTS `mshop_product_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_product_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `key` varchar(103) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `langid` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mspropr_sid_ty_lid_value` (`parentid`,`siteid`,`type`,`langid`,`value`),
  KEY `fk_mspropr_sid_key` (`siteid`,`key`),
  KEY `fk_mspropr_pid` (`parentid`),
  CONSTRAINT `fk_mspropr_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_product_property`
--

LOCK TABLES `mshop_product_property` WRITE;
/*!40000 ALTER TABLE `mshop_product_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_product_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_product_property_type`
--

DROP TABLE IF EXISTS `mshop_product_property_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_product_property_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msproprty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msproprty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msproprty_sid_label` (`siteid`,`label`),
  KEY `idx_msproprty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_product_property_type`
--

LOCK TABLES `mshop_product_property_type` WRITE;
/*!40000 ALTER TABLE `mshop_product_property_type` DISABLE KEYS */;
INSERT INTO `mshop_product_property_type` VALUES (1,1,'product','package-height','Package height',0,1,'2019-12-06 00:27:49','2019-12-06 00:27:49','core:setup'),(2,1,'product','package-length','Package length',0,1,'2019-12-06 00:27:50','2019-12-06 00:27:50','core:setup'),(3,1,'product','package-width','Package width',0,1,'2019-12-06 00:27:50','2019-12-06 00:27:50','core:setup'),(4,1,'product','package-weight','Package weight',0,1,'2019-12-06 00:27:50','2019-12-06 00:27:50','core:setup');
/*!40000 ALTER TABLE `mshop_product_property_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_product_type`
--

DROP TABLE IF EXISTS `mshop_product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msproty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msproty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msproty_sid_label` (`siteid`,`label`),
  KEY `idx_msproty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_product_type`
--

LOCK TABLES `mshop_product_type` WRITE;
/*!40000 ALTER TABLE `mshop_product_type` DISABLE KEYS */;
INSERT INTO `mshop_product_type` VALUES (1,1,'product','default','Article',0,1,'2019-12-06 00:27:48','2019-12-06 00:27:48','core:setup'),(2,1,'product','bundle','Bundle',0,1,'2019-12-06 00:27:48','2019-12-06 00:27:48','core:setup'),(3,1,'product','event','Event',0,1,'2019-12-06 00:27:49','2019-12-06 00:27:49','core:setup'),(4,1,'product','select','Selection',0,1,'2019-12-06 00:27:49','2019-12-06 00:27:49','core:setup'),(5,1,'product','voucher','Voucher',0,1,'2019-12-06 00:27:49','2019-12-06 00:27:49','core:setup');
/*!40000 ALTER TABLE `mshop_product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_service`
--

DROP TABLE IF EXISTS `mshop_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msser_siteid_code` (`siteid`,`code`),
  KEY `idx_msser_sid_stat_start_end` (`siteid`,`status`,`start`,`end`),
  KEY `idx_msser_sid_prov` (`siteid`,`provider`),
  KEY `idx_msser_sid_code` (`siteid`,`code`),
  KEY `idx_msser_sid_label` (`siteid`,`label`),
  KEY `idx_msser_sid_pos` (`siteid`,`pos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_service`
--

LOCK TABLES `mshop_service` WRITE;
/*!40000 ALTER TABLE `mshop_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_service_list`
--

DROP TABLE IF EXISTS `mshop_service_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_service_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `key` varchar(134) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `refid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msserli_pid_sid_dm_ty_rid` (`parentid`,`siteid`,`domain`,`type`,`refid`),
  KEY `idx_msserli_sid_key` (`siteid`,`key`),
  KEY `fk_msserli_pid` (`parentid`),
  CONSTRAINT `fk_msserli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_service_list`
--

LOCK TABLES `mshop_service_list` WRITE;
/*!40000 ALTER TABLE `mshop_service_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_service_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_service_list_type`
--

DROP TABLE IF EXISTS `mshop_service_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_service_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msserlity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msserlity_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msserlity_sid_label` (`siteid`,`label`),
  KEY `idx_msserlity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_service_list_type`
--

LOCK TABLES `mshop_service_list_type` WRITE;
/*!40000 ALTER TABLE `mshop_service_list_type` DISABLE KEYS */;
INSERT INTO `mshop_service_list_type` VALUES (1,1,'product','default','Standard',0,1,'2019-12-06 00:27:50','2019-12-06 00:27:50','core:setup'),(2,1,'attribute','default','Standard',0,1,'2019-12-06 00:27:50','2019-12-06 00:27:50','core:setup'),(3,1,'catalog','default','Standard',0,1,'2019-12-06 00:27:50','2019-12-06 00:27:50','core:setup'),(4,1,'media','default','Standard',0,1,'2019-12-06 00:27:50','2019-12-06 00:27:50','core:setup'),(5,1,'price','default','Standard',0,1,'2019-12-06 00:27:50','2019-12-06 00:27:50','core:setup'),(6,1,'service','default','Standard',0,1,'2019-12-06 00:27:50','2019-12-06 00:27:50','core:setup'),(7,1,'text','default','Standard',0,1,'2019-12-06 00:27:50','2019-12-06 00:27:50','core:setup');
/*!40000 ALTER TABLE `mshop_service_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_service_type`
--

DROP TABLE IF EXISTS `mshop_service_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_service_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msserty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msserty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msserty_sid_label` (`siteid`,`label`),
  KEY `idx_msserty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_service_type`
--

LOCK TABLES `mshop_service_type` WRITE;
/*!40000 ALTER TABLE `mshop_service_type` DISABLE KEYS */;
INSERT INTO `mshop_service_type` VALUES (1,1,'service','payment','Payment',0,1,'2019-12-06 00:27:50','2019-12-06 00:27:50','core:setup'),(2,1,'service','delivery','Delivery',0,1,'2019-12-06 00:27:50','2019-12-06 00:27:50','core:setup');
/*!40000 ALTER TABLE `mshop_service_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_stock`
--

DROP TABLE IF EXISTS `mshop_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `productcode` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `stocklevel` int(11) DEFAULT NULL,
  `backdate` datetime DEFAULT NULL,
  `timeframe` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mssto_sid_pcode_ty` (`siteid`,`productcode`,`type`),
  KEY `idx_mssto_sid_stocklevel` (`siteid`,`stocklevel`),
  KEY `idx_mssto_sid_backdate` (`siteid`,`backdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_stock`
--

LOCK TABLES `mshop_stock` WRITE;
/*!40000 ALTER TABLE `mshop_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_stock_type`
--

DROP TABLE IF EXISTS `mshop_stock_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_stock_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_msstoty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_msstoty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_msstoty_sid_label` (`siteid`,`label`),
  KEY `idx_msstoty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_stock_type`
--

LOCK TABLES `mshop_stock_type` WRITE;
/*!40000 ALTER TABLE `mshop_stock_type` DISABLE KEYS */;
INSERT INTO `mshop_stock_type` VALUES (1,1,'product','default','Standard',0,1,'2019-12-06 00:27:50','2019-12-06 00:27:50','core:setup');
/*!40000 ALTER TABLE `mshop_stock_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_subscription`
--

DROP TABLE IF EXISTS `mshop_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_subscription` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) DEFAULT NULL,
  `baseid` bigint(20) NOT NULL,
  `ordprodid` bigint(20) NOT NULL,
  `next` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `productid` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `interval` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `reason` smallint(6) DEFAULT NULL,
  `period` smallint(6) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mssub_sid_next_stat` (`siteid`,`next`,`status`),
  KEY `idx_mssub_sid_baseid` (`siteid`,`baseid`),
  KEY `idx_mssub_sid_opid` (`siteid`,`ordprodid`),
  KEY `idx_mssub_sid_pid_period` (`siteid`,`productid`,`period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_subscription`
--

LOCK TABLES `mshop_subscription` WRITE;
/*!40000 ALTER TABLE `mshop_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_supplier`
--

DROP TABLE IF EXISTS `mshop_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mssup_sid_code` (`siteid`,`code`),
  KEY `idx_mssup_sid_status` (`siteid`,`status`),
  KEY `idx_mssup_sid_label` (`siteid`,`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_supplier`
--

LOCK TABLES `mshop_supplier` WRITE;
/*!40000 ALTER TABLE `mshop_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_supplier_address`
--

DROP TABLE IF EXISTS `mshop_supplier_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_supplier_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `vatid` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `salutation` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `address1` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `address2` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `address3` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `postal` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `langid` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `countryid` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `telefax` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `longitude` decimal(8,6) DEFAULT NULL,
  `latitude` decimal(8,6) DEFAULT NULL,
  `pos` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mssupad_sid_rid` (`siteid`,`parentid`),
  KEY `fk_mssupad_pid` (`parentid`),
  CONSTRAINT `fk_mssupad_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_supplier_address`
--

LOCK TABLES `mshop_supplier_address` WRITE;
/*!40000 ALTER TABLE `mshop_supplier_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_supplier_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_supplier_list`
--

DROP TABLE IF EXISTS `mshop_supplier_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_supplier_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `key` varchar(134) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `refid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mssupli_pid_sid_dm_ty_rid` (`parentid`,`siteid`,`domain`,`type`,`refid`),
  KEY `idx_mssupli_sid_key` (`siteid`,`key`),
  KEY `fk_mssupli_pid` (`parentid`),
  CONSTRAINT `fk_mssupli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_supplier_list`
--

LOCK TABLES `mshop_supplier_list` WRITE;
/*!40000 ALTER TABLE `mshop_supplier_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_supplier_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_supplier_list_type`
--

DROP TABLE IF EXISTS `mshop_supplier_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_supplier_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mssuplity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_mssuplity_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_mssuplity_sid_label` (`siteid`,`label`),
  KEY `idx_mssuplity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_supplier_list_type`
--

LOCK TABLES `mshop_supplier_list_type` WRITE;
/*!40000 ALTER TABLE `mshop_supplier_list_type` DISABLE KEYS */;
INSERT INTO `mshop_supplier_list_type` VALUES (1,1,'attribute','default','Standard',0,1,'2019-12-06 00:27:50','2019-12-06 00:27:50','core:setup'),(2,1,'product','default','Standard',0,1,'2019-12-06 00:27:50','2019-12-06 00:27:50','core:setup'),(3,1,'media','default','Standard',0,1,'2019-12-06 00:27:51','2019-12-06 00:27:51','core:setup'),(4,1,'text','default','Standard',0,1,'2019-12-06 00:27:51','2019-12-06 00:27:51','core:setup');
/*!40000 ALTER TABLE `mshop_supplier_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_tag`
--

DROP TABLE IF EXISTS `mshop_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `langid` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mstag_sid_dom_ty_lid_lab` (`siteid`,`domain`,`type`,`langid`,`label`),
  KEY `idx_mstag_sid_dom_langid` (`siteid`,`domain`,`langid`),
  KEY `idx_mstag_sid_dom_label` (`siteid`,`domain`,`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_tag`
--

LOCK TABLES `mshop_tag` WRITE;
/*!40000 ALTER TABLE `mshop_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_tag_type`
--

DROP TABLE IF EXISTS `mshop_tag_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_tag_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mstagty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_mstagty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_mstagty_sid_label` (`siteid`,`label`),
  KEY `idx_mstagty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_tag_type`
--

LOCK TABLES `mshop_tag_type` WRITE;
/*!40000 ALTER TABLE `mshop_tag_type` DISABLE KEYS */;
INSERT INTO `mshop_tag_type` VALUES (1,1,'catalog','default','Standard',0,1,'2019-12-06 00:27:51','2019-12-06 00:27:51','core:setup'),(2,1,'product','default','Standard',0,1,'2019-12-06 00:27:51','2019-12-06 00:27:51','core:setup');
/*!40000 ALTER TABLE `mshop_tag_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_text`
--

DROP TABLE IF EXISTS `mshop_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `langid` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mstex_sid_domain_status` (`siteid`,`domain`,`status`),
  KEY `idx_mstex_sid_domain_langid` (`siteid`,`domain`,`langid`),
  KEY `idx_mstex_sid_dom_label` (`siteid`,`domain`,`label`),
  KEY `idx_mstex_sid_dom_cont` (`siteid`,`domain`,`content`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_text`
--

LOCK TABLES `mshop_text` WRITE;
/*!40000 ALTER TABLE `mshop_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_text_list`
--

DROP TABLE IF EXISTS `mshop_text_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_text_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `siteid` int(11) NOT NULL,
  `key` varchar(134) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `refid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mstexli_pid_sid_dm_ty_rid` (`parentid`,`siteid`,`domain`,`type`,`refid`),
  KEY `idx_mstexli_sid_key` (`siteid`,`key`),
  KEY `fk_mstexli_pid` (`parentid`),
  CONSTRAINT `fk_mstexli_pid` FOREIGN KEY (`parentid`) REFERENCES `mshop_text` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_text_list`
--

LOCK TABLES `mshop_text_list` WRITE;
/*!40000 ALTER TABLE `mshop_text_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `mshop_text_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_text_list_type`
--

DROP TABLE IF EXISTS `mshop_text_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_text_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mstexlity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_mstexlity_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_mstexlity_sid_label` (`siteid`,`label`),
  KEY `idx_mstexlity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_text_list_type`
--

LOCK TABLES `mshop_text_list_type` WRITE;
/*!40000 ALTER TABLE `mshop_text_list_type` DISABLE KEYS */;
INSERT INTO `mshop_text_list_type` VALUES (1,1,'product','default','Standard',0,1,'2019-12-06 00:27:53','2019-12-06 00:27:53','core:setup'),(2,1,'attribute','default','Standard',0,1,'2019-12-06 00:27:53','2019-12-06 00:27:53','core:setup'),(3,1,'catalog','default','Standard',0,1,'2019-12-06 00:27:53','2019-12-06 00:27:53','core:setup'),(4,1,'media','default','Standard',0,1,'2019-12-06 00:27:53','2019-12-06 00:27:53','core:setup'),(5,1,'price','default','Standard',0,1,'2019-12-06 00:27:53','2019-12-06 00:27:53','core:setup'),(6,1,'service','default','Standard',0,1,'2019-12-06 00:27:53','2019-12-06 00:27:53','core:setup'),(7,1,'text','default','Standard',0,1,'2019-12-06 00:27:53','2019-12-06 00:27:53','core:setup');
/*!40000 ALTER TABLE `mshop_text_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mshop_text_type`
--

DROP TABLE IF EXISTS `mshop_text_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mshop_text_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_mstexty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_mstexty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_mstexty_sid_label` (`siteid`,`label`),
  KEY `idx_mstexty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mshop_text_type`
--

LOCK TABLES `mshop_text_type` WRITE;
/*!40000 ALTER TABLE `mshop_text_type` DISABLE KEYS */;
INSERT INTO `mshop_text_type` VALUES (1,1,'attribute','name','Name',0,1,'2019-12-06 00:27:51','2019-12-06 00:27:51','core:setup'),(2,1,'attribute','short','Short description',0,1,'2019-12-06 00:27:51','2019-12-06 00:27:51','core:setup'),(3,1,'attribute','long','Long description',0,1,'2019-12-06 00:27:51','2019-12-06 00:27:51','core:setup'),(4,1,'attribute','url','URL segment',0,1,'2019-12-06 00:27:51','2019-12-06 00:27:51','core:setup'),(5,1,'catalog','short','Short description',0,1,'2019-12-06 00:27:51','2019-12-06 00:27:51','core:setup'),(6,1,'catalog','long','Long description',0,1,'2019-12-06 00:27:51','2019-12-06 00:27:51','core:setup'),(7,1,'catalog','name','Name',0,1,'2019-12-06 00:27:51','2019-12-06 00:27:51','core:setup'),(8,1,'catalog','url','URL segment',0,1,'2019-12-06 00:27:51','2019-12-06 00:27:51','core:setup'),(9,1,'catalog','meta-keyword','Meta keywords',0,1,'2019-12-06 00:27:51','2019-12-06 00:27:51','core:setup'),(10,1,'catalog','meta-description','Meta description',0,1,'2019-12-06 00:27:52','2019-12-06 00:27:52','core:setup'),(11,1,'media','short','Short description',0,1,'2019-12-06 00:27:52','2019-12-06 00:27:52','core:setup'),(12,1,'media','long','Long description',0,1,'2019-12-06 00:27:52','2019-12-06 00:27:52','core:setup'),(13,1,'media','name','Name',0,1,'2019-12-06 00:27:52','2019-12-06 00:27:52','core:setup'),(14,1,'product','name','Name',0,1,'2019-12-06 00:27:52','2019-12-06 00:27:52','core:setup'),(15,1,'product','basket','Basket description',0,1,'2019-12-06 00:27:52','2019-12-06 00:27:52','core:setup'),(16,1,'product','short','Short description',0,1,'2019-12-06 00:27:52','2019-12-06 00:27:52','core:setup'),(17,1,'product','long','Long description',0,1,'2019-12-06 00:27:52','2019-12-06 00:27:52','core:setup'),(18,1,'product','url','URL segment',0,1,'2019-12-06 00:27:52','2019-12-06 00:27:52','core:setup'),(19,1,'product','meta-keyword','Meta keywords',0,1,'2019-12-06 00:27:52','2019-12-06 00:27:52','core:setup'),(20,1,'product','meta-description','Meta description',0,1,'2019-12-06 00:27:52','2019-12-06 00:27:52','core:setup'),(21,1,'service','name','Name',0,1,'2019-12-06 00:27:52','2019-12-06 00:27:52','core:setup'),(22,1,'service','short','Short description',0,1,'2019-12-06 00:27:52','2019-12-06 00:27:52','core:setup'),(23,1,'service','long','Long description',0,1,'2019-12-06 00:27:52','2019-12-06 00:27:52','core:setup'),(24,1,'supplier','name','Name',0,1,'2019-12-06 00:27:52','2019-12-06 00:27:52','core:setup'),(25,1,'supplier','short','Short description',0,1,'2019-12-06 00:27:53','2019-12-06 00:27:53','core:setup'),(26,1,'supplier','long','Long description',0,1,'2019-12-06 00:27:53','2019-12-06 00:27:53','core:setup');
/*!40000 ALTER TABLE `mshop_text_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `superuser` smallint(6) NOT NULL DEFAULT 0,
  `siteid` int(11) DEFAULT NULL,
  `salutation` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `company` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `vatid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address1` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address2` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address3` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `postal` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `langid` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `countryid` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `telefax` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `vdate` date DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_lvusr_email` (`email`),
  KEY `idx_lvusr_langid` (`langid`),
  KEY `idx_lvusr_last_first` (`lastname`,`firstname`),
  KEY `idx_lvusr_post_addr1` (`postal`,`address1`),
  KEY `idx_lvusr_post_city` (`postal`,`city`),
  KEY `idx_lvusr_lastname` (`lastname`),
  KEY `idx_lvusr_address1` (`address1`),
  KEY `idx_lvusr_city` (`city`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'martinfer.69@gmail.com','martinfer.69@gmail.com',NULL,'$2y$10$yl54WqPYlfR//ylHJyky4.dUYm6v/vhOdkwUHfDnal.4gWcsl5VGa',NULL,'2019-12-06 00:30:13','2019-12-06 00:30:13',0,1,'','','','','','','','','','','','','','','','','',NULL,NULL,NULL,NULL,1,'aimeos:account');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_address`
--

DROP TABLE IF EXISTS `users_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(10) unsigned NOT NULL,
  `siteid` int(11) NOT NULL,
  `pos` smallint(6) NOT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `vatid` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `salutation` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `address1` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `address2` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `address3` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `postal` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `langid` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `countryid` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefax` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lvuad_pid` (`parentid`),
  KEY `idx_lvuad_last_first` (`lastname`,`firstname`),
  KEY `idx_lvuad_post_addr1` (`postal`,`address1`),
  KEY `idx_lvuad_post_city` (`postal`,`city`),
  KEY `idx_lvuad_address1` (`address1`),
  KEY `idx_lvuad_city` (`city`),
  KEY `idx_lvuad_email` (`email`),
  CONSTRAINT `fk_lvuad_pid` FOREIGN KEY (`parentid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_address`
--

LOCK TABLES `users_address` WRITE;
/*!40000 ALTER TABLE `users_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_list`
--

DROP TABLE IF EXISTS `users_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(10) unsigned NOT NULL,
  `siteid` int(11) NOT NULL,
  `key` varchar(134) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `refid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_lvuli_pid_sid_dm_ty_rid` (`parentid`,`siteid`,`domain`,`type`,`refid`),
  KEY `idx_lvuli_sid_key` (`siteid`,`key`),
  KEY `fk_lvuli_pid` (`parentid`),
  CONSTRAINT `fk_lvuli_pid` FOREIGN KEY (`parentid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_list`
--

LOCK TABLES `users_list` WRITE;
/*!40000 ALTER TABLE `users_list` DISABLE KEYS */;
INSERT INTO `users_list` VALUES (1,1,1,'customer/group|default|1','default','customer/group','1',NULL,NULL,'[]',0,1,'2019-12-06 00:30:13','2019-12-06 00:30:13','aimeos:account');
/*!40000 ALTER TABLE `users_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_list_type`
--

DROP TABLE IF EXISTS `users_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_list_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_lvulity_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_lvulity_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_lvulity_sid_label` (`siteid`,`label`),
  KEY `idx_lvulity_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_list_type`
--

LOCK TABLES `users_list_type` WRITE;
/*!40000 ALTER TABLE `users_list_type` DISABLE KEYS */;
INSERT INTO `users_list_type` VALUES (1,1,'customer/group','default','Standard',0,1,'2019-12-06 00:27:46','2019-12-06 00:27:46','core:setup'),(2,1,'product','default','Standard',0,1,'2019-12-06 00:27:46','2019-12-06 00:27:46','core:setup'),(3,1,'product','favorite','Favorite',0,1,'2019-12-06 00:27:46','2019-12-06 00:27:46','core:setup'),(4,1,'product','watch','Watch list',0,1,'2019-12-06 00:27:46','2019-12-06 00:27:46','core:setup'),(5,1,'service','default','Standard',0,1,'2019-12-06 00:27:46','2019-12-06 00:27:46','core:setup');
/*!40000 ALTER TABLE `users_list_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_property`
--

DROP TABLE IF EXISTS `users_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(10) unsigned NOT NULL,
  `siteid` int(11) NOT NULL,
  `key` varchar(130) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `langid` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_lvupr_sid_ty_lid_value` (`parentid`,`siteid`,`type`,`langid`,`value`),
  KEY `fk_lvupr_sid_key` (`siteid`,`key`),
  KEY `fk_lvupr_pid` (`parentid`),
  CONSTRAINT `fk_lvupr_pid` FOREIGN KEY (`parentid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_property`
--

LOCK TABLES `users_property` WRITE;
/*!40000 ALTER TABLE `users_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_property_type`
--

DROP TABLE IF EXISTS `users_property_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_property_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NOT NULL,
  `domain` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL,
  `mtime` datetime NOT NULL,
  `ctime` datetime NOT NULL,
  `editor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_lvuprty_sid_dom_code` (`siteid`,`domain`,`code`),
  KEY `idx_lvuprty_sid_status_pos` (`siteid`,`status`,`pos`),
  KEY `idx_lvuprty_sid_label` (`siteid`,`label`),
  KEY `idx_lvuprty_sid_code` (`siteid`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_property_type`
--

LOCK TABLES `users_property_type` WRITE;
/*!40000 ALTER TABLE `users_property_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_property_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-06  0:51:52
