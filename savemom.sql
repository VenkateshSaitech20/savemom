-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2024 at 07:01 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `savemom`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` varchar(191) NOT NULL,
  `userId` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `provider` varchar(191) NOT NULL,
  `providerAccountId` varchar(191) NOT NULL,
  `refresh_token` varchar(191) DEFAULT NULL,
  `access_token` varchar(191) DEFAULT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `token_type` varchar(191) DEFAULT NULL,
  `scope` varchar(191) DEFAULT NULL,
  `id_token` varchar(191) DEFAULT NULL,
  `session_state` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `image`, `createdAt`, `updatedAt`) VALUES
('cm1qf9z60000bdf6d2fen7opq', 'http://localhost:3000/landing-page/brand-images/1727786172742_1727261104447_img-one.png', '2024-10-01 12:36:12.744', '2024-10-01 12:36:12.744'),
('cm1qfa7ja000cdf6drme4uul0', 'http://localhost:3000/landing-page/brand-images/1727786183588_1726729923385_air-bnb_-_convert.png', '2024-10-01 12:36:23.590', '2024-10-01 12:36:23.590'),
('cm1qfadpv000ddf6d9rf7glzd', 'http://localhost:3000/landing-page/brand-images/1727786191601_1726815461050_img-one.png', '2024-10-01 12:36:31.603', '2024-10-01 12:36:31.603'),
('cm1qfajzb000edf6dpzcv311g', 'http://localhost:3000/landing-page/brand-images/1727786199717_1726815461052_img-one.png', '2024-10-01 12:36:39.720', '2024-10-01 12:36:39.720');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `countryId` int(11) NOT NULL,
  `state` varchar(191) NOT NULL,
  `stateId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `configure_subscription`
--

CREATE TABLE `configure_subscription` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `publicKey` varchar(191) DEFAULT NULL,
  `privateKey` varchar(191) DEFAULT NULL,
  `isActive` varchar(191) DEFAULT 'N',
  `type` varchar(191) DEFAULT NULL,
  `createdUser` varchar(191) DEFAULT NULL,
  `updatedUser` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `configure_subscription`
--

INSERT INTO `configure_subscription` (`id`, `name`, `publicKey`, `privateKey`, `isActive`, `type`, `createdUser`, `updatedUser`, `createdAt`, `updatedAt`) VALUES
('cm1qgyg7w0009123qhus3mku7', 'Razorpay', 'rzp_test_2hEj93EL0gFSAp', 'EpfQnpGGOd71Ub44IUcXaVgv', 'Y', 'Demo', 'cm1qdx6wo0001df6d78secy8y', 'cm1qdx6wo0001df6d78secy8y', '2024-10-01 13:23:14.205', '2024-10-01 13:23:42.678');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` varchar(191) NOT NULL,
  `badgeTitle` longtext DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `cardTitle` longtext DEFAULT NULL,
  `cardDescription` longtext DEFAULT NULL,
  `isfrontendvisible` varchar(191) DEFAULT NULL,
  `createdUser` varchar(191) DEFAULT NULL,
  `updatedUser` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `badgeTitle`, `title`, `description`, `cardTitle`, `cardDescription`, `isfrontendvisible`, `createdUser`, `updatedUser`, `createdAt`, `updatedAt`) VALUES
('cm1qgp24l0007123qg31g8195', 'Contact US', 'Let\'s work laptop charging together', 'Any question or remark? just write us a message', 'Send a message', 'If you would like to discuss anything related to payment, account, licensing,\npartnerships, or have pre-sales questions, you’re at the right place', 'Y', 'cm1qdx6wo0001df6d78secy8y', 'cm1qdx6wo0001df6d78secy8y', '2024-10-01 13:15:56.037', '2024-10-04 08:57:49.141');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `createdUser` varchar(191) DEFAULT NULL,
  `isActive` varchar(191) NOT NULL DEFAULT 'Y',
  `isDeleted` varchar(191) NOT NULL DEFAULT 'N',
  `phoneCode` varchar(8) NOT NULL,
  `sortname` varchar(3) NOT NULL,
  `updatedUser` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`, `createdAt`, `updatedAt`, `createdUser`, `isActive`, `isDeleted`, `phoneCode`, `sortname`, `updatedUser`) VALUES
(1, 'India', '2024-10-04 07:46:48.152', '2024-10-04 07:55:11.147', 'cm1qdx6wo0001df6d78secy8y', 'Y', 'N', '91', 'IND', 'cm1qdx6wo0001df6d78secy8y'),
(2, 'USA', '2024-10-04 07:54:57.171', '2024-10-04 07:54:57.171', 'cm1qdx6wo0001df6d78secy8y', 'Y', 'N', '95', 'USA', NULL),
(3, 'England', '2024-10-04 07:58:24.892', '2024-10-04 08:03:56.651', 'cm1qdx6wo0001df6d78secy8y', 'Y', 'Y', '111', 'EN', 'cm1qdx6wo0001df6d78secy8y');

-- --------------------------------------------------------

--
-- Table structure for table `customer_enquiries`
--

CREATE TABLE `customer_enquiries` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_enquiries`
--

INSERT INTO `customer_enquiries` (`id`, `name`, `email`, `message`, `createdAt`) VALUES
('cm1ui4qtw0000rr2t1ljhy96c', 'Venkatesh', 'superadmin@gmail.com', 'Awesome...', '2024-10-04 09:07:12.211');

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `countryId` int(11) NOT NULL,
  `country` varchar(191) NOT NULL,
  `stateId` int(11) NOT NULL,
  `state` varchar(191) NOT NULL,
  `cityId` int(11) NOT NULL,
  `city` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_setting`
--

CREATE TABLE `email_setting` (
  `id` int(11) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `emailType` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `createdUserId` varchar(191) DEFAULT NULL,
  `updatedUserId` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_setting`
--

INSERT INTO `email_setting` (`id`, `email`, `emailType`, `password`, `createdUserId`, `updatedUserId`, `createdAt`, `updatedAt`) VALUES
(1, 'aradhanab2017@gmail.com', 'gmail', 'jcqwlvkmmuwmvhnq', 'cm1qdx6wo0001df6d78secy8y', 'cm1qdx6wo0001df6d78secy8y', '2024-10-01 13:28:38.088', '2024-10-03 06:58:35.816');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `category` varchar(191) DEFAULT NULL,
  `slugCategory` varchar(191) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `isActive` varchar(191) DEFAULT NULL,
  `createdBy` varchar(191) DEFAULT NULL,
  `updatedBy` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `isDeleted` varchar(191) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `category`, `slugCategory`, `message`, `isActive`, `createdBy`, `updatedBy`, `createdAt`, `updatedAt`, `isDeleted`) VALUES
(1, 'Template 1', 'template-1', 'Hi\nThis is template one format.\nThanks.', 'Y', 'cm1qdx6wo0001df6d78secy8y', 'cm1qdx6wo0001df6d78secy8y', '2024-10-03 07:38:04.693', '2024-10-03 11:50:25.009', 'N'),
(2, 'Template 2', 'template-2', 'Hi,\n\nThis is template two format.\n\nThanks\n', 'Y', 'cm1qdx6wo0001df6d78secy8y', 'cm1qdx6wo0001df6d78secy8y', '2024-10-03 07:40:28.244', '2024-10-03 11:50:10.088', 'N'),
(3, 'Template 3', 'template-3', 'Hi,\nYou are using template 3.\nThanks', 'Y', 'cm1qdx6wo0001df6d78secy8y', 'cm1qdx6wo0001df6d78secy8y', '2024-10-03 11:02:19.851', '2024-10-03 11:32:43.474', 'N'),
(4, 'Template 1', 'template-1', 'This is a sample mail template.', 'Y', 'cm1u9gzsy0000bay2itigduo5', 'cm1u9gzsy0000bay2itigduo5', '2024-10-04 05:52:47.570', '2024-10-04 06:24:31.473', 'N'),
(5, 'Template 2', 'template-2', 'This is subuser template 2', 'N', 'cm1u9gzsy0000bay2itigduo5', 'cm1u9gzsy0000bay2itigduo5', '2024-10-04 06:22:37.739', '2024-10-04 06:24:11.240', 'Y'),
(6, 'Template 2', 'template-2', 'Template 2', 'Y', 'cm1u9gzsy0000bay2itigduo5', 'cm1u9gzsy0000bay2itigduo5', '2024-10-04 06:24:49.860', '2024-10-04 06:28:48.392', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` varchar(191) NOT NULL,
  `badgeTitle` varchar(191) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `updatedUser` varchar(191) DEFAULT NULL,
  `isDeleted` varchar(191) DEFAULT 'N',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `image`, `title`, `description`, `updatedUser`, `isDeleted`, `createdAt`, `updatedAt`) VALUES
('cm1qe8p7s0002df6dqr4helhu', 'http://localhost:3000/landing-page/features/1727784433573_company-image.png', 'Quality Code', 'Code structure that all developers will easily understand and fall in love with', 'cm1qdx6wo0001df6d78secy8y', 'N', '2024-10-01 12:07:13.576', '2024-10-01 12:07:13.576'),
('cm1qeaoln0003df6dfn06ki81', 'http://localhost:3000/landing-page/features/1727784794118_company-image.png', 'Continuous Updates', 'Free updates for the next 12 months, including new demos and features.', 'cm1qdx6wo0001df6d78secy8y', 'N', '2024-10-01 12:08:46.091', '2024-10-01 12:13:14.147'),
('cm1qehgyn0004df6du9c7v0j8', 'http://localhost:3000/landing-page/features/1727784842778_company-image.png', 'Stater Kit', 'Start your project quickly without having to remove unnecessary features', 'cm1qdx6wo0001df6d78secy8y', 'N', '2024-10-01 12:14:02.784', '2024-10-01 12:14:02.784'),
('cm1qeim810005df6dja7i833w', 'http://localhost:3000/landing-page/features/1727784896254_company-image.png', 'API Ready', 'Just change the endpoint and see your own data loaded within seconds', 'cm1qdx6wo0001df6d78secy8y', 'N', '2024-10-01 12:14:56.257', '2024-10-01 12:14:56.257'),
('cm1qejaxf0006df6ddibowak1', 'http://localhost:3000/landing-page/features/1727784944755_company-image.png', 'Excellent Support', 'An easy-to-follow doc with lots of references and code examples', 'cm1qdx6wo0001df6d78secy8y', 'N', '2024-10-01 12:15:28.275', '2024-10-01 12:15:44.759'),
('cm1qerzep0007df6d1pzgcsex', 'http://localhost:3000/landing-page/features/1727937009606_company-image.png', 'Well Documented', 'An easy-to-follow doc with lots of references and code examples.', 'cm1qdx6wo0001df6d78secy8y', 'N', '2024-10-01 12:22:13.250', '2024-10-03 06:30:09.610');

-- --------------------------------------------------------

--
-- Table structure for table `key_achievements`
--

CREATE TABLE `key_achievements` (
  `id` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `keyMetric` varchar(191) DEFAULT NULL,
  `highlight` varchar(191) DEFAULT NULL,
  `isDeleted` varchar(191) DEFAULT 'N',
  `createdUser` varchar(191) DEFAULT NULL,
  `updatedUser` varchar(191) DEFAULT NULL,
  `postedBy` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `key_achievements`
--

INSERT INTO `key_achievements` (`id`, `image`, `keyMetric`, `highlight`, `isDeleted`, `createdUser`, `updatedUser`, `postedBy`, `createdAt`, `updatedAt`) VALUES
('cm1qgcc9q0000123qyepaapd9', 'http://localhost:3000/landing-page/key-achievements/1727787962651_company-image.png', '7.1k+', 'Support Tickets Resolved', 'N', NULL, NULL, 'Super Admin', '2024-10-01 13:06:02.654', '2024-10-01 13:06:02.654'),
('cm1qge9d50001123qh82uk3x3', 'http://localhost:3000/landing-page/key-achievements/1727788052199_company-image.png', '50k+', 'Join creatives community', 'N', NULL, NULL, 'Super Admin', '2024-10-01 13:07:32.202', '2024-10-01 13:07:32.202'),
('cm1qgfcw80002123qepluhi4h', 'http://localhost:3000/landing-page/key-achievements/1727788103430_company-image.png', '4.8/5', 'Highly Rated Products', 'N', NULL, NULL, 'Super Admin', '2024-10-01 13:08:23.432', '2024-10-01 13:08:23.432'),
('cm1qgfx3a0003123qxo551xay', 'http://localhost:3000/landing-page/key-achievements/1727937476001_company-image.png', '100%', 'Money Back Guarantee', 'N', NULL, NULL, 'Super Admin', '2024-10-01 13:08:49.606', '2024-10-03 06:37:56.007');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` varchar(191) NOT NULL,
  `menuId` varchar(191) DEFAULT NULL,
  `menu` varchar(191) DEFAULT NULL,
  `subMenu` varchar(191) DEFAULT NULL,
  `slugName` varchar(191) DEFAULT NULL,
  `permission` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `path` varchar(191) DEFAULT NULL,
  `sequence` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menuId`, `menu`, `subMenu`, `slugName`, `permission`, `path`, `sequence`, `createdAt`, `updatedAt`) VALUES
('cm1k87mia0000zwq280tct81q', '1', 'Dashboard', 'Dashboard', 'dashboard', '{\"hasRead\":\"Y\",\"hasWrite\":\"N\",\"hasEdit\":\"N\",\"hasDelete\":\"N\"}', '/dashboards/analytics', '1', '2024-09-27 04:31:48.658', '2024-09-27 04:31:48.658'),
('cm1k87xyf0001zwq2w87icyyt', '2', 'User Management', 'Manage Roles', 'manage-roles', '{\"hasRead\":\"Y\",\"hasWrite\":\"Y\",\"hasEdit\":\"Y\",\"hasDelete\":\"Y\"}', '/apps/roles', '2', '2024-09-27 04:32:03.495', '2024-09-27 04:32:03.495'),
('cm1k887xw0002zwq248g0sldj', '3', 'User Management', 'Manage Users', 'manage-users', '{\"hasRead\":\"Y\",\"hasWrite\":\"Y\",\"hasEdit\":\"Y\",\"hasDelete\":\"Y\"}', '/apps/user/list', '3', '2024-09-27 04:32:16.436', '2024-09-27 04:32:16.436'),
('cm1k88lp90003zwq2qb1d7tg3', '4', 'Channel Management', 'Email', 'email', '{\"hasRead\":\"Y\",\"hasWrite\":\"Y\",\"hasEdit\":\"Y\",\"hasDelete\":\"Y\"}', '/apps/email', '4', '2024-09-27 04:32:34.269', '2024-09-27 04:32:34.269'),
('cm1k88w1e0004zwq2z93xahtr', '5', 'Channel Management', 'SMS', 'sms', '{\"hasRead\":\"Y\",\"hasWrite\":\"Y\",\"hasEdit\":\"Y\",\"hasDelete\":\"Y\"}', '/', '5', '2024-09-27 04:32:47.667', '2024-09-27 04:32:47.667'),
('cm1k895d00005zwq26k37joco', '6', 'Channel Management', 'Whatsapp', 'whatsapp', '{\"hasRead\":\"Y\",\"hasWrite\":\"Y\",\"hasEdit\":\"Y\",\"hasDelete\":\"Y\"}', '/apps/chat', '6', '2024-09-27 04:32:59.749', '2024-09-27 04:32:59.749'),
('cm1k89qj00006zwq2djebbxwv', '7', 'Channel Management', 'Voice Call', 'voice-call', '{\"hasRead\":\"Y\",\"hasWrite\":\"Y\",\"hasEdit\":\"Y\",\"hasDelete\":\"Y\"}', '/', '7', '2024-09-27 04:33:27.181', '2024-09-27 04:33:27.181'),
('cm1k8ayze0007zwq2pih4ct32', '8', 'Channel Management', 'Push Notification', 'push-notification', '{\"hasRead\":\"Y\",\"hasWrite\":\"Y\",\"hasEdit\":\"Y\",\"hasDelete\":\"Y\"}', '/', '8', '2024-09-27 04:34:24.795', '2024-09-27 04:34:24.795'),
('cm1k8bh0j0008zwq2gb3h0uqp', '9', 'Content Management', 'Content', 'content', '{\"hasRead\":\"Y\",\"hasWrite\":\"Y\",\"hasEdit\":\"Y\",\"hasDelete\":\"Y\"}', '/', '9', '2024-09-27 04:34:48.163', '2024-09-27 04:34:48.163'),
('cm1k8bqg70009zwq2rnj101tw', '10', 'Content Management', 'Category', 'category', '{\"hasRead\":\"Y\",\"hasWrite\":\"Y\",\"hasEdit\":\"Y\",\"hasDelete\":\"Y\"}', '/', '10', '2024-09-27 04:35:00.392', '2024-09-27 04:35:00.392'),
('cm1k8c0cc000azwq20848tfn2', '11', 'Subscription Management', 'Configure Subscription', 'configure-subscription', '{\"hasRead\":\"Y\",\"hasWrite\":\"Y\",\"hasEdit\":\"Y\",\"hasDelete\":\"Y\"}', '/pages/configure-subscription', '11', '2024-09-27 04:35:13.213', '2024-09-27 04:35:13.213'),
('cm1k8cd9y000bzwq2b4t1lhrs', '12', 'Subscription Management', 'My Subscription', 'my-subscription', '{\"hasRead\":\"Y\",\"hasWrite\":\"Y\",\"hasEdit\":\"Y\",\"hasDelete\":\"Y\"}', '/pages/my-subscription', '12', '2024-09-27 04:35:29.974', '2024-09-27 04:35:29.974'),
('cm1k8coan000czwq22nz18qqk', '13', 'Reports', 'Users', 'users', '{\"hasRead\":\"Y\",\"hasWrite\":\"N\",\"hasEdit\":\"N\",\"hasDelete\":\"N\"}', '/pages/reports/users', '13', '2024-09-27 04:35:44.256', '2024-09-27 04:35:44.256'),
('cm1k8cwl6000dzwq249tj23kb', '14', 'Master Data', 'Location', 'location', '{\"hasRead\":\"Y\",\"hasWrite\":\"N\",\"hasEdit\":\"N\",\"hasDelete\":\"N\"}', '/pages/master-data-settings', '14', '2024-09-27 04:35:55.003', '2024-09-27 04:35:55.003'),
('cm1k8d5lq000ezwq2c46a56zy', '15', 'Settings', 'Account Settings', 'account-settings', '{\"hasRead\":\"Y\",\"hasWrite\":\"Y\",\"hasEdit\":\"Y\",\"hasDelete\":\"Y\"}', '/pages/account-settings', '15', '2024-09-27 04:36:06.686', '2024-09-27 04:36:06.686'),
('cm1k8depu000fzwq29l9zbb77', '16', 'Settings', 'System Settings', 'system-settings', '{\"hasRead\":\"Y\",\"hasWrite\":\"Y\",\"hasEdit\":\"Y\",\"hasDelete\":\"Y\"}', '/pages/system-settings', '16', '2024-09-27 04:36:18.498', '2024-09-27 04:36:18.498'),
('cm1k8dp3e000gzwq2tro5ph6n', '17', 'Settings', 'Website Settings', 'website-settings', '{\"hasRead\":\"Y\",\"hasWrite\":\"Y\",\"hasEdit\":\"Y\",\"hasDelete\":\"N\"}', '/pages/website-settings', '17', '2024-09-27 04:36:31.947', '2024-09-27 04:36:31.947'),
('cm1k8e805000izwq22tsbatq6', '18', 'Settings', 'Bulk Import', 'bulk-import', '{\"hasRead\":\"Y\",\"hasWrite\":\"Y\",\"hasEdit\":\"Y\",\"hasDelete\":\"Y\"}', '/pages/bulk-import', '18', '2024-09-27 04:36:56.453', '2024-09-27 04:36:56.453'),
('cm1k8eiql000jzwq2i6ckf8e4', '19', 'Settings', 'Languages', 'languages', '{\"hasRead\":\"Y\",\"hasWrite\":\"Y\",\"hasEdit\":\"Y\",\"hasDelete\":\"Y\"}', '/pages/language', '19', '2024-09-27 04:37:10.366', '2024-09-27 04:37:10.366'),
('cm1k8exnf000kzwq2hn3pwax0', '20', 'Settings', 'Backup Views', 'backup-views', '{\"hasRead\":\"Y\",\"hasWrite\":\"Y\",\"hasEdit\":\"Y\",\"hasDelete\":\"Y\"}', '/pages/backup-views', '20', '2024-09-27 04:37:29.692', '2024-09-27 04:37:29.692'),
('cm1k8f826000lzwq2h6gqumkw', '21', 'Settings', 'Customer Enquiries', 'customer-enquiries', '{\"hasRead\":\"Y\",\"hasWrite\":\"N\",\"hasEdit\":\"N\",\"hasDelete\":\"N\"}', '/apps/customer-enquiries', '21', '2024-09-27 04:37:43.183', '2024-09-27 04:37:43.183'),
('cm1umjhhg00005m7sph5vh79i', '22', 'Settings', 'Newsletter Subscribers', 'newsletter-subscribers', '{\"hasRead\":\"Y\",\"hasWrite\":\"N\",\"hasEdit\":\"N\",\"hasDelete\":\"N\"}', '/apps/newsletter-subscribers', '22', '2024-10-04 11:10:38.353', '2024-10-04 11:10:38.353');

-- --------------------------------------------------------

--
-- Table structure for table `our_team`
--

CREATE TABLE `our_team` (
  `id` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `updatedUser` varchar(191) DEFAULT NULL,
  `isDeleted` varchar(191) DEFAULT 'N',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `our_team`
--

INSERT INTO `our_team` (`id`, `image`, `title`, `description`, `updatedUser`, `isDeleted`, `createdAt`, `updatedAt`) VALUES
('cm1qfucgv000gdf6deabae5j4', 'http://localhost:3000/landing-page/our-team/1727937434421_company-image.png', 'Paul Miles', 'UI Designer', 'cm1qdx6wo0001df6d78secy8y', 'N', '2024-10-01 12:52:03.103', '2024-10-03 06:37:14.426'),
('cm1qfzskw000hdf6dtb3frpa9', 'http://localhost:3000/landing-page/our-team/1727787377261_company-image.png', 'Sophie Gilbert', 'Project Manager', NULL, 'N', '2024-10-01 12:56:17.265', '2024-10-01 12:56:17.265'),
('cm1qg0h4n000idf6da7lxugua', 'http://localhost:3000/landing-page/our-team/1727787409076_company-image.png', 'Chris Watkin', 'Marketing Manager', 'cm1qdx6wo0001df6d78secy8y', 'N', '2024-10-01 12:56:49.080', '2024-10-01 12:57:20.061'),
('cm1qg0s5q000jdf6dxryhkehf', 'http://localhost:3000/landing-page/our-team/1727787423371_company-image.png', 'Nannie Ford', 'Development Lead', NULL, 'N', '2024-10-01 12:57:03.374', '2024-10-01 12:57:03.374');

-- --------------------------------------------------------

--
-- Table structure for table `package_plans`
--

CREATE TABLE `package_plans` (
  `id` varchar(191) NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `subTitle` varchar(191) DEFAULT NULL,
  `monthlyPrice` varchar(191) DEFAULT NULL,
  `yearlyPlan` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `popularPlan` varchar(191) DEFAULT NULL,
  `planBenefits` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `createdUser` varchar(191) DEFAULT NULL,
  `updatedUser` varchar(191) DEFAULT NULL,
  `isDeleted` varchar(191) DEFAULT 'N',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_plans`
--

INSERT INTO `package_plans` (`id`, `title`, `subTitle`, `monthlyPrice`, `yearlyPlan`, `popularPlan`, `planBenefits`, `image`, `createdUser`, `updatedUser`, `isDeleted`, `createdAt`, `updatedAt`) VALUES
('cm1qh09yi000a123qz5ky3h2u', 'Basic', 'Basic plan', '40', '{\"monthly\":\"30.00\",\"annually\":\"360.00\"}', NULL, '[{\"feature\":\"Timeline\"},{\"feature\":\"Basic search\"}]', 'http://localhost:3000/landing-page/pricing-images/1727789118905_company-image.png', 'cm1qdx6wo0001df6d78secy8y', 'cm1qdx6wo0001df6d78secy8y', 'N', '2024-10-01 13:24:39.403', '2024-10-01 13:25:18.913'),
('cm1qh1pzl000b123qv89fd610', 'Team', 'Team Plan', '100', '{\"monthly\":\"75.00\",\"annually\":\"900.00\"}', NULL, '[{\"feature\":\"Live chat widget\"},{\"feature\":\"Email marketing\"}]', 'http://localhost:3000/landing-page/pricing-images/1727937579129_company-image.png', 'cm1qdx6wo0001df6d78secy8y', 'cm1qdx6wo0001df6d78secy8y', 'N', '2024-10-01 13:25:46.833', '2024-10-03 06:39:39.134'),
('cm1qh2xdr000c123qjl4q648f', 'Advance', 'Advance Paln', '120', '{\"monthly\":\"90.00\",\"annually\":\"1080.00\"}', NULL, '[{\"feature\":\"Custom Forms\"},{\"feature\":\"Traffic analytics\"},{\"feature\":\"Basic Support\"}]', 'http://localhost:3000/landing-page/pricing-images/1727937550772_company-image.png', 'cm1qdx6wo0001df6d78secy8y', 'cm1qdx6wo0001df6d78secy8y', 'N', '2024-10-01 13:26:43.071', '2024-10-03 06:39:10.776');

-- --------------------------------------------------------

--
-- Table structure for table `questionanswer`
--

CREATE TABLE `questionanswer` (
  `id` varchar(191) NOT NULL,
  `question` varchar(191) DEFAULT NULL,
  `answer` varchar(191) DEFAULT NULL,
  `isDeleted` varchar(191) DEFAULT 'N',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questionanswer`
--

INSERT INTO `questionanswer` (`id`, `question`, `answer`, `isDeleted`, `createdAt`, `updatedAt`) VALUES
('cm1qgmddw0004123qxsdtj88k', 'How to logged in?', 'Here you go, get some', 'N', '2024-10-01 13:13:50.660', '2024-10-01 13:15:00.096'),
('cm1qgmovx0005123qmt8g656b', 'How to register?', 'Kindly visit our website', 'N', '2024-10-01 13:14:05.566', '2024-10-01 13:14:05.566'),
('cm1qgnbmv0006123qzuctxpup', 'What is Regular License?', 'ok lets see', 'N', '2024-10-01 13:14:35.047', '2024-10-01 13:14:35.047');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` varchar(191) NOT NULL,
  `userId` varchar(191) NOT NULL,
  `roleName` varchar(191) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `isDeleted` varchar(191) DEFAULT 'N',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `userId`, `roleName`, `permissions`, `isDeleted`, `createdAt`, `updatedAt`) VALUES
('cm1qhb60m000d123qi6c7gve1', 'cm1qdx6wo0001df6d78secy8y', 'Manager', '{\"hasRead\":[\"1\",\"2\",\"3\"],\"hasWrite\":[\"2\",\"3\"],\"hasEdit\":[\"2\",\"3\"],\"hasDelete\":[]}', 'N', '2024-10-01 13:33:07.509', '2024-10-04 07:25:11.421');

-- --------------------------------------------------------

--
-- Table structure for table `section_content`
--

CREATE TABLE `section_content` (
  `id` int(11) NOT NULL,
  `sectionType` varchar(191) DEFAULT NULL,
  `badgeTitle` varchar(191) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `image1` varchar(191) DEFAULT NULL,
  `image2` varchar(191) DEFAULT NULL,
  `isfrontendvisible` varchar(191) DEFAULT 'Y',
  `createdUser` varchar(191) DEFAULT NULL,
  `updatedUser` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `discount` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section_content`
--

INSERT INTO `section_content` (`id`, `sectionType`, `badgeTitle`, `title`, `description`, `image1`, `image2`, `isfrontendvisible`, `createdUser`, `updatedUser`, `createdAt`, `updatedAt`, `discount`) VALUES
(1, 'banner_section', 'Get Early Access', 'One dashboard to manage all your businesses', 'Production-ready & easy to use Admin Template for Reliability and Customizability', 'http://localhost:3000/landing-page/banner-images/1728032767966_dashboard-image-light.png', 'http://localhost:3000/landing-page/banner-images/1728032767967_dashboard-image-dark.png', 'Y', 'cm1qdx6wo0001df6d78secy8y', 'cm1qdx6wo0001df6d78secy8y', '2024-10-01 12:03:23.801', '2024-10-04 09:06:07.973', NULL),
(2, 'feature', 'Useful Features', 'Everything you need laptop chargingto start your next project', 'Not just a set of tools the package includes ready-to-deploy conceptual application', NULL, NULL, 'Y', 'cm1qdx6wo0001df6d78secy8y', 'cm1qdx6wo0001df6d78secy8y', '2024-10-01 12:05:36.793', '2024-10-04 08:19:28.522', NULL),
(3, 'testimonial', 'Real Customers Reviews', 'What people say', 'See what our customers have to say about their experience. This template is really clean and well documented. The docs are really easy to understand and its always easy to find a screenshot from their website ', NULL, NULL, 'Y', 'cm1qdx6wo0001df6d78secy8y', 'cm1qdx6wo0001df6d78secy8y', '2024-10-01 12:23:59.949', '2024-10-04 09:53:44.824', NULL),
(6, 'brand', NULL, NULL, NULL, NULL, NULL, 'Y', 'cm1qdx6wo0001df6d78secy8y', 'cm1qdx6wo0001df6d78secy8y', '2024-10-01 12:45:07.589', '2024-10-04 10:58:42.959', NULL),
(7, 'our_team', 'Our Great Team', 'Supported laptop chargingby Real People', 'Who is behind these great-looking interfaces?', NULL, NULL, 'Y', 'cm1qdx6wo0001df6d78secy8y', 'cm1qdx6wo0001df6d78secy8y', '2024-10-01 12:48:59.870', '2024-10-04 09:00:06.159', NULL),
(8, 'key_achievements', NULL, NULL, NULL, NULL, NULL, 'Y', 'cm1qdx6wo0001df6d78secy8y', 'cm1qdx6wo0001df6d78secy8y', '2024-10-01 13:06:06.977', '2024-10-04 08:57:43.543', NULL),
(9, 'faq', 'FAQ', 'Frequently asked questionslaptop charging', 'Browse through these FAQs to find answers to commonly asked questions', NULL, NULL, 'N', 'cm1qdx6wo0001df6d78secy8y', 'cm1qdx6wo0001df6d78secy8y', '2024-10-01 13:09:39.215', '2024-10-04 08:57:57.101', NULL),
(10, 'plans', 'Pricing Plans', 'Tailored pricing plans designed for you', 'All plans include 40+ advanced tools and features to boost your product. Choose the best plan to fit your needs.', NULL, NULL, 'Y', 'cm1qdx6wo0001df6d78secy8y', 'cm1qdx6wo0001df6d78secy8y', '2024-10-04 08:43:22.570', '2024-10-04 08:55:15.607', '25');

-- --------------------------------------------------------

--
-- Table structure for table `sent_emails`
--

CREATE TABLE `sent_emails` (
  `id` int(11) NOT NULL,
  `from` varchar(191) DEFAULT NULL,
  `to` longtext DEFAULT NULL,
  `subject` longtext DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `sentBy` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `sendMailTo` varchar(191) DEFAULT NULL,
  `templateCategory` varchar(191) DEFAULT NULL,
  `templateId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` varchar(191) NOT NULL,
  `sessionToken` varchar(191) NOT NULL,
  `userId` varchar(191) NOT NULL,
  `expires` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `countryId` int(11) NOT NULL,
  `country` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `createdAt`, `updatedAt`) VALUES
('cm1ui5ram0001rr2tye9adaqu', 'sample@g.com', '2024-10-04 09:07:59.470', '2024-10-04 09:07:59.470'),
('cm1uivuot0002rr2txoxc81km', 'abc@g.com', '2024-10-04 09:28:16.926', '2024-10-04 09:28:16.926'),
('cm1uiz3ax0003rr2tfna5ey1j', 'abcd@g.com', '2024-10-04 09:30:48.057', '2024-10-04 09:30:48.057'),
('cm1uizd3w0004rr2tltiet3yc', 'superadmin@gmail.com', '2024-10-04 09:31:00.765', '2024-10-04 09:31:00.765');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` varchar(191) NOT NULL,
  `systemName` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `systemImage` varchar(191) DEFAULT NULL,
  `navbarImage` varchar(191) DEFAULT NULL,
  `metaTitle` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `contactNo` varchar(191) DEFAULT NULL,
  `updatedUser` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `systemName`, `description`, `systemImage`, `navbarImage`, `metaTitle`, `email`, `contactNo`, `updatedUser`, `createdAt`, `updatedAt`) VALUES
('cm1qgwckn0008123q746a5c3m', 'Savemom', 'Lets see our website', 'http://localhost:3000/system-images/1727788896164_system-logo.png', 'http://localhost:3000/system-images/1727788896166_navbar-logo.png', 'Savemom', 'example@gmail.com', '9878587496', NULL, '2024-10-01 13:21:36.168', '2024-10-01 13:21:36.168');

-- --------------------------------------------------------

--
-- Table structure for table `testimonial_reviews`
--

CREATE TABLE `testimonial_reviews` (
  `id` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `rating` varchar(191) DEFAULT NULL,
  `postedBy` varchar(191) DEFAULT NULL,
  `designation` varchar(191) DEFAULT NULL,
  `isDeleted` varchar(191) DEFAULT 'N',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonial_reviews`
--

INSERT INTO `testimonial_reviews` (`id`, `image`, `description`, `rating`, `postedBy`, `designation`, `isDeleted`, `createdAt`, `updatedAt`) VALUES
('cm1qf5cr40008df6dh5gyd1v8', 'http://localhost:3000/landing-page/testimonial-images/1727785957068_company-image.png', 'See what our customers have to say about their experience.\r\nThis template is really clean & well documented. The docs are really easy to understand and its always easy to find a screenshot from their .', '4', 'Super Admin', 'Full Stack Developer', 'N', '2024-10-01 12:32:37.072', '2024-10-01 12:35:39.220'),
('cm1qf62lx0009df6dyqt8kd3z', 'http://localhost:3000/landing-page/testimonial-images/1727937348231_company-image.png', 'However customers have to say about their experience.\r\nThis template is really clean & well documented. The docs are really easy to understand and its always easy to find a screenshot from their website.', '5', 'Super Admin', 'Lead Manager', 'N', '2024-10-01 12:33:10.582', '2024-10-03 06:35:48.235'),
('cm1qf7j8o000adf6duwmz11v5', 'http://localhost:3000/landing-page/testimonial-images/1727937365523_company-image.png', 'Here we have to say about their experience.\r\nThis template is really clean & well documented. The docs are really easy to understand and its always easy to find a screenshot from their website.', '4', 'Super Admin', 'Digital Editor', 'N', '2024-10-01 12:34:18.793', '2024-10-03 06:36:05.527');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `contactNo` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `zipCode` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `language` varchar(191) DEFAULT NULL,
  `companyName` varchar(191) DEFAULT NULL,
  `roleId` varchar(191) DEFAULT '3',
  `roleName` varchar(191) DEFAULT 'customer',
  `profileStatus` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `isDeleted` varchar(191) DEFAULT 'N',
  `createdBy` varchar(191) DEFAULT NULL,
  `subscriptionPlan` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `contactNo`, `address`, `state`, `zipCode`, `country`, `language`, `companyName`, `roleId`, `roleName`, `profileStatus`, `image`, `isDeleted`, `createdBy`, `subscriptionPlan`, `createdAt`, `updatedAt`) VALUES
('cm1qdx6wo0001df6d78secy8y', 'Super Admin', 'superadmin@gmail.com', '$2b$10$oM6DSgMbzlaEJ0bq4lr1COrYFJ7KpnuEzrB8p0kCaTubBG7UndTZW', '', '', '', '', '', NULL, '', '1', 'super admin', 'Active', 'http://localhost:3000/uploads/1727789969182_image.png', 'N', 'cm1qdx6wo0001df6d78secy8y', NULL, '2024-10-01 11:58:16.633', '2024-10-01 13:39:29.186'),
('cm1qhcr4z000e123qm8lpaoix', 'Arun Kumar', 'arunkumarvk.saitech@gmail.com', '$2b$10$vm5qJNVkXzMGbaHfCLGnW.5Lk5X0tLldcirrEXjXczVZuUC0dXwhu', '9685858596', NULL, NULL, NULL, 'India', NULL, '', 'cm1qhb60m000d123qi6c7gve1', 'Manager', 'Active', NULL, 'N', 'cm1qdx6wo0001df6d78secy8y', NULL, '2024-10-01 13:34:21.539', '2024-10-01 13:34:48.796'),
('cm1u9gzsy0000bay2itigduo5', 'Ashok', 'muthamil.saitech@gmail.com', '$2b$10$qafb36NqzdOfou9usDZNN.eymhb2Rhd079eAYxey39Nh.8TTWpVEu', '9876543210', NULL, NULL, NULL, 'India', NULL, 'Saitechnologies', 'cm1qhb60m000d123qi6c7gve1', 'manager', 'active', NULL, 'N', 'cm1qdx6wo0001df6d78secy8y', NULL, '2024-10-04 05:04:47.166', '2024-10-04 05:04:47.166');

-- --------------------------------------------------------

--
-- Table structure for table `verification_token`
--

CREATE TABLE `verification_token` (
  `identifier` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `expires` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('433919d9-d92c-48bc-ab4b-f7168ae1dbf5', '0407b836543d669b37cbca99d4e7a6c4db5b34248209004ded2db490774e0510', '2024-10-04 08:38:48.691', '20241004083848_update_model', NULL, NULL, '2024-10-04 08:38:48.676', 1),
('5fbb3aee-d62b-4140-bd4d-02d6b6702ae6', '331e674fd01b61da661efe455c70a9f62d7084bfeeadb95f9bf22742b1afca17', '2024-10-03 07:34:45.440', '20241003073445_update_model', NULL, NULL, '2024-10-03 07:34:45.428', 1),
('8807b839-8b61-431f-a77a-67064fb28470', 'bf7ae843afdd015252beeb3c3c30989b69647740d7b0b98a7f22f0b8191cc4cb', '2024-10-01 11:51:07.521', '20241001042104_update_model', NULL, NULL, '2024-10-01 11:51:06.506', 1),
('8b0d8f3f-c290-4677-bdb3-4c42ea26ec9c', 'aab5d3ff130838b83770af760d675c40669404cd4c0697cd7865a30270eaf867', '2024-10-04 07:42:06.910', '20241004074206_update_model', NULL, NULL, '2024-10-04 07:42:06.902', 1),
('ae6c3d11-d27b-49db-8420-240cab43aa16', 'a8d48354cc02fd553b22e95a6277ecc8bd8729018c254d6d65fbdd5fd3dacab7', '2024-10-03 10:59:52.733', '20241003105952_update_model', NULL, NULL, '2024-10-03 10:59:52.721', 1),
('bbcf9a72-d2f8-477d-b2b0-f3d69aa2029d', '2d75ff7a00696d09d5c0c656e2471167bec0ef869ad470dbc6100927ecce78d8', '2024-10-03 11:21:29.424', '20241003112129_update_model', NULL, NULL, '2024-10-03 11:21:29.388', 1),
('c31f0e31-4f9d-4165-8c44-073ccaee8ea1', '9e96cd2b5d7c0151e3785b0fec9fb5805deaee70a89846486cadee9b0f167d68', '2024-10-01 11:51:07.574', '20241001113023_update_model', NULL, NULL, '2024-10-01 11:51:07.525', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Account_provider_providerAccountId_key` (`provider`,`providerAccountId`),
  ADD KEY `Account_userId_fkey` (`userId`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configure_subscription`
--
ALTER TABLE `configure_subscription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_enquiries`
--
ALTER TABLE `customer_enquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_setting`
--
ALTER TABLE `email_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `key_achievements`
--
ALTER TABLE `key_achievements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `our_team`
--
ALTER TABLE `our_team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_plans`
--
ALTER TABLE `package_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questionanswer`
--
ALTER TABLE `questionanswer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section_content`
--
ALTER TABLE `section_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_emails`
--
ALTER TABLE `sent_emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Session_sessionToken_key` (`sessionToken`),
  ADD KEY `Session_userId_fkey` (`userId`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonial_reviews`
--
ALTER TABLE `testimonial_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verification_token`
--
ALTER TABLE `verification_token`
  ADD UNIQUE KEY `VerificationToken_token_key` (`token`),
  ADD UNIQUE KEY `VerificationToken_identifier_token_key` (`identifier`,`token`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_setting`
--
ALTER TABLE `email_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `section_content`
--
ALTER TABLE `section_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sent_emails`
--
ALTER TABLE `sent_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `Account_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `Session_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
