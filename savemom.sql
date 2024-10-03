-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.16-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema savemom
--

CREATE DATABASE IF NOT EXISTS savemom;
USE savemom;

--
-- Definition of table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` (`id`,`checksum`,`finished_at`,`migration_name`,`logs`,`rolled_back_at`,`started_at`,`applied_steps_count`) VALUES 
 ('8807b839-8b61-431f-a77a-67064fb28470','bf7ae843afdd015252beeb3c3c30989b69647740d7b0b98a7f22f0b8191cc4cb','2024-10-01 11:51:07.521','20241001042104_update_model',NULL,NULL,'2024-10-01 11:51:06.506',1),
 ('c31f0e31-4f9d-4165-8c44-073ccaee8ea1','9e96cd2b5d7c0151e3785b0fec9fb5805deaee70a89846486cadee9b0f167d68','2024-10-01 11:51:07.574','20241001113023_update_model',NULL,NULL,'2024-10-01 11:51:07.525',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;


--
-- Definition of table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `providerAccountId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refresh_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `token_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scope` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Account_provider_providerAccountId_key` (`provider`,`providerAccountId`),
  KEY `Account_userId_fkey` (`userId`),
  CONSTRAINT `Account_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account`
--

/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;


--
-- Definition of table `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` (`id`,`image`,`createdAt`,`updatedAt`) VALUES 
 ('cm1qf9z60000bdf6d2fen7opq','http://localhost:3000/landing-page/brand-images/1727786172742_1727261104447_img-one.png','2024-10-01 12:36:12.744','2024-10-01 12:36:12.744'),
 ('cm1qfa7ja000cdf6drme4uul0','http://localhost:3000/landing-page/brand-images/1727786183588_1726729923385_air-bnb_-_convert.png','2024-10-01 12:36:23.590','2024-10-01 12:36:23.590'),
 ('cm1qfadpv000ddf6d9rf7glzd','http://localhost:3000/landing-page/brand-images/1727786191601_1726815461050_img-one.png','2024-10-01 12:36:31.603','2024-10-01 12:36:31.603'),
 ('cm1qfajzb000edf6dpzcv311g','http://localhost:3000/landing-page/brand-images/1727786199717_1726815461052_img-one.png','2024-10-01 12:36:39.720','2024-10-01 12:36:39.720');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;


--
-- Definition of table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countryId` int(11) NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stateId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `city`
--

/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;


--
-- Definition of table `configure_subscription`
--

DROP TABLE IF EXISTS `configure_subscription`;
CREATE TABLE `configure_subscription` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publicKey` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privateKey` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isActive` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdUser` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedUser` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `configure_subscription`
--

/*!40000 ALTER TABLE `configure_subscription` DISABLE KEYS */;
INSERT INTO `configure_subscription` (`id`,`name`,`publicKey`,`privateKey`,`isActive`,`type`,`createdUser`,`updatedUser`,`createdAt`,`updatedAt`) VALUES 
 ('cm1qgyg7w0009123qhus3mku7','Razorpay','rzp_test_2hEj93EL0gFSAp','EpfQnpGGOd71Ub44IUcXaVgv','Y','Demo','cm1qdx6wo0001df6d78secy8y','cm1qdx6wo0001df6d78secy8y','2024-10-01 13:23:14.205','2024-10-01 13:23:42.678');
/*!40000 ALTER TABLE `configure_subscription` ENABLE KEYS */;


--
-- Definition of table `contact_us`
--

DROP TABLE IF EXISTS `contact_us`;
CREATE TABLE `contact_us` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `badgeTitle` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cardTitle` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cardDescription` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isfrontendvisible` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdUser` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedUser` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_us`
--

/*!40000 ALTER TABLE `contact_us` DISABLE KEYS */;
INSERT INTO `contact_us` (`id`,`badgeTitle`,`title`,`description`,`cardTitle`,`cardDescription`,`isfrontendvisible`,`createdUser`,`updatedUser`,`createdAt`,`updatedAt`) VALUES 
 ('cm1qgp24l0007123qg31g8195','Contact US','Let\'s work laptop charging together','Any question or remark? just write us a message','Send a message','If you would like to discuss anything related to payment, account, licensing,\npartnerships, or have pre-sales questions, you’re at the right place','Y','cm1qdx6wo0001df6d78secy8y','cm1qdx6wo0001df6d78secy8y','2024-10-01 13:15:56.037','2024-10-01 13:16:37.273');
/*!40000 ALTER TABLE `contact_us` ENABLE KEYS */;


--
-- Definition of table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country`
--

/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;


--
-- Definition of table `customer_enquiries`
--

DROP TABLE IF EXISTS `customer_enquiries`;
CREATE TABLE `customer_enquiries` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_enquiries`
--

/*!40000 ALTER TABLE `customer_enquiries` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_enquiries` ENABLE KEYS */;


--
-- Definition of table `district`
--

DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countryId` int(11) NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stateId` int(11) NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cityId` int(11) NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `district`
--

/*!40000 ALTER TABLE `district` DISABLE KEYS */;
/*!40000 ALTER TABLE `district` ENABLE KEYS */;


--
-- Definition of table `email_setting`
--

DROP TABLE IF EXISTS `email_setting`;
CREATE TABLE `email_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emailType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdUserId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedUserId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_setting`
--

/*!40000 ALTER TABLE `email_setting` DISABLE KEYS */;
INSERT INTO `email_setting` (`id`,`email`,`emailType`,`password`,`createdUserId`,`updatedUserId`,`createdAt`,`updatedAt`) VALUES 
 (1,'aradhanab2017@gmail.com','gmail','jcqwlvkmmuwmvhnq','cm1qdx6wo0001df6d78secy8y',NULL,'2024-10-01 13:28:38.088','2024-10-01 13:28:38.088');
/*!40000 ALTER TABLE `email_setting` ENABLE KEYS */;


--
-- Definition of table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slugCategory` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isActive` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdBy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedBy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;


--
-- Definition of table `faq`
--

DROP TABLE IF EXISTS `faq`;
CREATE TABLE `faq` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `badgeTitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq`
--

/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;


--
-- Definition of table `features`
--

DROP TABLE IF EXISTS `features`;
CREATE TABLE `features` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedUser` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isDeleted` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `features`
--

/*!40000 ALTER TABLE `features` DISABLE KEYS */;
INSERT INTO `features` (`id`,`image`,`title`,`description`,`updatedUser`,`isDeleted`,`createdAt`,`updatedAt`) VALUES 
 ('cm1qe8p7s0002df6dqr4helhu','http://localhost:3000/landing-page/features/1727784433573_company-image.png','Quality Code','Code structure that all developers will easily understand and fall in love with','cm1qdx6wo0001df6d78secy8y','N','2024-10-01 12:07:13.576','2024-10-01 12:07:13.576'),
 ('cm1qeaoln0003df6dfn06ki81','http://localhost:3000/landing-page/features/1727784794118_company-image.png','Continuous Updates','Free updates for the next 12 months, including new demos and features.','cm1qdx6wo0001df6d78secy8y','N','2024-10-01 12:08:46.091','2024-10-01 12:13:14.147'),
 ('cm1qehgyn0004df6du9c7v0j8','http://localhost:3000/landing-page/features/1727784842778_company-image.png','Stater Kit','Start your project quickly without having to remove unnecessary features','cm1qdx6wo0001df6d78secy8y','N','2024-10-01 12:14:02.784','2024-10-01 12:14:02.784'),
 ('cm1qeim810005df6dja7i833w','http://localhost:3000/landing-page/features/1727784896254_company-image.png','API Ready','Just change the endpoint and see your own data loaded within seconds','cm1qdx6wo0001df6d78secy8y','N','2024-10-01 12:14:56.257','2024-10-01 12:14:56.257'),
 ('cm1qejaxf0006df6ddibowak1','http://localhost:3000/landing-page/features/1727784944755_company-image.png','Excellent Support','An easy-to-follow doc with lots of references and code examples','cm1qdx6wo0001df6d78secy8y','N','2024-10-01 12:15:28.275','2024-10-01 12:15:44.759'),
 ('cm1qerzep0007df6d1pzgcsex','http://localhost:3000/landing-page/features/1727785333247_company-image.png','Well Documented','An easy-to-follow doc with lots of references and code examples.','cm1qdx6wo0001df6d78secy8y','N','2024-10-01 12:22:13.250','2024-10-01 12:22:13.250');
/*!40000 ALTER TABLE `features` ENABLE KEYS */;


--
-- Definition of table `key_achievements`
--

DROP TABLE IF EXISTS `key_achievements`;
CREATE TABLE `key_achievements` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keyMetric` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `highlight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isDeleted` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `createdUser` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedUser` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postedBy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `key_achievements`
--

/*!40000 ALTER TABLE `key_achievements` DISABLE KEYS */;
INSERT INTO `key_achievements` (`id`,`image`,`keyMetric`,`highlight`,`isDeleted`,`createdUser`,`updatedUser`,`postedBy`,`createdAt`,`updatedAt`) VALUES 
 ('cm1qgcc9q0000123qyepaapd9','http://localhost:3000/landing-page/key-achievements/1727787962651_company-image.png','7.1k+','Support Tickets Resolved','N',NULL,NULL,'Super Admin','2024-10-01 13:06:02.654','2024-10-01 13:06:02.654'),
 ('cm1qge9d50001123qh82uk3x3','http://localhost:3000/landing-page/key-achievements/1727788052199_company-image.png','50k+','Join creatives community','N',NULL,NULL,'Super Admin','2024-10-01 13:07:32.202','2024-10-01 13:07:32.202'),
 ('cm1qgfcw80002123qepluhi4h','http://localhost:3000/landing-page/key-achievements/1727788103430_company-image.png','4.8/5','Highly Rated Products','N',NULL,NULL,'Super Admin','2024-10-01 13:08:23.432','2024-10-01 13:08:23.432'),
 ('cm1qgfx3a0003123qxo551xay','http://localhost:3000/landing-page/key-achievements/1727788129603_company-image.png','100%','Money Back Guarantee','N',NULL,NULL,'Super Admin','2024-10-01 13:08:49.606','2024-10-01 13:08:49.606');
/*!40000 ALTER TABLE `key_achievements` ENABLE KEYS */;


--
-- Definition of table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menuId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subMenu` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slugName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sequence` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`,`menuId`,`menu`,`subMenu`,`slugName`,`permission`,`path`,`sequence`,`createdAt`,`updatedAt`) VALUES 
 ('cm1k87mia0000zwq280tct81q','1','Dashboard','Dashboard','dashboard',0x7B2268617352656164223A2259222C226861735772697465223A224E222C2268617345646974223A224E222C2268617344656C657465223A224E227D,'/dashboards/analytics','1','2024-09-27 04:31:48.658','2024-09-27 04:31:48.658'),
 ('cm1k87xyf0001zwq2w87icyyt','2','User Management','Manage Roles','manage-roles',0x7B2268617352656164223A2259222C226861735772697465223A2259222C2268617345646974223A2259222C2268617344656C657465223A2259227D,'/apps/roles','2','2024-09-27 04:32:03.495','2024-09-27 04:32:03.495'),
 ('cm1k887xw0002zwq248g0sldj','3','User Management','Manage Users','manage-users',0x7B2268617352656164223A2259222C226861735772697465223A2259222C2268617345646974223A2259222C2268617344656C657465223A2259227D,'/apps/user/list','3','2024-09-27 04:32:16.436','2024-09-27 04:32:16.436'),
 ('cm1k88lp90003zwq2qb1d7tg3','4','Channel Management','Email','email',0x7B2268617352656164223A2259222C226861735772697465223A2259222C2268617345646974223A2259222C2268617344656C657465223A2259227D,'/apps/email','4','2024-09-27 04:32:34.269','2024-09-27 04:32:34.269'),
 ('cm1k88w1e0004zwq2z93xahtr','5','Channel Management','SMS','sms',0x7B2268617352656164223A2259222C226861735772697465223A2259222C2268617345646974223A2259222C2268617344656C657465223A2259227D,'/','5','2024-09-27 04:32:47.667','2024-09-27 04:32:47.667'),
 ('cm1k895d00005zwq26k37joco','6','Channel Management','Whatsapp','whatsapp',0x7B2268617352656164223A2259222C226861735772697465223A2259222C2268617345646974223A2259222C2268617344656C657465223A2259227D,'/apps/chat','6','2024-09-27 04:32:59.749','2024-09-27 04:32:59.749'),
 ('cm1k89qj00006zwq2djebbxwv','7','Channel Management','Voice Call','voice-call',0x7B2268617352656164223A2259222C226861735772697465223A2259222C2268617345646974223A2259222C2268617344656C657465223A2259227D,'/','7','2024-09-27 04:33:27.181','2024-09-27 04:33:27.181'),
 ('cm1k8ayze0007zwq2pih4ct32','8','Channel Management','Push Notification','push-notification',0x7B2268617352656164223A2259222C226861735772697465223A2259222C2268617345646974223A2259222C2268617344656C657465223A2259227D,'/','8','2024-09-27 04:34:24.795','2024-09-27 04:34:24.795'),
 ('cm1k8bh0j0008zwq2gb3h0uqp','9','Content Management','Content','content',0x7B2268617352656164223A2259222C226861735772697465223A2259222C2268617345646974223A2259222C2268617344656C657465223A2259227D,'/','9','2024-09-27 04:34:48.163','2024-09-27 04:34:48.163'),
 ('cm1k8bqg70009zwq2rnj101tw','10','Content Management','Category','category',0x7B2268617352656164223A2259222C226861735772697465223A2259222C2268617345646974223A2259222C2268617344656C657465223A2259227D,'/','10','2024-09-27 04:35:00.392','2024-09-27 04:35:00.392'),
 ('cm1k8c0cc000azwq20848tfn2','11','Subscription Management','Configure Subscription','configure-subscription',0x7B2268617352656164223A2259222C226861735772697465223A2259222C2268617345646974223A2259222C2268617344656C657465223A2259227D,'/pages/configure-subscription','11','2024-09-27 04:35:13.213','2024-09-27 04:35:13.213'),
 ('cm1k8cd9y000bzwq2b4t1lhrs','12','Subscription Management','My Subscription','my-subscription',0x7B2268617352656164223A2259222C226861735772697465223A2259222C2268617345646974223A2259222C2268617344656C657465223A2259227D,'/pages/my-subscription','12','2024-09-27 04:35:29.974','2024-09-27 04:35:29.974'),
 ('cm1k8coan000czwq22nz18qqk','13','Reports','Users','users',0x7B2268617352656164223A2259222C226861735772697465223A224E222C2268617345646974223A224E222C2268617344656C657465223A224E227D,'/pages/reports/users','13','2024-09-27 04:35:44.256','2024-09-27 04:35:44.256'),
 ('cm1k8cwl6000dzwq249tj23kb','14','Master Data','Location','location',0x7B2268617352656164223A2259222C226861735772697465223A224E222C2268617345646974223A224E222C2268617344656C657465223A224E227D,'/','14','2024-09-27 04:35:55.003','2024-09-27 04:35:55.003'),
 ('cm1k8d5lq000ezwq2c46a56zy','15','Settings','Account Settings','account-settings',0x7B2268617352656164223A2259222C226861735772697465223A2259222C2268617345646974223A2259222C2268617344656C657465223A2259227D,'/pages/account-settings','15','2024-09-27 04:36:06.686','2024-09-27 04:36:06.686'),
 ('cm1k8depu000fzwq29l9zbb77','16','Settings','System Settings','system-settings',0x7B2268617352656164223A2259222C226861735772697465223A2259222C2268617345646974223A2259222C2268617344656C657465223A2259227D,'/pages/system-settings','16','2024-09-27 04:36:18.498','2024-09-27 04:36:18.498'),
 ('cm1k8dp3e000gzwq2tro5ph6n','17','Settings','Website Settings','website-settings',0x7B2268617352656164223A2259222C226861735772697465223A2259222C2268617345646974223A2259222C2268617344656C657465223A224E227D,'/pages/website-settings','17','2024-09-27 04:36:31.947','2024-09-27 04:36:31.947'),
 ('cm1k8e805000izwq22tsbatq6','18','Settings','Bulk Import','bulk-import',0x7B2268617352656164223A2259222C226861735772697465223A2259222C2268617345646974223A2259222C2268617344656C657465223A2259227D,'/pages/bulk-import','18','2024-09-27 04:36:56.453','2024-09-27 04:36:56.453'),
 ('cm1k8eiql000jzwq2i6ckf8e4','19','Settings','Languages','languages',0x7B2268617352656164223A2259222C226861735772697465223A2259222C2268617345646974223A2259222C2268617344656C657465223A2259227D,'/pages/language','19','2024-09-27 04:37:10.366','2024-09-27 04:37:10.366'),
 ('cm1k8exnf000kzwq2hn3pwax0','20','Settings','Backup Views','backup-views',0x7B2268617352656164223A2259222C226861735772697465223A2259222C2268617345646974223A2259222C2268617344656C657465223A2259227D,'/pages/backup-views','20','2024-09-27 04:37:29.692','2024-09-27 04:37:29.692'),
 ('cm1k8f826000lzwq2h6gqumkw','21','Settings','Customer Enquiries','customer-enquiries',0x7B2268617352656164223A2259222C226861735772697465223A224E222C2268617345646974223A224E222C2268617344656C657465223A224E227D,'/apps/customer-enquiries','21','2024-09-27 04:37:43.183','2024-09-27 04:37:43.183');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;


--
-- Definition of table `our_team`
--

DROP TABLE IF EXISTS `our_team`;
CREATE TABLE `our_team` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedUser` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isDeleted` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `our_team`
--

/*!40000 ALTER TABLE `our_team` DISABLE KEYS */;
INSERT INTO `our_team` (`id`,`image`,`title`,`description`,`updatedUser`,`isDeleted`,`createdAt`,`updatedAt`) VALUES 
 ('cm1qfucgv000gdf6deabae5j4','http://localhost:3000/landing-page/our-team/1727787307815_company-image.png','Paul Miles','UI Designer','cm1qdx6wo0001df6d78secy8y','N','2024-10-01 12:52:03.103','2024-10-01 12:55:07.821'),
 ('cm1qfzskw000hdf6dtb3frpa9','http://localhost:3000/landing-page/our-team/1727787377261_company-image.png','Sophie Gilbert','Project Manager',NULL,'N','2024-10-01 12:56:17.265','2024-10-01 12:56:17.265'),
 ('cm1qg0h4n000idf6da7lxugua','http://localhost:3000/landing-page/our-team/1727787409076_company-image.png','Chris Watkin','Marketing Manager','cm1qdx6wo0001df6d78secy8y','N','2024-10-01 12:56:49.080','2024-10-01 12:57:20.061'),
 ('cm1qg0s5q000jdf6dxryhkehf','http://localhost:3000/landing-page/our-team/1727787423371_company-image.png','Nannie Ford','Development Lead',NULL,'N','2024-10-01 12:57:03.374','2024-10-01 12:57:03.374');
/*!40000 ALTER TABLE `our_team` ENABLE KEYS */;


--
-- Definition of table `package_plans`
--

DROP TABLE IF EXISTS `package_plans`;
CREATE TABLE `package_plans` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subTitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monthlyPrice` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `yearlyPlan` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `popularPlan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `planBenefits` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdUser` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedUser` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isDeleted` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_plans`
--

/*!40000 ALTER TABLE `package_plans` DISABLE KEYS */;
INSERT INTO `package_plans` (`id`,`title`,`subTitle`,`monthlyPrice`,`yearlyPlan`,`popularPlan`,`planBenefits`,`image`,`createdUser`,`updatedUser`,`isDeleted`,`createdAt`,`updatedAt`) VALUES 
 ('cm1qh09yi000a123qz5ky3h2u','Basic','Basic plan','40',0x7B226D6F6E74686C79223A2233302E3030222C22616E6E75616C6C79223A223336302E3030227D,NULL,0x5B7B2266656174757265223A2254696D656C696E65227D2C7B2266656174757265223A22426173696320736561726368227D5D,'http://localhost:3000/landing-page/pricing-images/1727789118905_company-image.png','cm1qdx6wo0001df6d78secy8y','cm1qdx6wo0001df6d78secy8y','N','2024-10-01 13:24:39.403','2024-10-01 13:25:18.913'),
 ('cm1qh1pzl000b123qv89fd610','Team','Team Plan','100',0x7B226D6F6E74686C79223A2237352E3030222C22616E6E75616C6C79223A223930302E3030227D,NULL,0x5B7B2266656174757265223A224C697665206368617420776964676574227D2C7B2266656174757265223A22456D61696C206D61726B6574696E67227D5D,'http://localhost:3000/landing-page/pricing-images/1727789164643_company-image.png','cm1qdx6wo0001df6d78secy8y','cm1qdx6wo0001df6d78secy8y','N','2024-10-01 13:25:46.833','2024-10-01 13:26:04.649'),
 ('cm1qh2xdr000c123qjl4q648f','Advance','Advance Paln','120',0x7B226D6F6E74686C79223A2239302E3030222C22616E6E75616C6C79223A22313038302E3030227D,NULL,0x5B7B2266656174757265223A22437573746F6D20466F726D73227D2C7B2266656174757265223A225472616666696320616E616C7974696373227D2C7B2266656174757265223A22426173696320537570706F7274227D5D,'http://localhost:3000/landing-page/pricing-images/1727789211471_company-image.png','cm1qdx6wo0001df6d78secy8y','cm1qdx6wo0001df6d78secy8y','N','2024-10-01 13:26:43.071','2024-10-01 13:26:51.476');
/*!40000 ALTER TABLE `package_plans` ENABLE KEYS */;


--
-- Definition of table `questionanswer`
--

DROP TABLE IF EXISTS `questionanswer`;
CREATE TABLE `questionanswer` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isDeleted` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questionanswer`
--

/*!40000 ALTER TABLE `questionanswer` DISABLE KEYS */;
INSERT INTO `questionanswer` (`id`,`question`,`answer`,`isDeleted`,`createdAt`,`updatedAt`) VALUES 
 ('cm1qgmddw0004123qxsdtj88k','How to logged in?','Here you go, get some','N','2024-10-01 13:13:50.660','2024-10-01 13:15:00.096'),
 ('cm1qgmovx0005123qmt8g656b','How to register?','Kindly visit our website','N','2024-10-01 13:14:05.566','2024-10-01 13:14:05.566'),
 ('cm1qgnbmv0006123qzuctxpup','What is Regular License?','ok lets see','N','2024-10-01 13:14:35.047','2024-10-01 13:14:35.047');
/*!40000 ALTER TABLE `questionanswer` ENABLE KEYS */;


--
-- Definition of table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roleName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`,`userId`,`roleName`,`permissions`,`isDeleted`,`createdAt`,`updatedAt`) VALUES 
 ('cm1qhb60m000d123qi6c7gve1','cm1qdx6wo0001df6d78secy8y','Manager',0x7B2268617352656164223A5B2231222C2232222C2233225D2C226861735772697465223A5B2232222C2233225D2C2268617345646974223A5B2232222C2233225D2C2268617344656C657465223A5B5D7D,'N','2024-10-01 13:33:07.509','2024-10-01 13:33:20.034');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


--
-- Definition of table `section_content`
--

DROP TABLE IF EXISTS `section_content`;
CREATE TABLE `section_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `badgeTitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isfrontendvisible` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Y',
  `createdUser` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedUser` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section_content`
--

/*!40000 ALTER TABLE `section_content` DISABLE KEYS */;
INSERT INTO `section_content` (`id`,`sectionType`,`badgeTitle`,`title`,`description`,`image1`,`image2`,`isfrontendvisible`,`createdUser`,`updatedUser`,`createdAt`,`updatedAt`) VALUES 
 (1,'banner_section','Get Early Access','One dashboard to manage all your businesses','Production-ready & easy to use Admin Template for Reliability and Customizability','http://localhost:3000/landing-page/banner-images/1727784269250_dashboard-image-light.png','http://localhost:3000/landing-page/banner-images/1727784269252_dashboard-image-dark.png','Y','cm1qdx6wo0001df6d78secy8y','cm1qdx6wo0001df6d78secy8y','2024-10-01 12:03:23.801','2024-10-01 12:04:29.256'),
 (2,'feature','Useful Features','Everything you need laptop chargingto start your next project','Not just a set of tools the package includes ready-to-deploy conceptual application',NULL,NULL,'Y','cm1qdx6wo0001df6d78secy8y','cm1qdx6wo0001df6d78secy8y','2024-10-01 12:05:36.793','2024-10-01 12:06:04.700'),
 (3,'testimonial','Real Customers Reviews','What people say','See what our customers have to say about their experience. This template is really clean and well documented. The docs are really easy to understand and its always easy to find a screenshot from their website ',NULL,NULL,'N','cm1qdx6wo0001df6d78secy8y','cm1qdx6wo0001df6d78secy8y','2024-10-01 12:23:59.949','2024-10-01 13:17:52.837'),
 (6,'brand',NULL,NULL,NULL,NULL,NULL,'Y','cm1qdx6wo0001df6d78secy8y','cm1qdx6wo0001df6d78secy8y','2024-10-01 12:45:07.589','2024-10-01 12:50:44.386'),
 (7,'our_team','Our Great Team','Supported laptop chargingby Real People','Who is behind these great-looking interfaces?',NULL,NULL,'Y','cm1qdx6wo0001df6d78secy8y','cm1qdx6wo0001df6d78secy8y','2024-10-01 12:48:59.870','2024-10-01 12:51:35.401'),
 (8,'key_achievements',NULL,NULL,NULL,NULL,NULL,'Y','cm1qdx6wo0001df6d78secy8y','cm1qdx6wo0001df6d78secy8y','2024-10-01 13:06:06.977','2024-10-01 13:06:34.548'),
 (9,'faq','FAQ','Frequently asked questionslaptop charging','Browse through these FAQs to find answers to commonly asked questions',NULL,NULL,'Y','cm1qdx6wo0001df6d78secy8y','cm1qdx6wo0001df6d78secy8y','2024-10-01 13:09:39.215','2024-10-01 13:09:50.447');
/*!40000 ALTER TABLE `section_content` ENABLE KEYS */;


--
-- Definition of table `sent_emails`
--

DROP TABLE IF EXISTS `sent_emails`;
CREATE TABLE `sent_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sentBy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `sendMailTo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sent_emails`
--

/*!40000 ALTER TABLE `sent_emails` DISABLE KEYS */;
INSERT INTO `sent_emails` (`id`,`from`,`to`,`subject`,`message`,`sentBy`,`createdAt`,`sendMailTo`) VALUES 
 (1,'aradhanab2017@gmail.com','venkateshbabu.saitech@gmail.com','Sample Mail from savemom','<p>Register Now!</p>','cm1qdx6wo0001df6d78secy8y','2024-10-01 13:29:36.836','single-user');
/*!40000 ALTER TABLE `sent_emails` ENABLE KEYS */;


--
-- Definition of table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sessionToken` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Session_sessionToken_key` (`sessionToken`),
  KEY `Session_userId_fkey` (`userId`),
  CONSTRAINT `Session_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `session`
--

/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;


--
-- Definition of table `state`
--

DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countryId` int(11) NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `state`
--

/*!40000 ALTER TABLE `state` DISABLE KEYS */;
/*!40000 ALTER TABLE `state` ENABLE KEYS */;


--
-- Definition of table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
CREATE TABLE `subscribers` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

/*!40000 ALTER TABLE `subscribers` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribers` ENABLE KEYS */;


--
-- Definition of table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
CREATE TABLE `system_settings` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `systemName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `systemImage` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `navbarImage` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metaTitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contactNo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedUser` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_settings`
--

/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
INSERT INTO `system_settings` (`id`,`systemName`,`description`,`systemImage`,`navbarImage`,`metaTitle`,`email`,`contactNo`,`updatedUser`,`createdAt`,`updatedAt`) VALUES 
 ('cm1qgwckn0008123q746a5c3m','Savemom','Lets see our website','http://localhost:3000/system-images/1727788896164_system-logo.png','http://localhost:3000/system-images/1727788896166_navbar-logo.png','Savemom','example@gmail.com','9878587496',NULL,'2024-10-01 13:21:36.168','2024-10-01 13:21:36.168');
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;


--
-- Definition of table `testimonial_reviews`
--

DROP TABLE IF EXISTS `testimonial_reviews`;
CREATE TABLE `testimonial_reviews` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postedBy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isDeleted` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonial_reviews`
--

/*!40000 ALTER TABLE `testimonial_reviews` DISABLE KEYS */;
INSERT INTO `testimonial_reviews` (`id`,`image`,`description`,`rating`,`postedBy`,`designation`,`isDeleted`,`createdAt`,`updatedAt`) VALUES 
 ('cm1qf5cr40008df6dh5gyd1v8','http://localhost:3000/landing-page/testimonial-images/1727785957068_company-image.png','See what our customers have to say about their experience.\r\nThis template is really clean & well documented. The docs are really easy to understand and its always easy to find a screenshot from their .','4','Super Admin','Full Stack Developer','N','2024-10-01 12:32:37.072','2024-10-01 12:35:39.220'),
 ('cm1qf62lx0009df6dyqt8kd3z','http://localhost:3000/landing-page/testimonial-images/1727785990578_company-image.png','However customers have to say about their experience.\r\nThis template is really clean & well documented. The docs are really easy to understand and its always easy to find a screenshot from their website.','5','Super Admin','Lead Manager','N','2024-10-01 12:33:10.582','2024-10-01 12:33:10.582'),
 ('cm1qf7j8o000adf6duwmz11v5','http://localhost:3000/landing-page/testimonial-images/1727786058790_company-image.png','Here we have to say about their experience.\r\nThis template is really clean & well documented. The docs are really easy to understand and its always easy to find a screenshot from their website.','4','Super Admin','Digital Editor','N','2024-10-01 12:34:18.793','2024-10-01 12:34:18.793');
/*!40000 ALTER TABLE `testimonial_reviews` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contactNo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipCode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companyName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roleId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '3',
  `roleName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'customer',
  `profileStatus` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isDeleted` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `createdBy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscriptionPlan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`,`name`,`email`,`password`,`contactNo`,`address`,`state`,`zipCode`,`country`,`language`,`companyName`,`roleId`,`roleName`,`profileStatus`,`image`,`isDeleted`,`createdBy`,`subscriptionPlan`,`createdAt`,`updatedAt`) VALUES 
 ('cm1qdx6wo0001df6d78secy8y','Super Admin','superadmin@gmail.com','$2b$10$oM6DSgMbzlaEJ0bq4lr1COrYFJ7KpnuEzrB8p0kCaTubBG7UndTZW','','','','','',NULL,'','1','super admin','Active','http://localhost:3000/uploads/1727789969182_image.png','N','',NULL,'2024-10-01 11:58:16.633','2024-10-01 13:39:29.186'),
 ('cm1qhcr4z000e123qm8lpaoix','Arun Kumar','arun@gmail.com','$2b$10$vm5qJNVkXzMGbaHfCLGnW.5Lk5X0tLldcirrEXjXczVZuUC0dXwhu','9685858596',NULL,NULL,NULL,'India',NULL,'','cm1qhb60m000d123qi6c7gve1','Manager','Active',NULL,'N','cm1qdx6wo0001df6d78secy8y',NULL,'2024-10-01 13:34:21.539','2024-10-01 13:34:48.796');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `verification_token`
--

DROP TABLE IF EXISTS `verification_token`;
CREATE TABLE `verification_token` (
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(3) NOT NULL,
  UNIQUE KEY `VerificationToken_token_key` (`token`),
  UNIQUE KEY `VerificationToken_identifier_token_key` (`identifier`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `verification_token`
--

/*!40000 ALTER TABLE `verification_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `verification_token` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
