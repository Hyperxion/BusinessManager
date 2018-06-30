-- MySQL dump 10.16  Distrib 10.2.14-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: edemko
-- ------------------------------------------------------
-- Server version	10.2.14-MariaDB

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
-- Table structure for table `Companies`
--

DROP TABLE IF EXISTS `Companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Companies` (
  `CompanyID` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(150) NOT NULL,
  PRIMARY KEY (`CompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Companies`
--

LOCK TABLES `Companies` WRITE;
/*!40000 ALTER TABLE `Companies` DISABLE KEYS */;
INSERT INTO `Companies` VALUES (1,'None'),(2,'T-Systems Slovakia s. r. o. Kosice');
/*!40000 ALTER TABLE `Companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Costs`
--

DROP TABLE IF EXISTS `Costs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Costs` (
  `CostID` int(11) NOT NULL AUTO_INCREMENT,
  `CostName` varchar(100) NOT NULL,
  `CostQuantity` int(11) DEFAULT 1,
  `CostShipping` float(5,2) NOT NULL,
  `PurchaseDate` date DEFAULT NULL,
  `Comment` varchar(256) NOT NULL,
  `CostPrice` float(5,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`CostID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Costs`
--

LOCK TABLES `Costs` WRITE;
/*!40000 ALTER TABLE `Costs` DISABLE KEYS */;
INSERT INTO `Costs` VALUES (1,'E3D Nozzle 0.25mm',1,1.30,'2017-07-13','www.vsepro3dtisk.cz',0.00),(2,'E3D Nozzle 0.15mm',1,1.30,'2017-07-13','www.vsepro3dtisk.cz',0.00),(3,'E3D Nozzle 0.6mm',1,1.30,'2017-07-13','www.vsepro3dtisk.cz',0.00),(4,'Igus DryLin LM8UU Bearings',12,0.00,'2017-07-31','www.ebay.com ',20.09);
/*!40000 ALTER TABLE `Costs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Countries`
--

DROP TABLE IF EXISTS `Countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Countries` (
  `CountryId` int(11) NOT NULL AUTO_INCREMENT,
  `CountryCode` varchar(2) NOT NULL DEFAULT '',
  `CountryName` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`CountryId`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Countries`
--

LOCK TABLES `Countries` WRITE;
/*!40000 ALTER TABLE `Countries` DISABLE KEYS */;
INSERT INTO `Countries` VALUES (1,'AF','Afghanistan'),(2,'AL','Albania'),(3,'DZ','Algeria'),(4,'DS','American Samoa'),(5,'AD','Andorra'),(6,'AO','Angola'),(7,'AI','Anguilla'),(8,'AQ','Antarctica'),(9,'AG','Antigua and Barbuda'),(10,'AR','Argentina'),(11,'AM','Armenia'),(12,'AW','Aruba'),(13,'AU','Australia'),(14,'AT','Austria'),(15,'AZ','Azerbaijan'),(16,'BS','Bahamas'),(17,'BH','Bahrain'),(18,'BD','Bangladesh'),(19,'BB','Barbados'),(20,'BY','Belarus'),(21,'BE','Belgium'),(22,'BZ','Belize'),(23,'BJ','Benin'),(24,'BM','Bermuda'),(25,'BT','Bhutan'),(26,'BO','Bolivia'),(27,'BA','Bosnia and Herzegovina'),(28,'BW','Botswana'),(29,'BV','Bouvet Island'),(30,'BR','Brazil'),(31,'IO','British Indian Ocean Territory'),(32,'BN','Brunei Darussalam'),(33,'BG','Bulgaria'),(34,'BF','Burkina Faso'),(35,'BI','Burundi'),(36,'KH','Cambodia'),(37,'CM','Cameroon'),(38,'CA','Canada'),(39,'CV','Cape Verde'),(40,'KY','Cayman Islands'),(41,'CF','Central African Republic'),(42,'TD','Chad'),(43,'CL','Chile'),(44,'CN','China'),(45,'CX','Christmas Island'),(46,'CC','Cocos (Keeling), Islands'),(47,'CO','Colombia'),(48,'KM','Comoros'),(49,'CG','Congo'),(50,'CK','Cook Islands'),(51,'CR','Costa Rica'),(52,'HR','Croatia (Hrvatska),'),(53,'CU','Cuba'),(54,'CY','Cyprus'),(55,'CZ','Czech Republic'),(56,'DK','Denmark'),(57,'DJ','Djibouti'),(58,'DM','Dominica'),(59,'DO','Dominican Republic'),(60,'TP','East Timor'),(61,'EC','Ecuador'),(62,'EG','Egypt'),(63,'SV','El Salvador'),(64,'GQ','Equatorial Guinea'),(65,'ER','Eritrea'),(66,'EE','Estonia'),(67,'ET','Ethiopia'),(68,'FK','Falkland Islands (Malvinas),'),(69,'FO','Faroe Islands'),(70,'FJ','Fiji'),(71,'FI','Finland'),(72,'FR','France'),(73,'FX','France, Metropolitan'),(74,'GF','French Guiana'),(75,'PF','French Polynesia'),(76,'TF','French Southern Territories'),(77,'GA','Gabon'),(78,'GM','Gambia'),(79,'GE','Georgia'),(80,'DE','Germany'),(81,'GH','Ghana'),(82,'GI','Gibraltar'),(83,'GK','Guernsey'),(84,'GR','Greece'),(85,'GL','Greenland'),(86,'GD','Grenada'),(87,'GP','Guadeloupe'),(88,'GU','Guam'),(89,'GT','Guatemala'),(90,'GN','Guinea'),(91,'GW','Guinea-Bissau'),(92,'GY','Guyana'),(93,'HT','Haiti'),(94,'HM','Heard and Mc Donald Islands'),(95,'HN','Honduras'),(96,'HK','Hong Kong'),(97,'HU','Hungary'),(98,'IS','Iceland'),(99,'IN','India'),(100,'IM','Isle of Man'),(101,'ID','Indonesia'),(102,'IR','Iran (Islamic Republic of),'),(103,'IQ','Iraq'),(104,'IE','Ireland'),(105,'IL','Israel'),(106,'IT','Italy'),(107,'CI','Ivory Coast'),(108,'JE','Jersey'),(109,'JM','Jamaica'),(110,'JP','Japan'),(111,'JO','Jordan'),(112,'KZ','Kazakhstan'),(113,'KE','Kenya'),(114,'KI','Kiribati'),(115,'KP','Korea, Democratic People\'s Republic of'),(116,'KR','Korea, Republic of'),(117,'XK','Kosovo'),(118,'KW','Kuwait'),(119,'KG','Kyrgyzstan'),(120,'LA','Lao People\'s Democratic Republic'),(121,'LV','Latvia'),(122,'LB','Lebanon'),(123,'LS','Lesotho'),(124,'LR','Liberia'),(125,'LY','Libyan Arab Jamahiriya'),(126,'LI','Liechtenstein'),(127,'LT','Lithuania'),(128,'LU','Luxembourg'),(129,'MO','Macau'),(130,'MK','Macedonia'),(131,'MG','Madagascar'),(132,'MW','Malawi'),(133,'MY','Malaysia'),(134,'MV','Maldives'),(135,'ML','Mali'),(136,'MT','Malta'),(137,'MH','Marshall Islands'),(138,'MQ','Martinique'),(139,'MR','Mauritania'),(140,'MU','Mauritius'),(141,'TY','Mayotte'),(142,'MX','Mexico'),(143,'FM','Micronesia, Federated States of'),(144,'MD','Moldova, Republic of'),(145,'MC','Monaco'),(146,'MN','Mongolia'),(147,'ME','Montenegro'),(148,'MS','Montserrat'),(149,'MA','Morocco'),(150,'MZ','Mozambique'),(151,'MM','Myanmar'),(152,'NA','Namibia'),(153,'NR','Nauru'),(154,'NP','Nepal'),(155,'NL','Netherlands'),(156,'AN','Netherlands Antilles'),(157,'NC','New Caledonia'),(158,'NZ','New Zealand'),(159,'NI','Nicaragua'),(160,'NE','Niger'),(161,'NG','Nigeria'),(162,'NU','Niue'),(163,'NF','Norfolk Island'),(164,'MP','Northern Mariana Islands'),(165,'NO','Norway'),(166,'OM','Oman'),(167,'PK','Pakistan'),(168,'PW','Palau'),(169,'PS','Palestine'),(170,'PA','Panama'),(171,'PG','Papua New Guinea'),(172,'PY','Paraguay'),(173,'PE','Peru'),(174,'PH','Philippines'),(175,'PN','Pitcairn'),(176,'PL','Poland'),(177,'PT','Portugal'),(178,'PR','Puerto Rico'),(179,'QA','Qatar'),(180,'RE','Reunion'),(181,'RO','Romania'),(182,'RU','Russian Federation'),(183,'RW','Rwanda'),(184,'KN','Saint Kitts and Nevis'),(185,'LC','Saint Lucia'),(186,'VC','Saint Vincent and the Grenadines'),(187,'WS','Samoa'),(188,'SM','San Marino'),(189,'ST','Sao Tome and Principe'),(190,'SA','Saudi Arabia'),(191,'SN','Senegal'),(192,'RS','Serbia'),(193,'SC','Seychelles'),(194,'SL','Sierra Leone'),(195,'SG','Singapore'),(196,'SK','Slovakia'),(197,'SI','Slovenia'),(198,'SB','Solomon Islands'),(199,'SO','Somalia'),(200,'ZA','South Africa'),(201,'GS','South Georgia South Sandwich Islands'),(202,'ES','Spain'),(203,'LK','Sri Lanka'),(204,'SH','St. Helena'),(205,'PM','St. Pierre and Miquelon'),(206,'SD','Sudan'),(207,'SR','Suriname'),(208,'SJ','Svalbard and Jan Mayen Islands'),(209,'SZ','Swaziland'),(210,'SE','Sweden'),(211,'CH','Switzerland'),(212,'SY','Syrian Arab Republic'),(213,'TW','Taiwan'),(214,'TJ','Tajikistan'),(215,'TZ','Tanzania, United Republic of'),(216,'TH','Thailand'),(217,'TG','Togo'),(218,'TK','Tokelau'),(219,'TO','Tonga'),(220,'TT','Trinidad and Tobago'),(221,'TN','Tunisia'),(222,'TR','Turkey'),(223,'TM','Turkmenistan'),(224,'TC','Turks and Caicos Islands'),(225,'TV','Tuvalu'),(226,'UG','Uganda'),(227,'UA','Ukraine'),(228,'AE','United Arab Emirates'),(229,'GB','United Kingdom'),(230,'US','United States'),(231,'UM','United States minor outlying islands'),(232,'UY','Uruguay'),(233,'UZ','Uzbekistan'),(234,'VU','Vanuatu'),(235,'VA','Vatican City State'),(236,'VE','Venezuela'),(237,'VN','Vietnam'),(238,'VG','Virgin Islands (British),'),(239,'VI','Virgin Islands (U.S.),'),(240,'WF','Wallis and Futuna Islands'),(241,'EH','Western Sahara'),(242,'YE','Yemen'),(243,'ZR','Zaire'),(244,'ZM','Zambia'),(245,'ZW','Zimbabwe');
/*!40000 ALTER TABLE `Countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customers` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `DateCreated` date NOT NULL,
  `Comment` varchar(250) NOT NULL,
  `Phone` varchar(30) DEFAULT NULL,
  `Address` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Mail` varchar(50) DEFAULT NULL,
  `ZipCode` varchar(20) NOT NULL,
  `CountryID` int(11) NOT NULL DEFAULT 196,
  `CompanyID` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`CustomerID`),
  KEY `CountryID` (`CountryID`),
  KEY `CompanyID` (`CompanyID`),
  CONSTRAINT `Customers_ibfk_1` FOREIGN KEY (`CountryID`) REFERENCES `Countries` (`CountryId`),
  CONSTRAINT `Customers_ibfk_2` FOREIGN KEY (`CompanyID`) REFERENCES `Companies` (`CompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=5045 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (5001,'Jana','Kusendova','2017-01-02','','','Komenskeho 44','Kosice','','040 01',196,1),(5002,'Tomas','Pelak','2017-01-02','','','','Cana','','044 14',196,1),(5003,'Ondrej','Kuchta','2017-01-02','','','Zriedlova 13','Kosice','','040 01',196,2),(5004,'Eva','Dittelova','2017-01-02','','','Komenskeho 44','Kosice','','040 01',196,1),(5005,'Stefan','Varga','2017-01-02','','','Potocna 162/2','Zdana','','044 11',196,2),(5006,'Ruzenka','Dorova','2017-01-02','','','','Nizna Mysla','','044 15',196,1),(5007,'Stanislav','Kopko','2017-01-02','','','Zriedlova 13','Kosice','','040 01',196,2),(5008,'Veronika','Suskova','2017-07-16','','','Rieka 2476','Cadca','','022 01',196,1),(5009,'Janka','Mitrova','2017-01-02','','','Zriedlova 13','Kosice','','040 01',196,1),(5010,'Maros','Forrai','2017-01-02','','','Zriedlova 13','Kosice','','040 01',196,2),(5011,'Vianocne','Trhy','2017-01-02','Kulturny dom','','Jarmocná 118/4','Zdana','','044 11',196,1),(5012,'David','Tkac','2017-01-02','','','Siroka 315','Zdana','','044 11',196,1),(5013,'Tadeas','Jambor','2017-01-02','','','Okruzna 106','Zdana','','044 11',196,1),(5014,'Tomas','Mocarsky','2017-01-09','','','Zriedlova 13','Kosice','','040 01',196,2),(5015,'Miroslava','Medvecka','2017-01-19','','','Zriedlova 13','Kosice','','040 01',196,2),(5016,'Michal','Sykora','2017-01-30','','','Zriedlova 13','Kosice','','040 01',196,2),(5017,'Matus','Trpak','2017-03-13','','','Zriedlova 13','Kosice','','040 01',196,2),(5018,'Martin','Brestovic','2017-03-22','','','Zriedlova 13','Kosice','','040 01',196,2),(5019,'Jan','Popelas','2017-04-06','','','','Cana','','044 14',196,1),(5020,'Ivan','Adamkovic','2017-04-06','','','','','','',196,1),(5021,'David','Ondrus','2017-04-18','','','Toryska 5','Kosice','','040 01',196,1),(5022,'Monika','Fabianova','2017-05-04','','','Komenskeho 44','Kosice','','040 01',196,1),(5023,'Jakub','Hanula','2017-05-04','','','Zriedlova 13','Kosice','','040 01',196,2),(5024,'Tomas','Sromovsky','2017-05-19','','','Zriedlova 13','Kosice','','040 01',196,2),(5025,'Stefan','Girman','2017-05-28','','','Zriedlova 13','Kosice','','040 01',196,2),(5026,'Marcela','Stredanska','2017-07-04','','','P.O. Hviezdoslava 2328','Topolcany','','955 01',196,1),(5027,'VW Zraz','VW Zraz','2017-07-16','','','Kemp Tatranec','Vysoké Tatry','','059 60',196,1),(5028,'Richard','Spalek','2017-07-19','','','Podzahradna 49','Bratislava','','821 06',196,1),(5029,'Marian','Hodza','2017-07-19','','','Prazska 35','Bratislava','','811 04',196,1),(5030,'Robert','Svec','2017-07-19','','','Vinicky 279/11','Male Uherce','','958 03',196,1),(5031,'Marek','Cibula','2017-07-19','','','Cislo domu 865','Stiavnicke Bane','','969 81',196,1),(5032,'Marcel','Boldizar','2017-07-19','','','Zriedlova 13','Kosice','','040 01',196,2),(5033,'Martin','Weber ml.','2017-07-19','','','Sklenarova 28','Bratislava 2','','821 09',196,1),(5034,'Tomas','Michna','2017-07-19','','','Za Vodou 1361/2','Stara Lubovna','','064 01',196,1),(5035,'Marcel','Mihok','2017-07-19','','','Hronska 421/65','Valaska','','976 46',196,1),(5036,'Angel Sanchez','Parreno','2017-07-16','','','C/Los Robles A3','Guardo','','348 80',202,1),(5037,'Lubos','Cura','2017-07-23','','','Babie 56','Hanusovce nad Toplou','','094 31',196,1),(5038,'Michal','Mocol','2017-07-23','','','Kamenna 538','Strecno','','013 24',196,1),(5039,'Matus','Hohol','2017-09-03','','','Svitska Cesta 5','Poprad','','058 01',196,1),(5040,'Lukas','Borbely','2017-09-03','','','','Saca','','040 15',196,1),(5041,'Tomas','Gasiak','2017-09-09','','','Cislo domu 217','Sneznica','','023 32',196,1),(5042,'Jakub','Jakubech','2017-09-09','','','Cislo domu 276','Pruzina','','018 22',196,1),(5043,'Miroslav','Tomasko','2017-10-29','','','Potocna 160','Zdana','','044 11',196,1),(5044,'Viktor','Vysoky','2017-11-27','','','Idanska 31','Kosice','','040 01',196,1);
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MaterialColors`
--

DROP TABLE IF EXISTS `MaterialColors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MaterialColors` (
  `ColorID` int(11) NOT NULL AUTO_INCREMENT,
  `ColorName` varchar(50) NOT NULL,
  PRIMARY KEY (`ColorID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MaterialColors`
--

LOCK TABLES `MaterialColors` WRITE;
/*!40000 ALTER TABLE `MaterialColors` DISABLE KEYS */;
INSERT INTO `MaterialColors` VALUES (1,'Lime Green'),(2,'Black'),(3,'White'),(4,'Luminious Red'),(5,'Luminious Orange'),(6,'Red'),(7,'Blue'),(8,'Orange'),(9,'Gold'),(10,'Silver'),(11,'Navy Blue'),(12,'Green'),(13,'Raspberry Red'),(14,'Hot Red'),(15,'Everybody\'s magenta'),(16,'Melon Yellow');
/*!40000 ALTER TABLE `MaterialColors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MaterialDiameters`
--

DROP TABLE IF EXISTS `MaterialDiameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MaterialDiameters` (
  `DiameterID` int(11) NOT NULL AUTO_INCREMENT,
  `DiameterValue` float(3,2) NOT NULL,
  PRIMARY KEY (`DiameterID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MaterialDiameters`
--

LOCK TABLES `MaterialDiameters` WRITE;
/*!40000 ALTER TABLE `MaterialDiameters` DISABLE KEYS */;
INSERT INTO `MaterialDiameters` VALUES (1,1.75),(2,3.00);
/*!40000 ALTER TABLE `MaterialDiameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MaterialManufacturers`
--

DROP TABLE IF EXISTS `MaterialManufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MaterialManufacturers` (
  `ManufacturerID` int(11) NOT NULL AUTO_INCREMENT,
  `ManufacturerName` varchar(30) NOT NULL DEFAULT 'Mladec',
  PRIMARY KEY (`ManufacturerID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MaterialManufacturers`
--

LOCK TABLES `MaterialManufacturers` WRITE;
/*!40000 ALTER TABLE `MaterialManufacturers` DISABLE KEYS */;
INSERT INTO `MaterialManufacturers` VALUES (1,'Mladec'),(2,'Fillamentum'),(3,'Devil Design');
/*!40000 ALTER TABLE `MaterialManufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MaterialSellers`
--

DROP TABLE IF EXISTS `MaterialSellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MaterialSellers` (
  `SellerID` int(11) NOT NULL AUTO_INCREMENT,
  `SellerName` varchar(50) NOT NULL DEFAULT '3DeS s.r.o.',
  PRIMARY KEY (`SellerID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MaterialSellers`
--

LOCK TABLES `MaterialSellers` WRITE;
/*!40000 ALTER TABLE `MaterialSellers` DISABLE KEYS */;
INSERT INTO `MaterialSellers` VALUES (1,'3DeS s.r.o.'),(2,'Kreatiff s.r.o.'),(3,'Prusa Research');
/*!40000 ALTER TABLE `MaterialSellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MaterialTypes`
--

DROP TABLE IF EXISTS `MaterialTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MaterialTypes` (
  `MaterialTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `MaterialType` varchar(10) DEFAULT 'PLA',
  PRIMARY KEY (`MaterialTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MaterialTypes`
--

LOCK TABLES `MaterialTypes` WRITE;
/*!40000 ALTER TABLE `MaterialTypes` DISABLE KEYS */;
INSERT INTO `MaterialTypes` VALUES (1,'PLA'),(2,'ABS');
/*!40000 ALTER TABLE `MaterialTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MaterialWeights`
--

DROP TABLE IF EXISTS `MaterialWeights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MaterialWeights` (
  `WeightID` int(11) NOT NULL AUTO_INCREMENT,
  `WeightValue` int(11) NOT NULL,
  PRIMARY KEY (`WeightID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MaterialWeights`
--

LOCK TABLES `MaterialWeights` WRITE;
/*!40000 ALTER TABLE `MaterialWeights` DISABLE KEYS */;
INSERT INTO `MaterialWeights` VALUES (1,500),(2,750),(3,1000),(4,2000);
/*!40000 ALTER TABLE `MaterialWeights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Materials`
--

DROP TABLE IF EXISTS `Materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Materials` (
  `MaterialID` int(11) NOT NULL AUTO_INCREMENT,
  `ManufacturerID` int(11) NOT NULL,
  `MaterialTypeID` int(11) DEFAULT 1,
  `ColorID` int(11) NOT NULL DEFAULT 2,
  `WeightID` int(11) DEFAULT 3,
  `MaterialPrice` float(5,2) DEFAULT NULL,
  `MaterialShipping` float(4,2) DEFAULT 0.00,
  `PurchaseDate` date DEFAULT NULL,
  `SellerID` int(11) NOT NULL DEFAULT 1,
  `Finished` varchar(10) DEFAULT 'No',
  `Trash` float(2,1) NOT NULL DEFAULT 0.0,
  `DiameterID` int(11) DEFAULT 1,
  `Comment` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`MaterialID`),
  KEY `MaterialTypeID` (`MaterialTypeID`),
  KEY `WeightID` (`WeightID`),
  KEY `DiameterID` (`DiameterID`),
  CONSTRAINT `Materials_ibfk_1` FOREIGN KEY (`MaterialTypeID`) REFERENCES `MaterialTypes` (`MaterialTypeID`),
  CONSTRAINT `Materials_ibfk_2` FOREIGN KEY (`WeightID`) REFERENCES `MaterialWeights` (`WeightID`),
  CONSTRAINT `Materials_ibfk_3` FOREIGN KEY (`DiameterID`) REFERENCES `MaterialDiameters` (`DiameterID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Materials`
--

LOCK TABLES `Materials` WRITE;
/*!40000 ALTER TABLE `Materials` DISABLE KEYS */;
INSERT INTO `Materials` VALUES (1,1,1,1,3,0.00,0.00,'2016-09-13',3,'Yes',0.0,1,''),(2,1,1,2,3,15.90,2.75,'2016-10-21',1,'Yes',0.0,1,'Test'),(3,1,1,3,3,15.90,2.75,'2016-10-21',1,'Yes',0.0,1,''),(4,2,1,4,2,15.90,1.20,'2016-11-27',1,'No',0.0,1,''),(5,2,1,5,2,15.90,1.20,'2016-11-27',1,'No',0.0,1,''),(6,1,1,2,3,16.90,1.25,'2016-12-08',1,'Yes',0.0,1,''),(7,1,1,3,3,15.90,1.25,'2016-12-08',1,'Yes',0.0,1,''),(8,1,2,2,3,19.00,0.00,'2017-03-20',1,'No',0.0,1,''),(9,1,1,3,3,19.90,0.00,'2017-03-20',1,'Yes',0.0,1,''),(10,1,1,6,3,19.90,0.00,'2017-03-20',1,'No',0.0,1,''),(11,1,1,2,3,19.90,0.00,'2017-03-20',1,'Yes',0.0,1,''),(12,1,1,7,3,19.90,2.50,'2017-05-02',1,'No',0.0,1,''),(13,1,1,8,3,19.90,2.50,'2017-05-02',1,'No',0.0,1,''),(14,1,1,9,3,20.00,1.20,'2017-06-06',2,'No',0.0,1,''),(15,3,1,1,3,20.00,1.20,'2017-06-06',2,'No',0.0,1,''),(16,1,1,10,3,20.00,1.20,'2017-06-06',2,'No',0.0,1,''),(17,3,1,11,3,20.00,1.20,'2017-07-19',2,'No',0.0,1,''),(18,3,1,12,3,20.00,1.20,'2017-07-19',2,'No',0.0,1,''),(19,1,1,2,3,20.00,1.20,'2017-07-19',2,'No',0.0,1,''),(20,3,1,13,3,20.00,3.60,'2017-07-29',2,'No',0.0,1,''),(21,3,1,14,3,20.00,1.80,'2017-10-12',2,'No',0.0,1,''),(22,1,1,3,3,19.90,1.80,'2017-10-12',2,'No',0.0,1,''),(23,3,1,3,4,34.49,1.80,'2017-10-12',2,'No',0.0,1,''),(24,3,1,2,4,34.49,1.80,'2017-10-12',2,'No',0.0,1,''),(25,2,1,0,2,24.50,1.80,'2018-04-19',1,'Yes',0.0,1,''),(26,2,1,15,2,24.50,1.80,'2018-04-19',1,'No',0.0,1,''),(27,2,1,15,2,24.50,1.80,'2018-04-19',1,'No',0.0,1,'');
/*!40000 ALTER TABLE `Materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Objects`
--

DROP TABLE IF EXISTS `Objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Objects` (
  `ObjectID` int(11) NOT NULL AUTO_INCREMENT,
  `ObjectName` varchar(100) DEFAULT NULL,
  `ObjectWeight` float(5,2) DEFAULT NULL,
  `SupportWeight` float(5,2) DEFAULT 0.00,
  `ProjectID` int(11) NOT NULL DEFAULT 0,
  `BuildTime` int(11) NOT NULL,
  `StlLink` varchar(5000) DEFAULT '',
  `Comment` varchar(100) DEFAULT '',
  PRIMARY KEY (`ObjectID`),
  KEY `ProjectID` (`ProjectID`),
  CONSTRAINT `Objects_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Objects`
--

LOCK TABLES `Objects` WRITE;
/*!40000 ALTER TABLE `Objects` DISABLE KEYS */;
INSERT INTO `Objects` VALUES (1,'3D Printing',0.00,0.00,1,0,'',''),(2,'Eiffel Tower',38.00,0.00,1,417,'',''),(3,'Spiral Vase 2',85.00,0.00,2,441,'',''),(5,'Test',15.00,20.00,1,105,'asdads','asdsd');
/*!40000 ALTER TABLE `Objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderItems`
--

DROP TABLE IF EXISTS `OrderItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderItems` (
  `OrderItemID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) NOT NULL,
  `ObjectID` int(11) NOT NULL,
  `ItemMaterialID` int(11) NOT NULL,
  `ItemWeight` float(5,2) NOT NULL,
  `ItemSupportWeight` float(5,2) DEFAULT 0.00,
  `ItemBuildTime` int(11) NOT NULL,
  `ItemPrice` float(5,2) NOT NULL,
  `ItemQuantity` int(11) NOT NULL,
  `PrinterID` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`OrderItemID`),
  KEY `OrderID` (`OrderID`),
  KEY `ObjectID` (`ObjectID`),
  KEY `ItemMaterialID` (`ItemMaterialID`),
  KEY `PrinterID` (`PrinterID`),
  CONSTRAINT `OrderItems_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`),
  CONSTRAINT `OrderItems_ibfk_2` FOREIGN KEY (`ObjectID`) REFERENCES `Objects` (`ObjectID`),
  CONSTRAINT `OrderItems_ibfk_3` FOREIGN KEY (`ItemMaterialID`) REFERENCES `Materials` (`MaterialID`),
  CONSTRAINT `OrderItems_ibfk_4` FOREIGN KEY (`PrinterID`) REFERENCES `Printers` (`PrinterID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderItems`
--

LOCK TABLES `OrderItems` WRITE;
/*!40000 ALTER TABLE `OrderItems` DISABLE KEYS */;
INSERT INTO `OrderItems` VALUES (1,100001,2,2,38.00,0.00,417,5.00,1,1),(2,100001,3,3,85.00,0.00,441,5.00,1,1);
/*!40000 ALTER TABLE `OrderItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderStatus`
--

DROP TABLE IF EXISTS `OrderStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderStatus` (
  `OrderStatus` varchar(50) NOT NULL,
  PRIMARY KEY (`OrderStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderStatus`
--

LOCK TABLES `OrderStatus` WRITE;
/*!40000 ALTER TABLE `OrderStatus` DISABLE KEYS */;
INSERT INTO `OrderStatus` VALUES ('Canceled'),('Not Sold'),('Sold');
/*!40000 ALTER TABLE `OrderStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) NOT NULL,
  `OrderPrice` float(5,2) NOT NULL,
  `OrderQuantity` int(11) NOT NULL,
  `DateCreated` date DEFAULT NULL,
  `OrderStatus` varchar(50) NOT NULL,
  `DueDate` date DEFAULT NULL,
  `Comment` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `OrderStatus` (`OrderStatus`),
  CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`),
  CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`OrderStatus`) REFERENCES `OrderStatus` (`OrderStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=100002 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (100001,5001,10.00,2,'2016-12-02','Sold','2016-12-02','');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Printers`
--

DROP TABLE IF EXISTS `Printers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Printers` (
  `PrinterID` int(11) NOT NULL AUTO_INCREMENT,
  `PrinterName` varchar(100) NOT NULL,
  `PrinterPrice` float(5,2) NOT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `PrinterShipping` float(5,2) NOT NULL,
  PRIMARY KEY (`PrinterID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Printers`
--

LOCK TABLES `Printers` WRITE;
/*!40000 ALTER TABLE `Printers` DISABLE KEYS */;
INSERT INTO `Printers` VALUES (1,'Prusa i3 MK2',699.00,'Original Prusa',8.06),(2,'Wanhao Duplicator 7 Plus',408.50,'Original Wanhao D7 Plus',125.98);
/*!40000 ALTER TABLE `Printers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Projects`
--

DROP TABLE IF EXISTS `Projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Projects` (
  `ProjectID` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ProjectID`),
  UNIQUE KEY `ProjectName` (`ProjectName`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Projects`
--

LOCK TABLES `Projects` WRITE;
/*!40000 ALTER TABLE `Projects` DISABLE KEYS */;
INSERT INTO `Projects` VALUES (5,'1-slot Card Case 1.0'),(6,'2-slot Card Case 3.0'),(4,'Card Roller 2.0'),(17,'Chinese Riddle'),(13,'Cigarette Case'),(16,'Cleveland Indians'),(1,'General'),(15,'Japanese Customs'),(11,'Key Hanger'),(12,'Keychains'),(14,'La Bella Art'),(8,'Odroid C2 Cases'),(7,'Raspberry Cases'),(3,'Snowflakes'),(2,'Spiral Vases'),(9,'Tesla Supercharger'),(10,'Torsen Differential');
/*!40000 ALTER TABLE `Projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-29 23:24:23
