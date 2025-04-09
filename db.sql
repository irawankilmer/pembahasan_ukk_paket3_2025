-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: pemadatan_albi
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `detailpenjualan`
--

DROP TABLE IF EXISTS `detailpenjualan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detailpenjualan` (
  `DetailID` int(11) NOT NULL AUTO_INCREMENT,
  `PenjualanID` int(11) DEFAULT NULL,
  `ProdukID` int(11) DEFAULT NULL,
  `JumlahProduk` int(11) DEFAULT NULL,
  `Subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`DetailID`),
  KEY `PenjualanID` (`PenjualanID`),
  KEY `ProdukID` (`ProdukID`),
  CONSTRAINT `detailpenjualan_ibfk_1` FOREIGN KEY (`PenjualanID`) REFERENCES `penjualan` (`PenjualanID`),
  CONSTRAINT `detailpenjualan_ibfk_2` FOREIGN KEY (`ProdukID`) REFERENCES `produk` (`ProdukID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detailpenjualan`
--

LOCK TABLES `detailpenjualan` WRITE;
/*!40000 ALTER TABLE `detailpenjualan` DISABLE KEYS */;
INSERT INTO `detailpenjualan` VALUES (1,1,3,3,96314.00),(2,2,1,5,16938.00),(3,2,3,3,144471.00),(4,2,2,5,83696.00),(5,3,3,4,240785.00),(6,3,2,1,209240.00),(7,4,2,1,83696.00),(8,5,1,3,16938.00);
/*!40000 ALTER TABLE `detailpenjualan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelanggan`
--

DROP TABLE IF EXISTS `pelanggan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelanggan` (
  `PelangganID` int(11) NOT NULL AUTO_INCREMENT,
  `NamaPelanggan` varchar(255) DEFAULT NULL,
  `Alamat` text DEFAULT NULL,
  `NomorTelepon` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`PelangganID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelanggan`
--

LOCK TABLES `pelanggan` WRITE;
/*!40000 ALTER TABLE `pelanggan` DISABLE KEYS */;
INSERT INTO `pelanggan` VALUES (1,'TRIA NIDA','Samarang','8131'),(2,'KHALYA','Bayongbong','1740'),(3,'SELA LASTRIA','Wanaraja','9181'),(4,'NAJWA NURROSI','Pasirwangi','6953'),(5,'DIMAS','Samarang','0950'),(6,'DWI P LESTARI','Cikajang','3886'),(7,'ZULFA ANNISA','Singajaya','3343'),(8,'SHERA NURFADILAH','Selaawi','1681'),(9,'FUJA AZQYA','Sucinaraja','2845'),(10,'ACH FAJAR R','Limbangan','3444');
/*!40000 ALTER TABLE `pelanggan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penjualan`
--

DROP TABLE IF EXISTS `penjualan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penjualan` (
  `PenjualanID` int(11) NOT NULL AUTO_INCREMENT,
  `TanggalPenjualan` date DEFAULT NULL,
  `TotalHarga` decimal(10,2) DEFAULT NULL,
  `PelangganID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PenjualanID`),
  KEY `PelangganID` (`PelangganID`),
  CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`PelangganID`) REFERENCES `pelanggan` (`PelangganID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penjualan`
--

LOCK TABLES `penjualan` WRITE;
/*!40000 ALTER TABLE `penjualan` DISABLE KEYS */;
INSERT INTO `penjualan` VALUES (1,'2024-03-01',56407.00,9),(2,'2024-03-02',58522.00,2),(3,'2024-03-03',55892.00,6),(4,'2024-03-04',50435.00,1),(5,'2024-03-05',71139.00,8);
/*!40000 ALTER TABLE `penjualan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produk`
--

DROP TABLE IF EXISTS `produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produk` (
  `ProdukID` int(11) NOT NULL AUTO_INCREMENT,
  `NamaProduk` varchar(255) DEFAULT NULL,
  `Harga` decimal(10,2) DEFAULT NULL,
  `Stok` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProdukID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produk`
--

LOCK TABLES `produk` WRITE;
/*!40000 ALTER TABLE `produk` DISABLE KEYS */;
INSERT INTO `produk` VALUES (1,'Buku',8469.00,38),(2,'Pensil',41848.00,58),(3,'Penghapus',48157.00,61),(4,'Penggaris',21073.00,68),(5,'Pulpen',43607.00,68);
/*!40000 ALTER TABLE `produk` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-09 20:41:46
