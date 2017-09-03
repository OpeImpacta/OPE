CREATE DATABASE  IF NOT EXISTS `ope` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ope`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ope
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.19-MariaDB

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `ativo` bit(1) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'','Carroceria'),(2,'','Interno'),(3,'','Mecânica');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `ativo` bit(1) DEFAULT NULL,
  `cpf` varchar(14) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (9,'','370.506.348-08','m.rabello23@gmail.com','Marcel Oliveira','admin',1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `id_endereco` int(11) NOT NULL AUTO_INCREMENT,
  `bairro` varchar(50) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_endereco`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedor` (
  `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `ativo` bit(1) DEFAULT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `ie` varchar(12) DEFAULT NULL,
  `nome_fantasia` varchar(100) DEFAULT NULL,
  `razao_social` varchar(100) NOT NULL,
  `id_endereco` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_fornecedor`),
  KEY `FK_okhcra9k4d3ow81j0hyffmggm` (`id_endereco`),
  CONSTRAINT `FK_okhcra9k4d3ow81j0hyffmggm` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagem`
--

DROP TABLE IF EXISTS `imagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagem` (
  `id_imagem` int(11) NOT NULL AUTO_INCREMENT,
  `foto` longblob,
  PRIMARY KEY (`id_imagem`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagem`
--

LOCK TABLES `imagem` WRITE;
/*!40000 ALTER TABLE `imagem` DISABLE KEYS */;
INSERT INTO `imagem` VALUES (1,'C:xampphtdocsprojetosloja-virtualimagensprodutos320x180.png'),(2,'C:xampphtdocsprojetosloja-virtualimagensprodutos620x350.png'),(3,'C:xampphtdocsprojetosloja-virtualimagensprodutos320x180.png'),(4,'C:xampphtdocsprojetosloja-virtualimagensprodutos620x350.png');
/*!40000 ALTER TABLE `imagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_venda`
--

DROP TABLE IF EXISTS `item_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_venda` (
  `id_item_venda` int(11) NOT NULL AUTO_INCREMENT,
  `quantidade` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `venda_id_venda` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_item_venda`),
  KEY `FK_6vheeo5tjv9y8h20jvakn8oj9` (`id_produto`),
  KEY `FK_pdxbb3v6i1aswlweppggqdb7t` (`venda_id_venda`),
  CONSTRAINT `FK_6vheeo5tjv9y8h20jvakn8oj9` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  CONSTRAINT `FK_pdxbb3v6i1aswlweppggqdb7t` FOREIGN KEY (`venda_id_venda`) REFERENCES `venda` (`id_venda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_venda`
--

LOCK TABLES `item_venda` WRITE;
/*!40000 ALTER TABLE `item_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelo` (
  `id_modelo` int(11) NOT NULL AUTO_INCREMENT,
  `ativo` bit(1) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `id_montadora` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_modelo`),
  KEY `FK_jxvabb637j7xj7hdnuej6aqbr` (`id_montadora`),
  CONSTRAINT `FK_jxvabb637j7xj7hdnuej6aqbr` FOREIGN KEY (`id_montadora`) REFERENCES `montadora` (`id_montadora`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (1,'','X200',1),(2,'','Hs1020',2),(3,'','VolksTruck',3);
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `montadora`
--

DROP TABLE IF EXISTS `montadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `montadora` (
  `id_montadora` int(11) NOT NULL AUTO_INCREMENT,
  `ativo` bit(1) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id_montadora`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `montadora`
--

LOCK TABLES `montadora` WRITE;
/*!40000 ALTER TABLE `montadora` DISABLE KEYS */;
INSERT INTO `montadora` VALUES (1,'','Volvo'),(2,'','Mercedes-Benz'),(3,'','Volkswagen');
/*!40000 ALTER TABLE `montadora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimentacao`
--

DROP TABLE IF EXISTS `movimentacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimentacao` (
  `id_movimentacao` int(11) NOT NULL AUTO_INCREMENT,
  `dt_movimentacao` date NOT NULL,
  `observacao` varchar(150) DEFAULT NULL,
  `quantidade` int(11) NOT NULL,
  `tipo_movimentacao` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  PRIMARY KEY (`id_movimentacao`),
  KEY `FK_3m33srukv6swiywfesxxpb833` (`id_produto`),
  CONSTRAINT `FK_3m33srukv6swiywfesxxpb833` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentacao`
--

LOCK TABLES `movimentacao` WRITE;
/*!40000 ALTER TABLE `movimentacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimentacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orcamento`
--

DROP TABLE IF EXISTS `orcamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orcamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nr_pedido` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_cliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `orcamento_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orcamento`
--

LOCK TABLES `orcamento` WRITE;
/*!40000 ALTER TABLE `orcamento` DISABLE KEYS */;
INSERT INTO `orcamento` VALUES (1,1501452841,'2017-07-30 22:14:01',9),(2,1502231424,'2017-08-08 22:30:24',9);
/*!40000 ALTER TABLE `orcamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `ativo` bit(1) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_imagem` int(11) DEFAULT NULL,
  `controla_estoque` bit(1) DEFAULT NULL,
  `margem` decimal(19,2) DEFAULT NULL,
  `mostra_vitrine` bit(1) NOT NULL,
  `preco_compra` decimal(19,2) DEFAULT NULL,
  `preco_venda` decimal(19,2) NOT NULL,
  `qtd_minima` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `FK_5rxwsr0kb6apig8cw13bximd` (`id_categoria`),
  KEY `FK_51ujkp87s34oq10ouej5hxtm9` (`id_imagem`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'','Lanterna Dianteira',1,1,'',10.00,'',150.00,165.00,2,4,'Lanterna dianteira'),(4,'','Lanterna Traseira',1,2,'',15.00,'',200.00,0.00,1,0,''),(5,'','Lanterna Dianteira Esquerda',1,3,'',10.00,'',200.00,220.00,5,3,'Lanterna'),(6,'','Parachoque',1,4,'',10.00,'',200.00,220.00,5,10,'Parachoque');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_modelo`
--

DROP TABLE IF EXISTS `produto_modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_modelo` (
  `id_produto_modelo` int(11) NOT NULL AUTO_INCREMENT,
  `id_modelo` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_produto_modelo`),
  KEY `FK_nw4jk8yp8cfrgmslc2nwl3k17` (`id_modelo`),
  KEY `FK_9nue7m27b2nx4qnhybga3k9xe` (`id_produto`),
  CONSTRAINT `FK_9nue7m27b2nx4qnhybga3k9xe` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  CONSTRAINT `FK_nw4jk8yp8cfrgmslc2nwl3k17` FOREIGN KEY (`id_modelo`) REFERENCES `modelo` (`id_modelo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_modelo`
--

LOCK TABLES `produto_modelo` WRITE;
/*!40000 ALTER TABLE `produto_modelo` DISABLE KEYS */;
INSERT INTO `produto_modelo` VALUES (1,1,1),(2,2,1),(3,2,4),(4,3,4),(5,1,5),(6,2,5),(7,3,5),(8,1,6),(9,2,6),(10,3,6);
/*!40000 ALTER TABLE `produto_modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_orcamento`
--

DROP TABLE IF EXISTS `produto_orcamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_orcamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) DEFAULT NULL,
  `id_orcamento` int(11) DEFAULT NULL,
  `quantidade` int(5) DEFAULT NULL,
  `valor` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_produto` (`id_produto`),
  KEY `id_orcamento` (`id_orcamento`),
  CONSTRAINT `produto_orcamento_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  CONSTRAINT `produto_orcamento_ibfk_2` FOREIGN KEY (`id_orcamento`) REFERENCES `orcamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_orcamento`
--

LOCK TABLES `produto_orcamento` WRITE;
/*!40000 ALTER TABLE `produto_orcamento` DISABLE KEYS */;
INSERT INTO `produto_orcamento` VALUES (1,1,1,1,165.00),(2,4,1,2,230.00),(3,1,2,1,165.00);
/*!40000 ALTER TABLE `produto_orcamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tel_cliente`
--

DROP TABLE IF EXISTS `tel_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tel_cliente` (
  `idTelCliente` int(11) NOT NULL AUTO_INCREMENT,
  `complemento` varchar(20) DEFAULT NULL,
  `numero` varchar(15) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `idCliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTelCliente`),
  KEY `FK_nxmc2nmy02racdws30a1csiea` (`idCliente`),
  CONSTRAINT `FK_nxmc2nmy02racdws30a1csiea` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tel_cliente`
--

LOCK TABLES `tel_cliente` WRITE;
/*!40000 ALTER TABLE `tel_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tel_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tel_fornecedor`
--

DROP TABLE IF EXISTS `tel_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tel_fornecedor` (
  `idTelFornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `complemento` varchar(20) DEFAULT NULL,
  `numero` varchar(15) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `idFornecedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTelFornecedor`),
  KEY `FK_kgsh4hxu9g4hu7rcq2xdahy0y` (`idFornecedor`),
  CONSTRAINT `FK_kgsh4hxu9g4hu7rcq2xdahy0y` FOREIGN KEY (`idFornecedor`) REFERENCES `fornecedor` (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tel_fornecedor`
--

LOCK TABLES `tel_fornecedor` WRITE;
/*!40000 ALTER TABLE `tel_fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tel_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativo` bit(1) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda` (
  `id_venda` int(11) NOT NULL AUTO_INCREMENT,
  `aprovado` bit(1) DEFAULT NULL,
  `ativo` bit(1) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `desconto` decimal(19,2) DEFAULT NULL,
  `finalizado` bit(1) DEFAULT NULL,
  `forma_pgto` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `total` decimal(19,2) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_venda`),
  KEY `FK_fwmdliq4e53pcssq6qq4fxmp3` (`id_cliente`),
  CONSTRAINT `FK_fwmdliq4e53pcssq6qq4fxmp3` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ope'
--

--
-- Dumping routines for database 'ope'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-02 17:43:02
