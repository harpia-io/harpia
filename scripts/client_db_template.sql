-- MySQL dump 10.13  Distrib 8.0.26, for macos11.3 (x86_64)
--
-- Host: 127.0.0.1    Database: harpia_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.5.6-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `harpia_db`
--

-- CREATE DATABASE /*!32312 IF NOT EXISTS*/ `harpia_db` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `harpia_db`;

--
-- Table structure for table `actions_history`
--

DROP TABLE IF EXISTS `actions_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actions_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `obj_type` varchar(50) NOT NULL,
  `obj_id` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `created_ts` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `actions_history` WRITE;
/*!40000 ALTER TABLE `actions_history` DISABLE KEYS */;
INSERT INTO `actions_history` (`name`,obj_type,obj_id,username,comment,notes,created_ts) VALUES
	 ('Handle alert','alert',1,'admin',NULL,'{"description": ""}','2023-01-02 17:22:49.0'),
	 ('Snooze alert','alert',1,'admin',NULL,'{"description": ""}','2023-01-03 10:25:49.0');
/*!40000 ALTER TABLE `actions_history` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `active_alerts`
--

DROP TABLE IF EXISTS `active_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_alerts` (
  `alert_id` int(11) NOT NULL AUTO_INCREMENT,
  `alert_name` varchar(255) NOT NULL,
  `studio` int(11) NOT NULL,
  `ms` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `service` varchar(255) NOT NULL,
  `object_name` varchar(255) NOT NULL,
  `severity` int(11) NOT NULL,
  `notification_type` int(11) NOT NULL,
  `notification_status` int(11) NOT NULL DEFAULT 0,
  `department` varchar(255) DEFAULT NULL,
  `additional_fields` longtext DEFAULT NULL,
  `ms_alert_id` varchar(255) DEFAULT NULL,
  `total_duration` bigint(20) NOT NULL DEFAULT 0,
  `acknowledged` int(11) NOT NULL DEFAULT 0,
  `assign_status` int(11) NOT NULL DEFAULT 0,
  `consolidation_name` varchar(40) DEFAULT NULL,
  `consolidation_state` int(11) NOT NULL DEFAULT 0,
  `consolidation_id` bigint(20) DEFAULT 0,
  `consolidation_ts` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `created_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `downtime_expire_ts` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `snooze_expire_ts` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `handle_expire_ts` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `assigned_to` varchar(255) DEFAULT '{}',
  `action_by` varchar(255) DEFAULT '{}',
  PRIMARY KEY (`alert_id`,`notification_type`),
  UNIQUE KEY `unique_component_commit` (`alert_id`,`notification_type`)
) ENGINE=InnoDB AUTO_INCREMENT=539 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `available_integrations`
--

LOCK TABLES `active_alerts` WRITE;
/*!40000 ALTER TABLE `active_alerts` DISABLE KEYS */;
INSERT INTO `active_alerts` (alert_name,studio,ms,`source`,service,object_name,severity,notification_type,notification_status,department,additional_fields,ms_alert_id,total_duration,acknowledged,assign_status,consolidation_name,consolidation_state,consolidation_id,consolidation_ts,created_ts,downtime_expire_ts,snooze_expire_ts,handle_expire_ts,assigned_to,action_by) VALUES
	 ('[URGENT] EXAMPLE Alert: Response time (web) (High)',1,'newrelic','Game Prod2','GameServer','AlertID:692173821',3,1,4,'[]','{"accountId":"2650711","language":"dotnet","trustedAccountId":"1432655","account":"Game Prod"}',NULL,49170,0,0,NULL,0,0,'1970-01-01 00:00:01.0','2023-01-07 23:19:26.0','1970-01-01 00:00:01.0','1970-01-01 00:00:01.0','1970-01-01 00:00:01.0','{}','{}');
/*!40000 ALTER TABLE `active_alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assign`
--

DROP TABLE IF EXISTS `assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assign` (
  `alert_id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_type` int(11) NOT NULL,
  `notification_fields` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `resubmit` int(11) DEFAULT 0,
  `sticky` int(11) DEFAULT 0,
  `recipient_id` varchar(100) DEFAULT NULL,
  `notification_count` int(11) DEFAULT 0,
  `time_to` timestamp NOT NULL DEFAULT current_timestamp(),
  `create_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_update_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`alert_id`),
  UNIQUE KEY `unique_component_commit` (`alert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assign`
--

LOCK TABLES `assign` WRITE;
/*!40000 ALTER TABLE `assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `available_integrations`
--

DROP TABLE IF EXISTS `available_integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `available_integrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) DEFAULT NULL,
  `status` varchar(70) NOT NULL,
  `website_url` varchar(254) NOT NULL,
  `create_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_update_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `available_integrations`
--

LOCK TABLES `available_integrations` WRITE;
/*!40000 ALTER TABLE `available_integrations` DISABLE KEYS */;
INSERT INTO `available_integrations` VALUES
    (1,'zabbix','active','https://harpia.io/integration/zabbix/','2021-07-10 05:08:25','2021-07-10 05:08:25'),
    (2,'grafana','active','https://harpia.io/integration/grafana/','2021-07-10 05:08:25','2021-07-10 05:08:25'),
    (3,'prometheus','active','https://harpia.io/integration/prometheus/','2021-07-10 05:08:25','2021-07-10 05:08:25'),
    (4,'gcp','active','https://harpia.io/integration/gcp/','2021-07-15 17:01:15','2021-07-15 17:01:15'),
    (5,'api','active','https://harpia.io/integration/api/','2021-07-15 17:01:15','2021-07-15 17:01:15'),
    (6,'appdynamics','active','https://harpia.io/integration/appdynamics/','2021-07-15 17:01:15','2021-07-15 17:01:15'),
    (7,'atatus','active','https://harpia.io/integration/atatus/','2021-07-15 17:01:15','2021-07-15 17:01:15'),
    (8,'newrelic','active','https://harpia.io/integration/newrelic/','2021-07-15 17:01:15','2021-07-15 17:01:15'),
    (9,'prtg','active','https://harpia.io/integration/prtg/','2021-07-15 17:01:15','2021-07-15 17:01:15'),
    (10,'dynatrace','active','https://harpia.io/integration/prtg/','2021-07-15 17:01:15','2021-07-15 17:01:15'),
    (11,'anodot','active','https://harpia.io/integration/anodot/','2021-07-15 17:01:15','2021-07-15 17:01:15'),
    (12,'cloudwatch','active','https://harpia.io/integration/cloudwatch/','2021-09-12 18:41:05','2021-07-15 17:01:15'),
    (13,'pingdom','active','https://harpia.io/integration/pingdom/','2021-09-12 18:41:05','2021-07-15 17:01:15');
/*!40000 ALTER TABLE `available_integrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `severity_mapping` longtext DEFAULT NULL,
  `notification_type_mapping` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (1,'{\"ok\": 0, \"information\": 1, \"warning\": 2, \"critical\": 3, \"unknown\": 4, \"urgent\": 5, \"down\": 6}','{\"alert\": 1, \"email\": 2, \"jira\": 3, \"skype\": 4, \"teams\": 5, \"telegram\": 6}');
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configured_integrations`
--

DROP TABLE IF EXISTS `configured_integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configured_integrations` (
  `integration_id` int(11) NOT NULL AUTO_INCREMENT,
  `integration_key` varchar(70) DEFAULT NULL,
  `integration_name` varchar(70) DEFAULT NULL,
  `integration_type` varchar(70) DEFAULT NULL,
  `status` varchar(70) DEFAULT NULL,
  `config` longtext DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_update_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`integration_id`),
  UNIQUE KEY `integration_key` (`integration_key`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configured_integrations`
--

LOCK TABLES `configured_integrations` WRITE;
/*!40000 ALTER TABLE `configured_integrations` DISABLE KEYS */;
INSERT INTO `configured_integrations` VALUES
    ( 1, '47ee0580-1fc3-11ec-aa2d-ced972b85e1f', 'EXAMPLE: Grafana Alerts', 'grafana', 'active', '{"environment_id":2,"scenario_id":2}', '2021-11-22 15:08:15', '2021-09-10 05:45:22' );
/*!40000 ALTER TABLE `configured_integrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `environments`
--

DROP TABLE IF EXISTS `environments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `environments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `env_name` varchar(70) NOT NULL,
  `env_settings` longtext DEFAULT NULL,
  `available_for_users_id` longtext DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_update_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `env_name` (`env_name`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `environments`
--

LOCK TABLES `environments` WRITE;
/*!40000 ALTER TABLE `environments` DISABLE KEYS */;
INSERT INTO `environments` VALUES
    ( 1, 'Default', '{\"description\": \"Notifications without Environments will be here\", \"default_scenario\": \"\"}', '{\"visible_only\": [], \"hidden\": []}', '2021-03-07 21:54:27', '2021-03-07 21:54:27' ),
    ( 2, 'EXAMPLE: Env', '{"description": "Example to demonstrate how Env looks", "default_scenario": ""}', '{"visible_only": [], "hidden": []}', '2021-03-07 21:54:27', '2021-03-07 21:54:27' );
/*!40000 ALTER TABLE `environments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bot_integrations`
--

DROP TABLE IF EXISTS `bot_integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bot_integrations` (
  `bot_id` int(11) NOT NULL AUTO_INCREMENT,
  `bot_name` varchar(70) DEFAULT NULL,
  `status` varchar(70) DEFAULT NULL,
  `config` longtext DEFAULT NULL,
  `create_ts` timestamp NOT NULL,
  `last_update_ts` timestamp NOT NULL,
  PRIMARY KEY (`bot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bot_integrations`
--

LOCK TABLES `bot_integrations` WRITE;
/*!40000 ALTER TABLE `bot_integrations` DISABLE KEYS */;

INSERT INTO `bot_integrations` (bot_name,status,config,create_ts,last_update_ts) VALUES
     ('email','active','{\"EMAIL_USER\":\"harp.notifications@gmail.com\",\"EMAIL_PASSWORD\":\"ktmgcsrrqhfmxxna\"}','2022-12-30 14:45:57.0','2022-12-30 14:45:57.0'),
	 ('voice','pending','{\"TWILIO_ACCOUNT_SID\":\"\",\"TWILIO_AUTH_TOKEN\":\"\",\"TWILIO_PHONE_NUMBER\":\"\"}','2022-12-30 14:44:57.0','2022-12-30 14:44:57.0'),
	 ('sms','pending','{\"TWILIO_ACCOUNT_SID\":\"\",\"TWILIO_AUTH_TOKEN\":\"\",\"TWILIO_PHONE_NUMBER\":\"\"}','2022-12-30 14:45:57.0','2022-12-30 14:45:57.0'),
	 ('slack','pending','{\"SLACK_TOKEN\":\"\"}','2022-12-30 14:45:57.0','2022-12-30 14:45:57.0'),
	 ('telegram','pending','{\"BOT_API_TOKEN\":\"\",\"BOT_NAME\":\"\"}','2022-12-30 14:45:57.0','2022-12-30 14:45:57.0'),
	 ('jira','pending','{\"JIRA_SERVER\":\"\",\"JIRA_USER\":\"\",\"JIRA_PASSWORD\":\"\"}','2022-12-30 14:44:57.0','2022-12-30 14:44:57.0');

/*!40000 ALTER TABLE `bot_integrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_config`
--

DROP TABLE IF EXISTS `filter_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_config` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_name` varchar(254) NOT NULL,
  `filter_config` longtext NOT NULL,
  `filter_status` varchar(254) NOT NULL,
  `created_by` varchar(254) NOT NULL,
  `create_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_update_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `columns` longtext NOT NULL,
  `grouping` longtext NOT NULL DEFAULT '[]',
  PRIMARY KEY (`filter_id`),
  UNIQUE KEY `filter_name` (`filter_name`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `filter_config` WRITE;
/*!40000 ALTER TABLE `filter_config` DISABLE KEYS */;

INSERT INTO `filter_config` (filter_name,filter_config,filter_status,created_by,create_ts,last_update_ts,`columns`,`grouping`) VALUES
	 ('EXAMPLE: Filter','[{"tag": "alert_name", "condition": "!=", "value": "Pod memory capacity"}]','public','admin','2023-01-08 17:26:30.0','2023-01-08 17:26:30.0','[{"name": "name", "placeholder": "Alert name...", "id_": "name", "width": 313}, {"name": "source", "placeholder": "Source...", "id_": "source", "width": 313}, {"name": "monitoring_system", "placeholder": "Monitoring system...", "id_": "monitoring_system", "width": 313}, {"name": "studio", "placeholder": "Environment...", "id_": "studio", "width": 313}]','[]');

/*!40000 ALTER TABLE `filter_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_labels`
--

DROP TABLE IF EXISTS `filter_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_labels` (
  `label_id` int(11) NOT NULL AUTO_INCREMENT,
  `label_name` varchar(254) NOT NULL,
  `label_values` longtext NOT NULL,
  `create_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_update_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`label_id`),
  UNIQUE KEY `label_name` (`label_name`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `harp_notification_columns`
--

DROP TABLE IF EXISTS `harp_notification_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `harp_notification_columns` (
  `column_id` int(11) NOT NULL AUTO_INCREMENT,
  `column_name` varchar(70) NOT NULL,
  PRIMARY KEY (`column_id`),
  UNIQUE KEY `column_name` (`column_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harp_notification_columns`
--

LOCK TABLES `harp_notification_columns` WRITE;
/*!40000 ALTER TABLE `harp_notification_columns` DISABLE KEYS */;
/*!40000 ALTER TABLE `harp_notification_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harp_user_environments`
--

DROP TABLE IF EXISTS `harp_user_environments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `harp_user_environments` (
  `user_id` int(11) NOT NULL,
  `environment_id` varchar(70) NOT NULL,
  PRIMARY KEY (`user_id`,`environment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harp_user_environments`
--

LOCK TABLES `harp_user_environments` WRITE;
/*!40000 ALTER TABLE `harp_user_environments` DISABLE KEYS */;
/*!40000 ALTER TABLE `harp_user_environments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harp_users`
--

DROP TABLE IF EXISTS `harp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `harp_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(70) DEFAULT NULL,
  `second_name` varchar(70) DEFAULT NULL,
  `username` varchar(70) DEFAULT NULL,
  `email` varchar(120) NOT NULL,
  `role` varchar(70) NOT NULL,
  `phone` varchar(70) DEFAULT NULL,
  `active_environment_ids` longtext DEFAULT NULL,
  `status` varchar(70) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_update_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_login_ts` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3399 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harp_users`
--

LOCK TABLES `harp_users` WRITE;
/*!40000 ALTER TABLE `harp_users` DISABLE KEYS */;
INSERT INTO `harp_users` VALUES ( 1, 'admin', 'admin', 'admin', 'admin@harpia.io', 'admin', '+380986627571', '{\"visible_only\": [], \"hidden\": []}', 'active', '$pbkdf2-sha256$29000$EUIIIcRYS2ntfU/JGSPkHA$L0mW1C4.IG2.Ze1E6E56L0encczcrS7tgpXrrGIA4lQ', NULL, '2021-10-01 21:29:12', '2021-04-14 12:55:07', '2021-10-01 21:29:12' );
/*!40000 ALTER TABLE `harp_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integrations`
--

DROP TABLE IF EXISTS `integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) DEFAULT NULL,
  `description` varchar(70) DEFAULT NULL,
  `settings` longtext DEFAULT NULL,
  `logo` longtext DEFAULT NULL,
  `status` varchar(70) NOT NULL,
  `website_url` varchar(254) NOT NULL,
  `create_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_update_ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integrations`
--

LOCK TABLES `integrations` WRITE;
/*!40000 ALTER TABLE `integrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `integrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licenses` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_name` varchar(70) DEFAULT NULL,
  `current_usage` int(11) DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `status` varchar(70) NOT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` VALUES (1,'alert',0,100000000,'active'),(2,'email',0,100000000,'active'),(3,'jira',0,100000000,'active'),(4,'skype',0,100000000,'active'),(5,'teams',0,100000000,'active'),(6,'telegram',0,100000000,'active'),(7,'pagerduty',0,100000000,'active'),(8,'sms',0,100000000,'active'),(9,'voice',0,100000000,'active'),(10,'whatsapp',0,100000000,'active'),(11,'signl4',0,1000,'active');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_history`
--

DROP TABLE IF EXISTS `notification_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alert_id` int(11) NOT NULL,
  `notification_output` longtext DEFAULT NULL,
  `notification_action` varchar(255) NOT NULL,
  `comments` longtext DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2785102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `notification_history` WRITE;
/*!40000 ALTER TABLE `notification_history` DISABLE KEYS */;
INSERT INTO `notification_history` (alert_id,notification_output,notification_action,comments,time_stamp) VALUES
    (1,'Details: Web response time < 1 seconds for at least 5 minutes','Create event',NULL,'2022-12-30 09:41:21.0'),
    (1,'','Created UI event',NULL,'2022-12-30 09:41:21.0');
/*!40000 ALTER TABLE `notification_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_scheduler`
--

DROP TABLE IF EXISTS `notification_scheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_scheduler` (
  `alert_id` int(11) NOT NULL,
  `channel` varchar(255) NOT NULL,
  `scenario_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `execute` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`alert_id`,`channel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_scheduler`
--

LOCK TABLES `notification_scheduler` WRITE;
/*!40000 ALTER TABLE `notification_scheduler` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_scheduler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `studio` int(11) NOT NULL,
  `ms` varchar(40) NOT NULL,
  `source` varchar(100) NOT NULL,
  `object_name` varchar(100) NOT NULL,
  `service` varchar(100) NOT NULL,
  `severity` int(11) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `output` longtext DEFAULT NULL,
  `additional_fields` longtext DEFAULT NULL,
  `additional_urls` longtext DEFAULT NULL,
  `actions` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `ms_alert_id` varchar(100) DEFAULT NULL,
  `recipient_id` varchar(255) DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `total_duration` bigint(20) NOT NULL DEFAULT 0,
  `notification_type` int(11) DEFAULT NULL,
  `notification_status` int(11) NOT NULL DEFAULT 0,
  `assign_status` int(11) NOT NULL DEFAULT 0,
  `snooze_expire_ts` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `sticky` int(11) NOT NULL DEFAULT 0,
  `procedure_id` int(11) NOT NULL,
  `last_update_ts` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_create_ts` timestamp NULL DEFAULT current_timestamp(),
  `assigned_to` varchar(255) DEFAULT '{}',
  `action_by` varchar(255) DEFAULT '{}',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_component_commit` (`id`,`name`,`studio`,`ms`,`source`,`ms_alert_id`,`object_name`)
) ENGINE=InnoDB AUTO_INCREMENT=539 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `available_integrations`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` (`name`,studio,ms,`source`,object_name,service,severity,department,`output`,additional_fields,additional_urls,actions,description,ms_alert_id,recipient_id,image,total_duration,notification_type,notification_status,assign_status,snooze_expire_ts,sticky,procedure_id,last_update_ts,last_create_ts,assigned_to,action_by) VALUES
	 ('[URGENT] EXAMPLE Alert: Response time (web) (High)',1,'newrelic','Game Prod2','AlertID:692173821','GameServer',3,'[]','{"current":"Details: Web response time < 1 seconds for at least 5 minutes","previous":"Details: Web response time < 1 seconds for at least 5 minutes"}','{"accountId":"2650711","language":"dotnet","trustedAccountId":"1432655","account":"Game Prod"}','{"Incident URL":"https:\\/\\/alerts.newrelic.com\\/accounts\\/2650711\\/incidents\\/115929341"}','{}',NULL,NULL,NULL,'{}',49170,NULL,4,0,'1970-01-01 00:00:01.0',0,2,'2023-01-07 21:36:39.0','2022-12-30 09:38:14.0','{}','{}');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedures`
--

DROP TABLE IF EXISTS `procedures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `studio_id` int(11) NOT NULL,
  `requested_by` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `wiki` varchar(150) DEFAULT NULL,
  `thresholds` longtext DEFAULT NULL,
  `tags` varchar(200) NOT NULL DEFAULT '[]',
  `procedure_type` int(11) NOT NULL,
  `procedure_review_status` varchar(30) DEFAULT NULL,
  `alert_fields` longtext DEFAULT NULL,
  `jira_fields` longtext DEFAULT NULL,
  `email_fields` longtext DEFAULT NULL,
  `skype_fields` longtext DEFAULT NULL,
  `teams_fields` longtext DEFAULT NULL,
  `telegram_fields` longtext DEFAULT NULL,
  `pagerduty_fields` longtext DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `last_update_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sms_fields` longtext DEFAULT NULL,
  `voice_fields` longtext DEFAULT NULL,
  `whatsapp_fields` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_component_commit` (`name`,`studio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedures`
--

LOCK TABLES `procedures` WRITE;
/*!40000 ALTER TABLE `procedures` DISABLE KEYS */;
INSERT INTO `procedures` VALUES ( 1, 'Default', 3, '1', 'asd', NULL, 'asd', '', 0, NULL, '{\"recipients\": [\"asd\"], \"description\": \"asd\", \"affected_func\": \"asd\", \"should_check\": [\"ads\"], \"players_expirience\": \"asd\", \"not_handled_effects\": \"ads\", \"notification_period\": {}}', '{}', '{}', '{}', '{}', '{}', '{}', 1, '2021-01-27 13:40:25', '{}', '{}', '{}' );
/*!40000 ALTER TABLE `procedures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenarios`
--

DROP TABLE IF EXISTS `scenarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scenarios` (
  `scenario_id` int(11) NOT NULL AUTO_INCREMENT,
  `scenario_name` varchar(256) NOT NULL,
  `environment_id` varchar(256) DEFAULT NULL,
  `description` varchar(1000) NOT NULL,
  `external_url` varchar(200) DEFAULT NULL,
  `requested_by` varchar(100) NOT NULL,
  `tags` longtext NOT NULL,
  `scenario_type` int(11) NOT NULL,
  `scenario_review_status` varchar(50) DEFAULT NULL,
  `edited_by` varchar(50) DEFAULT NULL,
  `scenario_actions` longtext DEFAULT NULL,
  `last_update_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `create_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`scenario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenarios`
--

LOCK TABLES `scenarios` WRITE;
/*!40000 ALTER TABLE `scenarios` DISABLE KEYS */;
INSERT INTO `scenarios` VALUES ( 1, 'Default', NULL, 'Scenario description', '', 'The reason of creating it', '[]', 1, NULL, 'admin', '[{"execute_after_seconds": 0, "action_trigger_delay": "0s", "type": "ui", "body": {"recipients": ["List of people who should be notified"], "description": "Info about scenario", "affected_func": "What was affected", "should_check": ["what operator should check"], "players_expirience": "What is the user experience if alert appear", "not_handled_effects": "What will be affected if alert won`t be handled", "notification_period": {}, "action_name": "Which action should be done to fix the problem"}}]', '2021-04-26 13:27:55', '2021-04-26 13:27:55' );
INSERT INTO `scenarios` VALUES ( 2, 'EXAMPLE: Multi Action Scenario',NULL,'Scenario to handle Kafka related alerts','','Requested by George J. after incident with Kafka','[]',1,NULL,'admin','[{"execute_after_seconds": 0, "action_trigger_delay": "0s", "type": "email", "enabled": true, "body": {"action_name": "Notify Technology Owner", "recipients": ["nikolay.k@harpia.io"], "description": "", "notification_period": {}, "resubmit": null}}, {"execute_after_seconds": 300, "action_trigger_delay": "5m", "type": "teams", "enabled": true, "body": {"action_name": "Send reminder to Technology Owner", "ids": ["https://microsoft.teams/channel/23414"], "description": "", "notification_period": {}, "resubmit": null}}, {"execute_after_seconds": 300, "action_trigger_delay": "15m", "type": "webhook", "enabled": true, "body": {"action_name": "Run Jenkins Job to restart Kafka Cluster", "webhooks": [{"url": "https://your-company.com/remote-actions?max_retries=3&not_working_hours=true", "http_method": "POST", "json": "{\\"server\\": \\"value\\", \\"group\\": \\"value\\"}", "basicAuth": {"login": "", "password": ""}, "headers": "{\\"ContentType\\": \\"application/json\\"}"}], "description": "", "notification_period": {}, "resubmit": null}}, {"execute_after_seconds": 0, "action_trigger_delay": "30m", "type": "ui", "enabled": true, "body": {"action_name": "Show alert to NOC team to start handle it as an Incident", "recipients": ["Nikolay K"], "description": "Kafka", "affected_func": "", "should_check": ["Check Dashboard", "Check deployements"], "environment_impact": "Daley in the system", "risks": "Downtime", "notification_period": {}, "resubmit": null}}]','2023-01-06 12:59:08.0','2021-10-01 09:08:15.0');
/*!40000 ALTER TABLE `scenarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statistics` (
  `alert_id` int(11) NOT NULL AUTO_INCREMENT,
  `close` int(11) DEFAULT 0,
  `create` int(11) DEFAULT 0,
  `reopen` int(11) DEFAULT 0,
  `update` int(11) DEFAULT 0,
  `change_severity` int(11) DEFAULT 0,
  `snooze` int(11) DEFAULT 0,
  `acknowledge` int(11) DEFAULT 0,
  `assign` int(11) DEFAULT 0,
  `update_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`alert_id`),
  UNIQUE KEY `unique_component_commit` (`alert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=539 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type` varchar(40) NOT NULL,
  `item_value` varchar(2000) NOT NULL,
  `added_by` varchar(40) NOT NULL,
  `update_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `passwd` varchar(18) NOT NULL,
  `user_type` int(11) NOT NULL DEFAULT 0,
  `user_schema` varchar(2000) NOT NULL,
  `studios` varchar(300) NOT NULL DEFAULT '[]',
  `notes` varchar(1000) DEFAULT NULL,
  `last_login_ts` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_uindex` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin',7,'{\"theme\": \"dark\", \"time_zone\": \"UTC\", \"alert_details_panel_alligment\": \"bottom\", \"show_categories\": [-1, -2, 1, 2, 3], \"alerts_list_show_fields\": [{\"field\": \"monitoring_system\", \"show\": true, \"filtering\": true}, {\"field\": \"service\", \"show\": true, \"filtering\": true}, {\"field\": \"source\", \"show\": true, \"filtering\": true}, {\"field\": \"name\", \"show\": true, \"filtering\": true}, {\"field\": \"department\", \"show\": true, \"filtering\": true}, {\"field\": \"studio\", \"show\": true, \"filtering\": true}, {\"field\": \"object\", \"show\": true, \"filtering\": true}, {\"field\": \"current_duration\", \"show\": true, \"filtering\": false}, {\"field\": \"total_duration\", \"show\": true, \"filtering\": false}], \"alert_details_show_main_fields\": [{\"field\": \"monitoring_system\", \"show\": true}, {\"field\": \"name\", \"show\": true}, {\"field\": \"studio\", \"show\": true}, {\"field\": \"object\", \"show\": true}, {\"field\": \"source\", \"show\": true}, {\"field\": \"service\", \"show\": true}], \"alert_details_show_secondary_fields\": [{\"field\": \"description\", \"show\": true}, {\"field\": \"output\", \"show\": true}, {\"field\": \"additional_fields\", \"show\": true}]}','[]','','2021-01-20 22:56:06');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-08 12:38:53
