-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: localhost    Database: clan
-- ------------------------------------------------------
-- Server version	5.7.32-0ubuntu0.18.04.1

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
-- Current Database: `clan`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `clan` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `clan`;

--
-- Table structure for table `class_info`
--

DROP TABLE IF EXISTS `class_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_info` (
  `c_id` varchar(10) NOT NULL,
  `c_name` varchar(20) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_info`
--

LOCK TABLES `class_info` WRITE;
/*!40000 ALTER TABLE `class_info` DISABLE KEYS */;
INSERT INTO `class_info` VALUES ('1801','软件工程1801班'),('1802','软件工程1802班'),('1803','软件工程1803班'),('1804','软件工程1804班'),('1805','软件工程1805班'),('1806','软件工程1806班'),('1807','软件工程1807班'),('1808','软件工程1808班'),('1809','软件工程1809班');
/*!40000 ALTER TABLE `class_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kecheng_info`
--

DROP TABLE IF EXISTS `kecheng_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kecheng_info` (
  `k_id` varchar(10) NOT NULL DEFAULT '000',
  `k_name` varchar(20) NOT NULL,
  `k_keshi` int(11) NOT NULL,
  `k_kind` varchar(20) NOT NULL,
  PRIMARY KEY (`k_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kecheng_info`
--

LOCK TABLES `kecheng_info` WRITE;
/*!40000 ALTER TABLE `kecheng_info` DISABLE KEYS */;
INSERT INTO `kecheng_info` VALUES ('000','None',0,'0'),('001','C语言',48,'公共基础课'),('002','高等数学',96,'公共基础课'),('003','软件测试',48,'专业课'),('004','Java高级编程',24,'企业'),('005','mysql数据库设计',32,'企业'),('114514','浩二',114514,'臭');
/*!40000 ALTER TABLE `kecheng_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_info`
--

DROP TABLE IF EXISTS `score_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score_info` (
  `sc_sid` varchar(10) NOT NULL,
  `sc_kid` varchar(10) NOT NULL,
  `sc_score` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`sc_sid`,`sc_kid`),
  KEY `sc_kid` (`sc_kid`),
  CONSTRAINT `score_info_ibfk_1` FOREIGN KEY (`sc_sid`) REFERENCES `student_info` (`s_id`),
  CONSTRAINT `score_info_ibfk_2` FOREIGN KEY (`sc_kid`) REFERENCES `kecheng_info` (`k_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_info`
--

LOCK TABLES `score_info` WRITE;
/*!40000 ALTER TABLE `score_info` DISABLE KEYS */;
INSERT INTO `score_info` VALUES ('181203817','001',100.00),('181203817','002',2.00);
/*!40000 ALTER TABLE `score_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_info`
--

DROP TABLE IF EXISTS `student_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_info` (
  `s_id` varchar(10) NOT NULL,
  `s_name` varchar(20) NOT NULL,
  `s_psword` char(32) NOT NULL,
  `s_cid` varchar(10) NOT NULL,
  `s_kid` varchar(10) NOT NULL DEFAULT '000',
  PRIMARY KEY (`s_id`),
  KEY `s_cid` (`s_cid`),
  KEY `s_kid` (`s_kid`),
  CONSTRAINT `student_info_ibfk_1` FOREIGN KEY (`s_cid`) REFERENCES `class_info` (`c_id`),
  CONSTRAINT `student_info_ibfk_2` FOREIGN KEY (`s_kid`) REFERENCES `kecheng_info` (`k_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_info`
--

LOCK TABLES `student_info` WRITE;
/*!40000 ALTER TABLE `student_info` DISABLE KEYS */;
INSERT INTO `student_info` VALUES ('123123123','法外狂徒','e807f1fcf82d132f9bb018ca6738a19f','1809','004'),('181203423','崔劲','2fb259388d85b83cde457109d963fc96','1804','000'),('181203800','张隽铭','25d55ad283aa400af464c76d713c07ad','1808','001'),('181203801','张隽铭','25d55ad283aa400af464c76d713c07ad','1808','002'),('181203808','常连峻','0928e4e050f8f0477d8ca6da762cabea','1808','003'),('181203817','赵祎泽','1f462a90356707c6164e0f351c8c1604','1808','001'),('181203818','许绍辉','e10adc3949ba59abbe56e057f20f883e','1808','004');
/*!40000 ALTER TABLE `student_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_info`
--

DROP TABLE IF EXISTS `teacher_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_info` (
  `t_id` varchar(10) NOT NULL,
  `t_name` varchar(20) NOT NULL,
  `t_psword` char(32) NOT NULL,
  `t_birth` date NOT NULL,
  `t_call` varchar(20) NOT NULL,
  `t_kid` varchar(10) NOT NULL,
  PRIMARY KEY (`t_id`),
  KEY `t_kid` (`t_kid`),
  CONSTRAINT `teacher_info_ibfk_1` FOREIGN KEY (`t_kid`) REFERENCES `kecheng_info` (`k_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_info`
--

LOCK TABLES `teacher_info` WRITE;
/*!40000 ALTER TABLE `teacher_info` DISABLE KEYS */;
INSERT INTO `teacher_info` VALUES ('sut001','张三','25d55ad283aa400af464c76d713c07ad','1979-03-04','讲师','003'),('sut002','李四','25d55ad283aa400af464c76d713c07ad','1982-04-06','讲师','001'),('sut003','王五','25d55ad283aa400af464c76d713c07ad','1979-03-06','教授','003');
/*!40000 ALTER TABLE `teacher_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-31 11:46:06
