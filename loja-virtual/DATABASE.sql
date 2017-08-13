-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 31-Jul-2017 às 00:50
-- Versão do servidor: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ope`
--
CREATE DATABASE IF NOT EXISTS `ope` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ope`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--
-- Criação: 15-Maio-2017 às 01:26
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `ativo` bit(1) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `categoria`:
--

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `ativo`, `nome`) VALUES
(1, b'1', 'Carroceria'),
(2, b'1', 'Mecânica'),
(3, b'1', 'Interior'),
(4, b'1', 'Elétrica'),
(5, b'1', 'Pneu');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--
-- Criação: 29-Jul-2017 às 19:24
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `ativo` bit(1) DEFAULT NULL,
  `cpf` varchar(14) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `cliente`:
--

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `ativo`, `cpf`, `email`, `nome`, `senha`, `tipo`) VALUES
(9, b'1', '370.506.348-08', 'm.rabello23@gmail.com', 'Marcel Oliveira', 'admin', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--
-- Criação: 15-Maio-2017 às 01:26
--

DROP TABLE IF EXISTS `endereco`;
CREATE TABLE IF NOT EXISTS `endereco` (
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

--
-- RELATIONS FOR TABLE `endereco`:
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--
-- Criação: 15-Maio-2017 às 01:26
--

DROP TABLE IF EXISTS `fornecedor`;
CREATE TABLE IF NOT EXISTS `fornecedor` (
  `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `ativo` bit(1) DEFAULT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `ie` varchar(12) DEFAULT NULL,
  `nome_fantasia` varchar(100) DEFAULT NULL,
  `razao_social` varchar(100) NOT NULL,
  `id_endereco` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_fornecedor`),
  KEY `FK_okhcra9k4d3ow81j0hyffmggm` (`id_endereco`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `fornecedor`:
--   `id_endereco`
--       `endereco` -> `id_endereco`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `imagem`
--
-- Criação: 15-Maio-2017 às 01:26
--

DROP TABLE IF EXISTS `imagem`;
CREATE TABLE IF NOT EXISTS `imagem` (
  `id_imagem` int(11) NOT NULL AUTO_INCREMENT,
  `foto` longblob,
  PRIMARY KEY (`id_imagem`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `imagem`:
--

--
-- Extraindo dados da tabela `imagem`
--

INSERT INTO `imagem` (`id_imagem`, `foto`) VALUES
(1, 0x687474703a2f2f706c616365686f6c642e69742f33323078313830),
(2, 0x415361734153736153415353415341445344);

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo`
--
-- Criação: 15-Maio-2017 às 01:26
--

DROP TABLE IF EXISTS `modelo`;
CREATE TABLE IF NOT EXISTS `modelo` (
  `id_modelo` int(11) NOT NULL AUTO_INCREMENT,
  `ativo` bit(1) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `id_montadora` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_modelo`),
  KEY `FK_jxvabb637j7xj7hdnuej6aqbr` (`id_montadora`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `modelo`:
--   `id_montadora`
--       `montadora` -> `id_montadora`
--

--
-- Extraindo dados da tabela `modelo`
--

INSERT INTO `modelo` (`id_modelo`, `ativo`, `nome`, `id_montadora`) VALUES
(1, b'1', 'cs122 turbo', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `montadora`
--
-- Criação: 15-Maio-2017 às 01:26
--

DROP TABLE IF EXISTS `montadora`;
CREATE TABLE IF NOT EXISTS `montadora` (
  `id_montadora` int(11) NOT NULL AUTO_INCREMENT,
  `ativo` bit(1) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id_montadora`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `montadora`:
--

--
-- Extraindo dados da tabela `montadora`
--

INSERT INTO `montadora` (`id_montadora`, `ativo`, `nome`) VALUES
(1, b'1', 'Volvo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `movimentacao`
--
-- Criação: 29-Jul-2017 às 19:24
--

DROP TABLE IF EXISTS `movimentacao`;
CREATE TABLE IF NOT EXISTS `movimentacao` (
  `id_movimentacao` int(11) NOT NULL AUTO_INCREMENT,
  `dt_movimentacao` date NOT NULL,
  `observacao` varchar(150) DEFAULT NULL,
  `quantidade` int(11) NOT NULL,
  `tipo_movimentacao` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  PRIMARY KEY (`id_movimentacao`),
  KEY `FK_3m33srukv6swiywfesxxpb833` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `movimentacao`:
--   `id_produto`
--       `produto` -> `id_produto`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `orcamento`
--
-- Criação: 30-Jul-2017 às 20:29
--

DROP TABLE IF EXISTS `orcamento`;
CREATE TABLE IF NOT EXISTS `orcamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nr_pedido` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_cliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `orcamento`:
--   `id_cliente`
--       `cliente` -> `id_cliente`
--

--
-- Extraindo dados da tabela `orcamento`
--

INSERT INTO `orcamento` (`id`, `nr_pedido`, `data`, `id_cliente`) VALUES
(1, 1501452841, '2017-07-30 22:14:01', 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--
-- Criação: 29-Jul-2017 às 19:24
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE IF NOT EXISTS `produto` (
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
  PRIMARY KEY (`id_produto`),
  KEY `FK_5rxwsr0kb6apig8cw13bximd` (`id_categoria`),
  KEY `FK_51ujkp87s34oq10ouej5hxtm9` (`id_imagem`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `produto`:
--   `id_imagem`
--       `imagem` -> `id_imagem`
--   `id_categoria`
--       `categoria` -> `id_categoria`
--

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `ativo`, `nome`, `id_categoria`, `id_imagem`, `controla_estoque`, `margem`, `mostra_vitrine`, `preco_compra`, `preco_venda`, `qtd_minima`, `quantidade`) VALUES
(1, b'1', 'lanterna dianteira', 1, 1, b'1', '10.00', b'1', '150.00', '165.00', 2, 5),
(4, b'1', 'Banco', 3, 2, b'1', '15.00', b'1', '200.00', '0.00', 1, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_modelo`
--
-- Criação: 15-Maio-2017 às 01:26
--

DROP TABLE IF EXISTS `produto_modelo`;
CREATE TABLE IF NOT EXISTS `produto_modelo` (
  `id_produto_modelo` int(11) NOT NULL AUTO_INCREMENT,
  `id_modelo` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_produto_modelo`),
  KEY `FK_nw4jk8yp8cfrgmslc2nwl3k17` (`id_modelo`),
  KEY `FK_9nue7m27b2nx4qnhybga3k9xe` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `produto_modelo`:
--   `id_produto`
--       `produto` -> `id_produto`
--   `id_modelo`
--       `modelo` -> `id_modelo`
--

--
-- Extraindo dados da tabela `produto_modelo`
--

INSERT INTO `produto_modelo` (`id_produto_modelo`, `id_modelo`, `id_produto`) VALUES
(1, 1, 1),
(3, 1, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_orcamento`
--
-- Criação: 30-Jul-2017 às 20:29
--

DROP TABLE IF EXISTS `produto_orcamento`;
CREATE TABLE IF NOT EXISTS `produto_orcamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) DEFAULT NULL,
  `id_orcamento` int(11) DEFAULT NULL,
  `quantidade` int(5) DEFAULT NULL,
  `valor` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_produto` (`id_produto`),
  KEY `id_orcamento` (`id_orcamento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `produto_orcamento`:
--   `id_produto`
--       `produto` -> `id_produto`
--   `id_orcamento`
--       `orcamento` -> `id`
--

--
-- Extraindo dados da tabela `produto_orcamento`
--

INSERT INTO `produto_orcamento` (`id`, `id_produto`, `id_orcamento`, `quantidade`, `valor`) VALUES
(1, 1, 1, 1, 165.00),
(2, 4, 1, 2, 230.00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tel_cliente`
--
-- Criação: 15-Maio-2017 às 01:26
--

DROP TABLE IF EXISTS `tel_cliente`;
CREATE TABLE IF NOT EXISTS `tel_cliente` (
  `idTelCliente` int(11) NOT NULL AUTO_INCREMENT,
  `complemento` varchar(20) DEFAULT NULL,
  `numero` varchar(15) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `idCliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTelCliente`),
  KEY `FK_nxmc2nmy02racdws30a1csiea` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tel_cliente`:
--   `idCliente`
--       `cliente` -> `id_cliente`
--

--
-- Extraindo dados da tabela `tel_cliente`
--

INSERT INTO `tel_cliente` (`idTelCliente`, `complemento`, `numero`, `tipo`, `idCliente`) VALUES
(5, NULL, '(11)98765-4248', '1', 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tel_fornecedor`
--
-- Criação: 15-Maio-2017 às 01:26
--

DROP TABLE IF EXISTS `tel_fornecedor`;
CREATE TABLE IF NOT EXISTS `tel_fornecedor` (
  `idTelFornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `complemento` varchar(20) DEFAULT NULL,
  `numero` varchar(15) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `idFornecedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTelFornecedor`),
  KEY `FK_kgsh4hxu9g4hu7rcq2xdahy0y` (`idFornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tel_fornecedor`:
--   `idFornecedor`
--       `fornecedor` -> `id_fornecedor`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--
-- Criação: 15-Maio-2017 às 01:26
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativo` bit(1) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `usuario`:
--

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD CONSTRAINT `FK_okhcra9k4d3ow81j0hyffmggm` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`);

--
-- Limitadores para a tabela `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `FK_jxvabb637j7xj7hdnuej6aqbr` FOREIGN KEY (`id_montadora`) REFERENCES `montadora` (`id_montadora`);

--
-- Limitadores para a tabela `movimentacao`
--
ALTER TABLE `movimentacao`
  ADD CONSTRAINT `FK_3m33srukv6swiywfesxxpb833` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`);

--
-- Limitadores para a tabela `orcamento`
--
ALTER TABLE `orcamento`
  ADD CONSTRAINT `orcamento_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `FK_51ujkp87s34oq10ouej5hxtm9` FOREIGN KEY (`id_imagem`) REFERENCES `imagem` (`id_imagem`),
  ADD CONSTRAINT `FK_5rxwsr0kb6apig8cw13bximd` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);

--
-- Limitadores para a tabela `produto_modelo`
--
ALTER TABLE `produto_modelo`
  ADD CONSTRAINT `FK_9nue7m27b2nx4qnhybga3k9xe` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  ADD CONSTRAINT `FK_nw4jk8yp8cfrgmslc2nwl3k17` FOREIGN KEY (`id_modelo`) REFERENCES `modelo` (`id_modelo`);

--
-- Limitadores para a tabela `produto_orcamento`
--
ALTER TABLE `produto_orcamento`
  ADD CONSTRAINT `produto_orcamento_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  ADD CONSTRAINT `produto_orcamento_ibfk_2` FOREIGN KEY (`id_orcamento`) REFERENCES `orcamento` (`id`);

--
-- Limitadores para a tabela `tel_cliente`
--
ALTER TABLE `tel_cliente`
  ADD CONSTRAINT `FK_nxmc2nmy02racdws30a1csiea` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Limitadores para a tabela `tel_fornecedor`
--
ALTER TABLE `tel_fornecedor`
  ADD CONSTRAINT `FK_kgsh4hxu9g4hu7rcq2xdahy0y` FOREIGN KEY (`idFornecedor`) REFERENCES `fornecedor` (`id_fornecedor`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
