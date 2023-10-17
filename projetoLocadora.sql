-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: locadora
-- ------------------------------------------------------
-- Server version	5.7.21-log

CREATE DATABASE IF NOT EXISTS locadora;
USE locadora;

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
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`; 
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidade` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `populacao` int(11) DEFAULT NULL,
  `anoFundacao` int(11) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,'João Pessoa',720954,1595,'PB'),(2,'Recife',1555456,1537,'PE'),(3,'Timbaúba',50956,1873,'PE'),(4,'Senhor do Bonfim',78588,1799,'BA'),(5,'Natal',803739,1599,'RN');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `CEP` char(8) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `CPF` char(11) DEFAULT NULL,
  `CNPJ` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Radegondes','Rua A','Bairro 1','João Pessoa','5895392','PB','11111111111',NULL),(2,'Xilderico','Rua A','Bairro 1','João Pessoa','5895392','PB','22222222222',NULL),(3,'Atanagildetina','Rua B','Bairro 1','Recife','54878777','PE','33333333333',NULL),(4,'Filomena','Rua A','Bairro 2','Natal','4785225','RN','44444444444',NULL),(5,'EMPRESA A','Rua X','Bairro 5','João Pessoa','5895392','PB',NULL,'11111111111'),(6,'José','Rua A','Bairro 1','Timbaúba','55870000','PE','55555555555',NULL),(7,'EMPRESA B','Rua A','Bairro 3','Recife','58742878','PE',NULL,'22222222222'),(8,'EMPRESA C','Rua B','Bairro 2','João Pessoa','5895392','PB',NULL,'3354678455'),(9,'Lara','Rua A','Bairro 1','Senhor do Bonfim','8785222','PB','77777777777',NULL),(10,'Bruna','Rua A','Bairro 1','Timbaúba','55870000','PE','88888888888',NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrato` (
  `numero` int(11) DEFAULT NULL,
  `idVeiculo` int(11) NOT NULL,
  `codigoCliente` int(11) NOT NULL,
  `dataSaida` date NOT NULL,
  `dataRetorno` date DEFAULT NULL,
  `dataDevolucao` date DEFAULT NULL,
  `valorReserva` decimal(10,2) DEFAULT NULL,
  `multa` decimal(10,2) DEFAULT NULL,
  `valorPago` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idVeiculo`,`codigoCliente`,`dataSaida`),
  UNIQUE KEY `numero` (`numero`),
  KEY `fk_contrato_cliente` (`codigoCliente`),
  CONSTRAINT `fk_contrato_cliente` FOREIGN KEY (`codigoCliente`) REFERENCES `cliente` (`codigo`),
  CONSTRAINT `fk_contrato_veiculo` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
INSERT INTO `contrato` VALUES (8,1,2,'2018-09-30','2018-10-04','2018-10-06',723.00,25.00,748.00),(19,1,4,'2018-11-11','2018-11-14','2018-11-14',375.00,0.00,375.00),(24,1,5,'2018-11-23','2018-11-24','2018-11-26',361.50,25.00,386.50),(3,1,6,'2018-09-24','2018-09-25','2018-09-25',120.50,0.00,120.50),(1,2,1,'2018-09-20','2018-09-22','2018-09-22',280.00,0.00,280.00),(13,2,1,'2018-10-09','2018-10-18','2018-10-18',1260.00,0.00,1260.00),(22,2,8,'2018-11-20','2018-11-22','2018-11-23',420.00,14.00,434.00),(20,3,5,'2018-11-18','2018-11-25','2018-11-25',490.00,0.00,490.00),(10,3,6,'2018-10-03','2018-10-22','2018-10-23',1400.00,7.00,1407.00),(14,3,6,'2018-10-14','2018-10-25','2018-10-25',770.00,0.00,770.00),(5,3,7,'2018-09-26','2018-09-29','2018-09-29',210.00,0.00,210.00),(23,4,1,'2018-11-20','2018-11-24','2018-11-25',391.50,13.50,405.00),(4,4,3,'2018-09-24','2018-09-28','2018-09-30',391.50,27.00,418.50),(2,4,4,'2018-09-20','2018-09-25','2018-09-27',913.50,27.00,940.50),(9,4,4,'2018-10-02','2018-10-05','2018-10-05',391.50,13.50,405.00),(11,5,4,'2018-10-04','2018-10-12','2018-10-12',800.00,0.00,800.00),(15,5,5,'2018-10-25','2018-10-28','2018-10-28',300.00,0.00,300.00),(6,6,3,'2018-09-28','2018-10-01','2018-10-04',630.00,31.50,661.50),(21,6,7,'2018-11-20','2018-11-22','2018-11-22',210.00,0.00,210.00),(16,7,2,'2018-10-26','2018-10-29','2018-10-29',375.00,0.00,375.00),(25,7,3,'2018-11-24','2018-11-25','2018-11-25',125.00,0.00,125.00),(18,8,1,'2018-11-09','2018-11-14','2018-11-15',600.00,10.00,610.00),(12,8,3,'2018-10-09','2018-10-15','2018-10-16',700.00,10.00,710.00),(7,9,5,'2018-09-29','2018-10-02','2018-10-04',325.00,13.00,338.00),(17,9,9,'2018-11-02','2018-11-05','2018-11-09',455.00,26.00,481.00);
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filial`
--

DROP TABLE IF EXISTS `filial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filial` (
  `codigo` int(11) NOT NULL,
  `telefone` char(11) DEFAULT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `CEP` char(8) DEFAULT NULL,
  `idCidade` int(11) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_filial_cidade` (`idCidade`),
  CONSTRAINT `fk_filial_cidade` FOREIGN KEY (`idCidade`) REFERENCES `cidade` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filial`
--

LOCK TABLES `filial` WRITE;
/*!40000 ALTER TABLE `filial` DISABLE KEYS */;
INSERT INTO `filial` VALUES (1,'32575888','Rua A','Bairro A','Timbaúba','55870000',3,'PE'),(2,'35877896','Rua A','Bairro A','João Pessoa','58052170',1,'PB'),(3,'33335848','Rua B','Bairro B','Timbaúba','55870000',3,'PE'),(4,'30301588','Rua A','Bairro A','Recife','55870258',2,'PE'),(5,'23658844','Rua B','Bairro B','Senhor do Bonfim','58744000',4,'BA'),(6,'35478522','Rua B','Bairro B','João Pessoa','58055040',1,'PE');
/*!40000 ALTER TABLE `filial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefone` (
  `codigoCliente` int(11) NOT NULL,
  `numero` char(11) NOT NULL,
  PRIMARY KEY (`codigoCliente`,`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
INSERT INTO `telefone` VALUES (1,'97777-0099'),(1,'98888-8888'),(1,'99999-0099'),(2,'98888-7777'),(2,'99999-7777'),(3,'9854-2547'),(3,'98547-0259'),(4,'99855-0258'),(6,'98858-8787'),(9,'98585-0099'),(9,'99985-0259');
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veiculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placa` char(7) DEFAULT NULL,
  `modelo` varchar(20) DEFAULT NULL,
  `numPortas` int(11) DEFAULT NULL,
  `arCondicionado` char(1) DEFAULT NULL,
  `vencimentoSeguro` date DEFAULT NULL,
  `codFilial` int(11) DEFAULT NULL,
  `marca` varchar(20) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `valorDiaria` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_veiculo_filial` (`codFilial`),
  CONSTRAINT `fk_veiculo_filial` FOREIGN KEY (`codFilial`) REFERENCES `filial` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` VALUES (1,'MNH0002','HB20S',4,'S','2019-04-30',4,'HYUNDAI',2017,120.50),(2,'KMN8872','Corolla',4,'S','2019-08-20',4,'TOYOTA',2018,140.00),(3,'QFC2010','Gol',2,'N','2019-10-03',3,'VOLKSWAGEN',2014,70.00),(4,'MAB0002','Honda Civic',4,'S','2019-10-05',2,'HONDA',2015,130.50),(5,'KKJ8888','Touro',4,'S','2019-01-31',2,'FIAT',2015,100.00),(6,'JNH1022','Kicks',4,'S','2018-12-31',1,'NISSAN',2018,105.00),(7,'KKK0002','HB20S',4,'S','2019-04-30',4,'HYNUDAI',2018,125.00),(8,'KFJ8223','Corolla',4,'S','2019-08-20',4,'TOYOTA',2015,100.00),(9,'QFT0202','Uno',2,'N','2019-10-03',3,'FIAT',2015,65.00),(10,'MMM0211','HB20',4,'S','2019-10-05',1,'HYUNDAI',2017,120.00),(11,'KDJ9999','Uno',2,'F','2019-01-31',2,'FIAT',2017,90.99),(12,'JNL0558','March',2,'S','2018-12-31',1,'NISSAN',2015,80.99);
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

/* Questão 1 */

SELECT
    c.nome AS Nome,
    t.numero AS Telefone,
    cn.numero AS Contrato,
    cn.dataSaida AS DataSaida,
    v.placa AS Placa,
    v.modelo AS Modelo
FROM contrato cn
JOIN cliente c ON cn.codigoCliente = c.codigo
JOIN telefone t ON c.codigo = t.codigoCliente
JOIN veiculo v ON cn.idVeiculo = v.id
ORDER BY cn.dataSaida DESC;

/* Questão 2 */

SELECT
    c.nome AS Cidade,
    c.anoFundacao AS AnoFundacao,
    COUNT(v.id) AS TotalVeiculos
FROM
    cidade c
JOIN
    filial f ON c.codigo = f.idCidade
LEFT JOIN
    veiculo v ON f.codigo = v.codFilial
GROUP BY
    c.nome, c.anoFundacao
HAVING
    TotalVeiculos > 0
ORDER BY
    Cidade;
    
/* Questão 3 */

SELECT
    c.nome AS Cliente,
    cn.numero AS Contrato,
    v.placa AS Placa,
    v.modelo AS Modelo,
    cn.dataSaida AS DataSaida,
    cn.dataDevolucao AS DataDevolucao
FROM
    cliente c
JOIN
    contrato cn ON c.codigo = cn.codigoCliente
JOIN
    veiculo v ON cn.idVeiculo = v.id
WHERE
    c.nome = 'Filomena' AND v.placa = 'MAB0002';

/* Questão 4 */

SELECT
    c.nome AS Cidade,
    f.rua AS Rua,
    v.placa AS PlacaVeiculo,
    v.modelo AS ModeloVeiculo,
    v.numPortas AS NumeroDePortas
FROM
    veiculo v
JOIN
    filial f ON v.codFilial = f.codigo
JOIN
    cidade c ON f.idCidade = c.codigo
WHERE
    v.numPortas = 4
    AND c.populacao < 100000;

/* Questão 5 */

SELECT
    v.modelo AS ModeloVeiculo,
    COUNT(*) AS Quantidade
FROM
    veiculo v
JOIN
    filial f ON v.codFilial = f.codigo
JOIN
    cidade c ON f.idCidade = c.codigo
WHERE
    v.valorDiaria > 100
    AND c.populacao > 500000
GROUP BY
    v.modelo;

/* Questão 6 */

SELECT
    v.placa AS PlacaVeiculo,
    v.modelo AS ModeloVeiculo,
    FORMAT(AVG(c.valorPago), 2) AS ValorMedio
FROM
    veiculo v
LEFT JOIN
    contrato c ON v.id = c.idVeiculo
GROUP BY
    v.placa, v.modelo
ORDER BY
    ValorMedio DESC;

/* Questão 7 */

/* Questão 8 */

-- Dump completed on 2018-11-26 17:06:05
