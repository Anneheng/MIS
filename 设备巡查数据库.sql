CREATE DATABASE  IF NOT EXISTS `database` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `database`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: database
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `baoyang`
--

DROP TABLE IF EXISTS `baoyang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baoyang` (
  `BID` int(11) NOT NULL,
  `EID` int(11) NOT NULL,
  `xmID` int(11) NOT NULL,
  `QK` varchar(100) NOT NULL DEFAULT '完成情况',
  `BZ` varchar(200) DEFAULT '备注',
  `Woker` varchar(100) NOT NULL DEFAULT '保养人',
  `time` date DEFAULT NULL,
  PRIMARY KEY (`BID`),
  KEY `E_idx` (`EID`),
  KEY `v_idx` (`Woker`),
  KEY `X_idx` (`xmID`),
  CONSTRAINT `E` FOREIGN KEY (`EID`) REFERENCES `equipment` (`EID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `v` FOREIGN KEY (`Woker`) REFERENCES `worker` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baoyang`
--

LOCK TABLES `baoyang` WRITE;
/*!40000 ALTER TABLE `baoyang` DISABLE KEYS */;
INSERT INTO `baoyang` VALUES (1,1,1,'完成','','小明','2015-11-13'),(2,1,2,'完成','已清洁','小明','2015-12-13'),(3,1,3,'完成','完成','小明','2015-12-13');
/*!40000 ALTER TABLE `baoyang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `CID` int(11) NOT NULL,
  `category` varchar(100) NOT NULL DEFAULT '设备类别',
  `period` int(11) NOT NULL,
  `TQQ` int(11) DEFAULT NULL,
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'6000V及以上电机',365,30),(2,'6000V以下不带振动电机',365,30),(3,'6000V以下带振动电机',182,15),(4,'CST',30,7),(5,'PLC',30,7),(6,'比重计、液位仪',30,7),(7,'变频器（100KW以上皮带、泵电机驱动的）',60,10),(8,'仓位传感器',30,7),(9,'除铁器',30,7),(10,'采样机',30,7),(11,'防冻设施',7,1),(12,'装车站防冻液喷洒系统',7,1),(13,'浓缩机',182,30),(14,'皮带秤',30,7),(15,'皮带运输机',365,30),(16,'球磨机',365,30),(17,'上位机',30,7),(18,'箱变',182,15),(19,'角执行机构、直执行机构',30,7),(20,'装车定量秤',7,1),(21,'装车站卸料闸板',7,1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date`
--

DROP TABLE IF EXISTS `date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date` (
  `EID` int(11) NOT NULL,
  `BDate` date DEFAULT NULL,
  PRIMARY KEY (`EID`),
  CONSTRAINT `x` FOREIGN KEY (`EID`) REFERENCES `equipment` (`EID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date`
--

LOCK TABLES `date` WRITE;
/*!40000 ALTER TABLE `date` DISABLE KEYS */;
INSERT INTO `date` VALUES (1,'2015-11-13');
/*!40000 ALTER TABLE `date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment` (
  `EID` int(11) NOT NULL,
  `CID` int(11) NOT NULL,
  PRIMARY KEY (`EID`),
  KEY `a_idx` (`CID`),
  CONSTRAINT `m` FOREIGN KEY (`CID`) REFERENCES `category` (`CID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,1),(2,1),(3,2),(4,2);
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expend`
--

DROP TABLE IF EXISTS `expend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expend` (
  `ID` int(11) NOT NULL,
  `BID` int(11) NOT NULL,
  `EID` int(11) NOT NULL,
  `Material` varchar(100) NOT NULL,
  `Num` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `s_idx` (`EID`),
  KEY `A_idx` (`BID`),
  CONSTRAINT `a` FOREIGN KEY (`BID`) REFERENCES `baoyang` (`BID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `s` FOREIGN KEY (`EID`) REFERENCES `equipment` (`EID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expend`
--

LOCK TABLES `expend` WRITE;
/*!40000 ALTER TABLE `expend` DISABLE KEYS */;
INSERT INTO `expend` VALUES (1,1,1,'瓷瓶',1),(2,3,1,'线圈',2);
/*!40000 ALTER TABLE `expend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker` (
  `name` varchar(100) NOT NULL,
  `BZ` varchar(100) NOT NULL DEFAULT '班组',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES ('小明','一组'),('小红','二组');
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xm`
--

DROP TABLE IF EXISTS `xm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xm` (
  `id` int(11) NOT NULL,
  `CID` int(11) NOT NULL,
  `xmName` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `q_idx` (`CID`),
  CONSTRAINT `q` FOREIGN KEY (`CID`) REFERENCES `category` (`CID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xm`
--

LOCK TABLES `xm` WRITE;
/*!40000 ALTER TABLE `xm` DISABLE KEYS */;
INSERT INTO `xm` VALUES (1,1,'检查6000V接线盒内瓷瓶、端子'),(2,1,'接线盒内卫生清洁'),(3,1,'检查电缆引线、穿线管、接地线');
/*!40000 ALTER TABLE `xm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'database'
--

--
-- Dumping routines for database 'database'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-13 12:06:02
