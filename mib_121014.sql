CREATE DATABASE  IF NOT EXISTS `diffsigm_mibint_server` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `diffsigm_mibint_server`;
-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: diffsigm_mibint_server
-- ------------------------------------------------------
-- Server version	5.5.37-0+wheezy1

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
-- Table structure for table `_tbl_migrations`
--

DROP TABLE IF EXISTS `_tbl_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_migrations`
--

LOCK TABLES `_tbl_migrations` WRITE;
/*!40000 ALTER TABLE `_tbl_migrations` DISABLE KEYS */;
INSERT INTO `_tbl_migrations` VALUES ('2014_10_20_061931_confide_setup_users_table',1),('2014_10_20_063011_entrust_setup_tables',2);
/*!40000 ALTER TABLE `_tbl_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tbl_cheque_voucher`
--

DROP TABLE IF EXISTS `_tbl_cheque_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_cheque_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `cv_number` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cheque_number` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `last_updated_by` int(11) unsigned NOT NULL,
  `rfp_id` int(11) NOT NULL,
  `approved` char(1) COLLATE utf8_icelandic_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cv_number_UNIQUE` (`cv_number`),
  UNIQUE KEY `cheque_number_UNIQUE` (`cheque_number`),
  KEY `fk__tbl_cheque_voucher_1` (`rfp_id`),
  KEY `fk__tbl_cheque_voucher_2` (`created_by`),
  KEY `fk__tbl_cheque_voucher_3` (`last_updated_by`),
  KEY `fk__tbl_cheque_voucher_4` (`company_id`),
  CONSTRAINT `fk__tbl_cheque_voucher_1` FOREIGN KEY (`rfp_id`) REFERENCES `_tbl_Rfp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__tbl_cheque_voucher_2` FOREIGN KEY (`created_by`) REFERENCES `_tbl_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__tbl_cheque_voucher_3` FOREIGN KEY (`last_updated_by`) REFERENCES `_tbl_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__tbl_cheque_voucher_4` FOREIGN KEY (`company_id`) REFERENCES `_tbl_companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_cheque_voucher`
--

LOCK TABLES `_tbl_cheque_voucher` WRITE;
/*!40000 ALTER TABLE `_tbl_cheque_voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tbl_cheque_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tbl_accounting_attrib_types`
--

DROP TABLE IF EXISTS `_tbl_accounting_attrib_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_accounting_attrib_types` (
  `attrib_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `attrib_type_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `attrib_data_type` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`attrib_type_id`),
  UNIQUE KEY `attrib_type_name_UNIQUE` (`attrib_type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_accounting_attrib_types`
--

LOCK TABLES `_tbl_accounting_attrib_types` WRITE;
/*!40000 ALTER TABLE `_tbl_accounting_attrib_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tbl_accounting_attrib_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tbl_payroll_summary_entry`
--

DROP TABLE IF EXISTS `_tbl_payroll_summary_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_payroll_summary_entry` (
  `ps_entry_no` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `ps_glAccount` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ps_amount` double NOT NULL,
  `ps_memo` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `ps_detachment` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_At` timestamp NULL DEFAULT NULL,
  `sync` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ps_entry_no`),
  KEY `fk__tbl_payroll_summary_entry_1` (`company_id`),
  CONSTRAINT `fk__tbl_payroll_summary_entry_1` FOREIGN KEY (`company_id`) REFERENCES `_tbl_companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_payroll_summary_entry`
--

LOCK TABLES `_tbl_payroll_summary_entry` WRITE;
/*!40000 ALTER TABLE `_tbl_payroll_summary_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tbl_payroll_summary_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tbl_PO_header`
--

DROP TABLE IF EXISTS `_tbl_PO_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_PO_header` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `po_number` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `po_date` date NOT NULL,
  `po_total_amount` decimal(12,2) NOT NULL,
  `po_paymentterms` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'NA',
  `po_downpayment` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'NA',
  `requestor` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `requestor_dept_det` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `po_fullyreceived` tinyint(1) NOT NULL DEFAULT '0',
  `po_status` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'FOR APPROVAL',
  `created_by` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `approved_by` varchar(128) COLLATE utf8_unicode_ci DEFAULT 'NONE',
  `po_remarks` text COLLATE utf8_unicode_ci,
  `cancelled` tinyint(1) NOT NULL DEFAULT '0',
  `sync` tinyint(1) DEFAULT NULL,
  `apvbedit` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apvcredit` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoiced` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`,`company_id`),
  UNIQUE KEY `po_number_UNIQUE` (`po_number`),
  KEY `fk__tbl_PO_header_bp` (`supplier_id`),
  KEY `fk__tbl_PO_header_1` (`company_id`),
  CONSTRAINT `fk__tbl_PO_header_1` FOREIGN KEY (`company_id`) REFERENCES `_tbl_companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__tbl_PO_header_bp` FOREIGN KEY (`supplier_id`) REFERENCES `_tbl_business_partner` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_PO_header`
--

LOCK TABLES `_tbl_PO_header` WRITE;
/*!40000 ALTER TABLE `_tbl_PO_header` DISABLE KEYS */;
INSERT INTO `_tbl_PO_header` VALUES (1,2,'11111',3,'2014-10-14',3000.00,'','','IT','',0,'','Juan Mambo','Pedro Rico','',0,NULL,NULL,'','2014-12-03 00:59:04','2014-12-09 05:09:35','N'),(2,1,'11112',2,'2014-09-24',10500.00,'NA','NA','Accounting','',0,'FOR APPROVAL','Ramon Pepano','Rogelio Padre',NULL,0,NULL,NULL,'','2014-12-03 00:59:05','2014-12-09 02:30:03','N'),(3,2,'11113',3,'2014-05-29',100000.00,'NA','NA','Purchasing','',0,'FOR APPROVAL','Paula Maldita','Paulo Chobibo',NULL,0,NULL,NULL,'','2014-12-03 00:59:06','2014-12-09 06:36:00','N'),(4,3,'11114',4,'2014-05-30',50500.00,'NA','NA','Admin','',0,'FOR APPROVAL','Raff Padilla','Rey Pahuyo',NULL,0,NULL,NULL,'','2014-12-03 00:58:36','2014-12-09 08:38:35','N'),(5,3,'11115',5,'2014-06-30',300000.00,'NA','NA','COB','',0,'','Jensen Jansen','John Doe',NULL,0,NULL,NULL,'','2014-12-03 00:59:06','2014-12-09 08:40:06','N');
/*!40000 ALTER TABLE `_tbl_PO_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tbl_coa_group_accounts`
--

DROP TABLE IF EXISTS `_tbl_coa_group_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_coa_group_accounts` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `group_name_UNIQUE` (`group_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_coa_group_accounts`
--

LOCK TABLES `_tbl_coa_group_accounts` WRITE;
/*!40000 ALTER TABLE `_tbl_coa_group_accounts` DISABLE KEYS */;
INSERT INTO `_tbl_coa_group_accounts` VALUES (1,'Asset'),(3,'Equities'),(5,'Expenses'),(2,'Liabilities'),(4,'Revenue');
/*!40000 ALTER TABLE `_tbl_coa_group_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tbl_accounting_journals`
--

DROP TABLE IF EXISTS `_tbl_accounting_journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_accounting_journals` (
  `journal_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `journal_date` datetime NOT NULL,
  `debit` double NOT NULL,
  `credit` double NOT NULL,
  `remarks` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`journal_id`),
  KEY `fk__tbl_accounting_journals_1` (`module_id`),
  KEY `fk__tbl_accounting_journals_2` (`account_id`),
  CONSTRAINT `fk__tbl_accounting_journals_1` FOREIGN KEY (`module_id`) REFERENCES `_tbl_accounting_modules` (`module_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__tbl_accounting_journals_2` FOREIGN KEY (`account_id`) REFERENCES `_tbl_coa_accounts` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_accounting_journals`
--

LOCK TABLES `_tbl_accounting_journals` WRITE;
/*!40000 ALTER TABLE `_tbl_accounting_journals` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tbl_accounting_journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tbl_assigned_roles`
--

DROP TABLE IF EXISTS `_tbl_assigned_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_assigned_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assigned_roles_user_id_foreign` (`user_id`),
  KEY `assigned_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `assigned_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `_tbl_roles` (`id`),
  CONSTRAINT `assigned_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `_tbl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_assigned_roles`
--

LOCK TABLES `_tbl_assigned_roles` WRITE;
/*!40000 ALTER TABLE `_tbl_assigned_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tbl_assigned_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tbl_coa_accounts`
--

DROP TABLE IF EXISTS `_tbl_coa_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_coa_accounts` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_acct_id` int(11) NOT NULL,
  `account_title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `account_desc` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `account_title_UNIQUE` (`account_title`),
  KEY `fk__tbl_coa_accounts_1` (`sub_acct_id`),
  CONSTRAINT `fk__tbl_coa_accounts_1` FOREIGN KEY (`sub_acct_id`) REFERENCES `_tbl_coa_sub_accounts` (`sub_acct_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_coa_accounts`
--

LOCK TABLES `_tbl_coa_accounts` WRITE;
/*!40000 ALTER TABLE `_tbl_coa_accounts` DISABLE KEYS */;
INSERT INTO `_tbl_coa_accounts` VALUES (1,1,'default_acct','Default Account');
/*!40000 ALTER TABLE `_tbl_coa_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tbl_coa_attributes`
--

DROP TABLE IF EXISTS `_tbl_coa_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_coa_attributes` (
  `coa_attrib_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `attrib_type_id` int(11) NOT NULL,
  `coa_attrib_value` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`coa_attrib_id`),
  KEY `fk__tbl_coa_attributes_1` (`account_id`),
  KEY `fk__tbl_coa_attributes_2` (`attrib_type_id`),
  CONSTRAINT `fk__tbl_coa_attributes_1` FOREIGN KEY (`account_id`) REFERENCES `_tbl_coa_accounts` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__tbl_coa_attributes_2` FOREIGN KEY (`attrib_type_id`) REFERENCES `_tbl_accounting_attrib_types` (`attrib_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_coa_attributes`
--

LOCK TABLES `_tbl_coa_attributes` WRITE;
/*!40000 ALTER TABLE `_tbl_coa_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tbl_coa_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tbl_users`
--

DROP TABLE IF EXISTS `_tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `full_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `confirmation_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_users`
--

LOCK TABLES `_tbl_users` WRITE;
/*!40000 ALTER TABLE `_tbl_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tbl_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tbl_permission_role`
--

DROP TABLE IF EXISTS `_tbl_permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_foreign` (`permission_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `_tbl_permissions` (`id`),
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `_tbl_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_permission_role`
--

LOCK TABLES `_tbl_permission_role` WRITE;
/*!40000 ALTER TABLE `_tbl_permission_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tbl_permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tbl_Rfp`
--

DROP TABLE IF EXISTS `_tbl_Rfp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_Rfp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rfp_number` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `costing_department` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `date_requested` date DEFAULT NULL,
  `date_needed` date NOT NULL,
  `amount_requested` decimal(12,2) NOT NULL,
  `request_description` text COLLATE utf8_unicode_ci NOT NULL,
  `charge_to` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approved` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `last_updated_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `rfp_number_UNIQUE` (`rfp_number`),
  UNIQUE KEY `invoice_id_UNIQUE` (`invoice_id`),
  KEY `fk__tbl_Rfp_1` (`company_id`),
  KEY `fk__tbl_Rfp_2` (`created_by`),
  KEY `fk__tbl_Rfp_3` (`last_updated_by`),
  KEY `fk__tbl_Rfp_5` (`invoice_id`),
  CONSTRAINT `fk__tbl_Rfp_1` FOREIGN KEY (`company_id`) REFERENCES `_tbl_companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__tbl_Rfp_2` FOREIGN KEY (`created_by`) REFERENCES `_tbl_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__tbl_Rfp_3` FOREIGN KEY (`last_updated_by`) REFERENCES `_tbl_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__tbl_Rfp_5` FOREIGN KEY (`invoice_id`) REFERENCES `_tbl_accounting_register` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_Rfp`
--

LOCK TABLES `_tbl_Rfp` WRITE;
/*!40000 ALTER TABLE `_tbl_Rfp` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tbl_Rfp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tbl_password_reminders`
--

DROP TABLE IF EXISTS `_tbl_password_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_password_reminders` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_password_reminders`
--

LOCK TABLES `_tbl_password_reminders` WRITE;
/*!40000 ALTER TABLE `_tbl_password_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tbl_password_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tbl_companies`
--

DROP TABLE IF EXISTS `_tbl_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_companies`
--

LOCK TABLES `_tbl_companies` WRITE;
/*!40000 ALTER TABLE `_tbl_companies` DISABLE KEYS */;
INSERT INTO `_tbl_companies` VALUES (1,'MIB 1','mib1','2014-11-05 10:01:25','2014-11-05 10:01:25'),(2,'MIB 2','mib2','2014-11-05 10:01:25','2014-11-05 10:01:25'),(3,'CSISI','csisi','2014-11-05 10:01:25','2014-11-05 10:01:25'),(4,'MIBSTC','mibstc','2014-11-25 23:43:18','2014-11-25 23:43:18');
/*!40000 ALTER TABLE `_tbl_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tbl_coa_sub_accounts`
--

DROP TABLE IF EXISTS `_tbl_coa_sub_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_coa_sub_accounts` (
  `sub_acct_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `sub_acct_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`sub_acct_id`),
  UNIQUE KEY `sub_acct_name_UNIQUE` (`sub_acct_name`),
  KEY `fk__tbl_coa_sub_accounts_1` (`group_id`),
  CONSTRAINT `fk__tbl_coa_sub_accounts_1` FOREIGN KEY (`group_id`) REFERENCES `_tbl_coa_group_accounts` (`group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_coa_sub_accounts`
--

LOCK TABLES `_tbl_coa_sub_accounts` WRITE;
/*!40000 ALTER TABLE `_tbl_coa_sub_accounts` DISABLE KEYS */;
INSERT INTO `_tbl_coa_sub_accounts` VALUES (1,1,'Bank'),(2,1,'Accounts Receivable'),(3,1,'Other Current Asset'),(4,1,'Fixed Asset'),(5,1,'Other Asset'),(6,2,'Accounts Payable'),(7,2,'Other Current Liability'),(8,2,'Long Term Liability'),(9,3,'Equity'),(10,4,'Income'),(11,4,'Cost of Goods Sold'),(12,5,'Expense'),(13,4,'Other Income'),(14,5,'Other Expense'),(15,4,'Estimates');
/*!40000 ALTER TABLE `_tbl_coa_sub_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tbl_permissions`
--

DROP TABLE IF EXISTS `_tbl_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_permissions`
--

LOCK TABLES `_tbl_permissions` WRITE;
/*!40000 ALTER TABLE `_tbl_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tbl_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tbl_CV_debit_credit`
--

DROP TABLE IF EXISTS `_tbl_CV_debit_credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_CV_debit_credit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cv_id` int(11) NOT NULL,
  `coa_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `last_updated_by` int(11) unsigned NOT NULL,
  `line_type` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk__tbl_CV_debit_1` (`cv_id`),
  KEY `fk__tbl_CV_debit_2` (`coa_id`),
  KEY `fk__tbl_CV_debit_3` (`created_by`),
  KEY `fk__tbl_CV_debit_4` (`last_updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_CV_debit_credit`
--

LOCK TABLES `_tbl_CV_debit_credit` WRITE;
/*!40000 ALTER TABLE `_tbl_CV_debit_credit` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tbl_CV_debit_credit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tbl_modules_attributes`
--

DROP TABLE IF EXISTS `_tbl_modules_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_modules_attributes` (
  `module_attrib_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `attrib_type_id` int(11) NOT NULL,
  `module_attrib_value` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`module_attrib_id`),
  KEY `fk__tbl_modules_attributes_1` (`module_id`),
  KEY `fk__tbl_modules_attributes_2` (`attrib_type_id`),
  CONSTRAINT `fk__tbl_modules_attributes_1` FOREIGN KEY (`module_id`) REFERENCES `_tbl_accounting_modules` (`module_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__tbl_modules_attributes_2` FOREIGN KEY (`attrib_type_id`) REFERENCES `_tbl_accounting_attrib_types` (`attrib_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_modules_attributes`
--

LOCK TABLES `_tbl_modules_attributes` WRITE;
/*!40000 ALTER TABLE `_tbl_modules_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tbl_modules_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tbl_business_partner`
--

DROP TABLE IF EXISTS `_tbl_business_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_business_partner` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `supplier_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `payment_term` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `contact_person` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `contact_number` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `contact_email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `sync` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`company_id`),
  KEY `fk__tbl_business_partner_1` (`company_id`),
  CONSTRAINT `fk__tbl_business_partner_1` FOREIGN KEY (`company_id`) REFERENCES `_tbl_companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_business_partner`
--

LOCK TABLES `_tbl_business_partner` WRITE;
/*!40000 ALTER TABLE `_tbl_business_partner` DISABLE KEYS */;
INSERT INTO `_tbl_business_partner` VALUES (1,1,'Supplier 1','Pasig City','','Supplier 1','Supplier 1','supplier1@email.com',NULL,'2014-12-03 00:58:54','2014-12-03 00:58:54'),(2,1,'Supplier 2','Pasay City','','Supplier 2','Supplier 2','supplier2@email.com',NULL,'2014-12-03 00:58:55','2014-12-03 00:58:55'),(3,2,'Supplier 3','Quezon CIty','','Supplier 3','Supplier 3','supplier3@email.com',NULL,'2014-12-03 00:58:57','2014-12-03 00:58:57'),(4,3,'Supplier 4','San Juan City, Manila','','Supplier 4','Supplier 4','supplier4@email.com',NULL,'2014-11-10 21:38:41','2014-11-10 21:38:41'),(5,3,'Supplier 5','Pasig CIty','','Supplier 5','Supplier 5','supplier5@email.com',NULL,'2014-12-03 00:59:00','2014-12-03 00:59:00');
/*!40000 ALTER TABLE `_tbl_business_partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tbl_accounting_register`
--

DROP TABLE IF EXISTS `_tbl_accounting_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_accounting_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `register_id` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `module_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `register_refno` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `account_value` double NOT NULL,
  `register_post` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `register_date_posted` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `po_id` int(11) NOT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `last_updated_by` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `register_id_UNIQUE` (`register_id`),
  KEY `fk__tbl_accounting_register_1` (`module_id`),
  KEY `fk__tbl_accounting_register_2` (`account_id`),
  KEY `fk__tbl_accounting_register_3` (`company_id`),
  KEY `fk__tbl_accounting_register_4` (`created_by`),
  KEY `fk__tbl_accounting_register_5` (`last_updated_by`),
  CONSTRAINT `fk__tbl_accounting_register_1` FOREIGN KEY (`module_id`) REFERENCES `_tbl_accounting_modules` (`module_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__tbl_accounting_register_2` FOREIGN KEY (`account_id`) REFERENCES `_tbl_coa_accounts` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__tbl_accounting_register_3` FOREIGN KEY (`company_id`) REFERENCES `_tbl_companies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__tbl_accounting_register_4` FOREIGN KEY (`created_by`) REFERENCES `_tbl_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk__tbl_accounting_register_5` FOREIGN KEY (`last_updated_by`) REFERENCES `_tbl_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_accounting_register`
--

LOCK TABLES `_tbl_accounting_register` WRITE;
/*!40000 ALTER TABLE `_tbl_accounting_register` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tbl_accounting_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tbl_accounting_modules`
--

DROP TABLE IF EXISTS `_tbl_accounting_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_accounting_modules` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `module_desc` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `module_name_UNIQUE` (`module_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_accounting_modules`
--

LOCK TABLES `_tbl_accounting_modules` WRITE;
/*!40000 ALTER TABLE `_tbl_accounting_modules` DISABLE KEYS */;
INSERT INTO `_tbl_accounting_modules` VALUES (1,'default_module','Default Module');
/*!40000 ALTER TABLE `_tbl_accounting_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tbl_accounting_ledger`
--

DROP TABLE IF EXISTS `_tbl_accounting_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_accounting_ledger` (
  `ledger_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `ledger_reference` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ledger_explanation` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ledger_date` datetime NOT NULL,
  `ledger_debit` double NOT NULL,
  `ledger_credit` double NOT NULL,
  PRIMARY KEY (`ledger_id`),
  KEY `fk__tbl_accounting_ledger_1` (`module_id`),
  CONSTRAINT `fk__tbl_accounting_ledger_1` FOREIGN KEY (`module_id`) REFERENCES `_tbl_accounting_modules` (`module_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_accounting_ledger`
--

LOCK TABLES `_tbl_accounting_ledger` WRITE;
/*!40000 ALTER TABLE `_tbl_accounting_ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tbl_accounting_ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tbl_roles`
--

DROP TABLE IF EXISTS `_tbl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_tbl_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_roles`
--

LOCK TABLES `_tbl_roles` WRITE;
/*!40000 ALTER TABLE `_tbl_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tbl_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-10 21:16:25
