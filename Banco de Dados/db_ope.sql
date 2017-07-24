CREATE DATABASE  IF NOT EXISTS `ope` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ope`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: ope
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'','Categoria Teste'),(2,'','TESTE'),(5,'','Cliente Teste'),(6,'','Categoria Teste'),(9,'','Categoria Teste'),(10,'','TEste Catet'),(14,'','Zero');
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
  `cpf` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (11,'','33.333.333/3333-33','teste@teste.com','Jose Santos',NULL,2),(12,'','111.111.111-11','clienteteste@teste.com','Maria Jose',NULL,1),(13,'','222.222.222-22','','Fisica',NULL,1),(14,'','77.777.777/7777-77','','Juridica',NULL,2);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagem`
--

LOCK TABLES `imagem` WRITE;
/*!40000 ALTER TABLE `imagem` DISABLE KEYS */;
INSERT INTO `imagem` VALUES (1,'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿ\Û\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿ\Â\0\0\È\0\Ò\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0µ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0#*Éš\é€\0\0\0\0\0¿¹\Æ\Å°\Zu\Ó[ÛŸr}—\Å\Â5\0a3c\ÉWä–—²-ŒŒW \0\rz\ês\Ï\ïƒo\Î>…z‡%žK£~(\å«UY\ë÷:Àkl\é¢œ9Ý°¯ìš»\Ì\åpŠv\0q\Ä\Íg_’/\í\Æ+¬œF\Ìykµ\'„[•gÃ¦§¡\0\Õñ\Z7$\Í#žøö]ùä‚`j8²\ÊnUl\'Zù}\×|Yx=\äDU[\ë–ü•\ë\ï-aŠõùf§kO!Ñ‡J°©Qj\Ú[6Â¼‘HaEž3&¯CR\Õ\Ä~\ç\ç[žc\Õ6´O¹\É\ëF\í=\Ï¨mª–nh½Ç‘F¡\Z¼{¾‡+!\Õ›\çPÚ‹ýžN!‡:3\Ð\Ç8f“¯?¡©¶°5³[O­†Ç²»€SlG\Ò§±inˆó—\Õ#Q>=€¬\Û\åA`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?ÿ\Ä\0,\0\0\0\0\0\0\0\0\0 !1204@\"#3`pÿ\Ú\0\0ÿ\0h>`#\"m\r±ÿ\0!È´©¯‡{½Ÿ\áe)\Å<Z³\ÂÖŠ\×\"D®lK\Ëþ/QR3K÷R\Ñzþ†QÑŒR³2Ù¢m‹<°—OKk\â\ïOX\ïC“ \æL\ÌJ\æ°KE\ë¾V\Ó\\~=oiœ²R5†ü\Ù`kQŒÀ‰QJ~D\Ê–q‰+@	v1G0\Åò!¹)„|[YV¨\àq\èÝƒG\Ò85x¿½“t\å…G\áicYsršY‡SZŠ‹\ï¤i\é¿\Ã ðÔ­\ß\îœ{\ëL\Ät\âx\ëi\ÆxL+÷\Ó##\Ø\Õ\å†ùc¸Ÿ\ØÂ‚\Å	[ðh\Òv‹\'‚@\ÛÜ”[¶È”\rý÷­òE\í§1k*·…š\ÎÁ\éñÈ’DJJ\Ê9‹D\Ò\Ñz\ëü9­›ž\Õ+\Ö tøƒ·\Óø~––÷T~\ãüõŸ9µÿ\0¢\ÂqilÕ£@-=Š:”mb)½-I\Ã7`±¬„tkg>©«û“\ä¹gV¯ß§ü\ÕEq€%M\ÝM4°Ú¥p\êÆ£¤WZ\Î;54÷ðµ\àúô`±ù\ÖF:\×bWºŠþ\ë2™QDw%bô\Ç_¹k~[\ä\ãX\å¢\ãqöbüpkA}\ËN\r_4\ìu¦\çCU¬W‹k’\n«\Â<\ì\ÓÁ^CKVÁ-rY>ö\Å-4>Lô#›:\Û|\èûP¾e¹0°Y•\Ò5ò\ÊÎ–TABG¨¾¾Ü­V\Ö\ê:\êk\Öwu9)«Uiÿ\0[ÿ\Ä\0&\0\0\0\0\0\0\0\0\0\0 !1\"2A#0@BPÿ\Ú\0?ü’\à\Þ\Ð7ö¼\Â\ëY\ÇÊ‹ÛƒQH\\h\àùTmk\Í\èMD9Þ¥xnsý½&?aÀ7\È\ëA›Æ®¦úmD\0aA©±\îu\êM(\äh\ãÙ¿´\Ç\ÐÁ\à‘A6\"»M6/GB>hTD†šQ·ö9¨oWr,¦¢µ‹‚Fu©\0\á´]ÿ\0oÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0 \01!P`ÿ\Ú\0?ø•¼aR}&I\ÈE§%\Ú´!	©Ð‚\\\îü¦[0·þ\'ÿ\Ä\0?\0\0\0\0\0\0\0! 1AQ\"2Raq#Br±Á03‘’¡¢\Ñ$@b\áCS`ps\Â\Òÿ\Ú\0\0?ÿ\0TUg·X£ûA\áü\Ì\Ø;XMµJ}œ9ÿ\0&\é²F†\Ù\ZH\är\è\æ\Ùð\Ù%€\ãDÂŽO¦Â„>ˆŸ\ß\è¹²õl2[Su;Ð»Æ¥\ãc|¸RK\"”D7ÏŽ\ÉT6„nñÖŒÝ¡‘ÙÅ¾GR\Ûv<õu·b6\Û2Hl¢ˆS\Ñ\Ç\ÈRÈ§0~ú7ö&+¾Ö¡\ì7šŒ\Æ\ÌCwµ%÷·[f{\äk­aE=ºóZ½jLÁ¡\è\Äa\r¾Œ¤\ZÁ\â4d%M·I\Íz»\Ùaj[s\àEE\Ðð\í/\Z\\J\Â.&²Ù\Ûr’I¯úE[£W<KÔ‘ðS•,ˆw~{l«\Úw5>\ÓÎ³©4ð\ä\ë&Íˆ\Æ\çÙ«ú.ø(#Ä°·1º¸\ì\Ä\ì_õ5\ÓhO…‡²ÛF\Är©˜w©\Ù·–\ÜòH¶øO=bû\Ô\ÜT\ØNjlvC\Ä\Ö8\âºó½a•\nŸ\Z0¹»&\ï-ƒ$\Íañ¨\ïü²ÿ\03qû«\ÖK¤Hy´”ò¤šB8\Ýi8\ÖH\Ò,\è4-vn\×;òÚ™\×}ª\ê\ì ºVc¾(2›©\ãª\ÞÎ‘\ê_\ìu\Ìy!øP*.\à-K~\Ö,©˜vB\ç±\é²\æƒ(€ï¶¡÷¾GTh‡9\Üj\éí®¤\Ï÷Þ­¤&!\Íh<M‰u²?e…ªñz\Åð\ßVu*|ib\'Õ¹µ¹Zœ¥\Ã÷©\×?¸~¼(¼†\Ê*Ë’\Ò($c/Ž®¡Q\æ/ZCcL£c\Ùðó¨\Õd‹P«?ú¨º\é\Ú\îx\ZÍ“ðÿ\0z\Ã0½¸\ÖaÏ™¢:!Ÿ<\ëF8V\æ1Â›\0s¢\Íí›–3“Ê¡Ž/»VŽyLŸl¼Åª/|Ph\ÉÆž\Ï:\í97\Ødm\Ì-A\ë\"õo\æ)<þ[/\ÖI\ÔA\âhB…QÎ½#J\ìœ\ì}­ž·Y\Î\ä\ÍzV’0D€Ÿ\n\éXu\äü†¨¿\å_Ž\Ã\ìŸ=F\Üs\Ùô\Ý5¬\ÈwH?zÁõs\rñ¾G^q\ÊwF™±¦\Ótò€\ê§\Ç\ïC¦\Ê%D<v´‡Ÿ­(l75ŠOS/ûk„_\È\ì\ß\0\Ôrsvž%1V‹I\Ò\â^\êË—\çV—I\Ò\ä^\ëK—\åV‚%O!V‘U‡\"/_Q\àeš Iñ5e½¼\ï©O-…2{´Q\Êòo÷sÿ\Ä\0*\0\0\0\0\0\0\0!1AQaq ¡‘±Á\Ñð0@\á`pÿ\Ú\0\0?!ÿ\0¨\Ã\ì–\"v©\ÚØ¥ý	\Î\Ó:	\Ã\å$}ÿ\0M \0‘JfÕ´”¹“‚v†CJ˜\nT‘°?¸\Ñ4(·;ºÿ\0\Û<¦•1N-?4?‹!Ÿð®Y\Ë,š\Ã&NaŠ¶\n@‰³\æõa\æ÷ªvÀö:\Ö×‹\ÓXð¶ûžÿ\0\" \ìSS\Èx^Zy\×\rý”†ÉÛ³ñz%[¨c‰‰=#|+\î\Ã\Ävùú »(\Í\à§Y8ÀÓƒ&\Ã\è\nY\Æ³½FPs?Tm_\r\nL\ÊY\n½Ù•úa\â;B£kjti\Ì\Õ06\Ë<ð¨ûWr$Ð \0 , b+ÁI˜ø)\â1cø¨+pÊž«š4\ïg\æ(x\ß\×T€A#ˆ\Ò=‡?Ÿºv˜Œ\í·z^½\ß4\Ì[õB­\îW´\n\ÊB9\Ò\Å\È\Ö\Ä\Ó:\à®m(0$ƒ\Ò\ßUnM³½F¨6§ož¸!ñTÉ’˜õPÀ­¥íŒŠœgÁ}\Ú\Øc\æ¨9N\ã²0Í€\Åhµ+\ÃD¾£\ËÞ›k–±±¥\ÉGE\Ð.\Ça±·s †\"e6û­÷ú•Àž\\\äÎ†™$\ržŠ†	œ§\é\ÇWùRb%0`S Iû\Ö1H\\\à~\é\Ømv¬À|¾^¤\ã\ÂV#´Ò«+-³nf´ÀÑƒÙ§pOµD\Ì\êEL… /#Ò¶¦\Zp\Ï80ND\Êz\ê`¿:„‹‡\ßFÿ\09BC)8j»\Ôu†.kW _¨¹*>š\È\ÇüC((‹\ìjT\Î\îA¹\ÐN+ô…â€­–ü©šR(/jA’-E,jB\í¯hö‰sU!\Z¯.›¡¾}w2§\éu¤Œ\Ô\Ø~h$\\\nGŽ\ÌV\"\á§G–y=H}köwv%\ëÍ­\ØúTO}\Æ£ˆµv `a:«CPfŠ!D³YLk&Õ¿\\ñ\é\Ýñ\ì\ÉbCŽ‹”k\Û\'HÀ \É\ÓCO\Ú\Ù[¯\ß\'RL²4Ž2õ¥…x™\Ð\î³}*rI(òùô\íI\ÌÊ§j9z\Ñ3\ëj¹§Ú…ˆ:iS7\Ñ>»-\r¾—\ê€fc^só\ÞtÙ†1\ÃPtMP\â\êçœxR9^-ç–®:\æ\è\à\Ðb\î4\ÈJU¸ûÕ¥†¾]	\Ìòsöö8¨! Ÿr‘“dAŽ-ÿ\0®ÿ\Ú\0\0\0\0\0\0ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó¿|ó\Ï<ó\Ï<ÿ\0\Ï8W\Ï8»Ÿ<óü±¯|óˆ=ó\Ï \Ë?_\Ï,Ÿ<÷t´Ç¼\ÓNß½\ë)_N[»\Ë$ó‡\Üó÷\ÔóO<ò\Ï·\Ï<ó\Ïó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ïÿ\Ä\0 \0\0\0\0\0\0\0\0\0\0\0!1 0AQ@P\Ñÿ\Ú\0?ü’-Tg•Å«B\0\éñÕ†\Çqµë‹ˆ\ânz®uºBÐ £Ž\ÃhÁõ3Eô.¦–5\Í`˜T\Âp´\\²ª1¥\ßEi˜)+HcQ/¬®%wÀ±#\0¶T{®2ÀYÑ®Sa_\ì¥\î\0\×;kŸAŸ\Ýÿ\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0 !10A@PQÿ\Ú\0?ü_>;\Õ\åOzµ,\Ñ‘X;9<iG©CE¥N\Éoj6û¥¬hVN\Å÷O¡£¢§±0N*%8?©\ë\í./£o“m¼ö\Åu¥µ_»ÿ\Ä\0+\0\0\0\0\0\0\0!1AQa q‘¡±0@Á\Ñ\áñ`pðÿ\Ú\0\0?ÿ\0”\0Õ ŒfNNqµ<1p‘\Ì6\Ù\×\Óû›YŒdecžŠ$þdÙ¡œ\Ù\n²–0\Í)MµB—²bý¬ºµ4R2º ©ô\ZÞƒ%Åµ\ãFZM´4?Clð¨þ|Pëˆƒx%tTÀÄ\Ãú*\ÜaØ¥\å\Ö¨±ÀL\Ê@o\nö2P«\0TA\n6‘ópiç £#	Ic¢%\å!÷\Ûe¦lñ{ø\èü0¶±<L{ŽùS\ÆQ\Çz<C\ì\Ð5]ªXš\ßP˜¤Bn·J\ä<$‰‡²H$T²\rO¤H;r¨{¡\íÆ€BB¢~:LB\ì¿ ½÷+[4A]ö\È\ÔƒIµˆ7™µ^ÀÑ˜\Ùf \Ùb;*\æ¹\Ï=\îûNl§\Ñø;\Òñ¤¡`n­ƒ\Í\rü<kÆ¼TGÁ”—b;ðøHù¥4 —Sc}I&•\"lƒˆF†\éÔ™¼ü£•Å±š‚\0@²DB9’~Š5-\Õ3ø\'\ÚóE˜\à27&Þ‘C7¹\×ôJ†‰‚[­Æ†A&û‘\Ýi5&\×R¯+\âŽúÁS\Êx\ØÒŒ  &\ÍJ!#bpy\à:ö\ÝÂ„Á¢]\àõz¼FÌ«\ì‚iò</\È$+ÌœÔ&#ûG´z—	\ÖeÄœ\Ú\ëo>J\ÎÏ¼£™\áÔ‡Zr´jXhNi XIOlû\à‡À{=:®\Ï\ZÃ„\ãD\ÔjjÀ\Ò\'\"&\â=Y°	WB›…]/‡\ÐAD	`Ù€ä©¶\Üpž)1\0´¯h| ð›v\Íy;\Z\ãox¥¡p‰¤\â@\"Éº\nYgUI_B\r\0òl0\ë}\à¡\Ã\×	ò‹û¨Tù˜½J\ç\å3¯v¼ bd\ÎK½Pp‹Œ>F)l@ñ˜r_\Í\\\Ý%\ã\ÐE(#@¯ð‡\\BÈ•„I\æX¢!·0R\ÊHb\Ë?‰õCºi\ÉQ\ì²õ6%\Å™Z%uaF-\àŽŠ\ìXžbošd¤º¬­)O\rŸ\Ø(`¬~bU<Ž)‡\ÔU’¨:‰‘\á\ë\"üaÛjkMd\åg\Ôú¤‚izh‰(¦p¶Àù:!´º6xŸ£«\à\Æ{ \n$u¶‹)Ê²ºª\íO ‘šE÷\Û\n\Ï?/š¯ú\è)\Ê\Í/Šn*ü\Z\Ì\á\æ\Z`ûF€\èS\Ò\çT±??ºñ¶•W\ì²õW;\\\ÆÔŠð\n~O§T#SItòJ\ÛeÏº5\Ì¶\Ö\àø iŸ»@ù~·‡¤‹´;(I¯\Å¬\Z\Z\á}‚ò³?\à{\êaObQCD@GÆ…\æ)$¬Á€}\ãj\"Ø½—À“\í\ì$/pGé¡6\â\0#´Oû®\ÆÕ¸4ž.\\*@F´\0x‚^¦ ü²g‚_>2H@@\Ùe‘\Þ\Ð\åõ8¥”\Ðó(\ên\Æ\Ôvð—\ÈO\è\à!	?ŽÁj_‚\Ð$?\Ò6eB\ÂYc–\ï*\ë\Û\ÄC.BþXm„\ã°^8qò\Õoÿ\0¢sƒ	}ñ€Í…©6\0B\rV\è\Ú \0\0Àv3J\ÉÈ§’jj`…v>„o@\É1°Y¹üù6 \0\0\ZV\ÂÄ–_±\ÙÃ‚HOÿ\0w©”<b@ô¿7ö‡¦¬Hdƒ°(\"·`ƒd	ù¡ƒ\0ûG\ÛAF w„\Í\0ˆIq?¢Œ˜\0€\í‚	\Z\Å/§=(Ê´\0v¨8Ø“F%¼F\åøvw\Â\Æd\Ä}µl\Ênl;ÛŸÿ\Ù'),(3,'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿþ\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 90\nÿ\Û\0C\0\n\n\n\r\rÿ\Û\0C		\r\rÿÀ\0,\0\ï\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rðbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Ú\0\0\0?\0ýR¢’Š\0)i)h\0¤¥¤ \0R\Ò{\Ñ@I@ükžñ\×\Ä/\r|4ðüúßŠu»=J‡‡º½”\"\äôU\î\Ì{(\É=…\0t4t¯OŒ\ß¾(¾ß†>\ZvŒ\ë”ñWŽ\ÚK(Ñ¡²A\çÊ§=\\\Â8\àœÕû9ø“Å»¤øƒñk\Å\Z\îã“§xu\×A°Q•8gnWø§n¦€=o\Ä2\Ð|\'l÷\Zæµ§h\Ð\"]B\î8Pub\\\ë^kªþ\Øt™fˆüE\Ñ/\åŠ?5£\Òg7\í·\Ø@“\ì9ö©ô/\Ù7\á‡§7|>\Ñ/.Ž\í\×Z¬\Ú¶\æ\ÜÅ¤¸.\ÌI\îNk\Óô\íN\Ò#T±°¶²EP¡m\áXÀ·\0q@9\'\íw\á–´\Z7†ü}\â%º\0¤¶\Ô\Ò<‡|ðÆ¸> ‘V\îÿ\0i&‚\äƒ\ágÄ‹½\ÌXô¥F>ñ\Ý ÿ\0zW²`zP@ô Ô¿j-%–ó\á\ÏÄˆ¡\È\ãð¼\Óm÷\Ûfü¢\Û\á½k=G\Åxj\éY¢ñ6•y£\à¿\Ý\æ\ê\Ç\â{F¥Cueo}	Š\â®\"=RT§ð4Ÿ\á\ß\èž0°[\íX°\Ö\ì˜·:u\Ò\\FÀô!‘\Íkõ¯ñ\ì—ð³^¼7ðøN\ßÃº·;uO\Ë&“t¤‚3¾Ù“=O\r‘\ê+O…ÿ\0>3Á_bñu‚g\Z/\ÄA4„q€—\ÖÁ$\\pdŽ^œ\ã4\îô¸¯_\Úv\çÀÓ­¿Åjÿ\0\âÝ³ûz\ÝÆ«¢“œn¢P\Ñ\×÷\Ñ \Ï\í\Zˆô¿iVúž¨\Ú\ê\Úm\Ê\î†ò\Êe–)ª²’\r\0h\ÑE\0~QE\0QE\0(¢Š\0J\\\ÑE\0&ii;\Ñ@IKIü¨\0 °&‘œ %˜\09$\×\ÎzŸ5\ß\ÚV\Ôü3ð\ïTºð÷\Ãû	\Ú\×YñÕ¦\×\Ò)\Ã\Úi„ðq\Ñ\îz/D~`\Ðø\ß\ãÖ£ªx®\ïÀ¿\n´¸|[\â\ëgòµ-Jg#H\ÐI\ên\æ_¿(\àý™˜G]ƒš·\à/\Ù\ËM\Ò|A‹¼o©MñÇ¨2šÖ±\Zù6$õ[+aû»e\ëÊ\çø˜\æ½ÀŸü?ð\Ó\Ã6š†t«}#J¶H \\nc÷\ÏWv<–bI<’k¡\è(\0\njSIE\0/ZNôE\0´\è –Š(\0¤ \ZZ(’D’£#¨ta†Vz\Zðÿ\0~\ÌñxoV¹ñ\'\Â=\\ü5ñ²y\×6\Ñùš&¤\Ýþ\ÓeO6-’õ=+\Ü\é\È\Å\0x\çÃ¯\ï¨ø¢/|@\Ñ\ÛÀ\Þ?*Z9dó,ud_½%…\Æ\0”¦3‰º\ã“\ì`ƒÞ¹/‰¿\nü5ñw\Â\Óh&Ó…õ“º\Íˆ\æ9­¦S”š\rŠy¤Àšò\ï|Lñ\ÂO\éŸ\r~&O&£¦\Æ/xÝ,zžÑ‘iwŽ#¼\nùe‘†%(\ß\è¤=9¥\0QE\0QøÑŠ;\ÐøQIK@\0QGz\0)	J	\Åx\Å_k¼sqð—Áš”\ÚVŸd±\É\ã?Z\Ò\ÞA•°·q÷nfC’Ã˜£m\ßy”Pf»\â\rKö«ñ^©\à\ï\Ü\\\é¿	´™¯ˆ|Ch\Å$\×gS‡Ó­$+#J¼žcR2Æ¾„Ð´-;\Ã:=ž—¤\ÙA§i¶q,6ö–Ñ„Ž$UG\0\n‹\ÃÒ¼\áý?C\Ð\ì \Ó4‹V\Þ\Ö\Î\Ù6Gj0EjP\0h¢Š\0(¢ŒPE”\0´RR\â€\n))E\0QE\0QE\0\Î|@ø}¡|Pðÿ\0‡<Gb·ú]\âmt$«\ÆÀ\åd‡)\"]pT€A®ŽŠ\0ðÿ\0‚~=×¼7\â{¯„ÿ\0/>\Ý\â­6\Ü\Ý\é\Z\ã¨A¯é¡¶‰»´G•Y”wea\Ãq\íõ\æ_þ\Ü|Iðµ­Î‡s—\ã\ãûSÃš«‚>\ÏvªF\Ç#“ªZ)¡W<diüø§mñÀVz\ävÍ§\ê\É%–©¦Kþ¶\Âú&\Ù<=UÁ\î¥XpE\0wdQE\0QE\0)i( £šJ€<\ß\ã\ï\Äû…\Þ’\ïI¶MC\Å:¥\ÄZF§\Èp.µ	‰X”ÿ\0²¸iýˆÚ®üø[kð‹ÀVšw¨\êR;\Þ\êÚ¬\ß\ëu\éNù\îú³“\ÙB¨\à\n\à-”|Tý¬.¦“l\Ú\Ã=5a…‚­¬_.\ç}£¼VªŠ7tûS`w¯z¨h4”¦€\nJ)zPE”\0´sI@ –Š(\0 RR\ÐEPEPEPÚ¼SSðöŸÓ¯!\r†>%\Â\Öw‘¯ú¸µ«h÷C1Œ\Ö\èñ“\Ü\ÛÇŸZ÷\Úñ?\ÛL•¾jþ ²ˆKªøF\â\Û\Å<r%³•f`>S\ËF²\'ø\È\ï@\Ö9–«iš…¾­¦\Ú\ßZH&µ¹‰&Š@1¹§ŸPEY \n(\í@ò¢Š(\0¦JÊ‘³9\nª	%ºO\ï\\\Ç\ï7„>|B\Ö\ã1‰´ÿ\0\ß\Ü\Å\æœ)u·r ýXø\Ðû Á.¥ð®ó\ÆH\Ëy\ã]rÿ\0\Äo\æ}\ï.YŒv\Ùù˜qo\r¸À<\08¯q\Åq\ß¼.¾	øI\à\ÍV1ý™£ZZ7”0¥’V {O\ã]z\0:\Ðh¢€\n(¢€\n(4PGj(\Å\0QGZ\0(¢Š\0(¢Š\0(¢Œ\ÐEPX\Þ2Ð¡ñG„u­\ä1¶\Ô,g´”!\Ãm’6Cƒ\ë‚kf›!ùhÉ¿d­~\ãÄŸ³7\Ã»¿;\í«\á\ë;[¯´\Èg†%†R\ÇÔ¼l\Zõºðÿ\0\Ø\Ýo-þ\Ú\Ø_\È$¹\Óu½sN,3ŒAª\ÝÄ£Ÿd\î µv¢€\n(\Å\0W‹~Ù’\Û/\ì\Ïã¨¯\ã\Ú\æ\ÚF\ã9ón\"Œ\Í\Å{Mxí“§®«ð\"\êÉ‘.¼A\á\Ø—¨\r­Ø©þt\í6%­´p\Æ0‘¨UÀ`T´\Ô-:€–Z3@Q@J(¢€\n:\ÑE\0QÒŠ\0(¢Š\0(\ÍPEPEPH\Ã\"–Š\0ñ?\Ù6úK¿ø\Ú9…µñÿ\0Š`Œ(\Ç\Ëý±tüû\å\Í{mx\ì|?\âWñdgñ+\Ä8Ÿ\é9þdŸÆ½ÿ\0\0t£­PE¢€\nñ¯\Ú\Âþ+O†:D2\ç\Æ>Š<¬5\Ë9ü«\Ùk\Â?l_ù\'\Þÿ\0±ó\Ãúv¶ w\"Š\0QTõMb\ÇC\Ó\ç¿Ô¯ °²K\Ësu\"\ÇkÜ³\0\æ¾5ø\çÿ\0ZøIðº\â]7\Â\æ\ç\â.²‡i\ZC³Fôi\Û\ïÀ‡=h\íj+ò_ý¾k\ï‰w“\Í\à‡7ú.™:·Ž\Ã\ÃSÝ²¡|\é«v9\n=+ˆÔ¿j_Û§@a.£g\â\ëH€.Z_©PRO‘\Ó\ë@µôW\áÖ‡ÿ\0hý¡|0$µ\ÔntMfX\Ü\ïþ\Ô\ÒBHž«û¦õ¯Eð¿ü·\ÇzuÚxB\Õm˜®³\çš\ÒE\äü\Æ@}¸ûE|\ãû#~\Ü>ý­­5}&\Þ\çAñ.œ‚[­ù\Õ\ß\Ê$,n¼:d€x£ôwZ\0(¢ŒPEKYÖ´ÿ\0\é·:Ž©{o§iö\Èdš\ê\êAQ(\êY‰\0­\0]¢¾Qñ÷ü÷ö|ð6ø\ãñ|¾%º\\\æ\r\n\ÊIûùhÁc=1\Ãw¹¯ž|]ÿ\0·ð\Ô34~øi«j ‡\Öo\â´\'\×\åŒKü\èôÒŠüš›þ_â»‰\Ø~i\ì«\ÕN­,¤\Â!V4\Ïø-GŠ#½·}_\á%¬zvð&k}JE/}»£\Æ}Z\0ý]ü(\ï_|ÿ\0‚£|øÅ©Å¤\ß^\ÝøW•¶\ÅˆU#‚SŒ\ágV(?\àes\Û5õÝ­\ä\Ö\Ñ\\[MÅ¼ª9b`\Ê\êzGPÔ‡šZBp(\Â?d(Txs\âL\àa\çø\âbþ\åucø\ê-{\Åx/\ìƒ.|;ñ.2½¿\Ä«g¡Ý¨I #ð‘Z÷ h\0¢Š(\0¢Š1@jñ/\Ú\Þ\Ã\í_ô+†”F–^4ð\Å\Ãd}\áýµf˜öûùü+\Ûk\Ä?m8Ÿ³_‹\î\r\ÛXÿ\0g5Ž¨·	\Ö6¶¾‚\à\Î!\Í\0{p Š\å~(üMðÿ\0Á\ï\êþ/ñ=ò\éú.™	šyO,Ý•1À¹5\ÓZÊ“À’\ÆÛ‘Àea\Ü•‹\ã/\0øw\â…­‰´k=r\Ê\Ú\ê;Ø­\ï¢F³Fr´ðH>´ù¹7‚>1ÁOüSe­kBó\á—À\ËW?e³.|\íAA$J¨@9\ØlNv†9\ÏÙ¿ÿ\0bƒÿ\0bVðß„-gÔ¶…}WUÿ\0Kºo}\Ï\Âs\ÙŠ÷(`Ž\Þ5Ž$X\ã@QF\ÐÚœ\Ý(\0ª\0\0p1F\ÐzŠ\Ï\×üG¥xWJŸSÖµK-M€n–òþ\á †1\ê\Î\Äøšò¶ý°>°fµñ­®£sŸM¶ž\î \ã\å’(\ÙXq\Ô(_\âG\ì\Ëð¯\â\ã\É\'‹|¡\ë7/\Ë]Ij©p\íªaûú\×\Í\Þ;ÿ\0‚Aü	ñait”\×ü\'?ð;PócüVerôo‡?j…>*\×E°ñîŠº\Ã\àÇ§^\ÜK‰sœyqÍµŸ¡û ô¯R\Èö •dø\'\ç„d\Ï\ê\Þ$\Ó5\ÍS\ÄZ\Ýõ«X,÷ª‘G\r¹tr¡«r\Äö\àsõP ô¯>ø­ñz\Û\áøzóYÓ¦>\Ôo—O½Ö£a\åilüC$Àò#gùôRW<\Z\0ô\Z)© ‘C+dx4\ê\0Jü¨ÿ\0‚·?Æ¯x\ÛKðö› k_\Ù%…ôx$š+«“÷þÑ³8e S\Û$dž?Gþ5|L‡\á\Ã-{\ÅRÀo%±€[5û\×7.\Â8b\í#\"þ5\ÒxzMF\ã@\Ó%\Ö!Š\ßV{hšò+rLi1PdU\'’¡²µ\0~~\ÏðL‹Ÿ\Zn\ï\\²‡\Þ\Ú\íº\Ü\ídÿ\0\Ë;|†<s–*=\Í~†ü ÿ\0‚Tüø_%­î¥¥\Þø\ßVˆ\Ók³î€¸\êDqžÍ»\êk\ìp÷®+\â7\Æ\Ï\0ü$…dñ—Œ´?\rC$p\êW\Ñ\Å,ª:ùq“½ÿ\0\à \ÐÆ‡\àøf\Î;]\'ÃºV—o\Z„X¬ì£‰BŽÀ*Šµ\ámTµ’\ÚóH±»·a\áž\Ù{‚0k\Ë\ãý¯¾Jª\é\â\Õh™‚Q§\Ý+\×!¼¬Wað÷\ã7>,@\Òø;\Æ\Z\'‰B y#\Óo£šH‡\ë\É\ÔpÀh\Â>5ÿ\0Á5>ü_±­¼6¾\ÖX§\á\Ü[\á»n‡˜\Øzü ú^\á¯þ\ÐðNn\á½ÿ\0…ÁðN\ß÷—Ö)Ž\ïL‹9yc‰™Šm8Vd89\Ô~“\Ó%‰\'£‘UÑVV Š\0\ÆðGŒôˆ~Ò¼K ^Ç¨\èÚ¥º]Z\Ü\Är®Œ2>„t#±V\ÛŠ\Íð\ç†t\èöúN…¦Zhú]¾\ï&\Ê\Æ†òÅŽ\ÔP\0\É$ñÜšÓ ý›n!:Ÿ\Å\ÛHwn·ñ\Õù“8û\Ï»ñÿ\0}W´×‰|\ÒWFø¡ñ\î\Î%ñ|7?1d\Òlô÷jöÌQ@E­\0QEyW\í;\ãMSÀÿ\05i´²øTž\ÛEÒ§\ÚO•sw:@’p\Üóôþ\n\0¯\â\ï\Ú[\Ãú\'‰\î|/\á\Í\'Zø‡\â«S¶\ëJðµºOö6\ì.\'‘\ÒOû/ n>\íy\ÆŽúŽ§ð\Æ:\ÄÏ…\Þ&øy¥kz=Þžº\ã›mR\ÆÙ¥‘Zv·‘š,3™“g,+\è†\rôO…>\rÓ¼7 [-½•¤`<¤6\æR>y\ån¯#¶Y˜òI5Ÿñ\×RM\à\Ä-FH\Ä\Ég\á\íB\á£p0Ki8\èh‚z\ÝÏ‰~øV¼ \Þ_hvW30¼\Ì@\í\É5\ÚWðsH›\Ã\ßü¥\\cÏ±\Ñ,­¤\ÇM\É)ýEv\0Wš|`ø\Ómð\Ýl4}7O“Ä¾8\ÖKG¢ør\Õ\Â\Ër\às$ŒxŠà¼­À2H\Òñ^=\â?Ù»M›\â¥ñ\Â\Úþ­\àÿ\0j0¬z»­\äWQ®6E$7\Õc¶//¹\ÎNh\Â~\"üó~\'|Ö¾.k’ø\ÇZ\Õ|RE\ÆK&“§º\ÚO5½µ¿\Ý™£Œ“h\ÜFqXß·\í\Ç\ãÿ\0\Ùo\âwƒü3\áY^iº…º\ÝKy¨A#­\ë6›x<¶]®\0?1Ì‹\Ç7§|mðwÅŸˆ?u	\ë¾\Óu©•\á»\Ó<Q\áK\ìw–w‘8xnV\Ú\ãYC\'\ä®ƒÁ|ks\á]?ˆüC\'Š\ì\Ñ\Ì\ÚTV7603B\Íp\n#;z¯Lœf€0¿j/ø\â?€~k^+ð­§öŒ\Þ&Ñ£6\Zœ+,-Û¬w6Í‘\ÎQ™Xz =@!\Úf¡®~Ç·÷^ º¼ñÁ	¤Ý§\ë2.o|0Xÿ\0¨º\ê\ÒZdü“r\Ñ\çkü 0\äu\Ø>;|uø½£k“ü8´ð\ï€ü+8¼\ÑôŸj©\×:˜R©yp Y‹$AŸdjW“’\Äð=žo…¿<Kf\ã\\ø¹>“$Š7A\ám\n\ÎWŒ2\æ\í.Y”û\ãúP¬\éZ­¦·aõ…\Ô¶S ’›y‘È§£+>¢ ñ\'‡´\ß\è7\Ú6±g£¥\ßB\Ö÷6³ d–6e#\Ó\á?³7\ìÅ­þ\Î~*ñr\Çã‰µÿ\0\ê\Â9\ì´i­\ß\ìW;˜\È\ê±\â5\â5E\ã\îñ_D\n\0ð¯\Ù;P¼\Ó<;\â¯\0\ê7s_\\ø]¹\Ñ`¸¸r\î\ÖGÙ†c\É+o4I“\×m{­x7\ÂŸµÇ»X~KyC½d\ê\ÏdQ›ñX£ð\Z÷š\0ð\ÚeF¹\âÏ‚þ\á\ÓSñŒ7³\Ä:´6pMpO\Ð:EŸ­{°\ã5\á\ß;¯\Ú\Ãà­›\ÆÃ¦x‚ùY»0KHø÷Ä§õ®\×ã§üAñ#\á~·\á¿x‘¼%«\ê‘&¬‘»˜“\ÌS\"ŽŒ7 dÜ¬ÝA\ÅüMø\á¨\ë ›\á\çÂ˜\à×¼t\ß%þ¦\Ã\ÌÓ¼7ÿ\0–\×L>ô˜\Î\È\æb9Ú šò\íGöqð_‡þ>|\Ð/,\Äz³®«\â}c_\Ö\"Y\ïu[»d‚8žW ª÷e•È»À®\ëÀ?³/‹<\á]\n\Ã\âGü!Vv\Ùh\ìü\r¡\Û[À\ÎO\Ìòµè»–V\'’\ÅÁ\'9&¹?Š¾:\Üø»Á~+Ð¼a\ákº–k9µk4Û‰\í\å@—³4%\ãu*r\n”žÀ\íƒÿ\0¾ý—¾8h~µð*\ëºt¶°^^\Ý<\í²¤Ž\Ê\Ý@\ÆWoV\È$\ã®\Ïö\ÝøE\áýs\Â^ñ½œRxw\ÅZ_ˆô˜\á\ÖtŒZß´771\Ú\É™>l˜8#tj zox«\ÆW\ía{\â\ÏÙº?\ê,–³\éÚ®¨ý\Ô\åd®N„r:\ã>,\ê?þ,x\ÛÀ1\'Á\íN\ËÁš&¢ºÎ¡gu®X$—÷Qg\ì¨\åe`°\Ç!¶Qp¼r\Ýø+\â÷ˆ¾øú\Ç\á§Å‰\ã¹}H\ìðÇ\ÕVú\Ñm®|°\Þƒ€v\Ê2Wiùk\è*ù\Ï\Æ_\nþ\'þÐººŽ\äð\çƒ<-rTÏ§\è\áµK\æÁ$¸•\"q\Æcb;b½ó\Ãú$\ZÐ´\í&\ÖK‰m¬mãµ‰\î§y\ådE\n\Èä³¶,Ä’rI\Í\0hQEñ´:¿\Ä\É?kÿ\0Œþð4V:<:ºi\Z\Õ×ŠµHM\Ìzl\"\Æ;lCn\Ì\í\Ú•G–Å·-z”Ÿ~,i\âÿ\0Gø\ã¨\ßjMó-§ˆ4+9\ì\ç;JB±HŠGË•|Ž¼ô6õ·ý­|3v›\ß\Æ^º\Ó&}ÍŒ‹<\'§\'Êž\ç¾HQý\ÚöÀs@Gð¯\ã¯­x²ÿ\0À^;\Ð\"ðÇ,-–ùR\Òs=†«h[a¹´€\Ä\á\ãu…—9	õ\Êñ\Ú.Ù´üñ}¤y¾\Ó|[o¥\È\à€M¥úµ¬«\È9\ÚÀ\Çúºöú\0+Ç¿i©\â·ð÷ä•\"_hE‹ôÿ\0Ô¯a¯ý°´É¯g¯_ZÀ—\Ú\ÙõûdxÌŸ=\Äw8\0s\Ê\Ä\Ë\Ç÷¨\ÙK]\Ç\0zšùKö™ý¬>k_>#xcFñ®y¯j\ZE\æ•k\n\ÜM$mÈ¥ G#|Ç…cÒ½Kö•ñÁý–>#\ëZÒ‹‡ð¥\íÕœ\Ð¿›fee÷Á\Ís|9¡i?²©a¤Y\Ú.c¤Z­‚BŠÑ¤a¢Pÿ\0»ß¾h\Ý4H\Z\ÛH²…¾ôp\"¨P*\ï4Š¨\0`zR\ÐEP\0@£Q@(\ÅP¥R7N(\Âþ„½ý¥~>_\Æ\ä¤W:6œ\ÊGñ\Ç`²?	\Ô~\îµ\å_~k^	>9\ÕüIöo\í\Ïø’\ïV‘-œ¸Ž\ß\r¬eŽ2D0Çž2GlŸU ø–‚\×ö»ø+y+Šm\Ä6Q\çø¥+g ÷\ÌN\n÷ƒ^\rûT9ð¤\ß>\"/–#ð§‰mþ\Ø\Ò\Ê\ìIØœñ·\ÎG\ÏO’½\ÝX2\äŽ¹ QÇ¥PF¥f€ÂŠ( Š3E\0x\íi\â\àWøW\â\è¬\ïu+­+\ÆC†œŠó\Ý›[›o)2®[\Í\n2ÀdŽjo\Ús\Å:Št¸> ü \Öü\á]Nò=>\×\Äwz­\ìis)ž;i¢Wo”9%Cü\Ük~\Ô6\çP\áUœl«,Ÿ4yF\ã\Ú\'y›\ëò\ÆG\ãQ~\Û\rþ\Ì~5·•·Q\Û\ÛZE³s=\Ó\ÜÄ°\'w˜W\èy\í@¿i™\æ~\évÑ¬³\ê=\Ò8gµ w»‘½ð–\íÇ¸¯j¯ñš\ÂWûNü)ðñ\Û\"øgI¿ñ=\èuDŽ«gmüY2]\àÿ\0«\ã½{\Õ\0G\\\Ñ\í¼A£_i—°­Å•\ì[O€U\ãu*\ÊA\ê$U\ê1@û/N5ƒ|@\ïSðt\×\Õ-\æ\Ú|\Øaù-Ü€V[Vù;\Íy=þ½q¢þ\È\ß¾k\×\ßh\×þ¯öd†o–It\å•Z\Æ\á²yn\é¹\Ð×¦|g¶?þ#Y|e\Óó…w\äi6¶Aò½©`–úÿ\0nÝ˜=LL\ß\Ü\Âþ\Ý~{;?i0\Â\×Z\î›}\àN6;V\ê\Ûi~\ÈÍ€A1Ý¬%s\ÚF\0ó\È\×0J³Â’!¬\Z’¹O„\Þ#_ü.ðŽ¸ª¨5&\Òì¢¶\à…\áV+ŸbHü+« Š( Š(\Å\0QE\0E \Å-£\ËüPð§\Äÿ\0‡ž$ðó\íu›	¬^@2Sz=Á þ7Ã½3Y\Ñ|\áý?\Äw6÷ºõ¥„_\\Ú‚\"še@®\ëžpH\'ŸZè¨ Ž´Q@Q@Q@Qš\0ñ‹Jº÷\í	ðSC\Û‰eqªx†t|–3oþº^“\Ý+#\ÅWðüdø\ä4¹\çŽ\ßÀŸ\æ‹W\Õ\îdp±]j\Æ&x!f\é²\Þ63>O\ßh¿ºjø\Î\×\Ã\ß¾%ø\Òý˜\é_¼\É˜¸\ß<“]KŒ‚R\Ö\03ùs^§ø;U\×ü=\àƒ÷rH5¿\Zù¾5ø‹v†[Fui-r9t­°ÿ\0S½@ Tý›#Ÿ\Çz×Ž>-\Ü\Ç4vþ-»Š\×BYø#F´R–\îò¢Y^\æp?»*š÷z‚\Ê\ÖH­­\âH-\áAqF¡U\0\0\è\0\0Tô\0Qš( \ßh\ZŠü?©hšµª_iz´–—v\Ò}\Ùb‘JºŸb	ò°Ú–¹ûx¯\Ã÷s\â…z¼6ó\Ý\Î\ê\Í*i—p]A;ÿ\0\×KTŽpr[½}¢Fk\Â4M2/Ú§\âNƒrO¦x«\Â\Ún©=¤Œ\Ì$x\Þ\â\ÒRP¸hü•8…\\\Ð\Ï\Ù\n\ìÁð^\Û\Ã\ì\ìòxgS¿Ð·>Ü˜¡¹q\ã\Ö„\ç¾sÞ½®¾dý™|\rwð\â\ç\Ä_†÷Z\ÝÖµ¦jYø£Džñx\Ör[³…mmWvrU×Œƒ_M\ÐA¢Š\0(¢Š\0(¢Œ\Ð9\âOˆ\Z/…5¯\é\Z…\Ë.©¯\\µ®ŸgM,³2¡wmª	TEg8U\È\É\éxž\nëŸµß‰®n¤Bþð…½„,Ä²‹Ë›‡¸‘Fp3öH3ò¨\Íz?Ž>#xsá¶Žu?j°iv¹\Û––w\ì‘F ¼Ž{*O¥\0t´W”h_´¯„õMN\ÃN\Ô\ìüE\á\ÝBt¶²OhWV1\Ü\È\ä\Ñ&tò·¹`e\Ã\ä\ãh<W©\\]Gko$óH±C\Z—y‚ª¨$“\Ð\n\0–³õýjèº†©sò\ÛX\Û\És*Z\Âó\ÊÊŠX„glA$ðk\ÉO\ís\àG‰o\à·ñ-ß†G2ø¢\Þÿ\0e\Ä3Ã™\Ìctô\Ñ %€\ÍzÆ‡\â-/\Å\ZU¾§£j6º¶›rà¼±f†U<†WRA\Ô\Z\0Âž)\Òüo\á\Ý;^\Ð\ï¡Ô´B¸µ»·m\É,l2­jñÙ–!¥[üJ\Ð!I§h\Þ4\Ô`²U\0,QL\"º1‰%ÌŠ`{E\0QE\0QF(\0¦–\Ú)\Õ[Q¹V7ÁR(\ÚBX\à\0<š\0ø§\Äz¿‹|\rñfòHM\Ìþ7ø­e\áˆ!tò\Í\Ì6·Vv.ªG,-nœôW<s^\Ñû4À\Þ-\Öþ\"|L¸Vgñµ&¦³’vi–\Ö\Ð\È\r ¸—þzu5\å\0?g\ßøc\àg†þ2][]\Üø™ôI<d¶÷:”òið^\Ü[4\Æu·g1¬»)p3Á=k\ß?e¯Ÿþ\Íÿ\0ô\ÖH£’\ÙµK´*\ì\ßR\ÌI=\É4\êTQE\0QE\0\á\Þ0xô\Úû\áÆ¢\ÐF¹\ágD3™6³<r\Ú]F¡‹\ç\Û,k\Ük\Ë~?ü8Ö¼s\á\Ý\'Sðœööž7ð¾¢šÖ…%\ã2\Û\É2£\Å%¼\Åyò\æ†Yc8\é¼\Ô…ñÝ¿\á\rø™ðŸ\â|°Z\ê’xgRe\0¢j!Y‰#…º†\Ó\Ün$wÛƒf¾0ý£¾,|Bø©ðg]ðÖð»\Ä\Þñ-”qêº­þ»n±iöIf\ëv~\Ít¤­ÌŒðª @~ñ,¯­ü\âK_xKEñ‹+\Ùj¶0_\Â\ÈÛŽX\ÕÔƒ\Üa‡4³EP\0h¢Š\0(\"Š(\Èþ(|?ñL:\Ñ~!øû>\ë\ÄvV’iZ†«\\½µ®«b\î$\ç\"9ŠX\ä‘ö0\ÃH¤\rÛ—7\à\Çì¿¢|.ñˆüYuö}w\Ä:½\ì×jW\Ð4—\ÖI1\r%±¸g!\Ð0J¤xU\0ƒÖ½¸Œõ¢€(\êš5Ž³o:…œ±C<W1¤ñ‡	,n9\0=YU\ê¬\\Z\Çyi%¼Ñ¬°Ê¥7¤`‚;ŒTÇšJ\0§¥höZ&‘k¥\Ø\Ú\Ãi§\ÚB¶\ÐZÄcŠ%PªŠ;\0\0\0{W\Î>6ý—¯|)ñŽ\×\âÂ»\r\Ã]Ž\ÖkV\Ñ\äÓ¬n\'˜:µ\å\Û\Æ\Ï	¸\nÆ„°É“¦>›\Í!\Ä|øh¿\n|\ro¢\É~ú¾§,\Ó_\êz¤«µ¯og‘¥žb¿\Â\Ø\árp¡FN+¸4Qõ Š( Š( 5\æ_´Þ¾|/û<üG\Ô\×nøtÝ\Ûh,Ð²¨Ï¹a^›^ûd}·Wøc¢xOLmµ/ø›K\Ñ\àšKSr‘þüN\îÉ‘•X\íÝŽH\ã4\íh\Þýõ	\ÙùBþ÷D·ð…ŒhkOt©c@ ž²‚\0ô¯r\Ñ4\È4M\Z\ÇNµ‰a¶³-\â‰>\ê\"(UQ\ì\0\ãz7Àx‡\Äþ\Öþ&|@-M\çûB\ÇE\Ó4ˆôûx,s\È7<’\ÃŠX(l6	½ÁF4\0¹¢Š:PEPA4Q@\\[Gqo,2.\è\ÝJ°\ÏPF\rx\Ç\ìs-ŸÁˆ|1r\Îo<ªj“\ÌVK[™#·#q$ƒo\ä0ú×µž†¼+\á¸ÿ\0„ö›øŸ\á†_&\Ï\Äö\Ö~/°P>V“`²¼Ž» ·r2Nf\Ïz\0÷j(\Í\0QE\0QY^\'ñ-‡„4\rCZ\Õ%xt\ëZy\äŽ\'••dˆ7\Ðk\å\ëø(\ïÃ¿k\'Eð%Å¶¹¨g\ëY¹:e¢Ž\änF™ñ\è‘r(\ë]\ÃÖ¸_ülð\Ã\ë\è´\íOTiõ™—t:>™m%õôƒ dA\n³…\Ë˜€9\ä×KñK\Ä>?ˆix¯\Är\é²?”tß†þ\r¾†II\à†¾¹Fù?\ÛA\ç;«¨ðwˆ$øc=\Ã\ï\Ùû\Å^\È7\Ëuª\Ëgiö¦?\Å5Ô—J\íœd°cõ\Æ(¯\ÚcD\Ò\ÌRx“\Ã~-ð†Ÿ\'R\Ötg[T?ô\ÒHËˆ‡¼›G½w÷\ß¼5¦øI¼Os¯\é\ÑxxD&þ\Ô7(m\Ê„889\È\Æ:\çŠò½GÆ¿5;8Ž›ð·Âºc1Ä‘\ê\Þ(i\Ûn0FØ­À\ë\Ð\î<vÁ\é	üq§\ê1j‡\àoÃ…\Õ#¸7h\ÖúÜ©n“ôYV@\à÷ \\´ý \ìµ\Ø\ÚoøC\Æ>\"³U,\×Vú3Z\Æ@\'•7F&q‘°6F=Et¿¾,øk\â\\WCG¾q}f\Â;\Í.úµ½´|gl°H\×\Ø\ã¨$s^{eñ3\ãVš°C«ü\Z³Ô˜!]h^\'ƒi}\ß.\È\çD;võ%³‘À ñ‡ñV\Ðü[z·>0ø%\ãx/\íµ\Í*\Ú)n\à\\ˆ§³¸3ÿ\0(ëž†€>Ž=ik\ã]_öŠ¼øAi5Þ›\ã‹\ßh6 \É>™\ãj6·qF:¨Enmõ–\'¿zôo…?¶N“ñ>\ÓN”øÇº0½eX®gð\í\ÄÖžŽ³Æ¬¦3Ùˆrq@BQH:R\ÐEP^ñ‡Šÿ\0j…\\I§\êž\'»R„\íb©gm\Îx$\ÏpyòÎ½Õ›¼ö{|Eøñ3\â›m’\ÇQ½O\rhR\í\Î\í?O2+È­\Ýd»–\èñÁ§žÀò8–Ž‚Š\0(¢Š\0(\ÍPEP^ûL\ãÀº\ç\Ã\ïŠ\è8<-©ý‹Y”\äcI½\Û\î\Ø\ê±I\äM\ÏA¯¼VG‹|+§x\ß\Ã\Z·‡õ{u»\ÒuKIl®\àn’E\"uüA4¬­¸qK^/û1ø¯Qjñ-\Ã\\x¿À\×F½žN\Zö\ÜôKÁ\ê%„)\'û\ë \í^\Ñ@¢Š(\n\î\Ïz\æ<ið\ÃÂŸt£§x—\Ãúv³iÈ—v\ê\æ&\ì\è\Ø\Ê0\ì\ÊAuP‹[xo\â·\ÂûA‡¬X|DÐ­Iòt\Ýsu¾ª\"#[À\Å%`2•n7?V­(h½\"\Ñ\ãƒ^ðÇŒ|9tCŽ\ïÃ—wGŽ¹ž\Ý%ˆûü×«\âŒ\n\0òøj…Z%\Ì\ß4\r>&$cQ½[GRFIv²ž\n±ÿ\0\r-ð“òSüÿ\0ƒ\Û_þ.½{{¥+4L§ød@\ÃõªðŒ\èÿ\0ô\n±ÿ\0Àtÿ\0\n\0\á\'ý§~D’”øá›·7´VZœW\ã\Ù#fcø\n¡qñ\ÏRñ$‚\ÛÀ~\×|E#Ž5-V\Ýô:>Ÿ3Ip¢G\ç÷Q½z®‘edI¶³··\'©Š%\\þB®b€<‚\×\à\æ±\ã\ÍBGâ†±·¤ö\Þ\ÒÕ¢\Òau «J¬w\Ý0 \æü€€B¯]H\Â\0\0€\0\éN¢€\n(¢€\n(¬ø\ßFøq\á=WÄž ¼[\rM®.\'`X…•G,\Ä\à$\0É 9ý¥¼q©\é~\ZÓ¼\áY|q\ã[ƒ¤\éÉ³ˆŒ\Ý^·¢C\æ\Ï÷\Ú1üU\è\ÞðV™ð\ïÁº\'†tx¼3I³Ž\Î\Ý]ˆ dž\ìq’{’My÷Àÿ\0\ëZ\Õ\æ¡ñ\'\ÆZwögŠu\è\ÄVšT¸g\Ñô\Õba¶,	c¬\ãltA^¿@Q@j(¢€\n(£4\0QFh\Í\0QE\0x¯\Æÿ\0j^\×,>-xWNŸR\Ötx¾Ë­\é6‡/ª\é%³\"ªÿ\0ÐŸ\ßG\Ü\ít\ë+\Ôü%\â\Ý#\Ç^Óµýú-OG\Ô![‹[¸)\"„\" ‚5ª\Ã5óþ½¡j³&µ¨x«\Â\ÚmÖ¯ð\ÛQ¸{½{\ÃVn4©œ\åï¬£´ly–\ç?:\îRô\áh\Þ;ðÞŸ¯h\Z”\Z¶‘ž\ÚòÙ·$ŠPGB ‚V\Å\0QFh\0¢Œ\Ñ@Qš\0(¢ƒ@QÚ€\n(¨\æ™!‰\Ý\Ü\" \Ü\Ì\Ç\0Ô“@\êz®‘aq{{q¥¼m4\×0Te™‰\à\095óßoÚ§\ÅZo\ÄJ¡ø]£\Îeð¶‘yC«\Ü)\Âê³£\Ë1ƒ\ä#Ix%@Í–òÿ\0ö\Æñt–V» ø¤O¶\æ\ì­\âÛ´<Ä	²‡\Ì\Ý%a•¾›¶·Ž\Ú†(\Ö(£Pˆˆ¸U\0`\0@(E´Qž(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢–’€\Å!\0ŽiOJ\0x‡‰¾\ë~	ñÿ\0Œ>\ß\Ûhzµ\ä¦\çTð¾¡»ûYs’\ÎBü\ÖÓ·üöŒO.[¿¾>\é>;\ÖeðÆ¯cu\à\Ï\ÚÇ¾\ë\Ã\ZÁUŸoy-\Ü|—zI=·<W©\Z\â¾(|!ð\Ï\Å\Í\"?Y3\Ïk\'Ÿ§\êV²otùÀùf·™pÑ¸õ¡dPjzQ_>\ØüUñ\'\ìûs‹ñj\áµ_	³ôïˆÀDh¹\ÂÇª*ŒA\'\Ýx\'\Ï;A÷«û}N\Î»Iâºµ‘O‡IŒ†VG Š\0±EPEPE\Z\0(£5\ËüCø—á¯…~}k\Å\Z½¾“bF†RL“H~\ìqF2\Ò9<PIô Š\î\î+igžh\à†%/$’°UE$’x\0õó\Äú†©ûZ\ß=Žœn´‚±Ÿô­QCs\â’	D†Ž\Ì\ãç—†”aS\nKPø7\Äÿ\0´¥\â\Þøö\Â\ëÂŸ\rU\Ã\Úx2F1\Þ\ê\ØnS\Ú~XŽ2-A\ä7\ïs÷+ß ¶Ž\Ö\á…(cP‰\Z(UU\0\0:\n\0¯£\èöZ—i§iÖ±X\ØZD°ÁmŽ$Q…U€\0*\íPEPEPEv Š( Š( Š( \0óEŠ\0(\ëE%\0Cyc¡m5µ\Ì1\Ü[L†9!•#© ƒÁv5\âŸ³]Ï\îg¿øAâ»‡³J\æg\Ðeƒ\í\Ú\ÎN[ý™L%Žr\Ð:u\Î\r{µ&(Ã£ø¡ñƒÁl\Ñø«\á:x¢\Ý3KÀZ¼3P	\Ú\ÞO@U]ý‰«ûVør\Îx¢Ö¼\'\ã\ß™#2o¾ðôŠ¸\ÆA0G g\é\ï^\ÓF(\Åô\ï\Û+\àÖ§nf\Çv\ê	—°\Ík\"ãƒ”•‡N\â§¶Áv`£\â>„Xñ´õ«\ØÔ«(e=A\ïQ}†\Ür-\âû\0xÞ©ûgü\Ñ\â2O\ã»)\0\Ç\Ëi÷\rùG\ZGý¬<;¨ž\ZðŸŽüa+ u]3\Â÷p+e¶\æ]¬©`\0\êk\ÚñF9 \r“[ø\ãñŒZ^¢ü)ÒYN£¯\\\r[T\\ô)k)÷i\Üg)ž‹Àß³Þ\áo/‰õ{\Ëÿ\0\Zø\ÏiQ\â\È&š\0~òÛ ;t?Ý‰W=É¯Q¢€\nZ( Š( ’–Š\0(¢Š\0(¢ŒPE\Z\08 Pih(¢Š\0\rw¢€\n(\ëFx Š(\Ï€\n(\ìh\Í\0QG¥\0Q@\äPŠ(\Å\0QF(4\0QF3E\0QF(\0¢ŒP(\0\ÅƒF(ÿ\Ù'),(4,'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿ\Û\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿ\Â\0\0\È\0\Ò\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0µ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0#*Éš\é€\0\0\0\0\0¿¹\Æ\Å°\Zu\Ó[ÛŸr}—\Å\Â5\0a3c\ÉWä–—²-ŒŒW \0\rz\ês\Ï\ïƒo\Î>…z‡%žK£~(\å«UY\ë÷:Àkl\é¢œ9Ý°¯ìš»\Ì\åpŠv\0q\Ä\Íg_’/\í\Æ+¬œF\Ìykµ\'„[•gÃ¦§¡\0\Õñ\Z7$\Í#žøö]ùä‚`j8²\ÊnUl\'Zù}\×|Yx=\äDU[\ë–ü•\ë\ï-aŠõùf§kO!Ñ‡J°©Qj\Ú[6Â¼‘HaEž3&¯CR\Õ\Ä~\ç\ç[žc\Õ6´O¹\É\ëF\í=\Ï¨mª–nh½Ç‘F¡\Z¼{¾‡+!\Õ›\çPÚ‹ýžN!‡:3\Ð\Ç8f“¯?¡©¶°5³[O­†Ç²»€SlG\Ò§±inˆó—\Õ#Q>=€¬\Û\åA`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?ÿ\Ä\0,\0\0\0\0\0\0\0\0\0 !1204@\"#3`pÿ\Ú\0\0ÿ\0h>`#\"m\r±ÿ\0!È´©¯‡{½Ÿ\áe)\Å<Z³\ÂÖŠ\×\"D®lK\Ëþ/QR3K÷R\Ñzþ†QÑŒR³2Ù¢m‹<°—OKk\â\ïOX\ïC“ \æL\ÌJ\æ°KE\ë¾V\Ó\\~=oiœ²R5†ü\Ù`kQŒÀ‰QJ~D\Ê–q‰+@	v1G0\Åò!¹)„|[YV¨\àq\èÝƒG\Ò85x¿½“t\å…G\áicYsršY‡SZŠ‹\ï¤i\é¿\Ã ðÔ­\ß\îœ{\ëL\Ät\âx\ëi\ÆxL+÷\Ó##\Ø\Õ\å†ùc¸Ÿ\ØÂ‚\Å	[ðh\Òv‹\'‚@\ÛÜ”[¶È”\rý÷­òE\í§1k*·…š\ÎÁ\éñÈ’DJJ\Ê9‹D\Ò\Ñz\ëü9­›ž\Õ+\Ö tøƒ·\Óø~––÷T~\ãüõŸ9µÿ\0¢\ÂqilÕ£@-=Š:”mb)½-I\Ã7`±¬„tkg>©«û“\ä¹gV¯ß§ü\ÕEq€%M\ÝM4°Ú¥p\êÆ£¤WZ\Î;54÷ðµ\àúô`±ù\ÖF:\×bWºŠþ\ë2™QDw%bô\Ç_¹k~[\ä\ãX\å¢\ãqöbüpkA}\ËN\r_4\ìu¦\çCU¬W‹k’\n«\Â<\ì\ÓÁ^CKVÁ-rY>ö\Å-4>Lô#›:\Û|\èûP¾e¹0°Y•\Ò5ò\ÊÎ–TABG¨¾¾Ü­V\Ö\ê:\êk\Öwu9)«Uiÿ\0[ÿ\Ä\0&\0\0\0\0\0\0\0\0\0\0 !1\"2A#0@BPÿ\Ú\0?ü’\à\Þ\Ð7ö¼\Â\ëY\ÇÊ‹ÛƒQH\\h\àùTmk\Í\èMD9Þ¥xnsý½&?aÀ7\È\ëA›Æ®¦úmD\0aA©±\îu\êM(\äh\ãÙ¿´\Ç\ÐÁ\à‘A6\"»M6/GB>hTD†šQ·ö9¨oWr,¦¢µ‹‚Fu©\0\á´]ÿ\0oÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0 \01!P`ÿ\Ú\0?ø•¼aR}&I\ÈE§%\Ú´!	©Ð‚\\\îü¦[0·þ\'ÿ\Ä\0?\0\0\0\0\0\0\0! 1AQ\"2Raq#Br±Á03‘’¡¢\Ñ$@b\áCS`ps\Â\Òÿ\Ú\0\0?ÿ\0TUg·X£ûA\áü\Ì\Ø;XMµJ}œ9ÿ\0&\é²F†\Ù\ZH\är\è\æ\Ùð\Ù%€\ãDÂŽO¦Â„>ˆŸ\ß\è¹²õl2[Su;Ð»Æ¥\ãc|¸RK\"”D7ÏŽ\ÉT6„nñÖŒÝ¡‘ÙÅ¾GR\Ûv<õu·b6\Û2Hl¢ˆS\Ñ\Ç\ÈRÈ§0~ú7ö&+¾Ö¡\ì7šŒ\Æ\ÌCwµ%÷·[f{\äk­aE=ºóZ½jLÁ¡\è\Äa\r¾Œ¤\ZÁ\â4d%M·I\Íz»\Ùaj[s\àEE\Ðð\í/\Z\\J\Â.&²Ù\Ûr’I¯úE[£W<KÔ‘ðS•,ˆw~{l«\Úw5>\ÓÎ³©4ð\ä\ë&Íˆ\Æ\çÙ«ú.ø(#Ä°·1º¸\ì\Ä\ì_õ5\ÓhO…‡²ÛF\Är©˜w©\Ù·–\ÜòH¶øO=bû\Ô\ÜT\ØNjlvC\Ä\Ö8\âºó½a•\nŸ\Z0¹»&\ï-ƒ$\Íañ¨\ïü²ÿ\03qû«\ÖK¤Hy´”ò¤šB8\Ýi8\ÖH\Ò,\è4-vn\×;òÚ™\×}ª\ê\ì ºVc¾(2›©\ãª\ÞÎ‘\ê_\ìu\Ìy!øP*.\à-K~\Ö,©˜vB\ç±\é²\æƒ(€ï¶¡÷¾GTh‡9\Üj\éí®¤\Ï÷Þ­¤&!\Íh<M‰u²?e…ªñz\Åð\ßVu*|ib\'Õ¹µ¹Zœ¥\Ã÷©\×?¸~¼(¼†\Ê*Ë’\Ò($c/Ž®¡Q\æ/ZCcL£c\Ùðó¨\Õd‹P«?ú¨º\é\Ú\îx\ZÍ“ðÿ\0z\Ã0½¸\ÖaÏ™¢:!Ÿ<\ëF8V\æ1Â›\0s¢\Íí›–3“Ê¡Ž/»VŽyLŸl¼Åª/|Ph\ÉÆž\Ï:\í97\Ødm\Ì-A\ë\"õo\æ)<þ[/\ÖI\ÔA\âhB…QÎ½#J\ìœ\ì}­ž·Y\Î\ä\ÍzV’0D€Ÿ\n\éXu\äü†¨¿\å_Ž\Ã\ìŸ=F\Üs\Ùô\Ý5¬\ÈwH?zÁõs\rñ¾G^q\ÊwF™±¦\Ótò€\ê§\Ç\ïC¦\Ê%D<v´‡Ÿ­(l75ŠOS/ûk„_\È\ì\ß\0\Ôrsvž%1V‹I\Ò\â^\êË—\çV—I\Ò\ä^\ëK—\åV‚%O!V‘U‡\"/_Q\àeš Iñ5e½¼\ï©O-…2{´Q\Êòo÷sÿ\Ä\0*\0\0\0\0\0\0\0!1AQaq ¡‘±Á\Ñð0@\á`pÿ\Ú\0\0?!ÿ\0¨\Ã\ì–\"v©\ÚØ¥ý	\Î\Ó:	\Ã\å$}ÿ\0M \0‘JfÕ´”¹“‚v†CJ˜\nT‘°?¸\Ñ4(·;ºÿ\0\Û<¦•1N-?4?‹!Ÿð®Y\Ë,š\Ã&NaŠ¶\n@‰³\æõa\æ÷ªvÀö:\Ö×‹\ÓXð¶ûžÿ\0\" \ìSS\Èx^Zy\×\rý”†ÉÛ³ñz%[¨c‰‰=#|+\î\Ã\Ävùú »(\Í\à§Y8ÀÓƒ&\Ã\è\nY\Æ³½FPs?Tm_\r\nL\ÊY\n½Ù•úa\â;B£kjti\Ì\Õ06\Ë<ð¨ûWr$Ð \0 , b+ÁI˜ø)\â1cø¨+pÊž«š4\ïg\æ(x\ß\×T€A#ˆ\Ò=‡?Ÿºv˜Œ\í·z^½\ß4\Ì[õB­\îW´\n\ÊB9\Ò\Å\È\Ö\Ä\Ó:\à®m(0$ƒ\Ò\ßUnM³½F¨6§ož¸!ñTÉ’˜õPÀ­¥íŒŠœgÁ}\Ú\Øc\æ¨9N\ã²0Í€\Åhµ+\ÃD¾£\ËÞ›k–±±¥\ÉGE\Ð.\Ça±·s †\"e6û­÷ú•Àž\\\äÎ†™$\ržŠ†	œ§\é\ÇWùRb%0`S Iû\Ö1H\\\à~\é\Ømv¬À|¾^¤\ã\ÂV#´Ò«+-³nf´ÀÑƒÙ§pOµD\Ì\êEL… /#Ò¶¦\Zp\Ï80ND\Êz\ê`¿:„‹‡\ßFÿ\09BC)8j»\Ôu†.kW _¨¹*>š\È\ÇüC((‹\ìjT\Î\îA¹\ÐN+ô…â€­–ü©šR(/jA’-E,jB\í¯hö‰sU!\Z¯.›¡¾}w2§\éu¤Œ\Ô\Ø~h$\\\nGŽ\ÌV\"\á§G–y=H}köwv%\ëÍ­\ØúTO}\Æ£ˆµv `a:«CPfŠ!D³YLk&Õ¿\\ñ\é\Ýñ\ì\ÉbCŽ‹”k\Û\'HÀ \É\ÓCO\Ú\Ù[¯\ß\'RL²4Ž2õ¥…x™\Ð\î³}*rI(òùô\íI\ÌÊ§j9z\Ñ3\ëj¹§Ú…ˆ:iS7\Ñ>»-\r¾—\ê€fc^só\ÞtÙ†1\ÃPtMP\â\êçœxR9^-ç–®:\æ\è\à\Ðb\î4\ÈJU¸ûÕ¥†¾]	\Ìòsöö8¨! Ÿr‘“dAŽ-ÿ\0®ÿ\Ú\0\0\0\0\0\0ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó¿|ó\Ï<ó\Ï<ÿ\0\Ï8W\Ï8»Ÿ<óü±¯|óˆ=ó\Ï \Ë?_\Ï,Ÿ<÷t´Ç¼\ÓNß½\ë)_N[»\Ë$ó‡\Üó÷\ÔóO<ò\Ï·\Ï<ó\Ïó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ïÿ\Ä\0 \0\0\0\0\0\0\0\0\0\0\0!1 0AQ@P\Ñÿ\Ú\0?ü’-Tg•Å«B\0\éñÕ†\Çqµë‹ˆ\ânz®uºBÐ £Ž\ÃhÁõ3Eô.¦–5\Í`˜T\Âp´\\²ª1¥\ßEi˜)+HcQ/¬®%wÀ±#\0¶T{®2ÀYÑ®Sa_\ì¥\î\0\×;kŸAŸ\Ýÿ\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0 !10A@PQÿ\Ú\0?ü_>;\Õ\åOzµ,\Ñ‘X;9<iG©CE¥N\Éoj6û¥¬hVN\Å÷O¡£¢§±0N*%8?©\ë\í./£o“m¼ö\Åu¥µ_»ÿ\Ä\0+\0\0\0\0\0\0\0!1AQa q‘¡±0@Á\Ñ\áñ`pðÿ\Ú\0\0?ÿ\0”\0Õ ŒfNNqµ<1p‘\Ì6\Ù\×\Óû›YŒdecžŠ$þdÙ¡œ\Ù\n²–0\Í)MµB—²bý¬ºµ4R2º ©ô\ZÞƒ%Åµ\ãFZM´4?Clð¨þ|Pëˆƒx%tTÀÄ\Ãú*\ÜaØ¥\å\Ö¨±ÀL\Ê@o\nö2P«\0TA\n6‘ópiç £#	Ic¢%\å!÷\Ûe¦lñ{ø\èü0¶±<L{ŽùS\ÆQ\Çz<C\ì\Ð5]ªXš\ßP˜¤Bn·J\ä<$‰‡²H$T²\rO¤H;r¨{¡\íÆ€BB¢~:LB\ì¿ ½÷+[4A]ö\È\ÔƒIµˆ7™µ^ÀÑ˜\Ùf \Ùb;*\æ¹\Ï=\îûNl§\Ñø;\Òñ¤¡`n­ƒ\Í\rü<kÆ¼TGÁ”—b;ðøHù¥4 —Sc}I&•\"lƒˆF†\éÔ™¼ü£•Å±š‚\0@²DB9’~Š5-\Õ3ø\'\ÚóE˜\à27&Þ‘C7¹\×ôJ†‰‚[­Æ†A&û‘\Ýi5&\×R¯+\âŽúÁS\Êx\ØÒŒ  &\ÍJ!#bpy\à:ö\ÝÂ„Á¢]\àõz¼FÌ«\ì‚iò</\È$+ÌœÔ&#ûG´z—	\ÖeÄœ\Ú\ëo>J\ÎÏ¼£™\áÔ‡Zr´jXhNi XIOlû\à‡À{=:®\Ï\ZÃ„\ãD\ÔjjÀ\Ò\'\"&\â=Y°	WB›…]/‡\ÐAD	`Ù€ä©¶\Üpž)1\0´¯h| ð›v\Íy;\Z\ãox¥¡p‰¤\â@\"Éº\nYgUI_B\r\0òl0\ë}\à¡\Ã\×	ò‹û¨Tù˜½J\ç\å3¯v¼ bd\ÎK½Pp‹Œ>F)l@ñ˜r_\Í\\\Ý%\ã\ÐE(#@¯ð‡\\BÈ•„I\æX¢!·0R\ÊHb\Ë?‰õCºi\ÉQ\ì²õ6%\Å™Z%uaF-\àŽŠ\ìXžbošd¤º¬­)O\rŸ\Ø(`¬~bU<Ž)‡\ÔU’¨:‰‘\á\ë\"üaÛjkMd\åg\Ôú¤‚izh‰(¦p¶Àù:!´º6xŸ£«\à\Æ{ \n$u¶‹)Ê²ºª\íO ‘šE÷\Û\n\Ï?/š¯ú\è)\Ê\Í/Šn*ü\Z\Ì\á\æ\Z`ûF€\èS\Ò\çT±??ºñ¶•W\ì²õW;\\\ÆÔŠð\n~O§T#SItòJ\ÛeÏº5\Ì¶\Ö\àø iŸ»@ù~·‡¤‹´;(I¯\Å¬\Z\Z\á}‚ò³?\à{\êaObQCD@GÆ…\æ)$¬Á€}\ãj\"Ø½—À“\í\ì$/pGé¡6\â\0#´Oû®\ÆÕ¸4ž.\\*@F´\0x‚^¦ ü²g‚_>2H@@\Ùe‘\Þ\Ð\åõ8¥”\Ðó(\ên\Æ\Ôvð—\ÈO\è\à!	?ŽÁj_‚\Ð$?\Ò6eB\ÂYc–\ï*\ë\Û\ÄC.BþXm„\ã°^8qò\Õoÿ\0¢sƒ	}ñ€Í…©6\0B\rV\è\Ú \0\0Àv3J\ÉÈ§’jj`…v>„o@\É1°Y¹üù6 \0\0\ZV\ÂÄ–_±\ÙÃ‚HOÿ\0w©”<b@ô¿7ö‡¦¬Hdƒ°(\"·`ƒd	ù¡ƒ\0ûG\ÛAF w„\Í\0ˆIq?¢Œ˜\0€\í‚	\Z\Å/§=(Ê´\0v¨8Ø“F%¼F\åøvw\Â\Æd\Ä}µl\Ênl;ÛŸÿ\Ù'),(5,'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0			\n\n\n\n\n\n	\n\n\nÿ\Û\0C\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nÿ\Â\0RR\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0ŸÀ\0\0\0\0(”ñ~º¼),t¾¶ÿ\0{]»E‘\Ë**\í\Ë\çW\äò;\0\0\0\0\0\0\0\0\0\á}\ê˜\ï\" \0\0\0\0\Ü\Úd^7¸¤‹‡=€\0\0\0\0\0\0\0\03¬È›_ü\î\0¨—\ÄZ\Ç,©Å†DCW\0„bþ~±_€\0c \0\0\0\0\0+*Ê¨¨\è€HùŒ:ŸL\08Ü‘^2ÿ\0kL…Àf]u\Üy»À\0\01‘†@\0\0\0\Z6œ\í¯\0tZÌ‹ø}À\0\ç=\n\ê$”m\0XmyLBÎ€\0\0\0\0\È\0\0ªµ¬ž¶\0?Xmré³Œ€\0\0Ÿf´)\0J¨«)\ËW\0\0\0\0\0\0\0\0BŠØ²z\Ø\0m}QµË¦\Î2\0\0\0V¼)šÐ¤)\âÄ§-\\\0\0\0\0\0\0\0\n+b\É\ë`µõF\×.›8\È\0\0Zð¦kB§‹œµp\0\0\0\0\0\0\0(­‹®\Òe^­U\î×}ù\'3Œ€\0\0¯\nnCX•z´!W²žMû\Ó€\0\0\0\0\0~“F6Ö·Ÿ\ß(\'\Ê	ò€\Â| 0Ÿ(\'\Ê	ò€\Â| 0Ÿ(\'\Ê	óú€‚Ç¤/~‹û\ÍRY¹\é\0\0\0\0\ÓdC„?¿À\0\0\0\0\0\0\0\0\0vi1~\è?8\0\0\0\0\Ñbõ<F \0\0\0\0\0\0\0\0\0\0\è¹Z ½ó \0\0\0T½´T¹\Z@\0\0\0\0\0\0\0\0\0\0½óP\Íó\0\0\0¥í¢¥\È\Ò\0\0\0\0\Ë\ás„5\îg@¦]7~uh\0\0\0\0\Û\ß5\ß1\0\0\0*^\Ú*\\ \0\0\0oYtX¸.\Ê(\ÎT\È\0\0\0\0\íïš†o˜\È\0\0\0/m.F\0\0\0\ínv‹d)o,d\ã\Ô\Îô¯°\0\0\0\0;{æ¡›\æ2\0\0\0K\ÛEK‘¤\0\0\0\07f“Ý…\È\ç+²\nN¸(\0\0\0\0o|\Ô3|\Æ@\0\0\0©{h©r4€\0\0\0\ì\Ò{œ¹l\ã%vAI\Ë€\0\0\0\0\íïš†o˜\È\0\0\0/lõRE€\0\0\0\0\çðÁûºA;X€\0\0\0\0v÷\ÍEWªd\0\0\0<¼YF®\ã§\0\0\0\0\0\0\0\0\0\0FÛ„e“`\0\0\0\0DÊº¿ˆòT;p\é\à\0\0\0\0\0\0\0\0\Ìñ“OkM#õ\0\01`d?€*û¤\0\0\0\0\0\0\0€¶Œ@\0\0ÿ\Ä\0*\0\0\0\0\0\0\0\0\00\0 @5671ÿ\Ú\0\0\è—”R,\å\ãlŸ\ÉI0\Üó|<.öCš\Ô\à\ZÚº|8\ë\âÓ²µ\à#ÔŒš	ªü\Ò\ËTªÖ‡¿žye“µ*\Ó½KW%h\áV\Ø$?:M×µ3_\î+5-; \î˜Ð”\Ñ>rl\Ùh-Æ•\íUµ(8\ã§ûU\0\Ò!Ÿª—,\Êó`\æ¨\Z\Õ*lF\à¦û2\Õ\çÕ§>„zx‡k•A\nÁu\Ý\Åø\rª\ÈÂ´Ú¿ŠQ¨[˜¤aQ\ÕVŠ€\ÐÒ…Q¡t©\á1xšW\ì\âýµ\×\Ê$9Âª’yŒ¼\Ôt³\â\ÅG\ãWR¥*N\"Š8URSWS¿1l2ú~-\n\àfõÁM‡\Õ0­\0¶NyT¦QpdšÊ§YfTW@H[\ÎW3\0¦8\ÇUV¥kGÕ‘\ç‚³|cJ-±°¬M\Ð+\Óg\äÕ‰Ó®ˆóX…\ÝY™\\%;aÁ8WüÚ‚˜\0©i\ì\Ê\â@\Ê.¶¸@\\n¬\ÙÕŸüGTª]›S\\´/xC\ÍY\éw:³k\Òø1Ÿ^\Ê\Ô\Ú÷Nû\ë\ÝYµ\é|Ï¯ejm{§}õ\î¬\Úô¾g×­M¯t\á¾½Õ›^—ÁŒúöV¦×ºp‡\ß^\êÍ¯K\à\Æ}{+Sk\Ý8C\ï¯uf×¥ðc>½•©µ\îœ!÷×º®ƒPŸvvb\Øcf-†6b\Øcf-†\ÑQ¾H¨\í:BI\Ø3Ù‹a˜¶Ù‹a˜¶n#ª-±QôÕ®*%\n	\ì\Ñ@Ðˆ$\ã\Ï÷olololololololololololololololololololole9ýJ¦\Úd}h\ÇÍ°]j¾0ÁS„óKJB˜Uö2Õžœ\ÚI>¯BŒ“V-ˆ\îÊ‡\Äczþ\ã\"ð™´\êb\Ó\Z#zo»ƒýpÜˆ&±u÷a³‰¬Ìš\Ü\ÙQjó½\ÔZ“Nõ¹r6¡NòXl\é\Ô\Ö\å§\Ùû\Éÿ\0;nZ}Ÿ¼Ÿó¶\å§\Ù\î¢P\n\Ç\Õ7	?u9¤#!\ÕL\æ±kÆ¶ò\ÎÛ–Ÿg¸ˆH\Z.\Õ(}ºN~+¨h\Ì\è\ä+EýV®¸Ÿó¶\å§\Ù\îBb0jTü%\Ñ\Äÿ\0·->\Ïr\ç	dt	[;q?\çm\ËO³\Üo\ÆM\â¹´O¯Sÿ\0Šššz0$‹\Âž©¸Ÿó¶\å§\Ù\î\Æ5	\Ù[¹øš\êª;\Éÿ\0;nZ}ž\ìsûV_\æ\'™ºŸó¶\å§\Ù\î\Ç?µeþbpy›©ÿ\0;nZ}ž\ìsûV_\æ\'™ºŸó¶\å§\Ù\îÇ‘´\0ó\åø›\ÃhÔ ºŸó¶\å§\Ùî•™V˜µR\â•+]\Z$¹\Ýr*\Ý%­\Ôÿ\0·0(…¦woþ·\ÑB™,­Í„ ƒP÷¢\ÒTE#¹mÁGQ/‘\ê#4\É\×v.¶\" ·$“©Â£¨§~\Üiµ**\Û\ÎüvI:9/X§!½ô\ì$›Å¢æ©¤‰I\á´h\Ð‹ù\å–x~\ÒI_\â\Ï*Î¥.Yj;¥“U\0S\Ó\Ò\è³ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€ÿ\Ú\0?rÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€ÿ\Ú\0?rÿ\Ä\0R\0\0\0\0\0\0\0!01@Aat \"7Qqu‘•±²³\ã#25BRr”¡Á\Ò$Cb…’¢\Â\Ñ3Ss‚4PTƒ\áÿ\Ú\0\0?ÀŠ=Iº	„Î²\ÊJ]ñ¡Ð«¥^0¸Zð\ÐÒŸ®o€P\ÉÁPc \ÞQ\Ñ\Â{^\ê	b•\ê$p\å+‘ pTúLEu=u„iôwJ\Ô8…\'®Q$2\á¥Á@qt\"I\Ï\Ä|\Ø\ÞY\r\nÞ»À‡›þ\ÃA\ÑS\àñƒ\ßNø\Õh\ãw©cOl»a|7ÿ\0\à&#E µ8©Å¢%)\ÔxG(‡Ž9†‚òµÇ–sndFrI?Th.%Š@b«³pOf\ê‰G\ÝDà½”P˜^³r^þ\á”8(”Vù\'-—%’K\"{\"˜0\ÕbQ7i ‚$ª²¦‘J#Ej\ÍIp«8E²ª¸ZQ\ß\ÊL˜ñ\ì]@aë‹ˆq\Ï7P\ÕM¨>Rú&\ËD\ë\r[yfCZU#x\èŸ\Ñ0b,îœªR&™D\Ç9†@P\ãA«\Õ}s\'l}H^G<\Ù6~\îHô[\"\ZEx\ÔÃ©]=ø*7¬õ}Åš…²›\ÆLÁ|¦\ÊQ»U\×2´Xƒ¾üGx6poXFüÀG\Äþ˜\âT6±\ä¡VH\àb˜&Smak9¬EbÁšfó\Ö5¢‡\Çh(´R\"\à\Ë.\áQQeO|\Æ˜Ž˜!UZ\n»Å±‚E´L¦\Å\rº\Åt­)5ö\ÌS\Ñ\rø†A\Ë@+¤¢.ŒÊ½—4’Nõ,©\Ä\rñ¥N®*¦o5ŠVAø‹ûRu–`o=K\Ô5hùb\ßÓ©R\â\îlžB\040\Û;q½øF\ÖÔ°†õ)¢óo\nJ\Ér†5\Ïû\\#¦\ï\ÌT\çiHòQpñ\×A?‰±Q8Y…$Ñºa\â¦Í”\Ã|Ã”t§hñ¹I@’‰¨Y”Á”(µp\ìf\Ø\Ú&wp·bÌ—\ËÁ±¦‡VB©$H¶†ð=$Mhß¾õT\ÌS\Ê!Œ0e¢.b’	E\r°P	\Ö¦Uë£¬yý¡ž•8@Ù‘Š¢\ÄW/šžÀe\ÔF\nhD·LŠI„€¥‡ú‡V\ÚØ²z¬Ÿ¢™m °ù\Ù\0Ü»zhKµ•³Y²B\Õq”\í\å±Á£N<Ž²%n_ýpŽ™³§Ø¼‹}-Àˆ[±¿‡”n/j\ÌL“E\ës$|“¼;\ÃozŽ 1X®\ÍÁ‘T2”e¥ŽUÓŸR’\É8L=`40f\Í6œE“\å\0!\ÇJ\Ê\ro\éN\ÓF\×\Ú0\ÙX‘2H\0\'Ž$ŠùºN7\ìlG\Þ]+ö :•\á&¥9|\ZM˜¨ôf\Ò\Õ\ä{¾È\æ\Î¸yð™ò†\Ò\Ëf¿)0h>\êF:Z»º©ò\Ü\àû–= \é~\ë_ô\à\Ð}\ÔŒtµwuS\å¹Á÷,zA\ÒýÖ¿\éÁ û¨=\éj\î\ê§\Ësƒ\îXôƒ¥û­ÓƒA÷Pz1\Ò\Õ\Ý\ÕO–\çÜ±\éK÷Zÿ\0§ƒ\î ôc¥«»ªŸ-\Î¹c\Ò—\îµÿ\0N\r\ÝA\è\ÇKWwU>[œrÇ¤/\Ýkþœ´*°¹t’mW\ÑH-N\0\"2–0\ZyZ/\íù)\åh¿´å§•bþ\ÐO–žU‹ûA>Z3¬\ÐØ”PË±p\n¤UV ”D6u76\ÑZ\Äñòj6CB 5P œñ€\ÓÊ±h\'\ËO*\Åý Ÿ-<­ö‚|”ò´c\Ú	òSøšþ ¢ú’±r©D²4¶“Ñ«]dj\ÏS2¤u<!¶ˆÆ‚œ/¬5Š%ºž±´\Ã\íEººkh^7ê©­¡xßª¦¶…\ã~ªš\Úúªkh^7ê©­¡xßª¦¶…\ã~ªš\Úúªkh^7ê©­¡xßª¦¶…\ã~ªš\Úúªkh^7ê©­¡xßª¦¶…\ã~ªš\Úúªkh^7ê©­¡xßª¦¶…\ã~ªš\Úúªj»\Z—ºªcU)\ëp³7pUe\ÃcB¡­(•Á†Ej\ïÁ(#\r{\02\ë¨R…™\Îa\0l\ÑJ»Ø±[Dª\Å\Ì[fþ\Ð/´;\Ô<B&õW¨3QeŽ&1·\Ç	˜\r…\Öe”ŠÂ‚Ð‘SMdC\ìoú£\î¢5Š®?+†«†¤Å¾Œ¢‡%\Ù^Æ•Yä™·5ŒQt\Çù\Ê\Õú¡dv°\Ðqdu!ŽLˆµ\ÙL¿h?ùDbp\×%Y»„ÁDU \Ú1Fð\Ý\Æ[©bñ`\îfþ´\ÞvðLw¨*(q1Œ3o\áÎ»DW(\ÃÃ±²©\Õx\Ü\ë¤ª¦¦¥\Çr¡g\çlC\ÜQ\á\Ã\à®ôK.ç¹•·|ª(…\ÑÁ–\Å‡\áŸ\Ç‡8(\Û#\äŒŒ.3Fý\Ï;OœG™£~g§\Î£\ÌÑ¿Gv\ï=S„Ê P×ˆ˜l˜\Ãh)¢V\Ú\ëb ýT=	€‘¿j¼•\Ý\âj\ËQ\ÝM\ÊbþYSº£LŠ»=‰\"\rF\É9\ì2\ïÝ™gió‚\èó4o\Ñ\ÝY\ÕXA|3µ€¶R´Bù\Ç€\è\\«í€¤L¾Yj\Ö>3›/mH|Aªk ±lUIRÌ¦\r\nX\Ã\nq…?Q‰‡\êý$§“n¬³´ùÁtyš7\èî±ŠÂ¢s3FdE1•\í\Óf•X‘Óš\ç‰*™¶&6Îº³\Î\Ó\ç\Ñ\æhß£º\Ç*ù\Î\0w\r’]0ûxi]²9Àý\Ê(&¿ª³qn¬ó´ùÁt{š7\è\î¬\ë\\.\Ù\Û)\á¥>1wÂˆ\ÖJ¸ôn°^ó“62˜1v\Î\é\Ò\äM4\Ê&QCš@P\Ù¡YA„\ÃfV£)h\ÇO€dÛº²\Î\Ó\ç\Ñ\æhß£»B\áø’©·|©“vM¨T,6\Ã{·«\í\"J¦\Í\Êk(\å¹\r T@K+-›÷fY\Ú|\àº<\ÍôwhtnŒýº¿›8\ç\ì\Ï;OœG™£~Ž\í\0ÎÑŸ·Wóg\â]™\çió‚\èó4o\ÑÝ Ñº3ö\êþl\ãœK³<\í>p]fú;µ_:ƒk»,wÄ†\Ü¸¨¬\Ö0\í	\Ëû]™\çió‚\èó4o\ÑÝ‹C\Ö\×l±UD\á\æ˜aD\ÄQ0\'\ÒX¹Pª\Æ$ñƒ\ßCD£õ•ª`©I5@\ê)¥cGt…$d	3@Gùi\à\Û\Æ;wfY\Ú|\àº“R\â\Z‰\Ê;2™~|)‚%™–‰\"@\r³…\Ò\\\ÐN`‰\Î\ÑÉ¶,µD\ä7\ÉØ¥4a„3µ‡h$O\Ì!ÁtU\È\n\í~¬÷\Êm\á•À#\r\Å\'-\Ö \âÃ»\ëma‹ˆ,¨\rô\Òó	ñßºÿ\0\ÕV\áß–\É\ÉDB\×u¦½`\ÅÁ±C¶t‰“Q3Xœ‡,„£°8bþ¹±CQ0ƒUCýÑ½!@=ûWsE”:-+O’NÒŸ\Ü/·~‡´EÚ–ó\æE\Ê!\â\ï\á%kUª\ë—s4…B\'\àË¶q´N;\Ùt¢‹#\'L<cö¿©É·@M2€¡ \0\Ø¨g\ß\Ã0ýKmn\ã%—¨%I2”6\n)@Á;t*‘\Z¸ÁsNú\ÍlyB€ƒd™ñY\0\\¿ÿ\Ä\0*\0\0\0\0\0\0\0\0!01AQ@aqð ‘¡ñÁP±\Ñ\áÿ\Ú\0\0?!\à\"4¥\';MÂƒ\ÌN´PÆ‰\Öe\ÐQ!øTû\n•¹gû¶“Ÿ\r-BMŒÿ\0~1B„MU~ú›-Ív\Þ\ÅG~¹\ázq\í¤s¦`c\ÛdtwA//¬O<•V\'\ÊU\ÎM¨¦•#\ï6k\ÏU\0KQ8\Ð\è\âK\ÍŠI²vWsm·,\âw5\È|Lõ\Z\rv˜öK’qpPKÂ”t\0š\r•bt¥·÷¯’®6ðä¶¾Ó®b\å\"Å”\Ñ=\ì–x–\Ä\Õ\É\í\0 \'Ú³ÀH\Âó&Q·÷§¨Q£üÁW”q<“?¸?6™)+‘\Õ}HÝ¦S:ž\á½1&5\èP“Œ\Ö}¢Rwéœ§\ÅY\í¯\Ê\Ú{\ê{\ä\ÊÙ›”Qjå¯÷_\Ép÷z‚93`K=¿/L\ÅVÃ\ç\'ød»‚&µ\Þ\\sJ\Â\É}¡,”\åFõYú„5¨Ç¥Œ’\Ö;\Ða\ÌP\ëBR%\Ç\ÛaÏ¨\ÛRObh2\ÉXv\í\éq\árl\Ûöwt¨¦\Ö@­$ K®PCwÓ¥\é3¤­›\"k\Ü\Ù;ð\È\Õ\ê7£G?A\Ø>\Ñ®x§A3yÀ9\ÒÅb~\'ÒŸ\å[—\rV5¡‰÷oJ\Ý\ßú´;]±‚Ü¦\å\é?\Ù{úz­a&?/|iÀ0!\íþÞœ\Ù\Ì\ì?J2\ÂÍš3Ç¯¥\È\Ò>\ç,˜\ëò¼/\Æc\å“~W…ø\Ì|Œ±\×\åx_Œ\Ç\Ë&:ü¯ñ˜ùd\Ç_•\á~3,˜\ëò¼/\Ã[˜]e\Å\ÈC\é,Ù¼¡€\Ä Š,a)U¹M\Í\ÍK\é6l!ÛÎŒ<\ZM\êg\ZG¬\í\á`\èR k€üW\ïTû\Õ>õO½S\ïTû\Õ>õO½S\ïTû\Õ>õO½S\ïTû\Õ>õO½S\ïTû\Õ>õO½R*\ËXt{ž³x\n»-¤Y\ÞjMñ\Ð	„J— 5¡xªd\äJ]u1¡Í·n<IGÈšT{ODÝšI{?)\ê±Z\îœPÂš½„ew\î–y6™\æ\ä®RÄ\ÆHv\Äl—\"\àP*Lr…9««\ÇOxšV<˜Oó‰n\Ïl\×/N=5iVW÷¨\Ë\rG&\ã\ÆÀ.–Œ?=³ø\Æž\Ùüc\ÎlÆ&\ã(~]!K¹Ý¦ò¤ó\Î\í(Ž‰\Õe’½\0\è¸\éŒ?=³Ay§\Íu	t¡W\Å\Î\è\ê¾—”’­\æ‹%D„i™\r\ÍL\ÈuxÉŒ?=³õ)y¨‡8‡w\Óg\âe\ÄD\Å6\Å,aùí˜¯ópúF¶3¹\ØZn\â–0ü\Æ\Ì]W¥…™ût«‚g“ö\Éü™\'„i*,õpk+d]9	\Æ&0ü\æ\Ìkxi&šˆG2Œ¿\r@ü5Ö²³mif\î6c\Îl\ÇM‘Ó”X\Ãñ\Û1\Ódt\àe0ü\æ\Ìt\Ù8EŒ?9³\ZÉŽˆùJ\Éø·\Þ@|r\ÆœÙ˜Ì‚=\Ê/D%P\\¹‘f¥9“®Tfr|n”˜tŽg\ÉÌ¯1c¦0šsd*Ü¾qòÔ±\Ôy”gŒ6’03\\¤{8÷¡6®³»¨ Œ3¨²~\Z½\ëUy<´\ÜsDxÐš¶t^Ð½³\n\Í\ã¦.‹\ß\Z$\Þñ\Ì\ì<H.„‰·W\"l\Ík\ß?¸±Œ„\äD\í\ÝÊ¦`øÀOd¥<4ˆ\éžvg}©\ïO3sAQD8@i€þtü\éø¸	&ô´_·;{\æV\ÂTC…¡¼J(\Ã\Ò\ÍR…³\Úú`¶ÿ\Ú\0\0\0\0\0\0\0\0\0\0\0Á0À\0\0\0\0\0\0\0\0\0€\0\0\0\00\0\0\0\0\0\0\0\0L\0\0A\0 \0\0\0\0\0\0\0 \0 \0\0\0€\0\0\0\0\0\0€€\0\0R€\0\0\0\0\0\0 \0\0(\n\0\0\0\0\0@\0\0\0\0\0\0\0€\0 \0\0\0\0\0\0\0\0\0\0\0\0(\0\n\0\0\0\0@\0\0\0\0\0\0\0B \0\0\0\0\0\0\0\0\0Š\Ã0\Ã0\Â \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\0\0\0\0\Â@\0\0\0\0ð\0\0\0\0\0\0\0\0€ \0\0\0\0\0\0\0P\0\0\0\0$#@\0\0\0\0ð\0\0\0\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0P\0\0\0\0\0 €\0\0\0\0ð\0\0\0\0\0\0\0\0 \0\0\0\0\r\0\0\0\0\0€\0\0\0\0\0\0\0\0\0@\0\0\0\04\0\0\0\0\0\0\0\02ˆ\0\0€\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€ÿ\Ú\0?rÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€ÿ\Ú\0?rÿ\Ä\0\'\0\0\0\0\0\0\0!10AQ @aq±ð¡‘P\Ñÿ\Ú\0\0?\ÒI#©\à\Ôñr°ø&]©Z H*.t\ÅfY{›I¿…Pá»‹)Í¯^|‘|\Í4I\è\Èý\è£aqž\çù½h=;„_•ñKÐ£mW`ó…-·W„vfUN#}Dž„Œk¦ \nª\0Ý©ç±‡(¾Av2%\0’ó`\ÅÅºoJ¬¯\\¼Ð€šG\ÈE\äXF¸5”‘.\ïB–n‘txLŒˆ$Q‹\ëAù\Ö\')yD\0\áv‘qvÏ©Fe\ÐÁ\ÔKcLS\nPzH˜\Â\Ö`-w(	=x\r\á*M“§¿¡‹\êM·–ª\Ê\È\Ø©j\Ü 0‹“&B\ì\ëL\È (\Ì7\æ\ê€dƒñ£u\ÈL/LuÁÆ¢“IúÑµ\0›#\Ë¤Ë®**\Ç[)\Ñ?ô\å@3Á-\"°ˆ‘e!#\Ó!—§I9\Ô_·¥B\ÜH”ewmX7(˜\êš\Ä>¥E¢\Ô1°d\ã\nq¯—W$ž^ðHö¿\ÍC¶º“\î\r\\(”\Ý\áñ³\"-ú\Öw¶?j‘2t¥II€”í’½\ÑI\Ø}B;ô\È\á\ÔP{(\"J¢\Ó,!ß¨`‹§´	d°4 7°9’¹*$ø\éad$ª\á…RLD\Í\ÈRª¡+B3;ô\Þa\Ù…?j\'o\\ Èˆùõ#\Ò\Ç@ADØ¤–Za\Ó\ájC<\0\r€t„_\Ä\á\nX¾Ñ”29¸@\Ïb\îUVU\ë˜(ùªD•…\"½£¡€œoJH’·[…V\íÞ‰$hÁÆœ`’\0Ÿ‰4\ÆF6\è#Š\\\02:\ß\rÛ\Óƒ\×\æ•í¤¦}™°4’\'\îBvl;‰\Òß–z¤\áó?ºs\Ñ“ª\nƒƒO\ÚW\È\Â/Ã¤¥M¡`\Â|\rñXÁB\à\r!\ÉNh~\ä¨ùE\îºa\×£@>]&/£	‰Ð‹!w,/·Kx©2DQ\Èy\ÒDˆ0/&ðÿ\0)}¯½¸iÁù\ìþO*\Ãñ\Ó#‡µ—rN{ÿ\0“Ê°üuo”»…ˆ\ì—þO*0~;©w$ç¥™´i¯üžU‡ã¾—q¶¢ÿ\0\É\åX~?\àË¹#‡E\äò¬?\Z9\î%Ü€Á\ÐÐ«KL\É`bûzÈ“&k2f²\êYÙ²–K ½\r ¨z¯÷\"\ÆI\"¶ô†+2g\×0 o*V”„3löhöœ„ƒ¸y\"T\êù|øO\Èsj|lùHv¯<xñ\ãÇ<xñ\ãÇ<x¢\îrhV“u-±Sd­6\è…;\Õ\Û2:°=A2<¬*ZS)\Êx[‚\0Õ—Ö+)\ç¹4RaŸzV]Œ°œ’†‘R[¿@\ì•\Æ\×È‹\Ö\Î\Ý*	‰¥±(!t¢½°,¥Aežòoø6	Oˆ#H$\Ø\áCÉ†\æ 3Á‡?‡“zDA!ô©tUV\ê÷£¡†	\é)ŒÀ#dX\ZA,E\á“5\ÆÀ\ÎÏžþ\Â\ÈV}…\ïsS„²\îú°ó\Ò\â˜Pur4<§\Ï~•…‰‰þV>_½fg\Ågþ^xy~ú`üö­apv<ðòý\é“K[\Ù‹¯BKil\"-JÑ‘”H\\Y‹\æ”.\à\ì\Â<“5%4„D^ Z‚C\Z¦B/\ßp\ÕÍ¤]„\ØóJÆŸ\ÊKe‹HQÆšÿ\0€*’\áX©,\ÕK\Ë\Ê-S!G‡—\ï\Ñ&~=o\Ç÷¢}µ\Ú\Îeõ\ÓhJƒŽZ\Øy\"}\êN5y\á\åû\î\Z9	ƒt\Z\ÛOIæ´‚¼DŸ’”.¯<<¿z7ŠŸme¶b%`\Óf@@‘´ªÉ›\"Eº„(ƒ\n¤\0¡ù\r‘@\×…”\n\rK\è<<¿}\ÃÑ†iÒ¾gI‰¦\Ò(µ+¹\èž¶K3lPDR]\Ö‡—\ïIÅ»¶¿Ø¸ç‡—\ïDÇšX&œ\ë«kø‹Žxy~ôB(½æ–¿¶¿Ø¸ç‡—\ï@\Åû²Å¸p“y „v=&“\Â/ø\ëó\Ã\Ë÷\Ó\ç¥Ã®÷…\\O\Ì·\Å\"\'b‰	-2 ±D¥`X†C\ØÀ$Az7¡¬©e\ÌZ!`Ö¾ƒ\Ã\Ë÷\Ó\'\ã¥~)9¦\Ð¼!®r€\Ä\rtz©•a\n\Ã\Ë÷\Ó/)50ò\Â^cß¿}F+™#G	µDð4\æ\Ù.pÝ–mœ€\Ã@\Ãp¢\Ê	a{Ù\ãv‰[šö\íA\Üx}\rýo½7*\0Íó7­•tT$(\"»E,H¯@\0\Z„’=%\ã­\É@g1¥¸p(°HüO\â90ÿ\0œ\Ò\ä\ÉÛŒM‹\î\ÐE\ÃORR™³\ì4¯ôAˆ\ÅÀŒ‚\Z8yp\Ô`\0`4a£\ÓwšV[úK\ïH9(ˆ÷(Fi$\ËÀ\Êý€¼\íFˆ\Ìd.\0\íH‘>\Zöi/ô,TC\Æ4{0x(m\æšrz¹=ÿ\Ù'),(6,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0\\r¨f\0\0\0sBIT|dˆ\0\0\0	pHYs\0\0\0\0\0šœ\0\0\Z IDATxœ\í\Ý{˜\\e\'ð\ï\ï­\êNH\Ä‘†NŸKu\ÓB‡8^0!¹_vAD`Y\ÅqY}\Ðq\ÜAY\\‡‘qE¼¡3°²\":\Ü\'drXhº\êœ:\ÎôC\'$\ä\Ò]õþö¤c¹U·ª»\ê|?\Ï\ÃC§ê¼¿÷—<ý~«\êÔ¹\0DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDt â¸ž)t\nš«_TŽP\ÑCU%\ïx¢¶\'¢6)°A€²Tó/\×#\0\Ö\Ùi,X°`\æ\Ö\×^»P€ÿ¤S˜\í¢1\"z=k\ízó„Q<ð\Úø¶ŒŒŒlMS¯\î\0\è\íî¯ùÊŸ[«0\Æ\ÌJ\Ó\Õe#,¾gsøq\ÔS \æ\0\è\ï\êŸS™¶ý\Ö\ê1õLJDY»]Ü®\"Ÿ\ãø\ÕZ†\Ö\0¡¾_µúc\Ìjëˆ\ZÍª}\Æ|$Ž\ãì˜ƒ\n€\î\î\îé¹\Üß‹˜«\êoˆšBñ¥yGuýŠ+*\Úô€\Ð\ß\Õ?§Ò¹\íAˆy—›îˆ¨	Ú²}\ÛE\ÚI¸\ß\0\è\é\éys\ä	\Ó\ï¶7\"j8µ+7m\ÝzÖºu\ë¶\ìk³¯\'‚ 8¬C\ä.~¢%\æ¤Y3f\Ü ·¯Möõ„y\Ã\ì\Ù?†˜\Ó5‡\æ\Ì>b\Ö+££\î\íÙ½@\èûŸÈ•mŒˆšAD\Þ=gö?et4z\Ýs{>†\á;\Å\ê“\Ø\Ï\Ç\"j-\n¼dò¹B±XÜ´ûã¿·È—,Y’k¿¾\ç\ãD\Ô\Ú8R+•öòøï„¾ÿ!Ü‘r.k\åFñ/Vñœ;j©¦¬I”)9U£ª‡Ã˜>¨žb­ž‘ö\È[k\íX¾\Ú9p\íàº‰\ÇvÀÂ…;6n\ØP2ùõÖ‡\â[9[¹\é…5k†\Ó4JD¿\Ïó¼7\åE®³V¯5\Æt\Ö[G¡_Œ\Ê\å\ë\'þ¼+\0B/|¿ˆþS=E-tsIE+\ëmŒˆ¬·§\çøª\É\Ýg€B=ã­µ\ë:\æ\è#\'Ž\ÜõY_\Ä~°®‚\Ð5\Õê»¹ø‰\Z¯84ôl¾#\",ž©g¼1f\îK##\ï\Ýõg\0\è\ï\î>Sj®f\í«yk\Ï\à[~¢\æ\\_{¬­\ë`ÎŸø\Ù\0@%Ÿ?\ru\ìùWÁ\Ç‡†Jõ4ADõK’\ä7üq\Ã\ß=ñ\ÃÄ¢¯\ã\Õ\ÏDIò\Ý: ¢”JIò„Z<PûH9®««\ë`\"\0¬,¨¹F[û\ÄD\äT^¾\\Ç¨Ü¡G;@`\ÐW\ËhkmEr¹:’‡ˆ\\Š¢h€\ß\Ô:N9\n\0Lww÷\á\0f\Ô2\Øž\ÛóB\"šªŠŸ\Õ:\ÈZ3\0L>Ÿ¯ý‚žb†jCD!Zóz©Z\00ùj¾¦W\0P\è>/0@D\Í%*›k$\n\0FU]\ß„ˆZ\Ïú#\Ê0\0Q†1\0ˆ2Œ@”a\0¢c\0e€(\Ã\0D\Æ\0 \Ê0\0Q†1\0ˆ2Œ@”a\0¢c\0e€(\Ã\0D\Æ\0 \Ê0\0Q†1\0ˆ2Œ@”aù\ÉnÀ…þ®þ9•\éc—¨\ê‰™­Šõ]¥\"÷\Æqü\êd÷G­¯\×÷—Z\Õ\ËD\ä\Í\nÀ˜¯GQ”Lv_iµü;€\Ð¯\ëØ¶Š¯\n\ä\0\ÎÁ\å¹Ck\nAp\Ùd÷H­«»»{z\èyÿ \å\"\æ*@\ÎÈ§¤R}ÿš\É\î/­–€\Ð÷?-¢·cözsfCñ¡~¦Ù½Q\ë\ë\ï\ï?´#\ßñ ˆyý‹ˆ1\Ór[è…Ÿœ„Öœi\Ù\0‚\à]ùüÁl+¢7¼\à–F÷D\í\ãøcŽ™]Ù¶\íqs€;g‹\è\ßôùþ\Âfõ\åZ\Ë€X\\\à\àoj\"¸®\àw …ÿ\Î\Ôý\Ý\ÝGn\í\è\\1\ï:ˆ\Ís¸¾\áM5HK.†…vˆ\àôš\n>Tðƒ».\\\ØÑ€¶¨\r;~w\Åt¬2Àñ;Æªž‰]K-\Ùô\è\è\è<\0\Ó\ë~É¦\r\î\ï\î\î®w<µ©\Þù½½UÉ¯‚AP\Ë8#ff\ß1}onT_Ô’\Ð\Ñ\ÑQIWA\Î\é4÷öö\Ö~gdjKa¾MsÕ•08ºžñvºw\ÝS3´d\0‹\Åu\nŒ¦©!K«•\ê²þ®þ9®ú¢\Ö\Ô\ëû\'Š\Õ\å\0\ÞTWk_.•J¿u\ÛUs´d\0\0PUüŸ´Eð‡•Ž±•}\Çô\Ís\Ñµž NW\È\ã\0Ž¨·†\Z¹\ÏaKMÕª€\\5w“µ¶öû¢\ï\É\à­67¶ª·»w~ú®¨•„^ø>T\íÌ¨»ˆµ¯ª\È\Üu\Õ\\-\0\Å\á\â\Zc\ä2k|ö2\ÆW3¾:\Ãc´F- ôý+Dôc:\ë­a­S\ä.\ãx\Äeo\ÍÔ²\0\0¥rùœ`k\êb\Æ¥•\êJ\ß÷OH\ßMe¡\ï_#;\äR”Ù‚œ9/\ZŠt\ÔÖ¤h\é\0\0€(I²‚³¬µ›\Ò\Ö2Æ¼!guy\Ø.v\ÑM=¡~F ·¡–ƒ\È^o#Ôž\Çñc®úš,-\0\0\ÇñŠœ\àk\íú\ÔÅŒ9LŒ>Zðý3´FSHÁn\ÑS±öe5²´”$?q\ÔÖ¤j‹\0\0€b’<…œ9Éª}\ÑA¹C¬\Õzƒ\à\"µhò™BOðu®KU\Å\â?D;GQôG}Mº¶	\0\0ˆ\ãx@r¹\ÅV\íP\ÚZÆ˜NU\ÜxÁ•.z£É±dÉ’|Á\î‚Á‡\Ó\ÔQ ªˆ]T\\S,º\êm*h«\0\0€(Š’\\G\Ç\"X;\à \\\Î¾\Õ\ë\×:¨EM\Ö\Ý\Ý=}\Ý\È\Èý\0.IWIY±\Õ\ÅI’¬u\Ò\Ø\Òv\0\0\ÅbñE3­ó$<å œ¨\àÖ‚ü•ƒZ\Ô$½½½³:M\ÇÃ€œ›ª\ÅO·W*K‡††~í¨µ)¥-\0\0\×\çò¹S v…“‚‚Ï…ž÷e\'µ¨¡ú»ú\çT+\Õeb°4]%ý—\é³fœ6<<¼ÁIcSP\Û\0\0‹\ÅM[\Æ\Æ\Îð‹z\"\æ\ã¡\ç}mþ\ï\Ö\ÊúŽ\é›W\é[i€?LS\ÇZüÐŠœû«_ý\ê5W½MEmÿ‹<22²u\Ö‡Ÿo-\îuQO\Ä\\zÁÝ¼¦À\Ô\Ó\Û\Ý;\ß\æ\ÆVÁà­©\nY|/Š/Š\ãx»£Ö¦¬¶\0\0xú\é§\Ç\ã¡øR(¾á¢ž.Þ´a\ã»ººqQ\Ò\ÃðX5\ã«aŒŸª\â\ïKCñŸ\0¨:ilŠ\ËD\0\ìdKIüa(þ§£zg\Ï\è\ì|„\×˜|¾ïŸ •\êJsTªBŠ›JIü\ß\0¨›Î¦¾,\0\0 ”\Ä\×AñY\'\ÅÄœT­TŸ\è\ë\ë›\ë¤\Õ,\ì	\ç¬.7Æ¼!M…~²”Ä™»zt\æ\0\0JI|£ª\\Io€·\Û\íc+{{{\ß\â 5ªAÁ÷\Ï£Â˜\ÃR”±\nýpT.\ÉYc-$“\0\0Q}EU>ŸõŒé¯Ž¯\Ã\ÐK\ßŒ\Þ ¸\ÈZ}\0@\ÝûavœJ®—Få²“}C­(³\0\0QÝ©*[k\Ç\Ò\Ö2bz´Z]A¿‹\Þh\ß/¸R÷¤9—ÀVœ_*—|;Ôª2\0\0%\Ñ3\çØ’¶–óT\í\Ê^\Ï{»ƒ\Öh/z½\àZ#øRœ\Ëo­Ý¤FÎŒ’\Ä\Éñ!­,ó\0\0q?µ§Ø˜¶–1f®*–…ax’ƒ\Öh7/ø+ÜŠ\çò[k\×\ç§DQ´\Òak-‹°S)I~¢F–\ÂÚ—S3\æ0±úHÁó\Îr\Ð\Z=\ï\Ë|.M\r«öE\ä\ÌI\Å$qqŽH[`\0\ì&Š¢_ˆv,†µ.®ñvˆU<Pðý‹\Ô\Ê2z\Þ7E\Ì\ÇSU±¶lòùEq»8K´m0\0öP\\S,\æ\Ô.R J[\Ë\Ó\ÈÝ… ¸\ÊEoY³p\áÂŽ\Ð\î\Þq[\î,ž7\Õ\ÎÅ¥R)õu\"\Ú\r`/^X³f¸b«‹-ð¬ƒrŠo‚ \Ý+X\Ætuu²i\Ã\ÆŠ \Õ;(ü<?\Þy\Ò\à\ÚÁu®zk\'€}\Z\Zúõ!\ãcK ö\ß”(¾úþwP«\íApØŒ\Î\ÎG\0œ¦ŽZük.Ÿ{\ïÀ\ÈÀ+ŽZk;€ýxv\í\Ú\Ñüô\é§Z`™‹zùl\èû©öb·»¾¾¾¹¢xbR~‹¢ÿ<f\Ç\Ï*‹©¯\Ý\Î\0000°‚sTñ#õrmÁ÷S}Ý®z{{\ßb·­`aºJz÷¼®®†‡‡·¹\é¬}1\0B\Ç\Û\ßrôQ*ô.7\å\Ê\Ðó\î\é\ï\ïOs$[[	\ÃÐ«Ž¯†1)¤\Ô\ÛK\åòe+V¬Hy\él`\0¤+VT¢rùr…~\ÍE=s\ÑøÖ±xM ‚~­VW1=i\ê(ô\æR¹ü§\0¬£\Ö\Ú 6\Z•\ËU\è]ƒ3gL›öhi\Îfki½ž÷vT\íJ#&\ÝÙ”Š\ë£rù/µ•€:D\åòõP\\ï¦š,6U,/\n©\ÎgoEA,©*ž0Æ¤¹ž‚\Ââ£¥$v\ÊY\Ã\0¨S)‰¿‹\Â\Å\ÕcN@¥²2\ÃtW´i!¡\çmcê¾¢’µ¶\"——†b\'Ë²ˆBi(þšX\\n­M¿\ÃIÌ±j\í\ê \Ò]Ó®|ÿbUü)\Îå‡µ\ÛsF.,ÅŽv\Ìf ¥\âP|W\ÎÈ…°6õd\rd>TWù¾Ÿîª¶SXÁ÷ÿ w\ï8Lº>\Ö\Ú\Íœ],—|5›e\0Š\åò 8\ÛZ»9m-™\'VWzzR]\×~**øþ\'\0ùRü\Þ)0*ùÜ©¥$y\Âak™\Å\0p¤”$OH>wª£ikc\æZÈ² –¸\èm*}ÿ¯IuEf^2¶º$Š\"‡g\0NEQôo\ÆV—(ðR\ÚZÆ˜YFñH\Øžã¢·I$\ßÿ;Ü¦ˆ…®QÁ¢\âÐ‹´h\'€cÅ¡¡g-t±\Ã\ÊMWT\ï=/\å\Ým\'Mn\Ça\Ïò±4E,t\"‹\ã8.»jŒv`\04@¹\\ŽU°\ÈBS\ßK\Þ\Ó!b\î\n}ÿC.zk–þþþ\Î\Ðó\î\ä\ÊT…,ž1¹\Ü\â8Ž]\\¤…öÀ\0h8ŽG ²\Öþ_\åŒ@\î}ÿ:µ\ZnÞ¼y3Æ·ýH\Ä\\”®’®²9œ\\*•~\ë¦3\Ú \â8~¹\"8\Ù?qQO ·|ÿFµ\Z\Åó¼\ÃgÎ˜ù¨\ÎHSG\çÆ­ý£8Ž_u\Õ½ Á’$\ÙøÚ–\×Nô—n*\Êg\n¾ÿw˜‚\×‚\ày\År,J[K€\ãr&÷xot\Ñ\í 	›>ó@ŽwWQ>Vðýoc\n]S Ã£ º\Æü«š8Še\Æa\04XoOð5øœÿ[ËŸ|ÿÞ©pM |µvµô¹®\Íh,@5nñOÇ·ýhÞ¼y3\ZSÿÀú<\ï8Q¬6ùšƒ!\Ð8€iü\â\ßAgÌœ1ó1\Ïóo\ä<{ö„ï¨ˆ¬\à\ÈF\Ï\Åh@4kñO0À{òŠ\å\Í\\½¾¿TQ]f sš5\'CÀ=€c\Í^ü»óP]AW£§\nz‚sò°1\æ\ÐFÏµ\'†€[\0‡&mñ\ïd }¢X\íû~Ð¨9B/|?`\ï0½QsCÀ€#… ¸l2ÿº\rdUŸ\ç\çºv\è…W‹\è?\Zcò©\n©]‰”WRb¸Á\0p —Añ]¤ü÷T\è\×`ñL\Ú~8²\"²\"\ì	ß‘¶Ö„‚|JDoGÚ¿£\ÚûfÍž}ª¨}€µij1\Òc\0¤\äpñ\ß\Z•\Ëµ9œ¼ó2™£¨.\ëõý¥ik¼\à&nN[G¡wEIr\É\ÓO?=^L’§\Ô\È\É`L*@\nŽÿ\Ç Ž\ãW·Œ	\èƒiû3\Æª‡ƒ 8¯\ÎRð‚\Û øt\Ú^¬\â›Q¹|€\ê\ÄcQ%\É\Å\0¨S#ÿ„‘‘‘­óºº\ÎôŸR5¹\ÃtT\ívì¼«I®\Ð\Ü	Á5i°Š¯\ÆIüa\ì\å†\É\Å\0¨C#ÿ„+VTJ\åòeVñ\Õ4s\0€1&/¢ÿz\á\Õ³}\Ó\n~ð}\\‘vn(¾\'ñ5\Ø\ÏN?†À\äa\0Ô¨‹÷\Ív,ý|š¹v2\"z{Á>µ¿,X0Ó¨þ3€\ÒN¨\ÐKIüÉƒÙ–!09\05hò\âß¥T.\ß\0Á\'\à\â&$‚›^p\ÓÞž\ê\î\î>b\ë¦-rj\Úiú\é¨\\þl-c\Í\Ç\08Hß¿|2ÿ„Rÿ­U\\…\Ýv¢\ÕMð\é‚Ü†Ý®)\àyÞ›¦\år\Ë\Å\à\Ä\Ôõ\Êå¿©g(C ¹\0¡\àû—r\'&iñOˆ“ø;ªö\\Ü„‚k\n=Á\0r¾\ïmDVB\Ì\ÛRVU«ø\ÓRßš¦C y\00Uÿ„(I\î‡\à7!Á\ß Ym ½)«Y«¸*N\â\ÛS÷†@³0\0öcª-þ	¥$Y&È½\×B_I_M\ÎpLš\n\ÖÚŠªý@œ\Ä\ßI\ß\Ï\ï0\Z°SuñOˆ†¢W\à$«öE×µka­Á\ÅQ’\ÜÓˆú\Æb\0\ì\ÅT_ü\Ê\åòó&Ÿ_k\'\ë†\ÛDpA”$÷7r†@\ã0\0ö\Ð*‹B©T\Z\Ê\Û\ê\"4û–Y[ ö\Ü(Ij\Æd\Æ`\0\ì¦\Õÿ„\á\á—[‹Ÿ6c>k\í&µrf)I–5c¾	÷\0;µ\ê\âŸð\ìÚµ£›¶½v*\Ô>\Ö\à©6H>wZ4­jð<{\Åp‹\0 ôý+ZyñOX·nÝ–üô\é\ç©\âû¨o­ý­œ2Ù·\çf¸“ù\0}ÿ\n|-¾ø\'ŒEI|‰U|\Óq\é_«‘¥q»¸\×aj72\0\í¶øwc\ã$þ ·¸©fÿŸTsK\Ê\åòóN\ê9\ÂH/³\ÐÆ‹—R¹ü)(®OSCa\Í\çN*®)¦¾\Õy#0\Ò\Éd\0dañO(%ñU\å#\Ø\Ë\Å8\È\"¶\Ð\ÅQ%\î;s‡!P¿\Ì@–ÿ„(‰¾\è¥\Ö\Úñƒ¤öSÍŸT.—ÿ£­9\Ã¨O¦ ‹‹B©\\¾\×þ3€­\ÞZiY2¸vp]\Ãsˆ!P»\Ì@–ÿ„R’<,\ÐSxi_Û¨Å¿\æ·O;%Žã—›Ù›+\Úd\"\0B/|_\Öÿ„b¹ü\äXeüX…þ\å\Î{lU`T-ô’h(>e`dÀÁY†“\Çek[°`ÁLG­M9\é\îð\Ò‚ x£¨~\\ü»o\0ð…ÿµ¥(Š’0O«Ë‘\ætg1oÛºyó\0>á¬¹)¤\í\ßˆ•«¤ºuv;-þ,qõN@\Ä|$‚\Ãµ5¥´}\0@õ¬TÃ¹ø[š£8Dª²\ØUOSI\Û€À\Öýö‹¿=¸1v¾»Ž¦Ž¶\0\0cõ\â\âo/©C@d›ÛŽ¦†¶\0ó«Z\Çpñ·§4! UiöWš¢\íÀ½»–\í¹ø\Û[]!`m\rE?o\\W“§\í T.\ß\è¿Ì¶\\ü\ÙPkH\Îü9\\Ü•i\njû\0\0`­È…°ˆ÷¿™\Þ\ÂÅŸ»BÀ\Úœè¤Ÿ/\Æñ}\Í\éªù²\0ˆ\ãxD:s\'@ñ\0¿\Ù\í)U‹\'=«T.\ï÷¦™\Ô~¢(J*‚z³µö·»=¥€®²§—\Ê\å&­Á&hû#\'‹\ÅM\0þÀ\r}==Œ™…ŽŽ5ƒƒƒ\ë\'»7š<I’lð\0>=ñ{a¶OjõÃ¡Vf`7vph¨4\ÙMÐ”“\Éß‹L| ¢½c\0e€(\Ã\0D\Æ\0 \Ê0\0Q†1\0ˆ2Œ@”a\0¢c\0e€(\Ã\0D\Æ\0 \Ê0\0Q†1\0ˆ2Œ@”a\0¢c\0e€(\Ã\0D\Æ\0 \Ê0\0Q†1\0ˆ2ÌˆH[\ÞóŒˆöMv\Þ\ë\Ðlo\Ëûže…\Â>kGjc\Ù\n\0F*36\Õ<¡•™µŽ!¢Æˆ’\äùe\Ã^\0302°\Ön¯e¤1\ÚS\ãdD\ÔHª^-›\ç¶\ç~\r\ì\Ø	hÕ˜¨–Á\Ö\ê[ƒ 8¬–1D\Ôý]ýs ¦·†!\×®v~ \Ðgk™\Ð“k/¨e5Fe\Úö÷¡†oô,ð\Ü\Ä\Ï\0X^\ë¤üÙŽÿ\Ñ$2°ògµ\è¿ÀTò\×<­˜·‚\àƒ5#\"g\nAð¼µ–1¢úØ®Ÿwò¼ŸBÌ»j)d­\Ý,ù\Ü;¢(z¡–qD”^oO\Ïñjr?0£†akK\å¸€vûÜ \"ß®µcÌ¡bõ‘0k\ÚID\é\ëy¡BBm‹€~;?°[\0lÞ²\å.Xûr½#VZð¼÷\Ö1–ˆj\Ô\ëûgŒ+ž„1]5\Ýf\Æ;þ\×\î\ä&~Ø¼yóø\Ü9s‚\Ó\ê\èi&D.Ÿ{\Äïˆ¹³Ÿ}¥Ž\ZD´}==…9s\ç~›E¤\ÆW~\0_+—¾¿ûC¿·¿««\ëé\Ï1iôQ@WC\åq«\È]¯ª•õˆ2IDòU+s\à8+8\Í\0\'¢\Îo\ÞUAoÇ¿÷.ÿu\Å\nžw\Ä<Tg\ÏD4)ô\ê¨\\¾c\Ï\Çs{>°~t4ž;{\ÎQ,lNkD\Ô`E\åòu{{b¯Gm¯Žj\ÑØžˆ¨	ÖšŽü\Øyú\ïžö\Z\0\Ã\Ã\ÃÛ¬1\çX\Û\ÈÎˆ¨q­B\Ï\\¿¯möyüp\Ç#RÍ®ÀKiˆ\Z\ÅZ»IÔžW.—Ÿ\ß\ßvû= ¸¦X„‘÷À\"v\Û5\Ðo\Ô\È\ÒR’ü\ä@ð¢(Š›Ã‰€\Ö~¾\05•ž’J\î\årù™ƒ\Ùþu\ß\ì\Í+¯¼²eý\è\è]s\æ\Ì«‹ ’O\×&9VµŠ[;§w^:\ïû3ÿžj>¨\àX\Ï+0·‰\àŒZ\ÇQ¨ýYU\ä¿\ì«þ\î\ê>Ÿ¿\ày\ïQ˜Dpzš:DTµxboŠ’¤\î÷R/\Ü\Þ\î\Þùš«þ±\n\Î\à5‰h,žW£ª\Èw\ã8H[\Î\éb\í\ë\ë›[{\'DŽ\àp€Yª\Ò\ár¢v\'‚ªµ\Ød€‰\è\0òù§Š\Åâ‹“\ÝQfü\ç©0=ø\Ë|‘\0\0\0\0IEND®B`‚'),(7,'ÿ\Øÿ\à\0JFIF\0\0\0\0\0ÿ\Û\0C\0	\Z!\Z\"$\"$ÿÀ\0\ÖX\0ÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0O\0\0\0\0!\"1#2´	78AQv$BW„•¥\Ò34HUVg‡”\Å\Ó\Ô\ä%&(5CGSw…µ\Ãÿ\Ú\0\0\0?\0\Ù`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\':“}v~ÁB\Ê\Ê\í\Ä\ÓóDùR$mRVÉ•E\\« \æ\äo…÷*c8L\åS<6§\êóf­Ÿ\áõ·­A\Ý\å\Ï\á\Ö\ç3³Œc—¨X³œ®8òû+œxÏ‹ùj\ígøƒYÿ\0©\Ó\Äg\å\Ïþk¿¯ÿ\0\å\Ç\å\Ïþk¿¯ÿ\0\åÎ¶ƒ­¶}\r;\ë´Ö­‚­\Ñ5gŠ)åÇ¹­z\Ì\ÕsQrˆ\åkUS\Î\ä{:o¬=Ÿº\×>ž¹Ú‚\ÃbW¥E}½—(œ |Ž\ä¹Uò\ÔL5|\ç½Ö˜\ß\íš\Ô^£\áû…e‡\Óñ\çñºƒ<³Ž>¡\Ï\ì®x\ç3Œ¦i€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ñ¯«¥ ¡¨®®©†–’š\'M<óHŒŽ&52\ç¹\Ë\á­DEUUðˆ„q:µÚ1ß¦³\Ô\Ö\êšøûÑ£-\Ñq§l¬ð\Ôt\ÒaŽw\Éñ$‰„U\ÂûyOí»™\Õf\éq]£h´•¦Z˜§‚\çQHŒ\Å,¼»j¯ªUl\ìFª9Ï†%rñj¢\"9\Zª>“uö¬ôSn¾\ïV\Ü}Jð¦ŠY\ëñ¸+ûsT9½§»Š§÷7\"qj¯/²”m7\ÒN\ËZ¨_O]g¹ß¥tªô¨¯¹J\É\Z˜D\à‰\Æ\Þ)…_-UË—\Î0‰@ \ÙÝ§¢¡§£‡m´“¢‚&\Ä\ÇMi†i\Z˜Es\Þ\Õs\Ý\ãËœªª¾UUNÎ‚’–‚†ž††š\ZZJh›C\Z28˜\Ô\ÃXÖ§†µ\Â\"`3ñOµŸÉ¦Œþ‚¦þÁ9Ô$\ìµÖ…”ô6{†VÊZŠ”¯‘É…N\n“¬\â¹Eð\Ô\\µ<\ã(³Ÿ\Écst-ó\×\ìþ\êúf©\ïK\rl’\Òûcv`l‰HÊœ#žŽ\æÆ·\ç\íTr¢?=Dme7_l¾5A7q÷8!ÃŸ7,µ\é%;q\åˆ\ÎråŠ«\ç\Ý@Û¾­v§Sö)¯5ºZ¾N\ÌjËŒ\\©\Ý+ü94yDc]ó|©\ZaQpž\î7+%\Ú\Õ|µ\Ãt²\\\è®tò\íUQ\ÎÙ¢“‹•«\Å\íUEÃ‘Qp¿4T?h\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\03n\ëug¥\íË§6\Þ\Û6´\Ô3K\é |-rR$Ê¯cZ\ÕD\çP\îh\Ì64F½¯öÉ“Œ Ù½\ï\ß:\ê{\Öò\êY´\æžY[Q’D‘žMFÀ‹\Â\'p–V$’«\æj·‹\Ú\ä/û_²;i·EY¦ô\Ü)tŽ&1nUoZŠ•Tc˜¯kŸ”‰\ÎG»—i‹œcˆ”`\0\0\09Ö»´ºÆ¹+¯\Ú\Z\Ù%Z\Ë$\ÒOKÎ’IŸ\"¢½òº1erªg/Ê¢ª\ãæ¹‰\ÞúDº\éÊ‰®»?¹×«{©›n²wD\é³\"+\Ñ\Õ4üU¬\âTgm\Ùs+\ç\Ûð—sº¡Ú©¤v\à\èxu–)jf–\ãEQÝ˜Ø‰Ï»LŠ\Ø\"O\"\Í\n9Q^ž1\ì\î¶\ï«]©\ÔýŠk\ÅMn–¯“³\Z²\ã*wJÿ\0F\ÍQ\×|\ß*F˜T\\\'»\Ê\Évµ_-p\Ý,—:+ü»UTs¶h¤\â\åjñ{UQp\äT\\/\Í\Ú\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\'º;‹¤v\ÛN\Ëz\ÕwhiZ‘=ôôˆö­Mb·Š+!U\î\ËØ‹ú›\É\Ê\Ö\åS#U_w—«£\ívj_¢ûvÊ˜\"¯Ä’(\ÞÆ«\ÕÏ‘Q©~p©Q\Õì«‘«‰Ilž\Äh-®¡¤š\Ýl†\ã¨c‰{\ÕT|§{ðôs¢EUH\Z©#›Å˜Un\ÊõL­L\0\0\0\0\0\0\áµþ\Ðí¦¼™õ\Z§F\Û+jä•²\ÉYž¦Ek854J\Ù\ÔnŠ¹S\Ã|{S\æ÷\Ò&ª\ÓI®»?¹Õ¶©¦\ãn²yiel\n\ÔW£ªiü¿25ªŒ\íµ1Œª«}ß‹ñ\í\Ô\Ï{7C|nŠ§\Í=g(©ø\È\ï³¨¦k\à\\$R¯m[\Üó\Ë<Qn{c\ÔN\Ô\ëúŠZn¡ømÚ§\Äv\ë¬~žUwq#k\ÙXž÷*µZ\Æ=\ÎT_–QQ+ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0u1¾Vm Ó©I\r\ÇUWD«n·+½­O)ß›–ÄŠ‹„ð¯TV·s™\Úm˜Ô›õ|“v÷®®¶*\n\Þ´\Ú\éÜ°÷©\ÑÜšˆ‹•Š—$j\"£\ß\Í\ÒrL£\ä\Ø\Ô”´4ô44\Ð\Ò\ÒSD\Ø`‚Ñ‘\ÄÆ¦\ZÆµ<5¨ˆˆˆžû\0\0\0\0\0\0\0‹zÁ\ÙM#¦5§q©\ìsRh\É%Š‹P[´üM§šW’2ª<µÐµ«\ìjµZ\ÄW#<¥W7ö\Ðl\Îÿ\0mÝšž¿fw^Keu]KF²5‘È’\É\ÍVfY)¸ª*I\Ü\æ\ÕTs\Ñ>~\ï\ØþªwCWEm\ÝÝ¤š‚Y+ŸU\Ò:Jh\Ý­‘al¨ö\Ô9¹U\ä\ÙQ®G3\Ê\"òZn•\êŸe¯°\Ñ$º–k5]\\½¤¥¹QK¡UY$b:µ|;—s‹—*aq\Üþ66³ùKÑŸÓ´\ß\Û¬þRôgô\í7ö\Ç\ãck?”½ý;Mý±ø\Ø\Ú\Ï\å/FN\Ól~66³ùKÑŸÓ´\ß\Û¬þRôgô\í7öÏ½\æ\íµ}u=\r\ái*ªº™[Cy§|’½Ë†±­G\å\ÎUTDDòª§X\0\0\0\0\0\0\0\0\0\0\0\0\0\0>£÷^ƒivò¢óÎŠ{\åO\Ô\Ú(*\äõ\å\ÎTo•dmw7}”_ky5^\Õ3\ÏLûyÜD»Ç¼k5\Æ\Z\éR®ŠŠ±¾\ëŠø\ã4­\ÆNˆˆŒ‰\èð‘\"$›H\0\0\0\0\0\0\0\0<ms¦mZ\ËH]tµ\î\íÎ™ôò\á­W3)\âFrED{]‡5Uj/\ê#=\êk­®÷³š¾lj]R\êx¹¹Ù©¡W}\\‘÷›\Ø\Õ\\\"£\ZÔ‰ôøù—ó u×³ZVÙ·”\Ú\ëG\éŠ+EM²¦:{‹m\Ñ\ÅMN´²+š’:$DG=%tmEo»/,£QYL±t§³v:\nK¦—ø|\Ñ\ÇU[\ë\ê\áõ2µ¨—¶Ù°\ÎNEwð™\Â6l¾€\ÝmÑ–ÉµvmZ\n\É+y\Ôñ\ÔT\Í%UBr\çMH\éf|r5Z\èýü=ªŠì¹®cd¼þK›þC[Vÿ\0¾’\æ\Äÿ\0\ß\ÖÕ¿\ï‡ä¹±?\ä7õµoû\ã\Æ\Ôý!\ì\Õ\ß\Óü>Šõ§û\\¹ü:\â\ç÷³Œrõ	.1…\Ç?isŸñ\"­¬ÿ\0\ë?õ\Êoøqùmgøÿ\0Yÿ\0®SÃœDuT\Ôõ\Ô;·5-]4­š	\á²+$‰\í\\µ\írT\å®EDTTòŠ‡³©:w\ß8(Xý9\ÔN ¸Õ¬¨Š¾º¶’4f.G²iU]ž)ÇŠ&W>0¿ ýd\é}1Ù´\î=–÷é¿¹\Ówc¨«—“ò¿]WNœ±\ÉW\ß\'†¦\ä>úË¬\Ý%§jjoZÙ¨›¨õšH`¨©j;‹QŒŠŠf«š‹\ç\ÃS.U^)\áQ\Õ^\ä\éM;MU¯¶2\çG+¥X]]#ª-ôÒ½y9¬ce…øwùsr¯/„ð‹­²¬ô],ºš\Ù4ý¶\ÕI\éâšž™\Î\Ç5\ä\Ù9½U_)%Dð\Üø(\Úo¨}–¿\×>Ž‡p-\ÊÈ–Uu{%¢¨˜G\Î\Ö5]\å=¨¹\ÆWE\Å\Z\Évµ_-p\Ý,—:+ü»UTs¶h¤\â\åjñ{UQp\äT\\/\Í\Ú\0\0\0\0\0\0\0\0\0\0®u5«F\é®©½\ÍÚ ¶S>¢\\9¨\ç\á<F\ÎJˆ¯s°Ö¢ªe\ÎDýf?\Ù-u\êCz«·‹Z\Ð\Ñ&“¶Ô¥4™¥t\ì‘ñÆ‹:5U0\Æsd²*¢1\ïr¢1Q\ïFm\0\0\0\0\0\0\0\09õY\Óo–Œ\Þ8iû6›·-?ªejFX\Å\ÐÈ¨Œt®{QŽz«rª\Úh\ã\ËQ}\Ú0ó5E‚Í©\ì\ÒYuººYb–Zi“1È±H\ÙXŽO\ã7›\Zª\Õ\Ê*&Qa\\j‹ý\æºË±\Z!úC¬\"s\ë\'–wÂ”´MUW/$DEk\Ò)‘ÈŠ\å\á\ÛÁ\Ë#K\Ø\è]7·:B—K\éz/OEºI¨\éjeTNR\Ê\ì\'\'»	\ç\Â\"\"5\Zˆ‰\Ó\0\0\0\0sú“Dh½K\\\Ê\íG¤4ý\æ®8’O_m†¢F±UŽ{UQ¹s—,ªþ\Òs~\éd®Þ¾O¡Þ‚¦³¸\îýtñöüû£š\Ä\Þ*¹kx+œq\à™\ê~ˆt­G§ú3®/V\Þ<½G\Äib¬\î|¸ñ\á\Ù\ávs\Ë9O–<¦\Ú¨ô\Ò\áp\Ò\ËñøYL­—Z\Éd–£\Ú\×+R\n†\Ë®o¹^ž>nj9ÈžeF÷õ\'µ\Ð\Ó.\ç\í\Ä7k]4K-e\Æ8x9\è÷¹±£\êi\Õôñ9­o*ˆ\Ô\Æ\\ŽZf\×õYµº\Êh¨nusi;‹¢b¹·ec)œþs\ÚÊ„^<[\Ç\é;j\îM\Âep—:\nºZú\Zz\ê\Z˜j©*bl\ÐOˆø\åc“-{\\ž\ÕEEEO\nŠ}€\0\0\0\0\0\0\0\0[ÔŽ¢¼\ï¾öÛ¶OE÷Ÿe´Wf\ïR”YX*#{¢žuW93,zµ,\æ÷9Ÿ(”\×:LÚ´nµik$=ªe3)\â\ËZŽ~ÌâˆŠ÷;.r¢&\\\å_\Ö{ \0\0\0\0\0\0\0\0\'¼zB={µÚ‹H½º[\ÙL³HöFÊ†û\à{•ž\î-•¬r\á(˜TTð¼—I:\êm±¶[•}o«»Pr¶\ÜdT‘\\²ÅŽ.{žª¯{¢Xž\ç\"ª+ž¿%\Ê%d\Î}+úmuºû¡¼\éè§†º\ä–KDðw£w¥ŒËü\'r6\Ò;+\î\ä\×øb.F\0\0\0\0\0\0\Í\Ñ\Ø\r­\Üe}\ÏNCl¸\É+\æu\Î\Ò\ÖST¹\ï{\\÷½Qª\Ù\\\î8U‘¯T\ä\åL*\ä\Îu;y¾½3\ÍW©tE\ÚU¤ ŠI«i•µ‘£¦š“žZ\äTEI\"s•«Õ¬\ËVó°=Dh\Ý\Ö\íZÿ\0\î-Pþ\ë¾<‹\'qŒ\ÂòŠ^-lž\ÕÊ·ô\âõ\â­o%³\0\0\0\0\0\0\0\0Ï©½\ÆüX\í\Òÿ\0M\'µF(m>\Ü\âªDwùc›\ìk_&œ]\Ûãœ¹	ÿ\0BûQŒ\Û\ÈõµÅœïšžš9šdk\éhò®‰¬{r¿X\ÕdŽòŸømV¢±Ut`\0\0\0\0\0\0\0\0\0y\Úy$\Ð]Xnª–fÛµ\\M\ÔÖ…ª¯b£\æs—\Ô6(“ø\Î{¥ýŽFR¦QÉ‡%›r¯uZknµ.£¡Ž*\íVŠª\Ø2*\Æ\ç\Åž\Ôr\"¢«r\Ô\Î­	\ÏD¿£‘þ{÷\Ù\Ë0\0\0\0\0\0\0s\ê?¦ú\rQ\ê5\Æ\Û\Çð=wO¯\Í<î…•ò¦\Â\å¹7“doW«¹ùw6y3\ï•\æ›Q.\Îo\ZMnÕ´2¥%mc½Õ‹\ãŒ2»8tªŠŠ\ÉQU&Eo•z¢Ë§À\0\0\0\0\0\0\0\Ïs\í\Õõ¿@GõºOGw~#ú¹ð{=_þœ‰\ÎDŠ›\Ú\çcq¾M˜\0\0\0\0\0\0\0\0\0\0 N\Õ]\×\Ú=Îà´°\Ñ\Þ\Ýd¹UV{U³\'?\ÂpŽ4©r+†¹\è¸TWýÊ²Uj]ºÔºr†Hc«º\Ú*¨ |Ê©_,.cUÊˆªË“8E\\~¥\'=þŒZGù\ï\ßg,À\0\0\0\0\0\03\Õ6\ÊZ·[HM[IK\Ú\Õ\Ö\Êgº\×S5Q„W%,Š\åDV9\ÙDUT\à\çrEÂ½®\áº7\ß+Î¥®›kw&f§¶E\"R\ÕÕ»·=JD¼_\Íz£–¡žW(Š®k¯Ã˜\ç?O€\0\0\0\0\0\0Oxõ|zkµ®{\ál¶\ê¾™&\ïõö@\Ç#=\Ü]+˜\ÕÂ¦rª‰\å!ŸƒóHIŠ¼\î]\é“TÞµ%tŒŠ¶¦FK$´ñ»\Þôw™ÏŸ»Ï’û–&.<\"®Ÿ\0\0\0\0\0\0\0\0\0\0Îº\ít›o•uwf¶T\ÒUQ»›“·*\Î\ÈU\ØE\Âý\\\Ò7”÷gæˆ©`\Òwº]K¥m:Ž†9£¤º\Ð\Ã[&DI\Z\ÉXj9U\Ørg\n©ŸÖ¤O K\ï\Åúy¤·ú^\ÏÁ.UT<ûœ»Üœ•ñ„\ãýñ\Ç~\Æs\ç	\0\0\0\0\0\0\0#uû¥\ét\ä\Ú[xtò\Ãm\Ôt·xi¥š8Î¨{X²Á+ò¼U\Ñö¾Zª\äsQWj\Z²\Åt ¾X\è/v¹ýEÂš:ªYx9½È¤j9ŽÃ‘2\ÕEÂ¢/\í?h\0\0\0\0\0\0Sü!Ú¢©\ÚwLmµ•&©¸\ß+½L\ÔÔ“ª\Í##\Ã\"‰\Ð5\Ïl’¿-ÏŽPxETö\é\'d¥\ÓZVÓ§(dšJKU4P>eE‘Ì‰ˆÆ«•]†¦pˆ™ýHz`\0\0\0\0\0\0\0\0\0Œ\ßoÌ†¼ýÛ¸ý\ÚA±?™\rû·nû´g\Ò\Çþjÿ\0\îM\ãÿ\0\âY€\0\0\0\0\0\0\0É¿„ûñ¯¡»Ig¥õ—û¥\Ê*\æ3¹\Û\ãž\å<Ë‘½\Ç\É\'žiÇµ\å0\äSRØ­t;’\×§ ·\ÓGKK7;·mF±¹rª®\Zˆ™UUý§\í\0\0\0\0\0\0\0\ÈV~2¿e%;©¨®VL\Ç>JjŒvû¬­s\Õ\î{+gk­ùqDspS_€\0\0\0\0\0\0\0\0\0\Æo·\æC^~\í\Ü~\í ØŸÌ†ƒýÛ·}\Ú23\Ò\ç¿y\ï5Æ™\0\0\0\0\0\0\0¦7\ÊÍ´\Zu\"‰!¸\êª\è•m\Ö\åwµ©\å;óarØ‘Qpž\êŠ\Ö\ãs%\Zm®¤¾jz½÷Ü¥­¨¼\\>²\Ë%D\Ê\×\È\Ù\æIP\è\Ñ‹\Zµ‘7(\Þ•Ç´\ãY\0\0\0\0\0\0\0\Ð{#\Õ{‹ºŸ=’j9nUØ¤•^÷GTM,óÀ\Â6G7ê«Œ¢q_j;®@\0\0\0\0\0\0\0\0\0\0\ã7\Ûó!¯?v\î?vlO\æCAþ\íÛ¾\í\éóß¿¿¼‰÷š\ãL€\0\0\0\0\0™\Ü-£vþ\ÖÛŽ±\Ô4Vˆd\Ïi²¹],\ØsZ½¸šŠù0¯nxµx¢\åpžLÍ¸]Mk-u©£º|°\Ö\ÕÌ¹Inr\Ð$’ø™­I#c•Y8\ã™\'O”¾R5nW \éû¥\Ê[Ew\ÓMØ’M¨kbt\Ò[jØ•S\Í\"¹d|\Ïr¹*eÂ§•N-r½Sšðzið\0\0\0\0\0\0\É\ï=]U\ÏkJ\ê\Z™©j\é´ý|\ÐOŠ\É\"{iÞ­{\\žZ\äTEEO(¨IÝ’ª\Õ\Óûkª$…\Ñ^nõ5´\é\Zª¹¬j2QùDÃ¹Àõñ”Â·\Îr‰¡€\0\0\0\0\0\0\0\0\0\0\ã7\Ûó!¯?v\î?vlO\æCAþ\íÛ¾\í?\è\î\éA|±\î5\î\×?¨ ¸nÎª–^or)˜\ì9S-T\\*\"þ\Ò\æ\0\0\0\0\0\Æ\ÖZ¯M\è\Û—½Sz¢´PG”\î\ÔÈ\æ\äkÁ‰ó{Õ­r£\ZŠ\å\Â\á\Ë7¾£·Ct®“i\íƒ\Ñ±1œ{·ZÈ£’X²\Ôzr\ä«OOž\Ü\ÍN\ãŸ\Í1Ç‹¼žŠ\é;r\ê\á\Öw=Kz–X\ß4TµOXÞŒUo	g•YZ\æ64ö¤J\ÔEDUð\ä\Òz7Ji½cŽÉ¥¬´VŠð½ªhÑ¼Üky½~ozµ­E{•\\¸Lªž\È\0\0\0\0\0\0\0ž¶¿F-]ü\Ë\ï°ŸIvJ«Nz2†²Hd–ZVµbUVð©•õE\Ê\'¹+QVQpªžV¦\0\0\0\0\0\0\0\0\0\0\r\Ô]-\Åk©«*a¦‰\Ú~¶¾YW\É\Ø\Æ\"¯ñœ÷5¨Ÿ5W\"\'•>Ot ±ôé¤¯wIý=¿H\ÑUUKÁ\Î\í\Å÷a¨ª¸j*\áWögB–ºM¶:º8;S\\\êj\ê«\Í\ËÜ•\'|(\ì*\á>®Û„\Â{sóUU¹€\0\0\0\03¨þ£4\Þ\Õz‹¾/Œ\ê\çSw\"¥nž‘\Î\Ç©r92\ÕW£—*\"eXk\É6\Ýô÷¸;³©\à\Ü\rýº\Ö\Ä\Ä\ì¤v·µŒ¨ª§FrF9#V¥#992\Äj=Ue\ÊF\åG®³ÑºSM\è\ÛvM-e¢´PG…\íSF\æ\äk[\Í\ëó{Õ­j+Üª\å\ÂeTö@\0\0\0\0\0\0\0<þK\ÝU«§÷P\Ó\Ç¢¼\Ýé¨ªDUsX\Ô}B+0©‡s‰\ç)…wŒ\áR§±?™\rû·nû´gf\0\0\0\0\0\0\0\0\0\0g­¯Ñ‹W2û\ì¹·®\èI9Qv+\ã\Ò6ûeM=dNk¢\ï²\ZiQ\Í\Ê+^\Ö\Èü\"üœ‰”\\*=š°I¥¶›Ji\ê‹t6\êºE4U”ñ#8²£¶Õ™UY\ís–Ez«‘W’ª®W9:À\0\0\0\0S\ßÎ¡ªµ%t_±My\Ô7Y_K=Ò‰Er9”\ï\\\"»\rs–t^g¹®U^qô\Ý3ô\ÑfÛˆVù¬#¶_õS¥GBô»M@Œz9‹q¨«.Z\×,Š\ÔVøkq‡9ú\0\0\0\0\0\0\0\0\0\Ìß„wó!fý\äƒ\î\Õ&†\ÒvJ]5¥m:r†I¤¤µP\ÃE\æTYÈ˜Œj¹Q\Øjg‰ŸÔ‡¦\0\0\0\0\0\0\0\0\0\0g­¯Ñ‹W2û\ì™\ÖtT·;¡tEM\Þj8µ.² ¢«‚š¥#šzU\ä’*5sÉ¬{¡w–¹¨\îÚªg\ä\0\0\0\0‹z˜\ß+\Î\ä\ê$\ÙÍœI®0\×J´•µ´n÷\\W\Ï(bvp\ÚtDU|ª¨Dw”‰d¹ôÏ±¶m Ó«,«\r\ÇUWD‰q¸£}­OØ‡)–ÄŠ‰•ð¯TG;kY_\0\0\0\0\0\0\0\0\0fü#¿™7\ï$v©4]-}\r=u\rL5T•16h\'†D|r±É–½®Oj¢¢¢§…E>À\0\0\0\0\0\0\0\0\0\0g?\Â\rñYöb\Ïk´z\Ùf¹\êJZE¥¥ä®«\ÌS¹‘po—\æFÆ¨\Ü/¹­TL¢·{~~\ê·eô\ÍoðŠšˆ\Ý$§÷³†\"G\ÓI\É0‹õ´®^9_±\îL/›ø\0\0\0\0g«ýÒº\Ý\î\Ø-»¶\Ö\Ü5-ß·\r\ÊHUÑ¬Q½­—°\Å\Ê\"ò#Ü½¶Ä®E\Î\\±\Ñúg\Ø\Û6\ÐiÕ–U†ãª«¢D¸\ÜQ¾Ö§…\ìC”\ËbED\ÊøWª#Œ5¬¯€\0\0\0\0\0\0\0\0\0fo\Â;ù³~òA÷j’Í±?™\rû·nû´gf\0\0\0\0\0\0\0\0\0\03ªÛ¥7Í ²I?\Zú½À·UA{\â…\Ê\Ùœa0\é\âL*\åyx\ÎÍ’–\ë\×}’º¢I›-›B:¶#TF¹îªšQùE\ËxNõñ…\Ê7\Î2‹y\0\0\0\0ž©·®Õµ:Bj*J®î®¹\Ó=¶ºh•ª\ê|¢µ*¤G\"¢1®Ê¢*/77Š&\îo\'Ñ¾\ËUiš·p-óI­®²\É4®•dž’.{\ÑÉ–THªõzª«‘ª^*²5t\0\0\0\0\0\0\0\0\0\0Œõµú1j\ï\æ_}€\ëz}«¥­Ø­5L517O\ÑB\ç\Å\"=¨ø\ác\ÅTþ3^\×5S\æŠ\ÕEò‡r\0\0\0\0\0\0\0\0\0\0¨%-ÿ\0¨Í‹¡¬’hâŠº\éZÕ‰QÎš(*‹”_j¾&¢þ¼*\áQ|§§þ\ß\è\Ûý¤Y€\0\0\0$Lo•›h4\êECq\ÕU\Ñ*Û­\Ê\ïkS\Êw\æ\Â\å±\"¢\á<+\Õ­\Æ\æOúg\Ø\Û\ÍN¢]\ã\Þ5š\ã«k¥Jº**\Æû¨\×\Ç¥n0\ÙQ‘\"\"Bˆ\ßôD‹O€\0\0\0\0\0\0\0\0\03\ê¢\Åô‹§koõ^—µmuw>\ß<úg6£†2Ÿkµ\Ç?«–p¸\Âø½þŒZGù\ï\ßg,À\0\0\0\0\0\0\0\0\0\0@5m¾\ëx\ë·Gv«€XtŒ÷9)\å•\ÜSºúŠg,mÂ§7:Hr¾2\Øþk\Åö\Ã{ý´‹0\0\0\02\Îøu?3®‘h½¥úQŸ½Õ´ôrT¶%k^Š”ñ¢}sÓŠ\É\Ï‹‹SÄˆ\å\ãûzp\éŸ\è\ÅòŸp÷*»\ãz²_\ál¤•{¬¢ªs•Î–I\Ëß™2\Õ\åöZþJŠõF=4\È\0\0\0\0\0\0\0\0\0\0\Æ\×v/¥\Zý¦}W¤ø½¶¢‡\Ôvùö»±9œø\å9c–q”\Î>hgŸÁ¿WJýž¿P²¦UÃ¨$šXDY\Ç\ÓÀŒz·\ær\ÆôE_\n¬v>Jið\0\0\0\0\0\0\0\0\0\0 yoº\Ü:\Ý\Ü\Ûìµ½\Ú=’‚\Ù2\Ê\ç:?Q5#n0Œ\å\ÎT\Ê{Ÿœ/%TønÝ¶–\Õ\Ö~\Ñj\ÊË¤0Eq¡¯µ¶)pÆµñ\Ã/=WË¤}[X\Â.Q2®\Âh`\0\0=\Ý\ßM¸\Ût\×ûÏª»7ôM¹z´\Ï÷7(Ø½²#Ó¸\ærj/J˜3c*w×ª§KF‡Hm\ë¥d®r\ÂöÁ;;‘©Ê®V\ár\ÔVE\Êª¤n\ã\'±{)£v–\ÖßƒRú»\ä\ÔÍ‚¾\ï:/v£W*5ªª‘3–=ù£Y\É^­GÀ\0\0\0\0\0\0\0\0\0\0\0¢úŠ\r7\Ô^\ímý®\ÝÙ J™\ä¥w}\Î\ìEGXøY•v[Pž\åvS‡œò\Êkð\0\0\0\0\0\0\0\0\0\0 %AñM_¼\Z\é·ßŠ\Ãv\Õ\Ò\Ð\Ó9\Ýob•\\\èž\Éy*9‹C\Z\ÔO\rli…TTDøu¾\È\ìºwC\î4vI®uzOT\Ò\Õ9c{\Ú\ÖS¯½\íz¢+X\×\É;y¹«…V¢}¬.†\0\ã_WKACQ]]S\r-%4Nšy\æ‘Lje\Ïs—\ÃZˆŠª«\áf\èõYµº6ihm•sjË‹bzµ¶•c\éšþ\rs\Zú…^<]\Ë\n\èûŠ\Þ.\Êe0²j-q\Ô\ÏPºCŠ\ÓK\"¶\ç¤¦k\Ù\ÍUZ•Ì’9®…X®§kS.Tz#W	S\Ú.”v\ãEð­¿\Åô\Æ\ì\Üýe\ÆJF}´ö\ÓeZ¹k‘¸²{˜Žo/\à\0\0\0\0\0\0\0\0\0\0\0\0É·Ykôo\á¤©©ºQRPj\ëk\Z\äsšœ\âZeŠ8œ¯D\â÷T\Ò3Š5r¹bgÜ­5\0\0\0\0\0\0\0\0\0\0ñµ\Ý÷è¾‡¿joK\êþm¨®ôý\Î\Þ\ÔNX^9\ãŒ\áqŸ’’ÎˆlØºs°Ê¶é¨ª\î²\Ô\\*’Tz:et®dr\";\ä\×C8\ÆSó\ÉUx]\Ë\Ö5ýBk…\Ùý¼gD\ÒT\Ã&­\Ô«xI%Gv©Þ­r}¦{ˆ«#Û”\ÄL{Ÿ©\É\ê­\Ì\Û\Í-5m>¡\Ö\Ú~\ÝWCv¢ŽZøýK‡4D…¸\ç+U\ZUvS¹B?¬º\ÅÚ›?r+w­K7¦Y!’š—±N²û¸\Ä÷L­{|¢eÍÈˆ\ä\Ç%EC†¨ß¾¡72\Zhv¯k\æ³P\×Ä©\ÎHR\Þq½\Ê÷2¦f²™\Z¨\ÅgµW<‘’µA\Òþ\énu=\ßy·*ejJÚ–\ÐC+\ê\ä‰%^U7—i\á­N\ÒHÌ§„\â\ÔE¶mN\ÛS *)k\íº{\âWjo1\Ün²z‰Q\ÝÄ‘¯F\á\"cÚ¨\Ôk\ØÆ¹>yUU¬€\0\0\0\0\0\0\0\0\0\0\0\0\×\å\rVš\Õ[y»‹l2UÚ«’	ª&‘V7>\'¶¢–\'FŽEV\åµ*ª\ÔEÇ…r{MgAWK_CO]CS\rU%LMš	\á‘¬re¯k“Ãš¨¨¨©\áQO°\0\0\0\0\0\0\0\0\03®mMôw§›­<sV\ÃS{©‚\Ù”\Î\ãŽN\îÈ\\¢ðtQJ\ÅD\Îy¢*aURmÝ½\ÞÜ›v\ï`ô\åm¾\Ça¶\ÅF\ê\éj!õ\ï§c]k$\ïVE\Þ\Î.\ã½•TE\Ç\ÛM\íÿ\0W{eBý)¡›lužVf\Ï@–ÕŽw½\\õuC[3œž—¦p\ÄDö£N\ÏRmW—úQ\×nþŸ†&J’£¨*e¢“(Š˜WÁJ\Ç+|¯µW\Â\ã(˜ó*úI\×Úº\×C&\àoUmu}?sŒ\Ã=\Æ*~NóÛ’i˜¾æµŠ¾\ÆùLy\Â*÷:o£ÍŸµW>¢¹º‚ý¢V%=}ÁW(¼\Ñ`dn\ä˜Tò\åL9|g\n•=µ[q¢ý#ôÎ‹²\ÐT\Ñóôõž™$«g>\\¿„?2®Q\ÎO._jñùx;0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Œõ¥¥¾”tó¨;4>®¶\ÑÛºS}o\×i\ß]\'•Dv tþ\Õ\Îs\á\ÜOO¤»\ÝUÿ\0§=]Y1\Ë¨š‘\"£xSJúv*\åWÜ¬‰ª¿«*¸DO	S\0\0\0\0\0\0\0\0S\ê\Í+¥ý?\ÒmKe²zž^Ÿ\â5\ÑS÷x\ã—nNX\ä\Ü\ã\å”ý¤\çUu/²\Úzj\Úiuœ7\ZºH¹¤6\Úyj[:ðäŒŽV7²\ç.Q>\Ú\"/‡*aq2¼u§`žº\ßC¢öûP_j\ê\å\ì¬S2šE{•©\"lI2\È\ç*ªcÚ¹\Æ3Ÿef\ãõu®½lZKn~ŠCOR’2JŠÁQ\Úw>1+«œŒ—\Æ9:8\Ñr\Öý”vd\éUj{¤7]\à\Ü\êÛ¬\Ðòƒ·G<µRºj«µ5Y‰\åVvÜ˜\Î\Þ\ÝM£t¦›Ñ¶8\ìšZ\ËEh Ú¦\Í\ÈÖ·›\×\æ÷«Z\ÔW¹UË„Ê©\ì€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\03VY)u.•»i\Ê\é&Ž’\ëC5\ï…Q$k%b±\Ê\ÕTTGaËŒ¢¦R™›ðm^\égÛ­Q§\ÉWCwml¯TNÚ²xZ\Æ\".s\É™ù\Ê\"a[…\\®5`\0\0\0\0\0\0%š×¨MŸÒ”)QU­\í—9_†ž\Ñ*V\É*±xf,¶7;(\î9ˆ«Ÿ8ET“^:Ó°O]o¡\Ñ{}¨/µuröV\n©™M\"½\ÊÔ‘6$™ds•U1\í\\\ãÏ6\êue«¾/›\Ú:+,)É°Iq¤}5E;_Ë¶­uT±²gµÊ¤jÜ¢rj#‘\áO£z\ÍÕºv¦šõ¯-šu²JŒXdš\nz—#x¹\Éh¡rµª¾<=p\äT\â¾U*nN«Ó´Ôºû|\îu’¶U™\Ô26¢\áMÓ“Zö:Y™—p_ŸªrryO+\ÐXº.\Û*?A-\Òõ©®sA\ÛuT~¢(i\ê\\\ÜsN-›\åEð’rD_Ï’¦úx\Ùks\ë(vþ\Ù4¯‰bV×¾Z\Øðª‹”d\î{Q\ÞÜ‰œe3…\\\Ð4Þž°iª\Ð\é\Ë²\ÍI$«3à ¤e<nz¢\"½Z\ÄDWa­Lüð‰ûL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0M\é¯\ã¶³·oL\Öÿ\0¦®õWI)ýçš¶>šNI•Oªªrñ\Ê}¿re<k \0\0\0\0\0Ÿ\îvò\í\Æ\Ý\Ó\Õ}#\ÔôI_M\í[],‰=kž±¬Œoi«–rj&þ,÷7.L¡\0½õ=¸ûtšÍ±»w[<>\Úy.5”«<°¾f£c‘\È\Çviø¹$\Â\Ê\ç±\È\ÔU\âˆ\ä>\Ñt\ç¼—4u\ÛÑº32‘ò\ÓU:\ÓDå™­Tbµ\í\àœ)\à•­^(ø\Û\"*¹\ë\çø\Ô\Ý\Ò\æ\Ï\é)™RûÚŠ®9\\öM{™*\Z\Ôs8ðXš…\ÍO*œ˜ªŠ¹Ï†\â¿d´Ú¬v¸mvKe²‚]ªZ8Qòr¹x±¨ˆ™rª®æª§\í\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0dÛ¾\ëaü$vÚ[Â›Q\ÛV£·®Np6‚H»r¦\ëiy¢yO_ša5\0\0\0\0\rñ\êAm\\\Ó\Úk&š\ï¨\Ù=¶ª$÷1\\\Ç9‹4‹í«†\å=\ÏD{\\ŒT\\\Ê-q\Ô\ÏPºCŠ\ÓK\"¶\ç¤¦k\Ù\ÍUZ•Ì’9®…X®§kS.Tz#W	F\Ûv\ãK\ÔR\Ü5En­¯ƒÜ¬ªD†‰^’#˜\î\Ãr«†¢5Z÷½ŽË²\ß(‰¡¨))h(i\èhi¡¥¤¦‰°Á1£#‰L5jxkQ<\"!ö\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\01\×SUuT]rmd\Ôu3SJ\è­p¹ñH¬r²K„\ì{Sø®cœ\ÕO’£•Â›\0\0\0†\Ým\Ú\Ð[eB³j»\ì0Uº.\ä\è~¶®t\ÃÕ¼bO(\×,nj=\ÜY\ËÂ¹\Ù6\á\ï\ÏQK…\ÕEôGF\ÓÔ¬s|ÞžU\ÃZö$³·“ùåˆ¼)\ÓÚ“#^®j£–›´](\íÆ‹\á[‹\éÙ¹úËŒ(”Œûi\í¦Êµr\×\"/qd÷1\Þ*_À\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0M\ê\Êû\ê:§\Ùm3\éxú•%w¨\îg¹\ê+£g8ñ\Ç\Óg9\\óù&<\ë \0\0\ã_WKACQ]]S\r-%4Nšy\æ‘Lje\Ïs—\ÃZˆŠª«\á§¸ýT]u§‡B\ìE“\ãw*þ0\Ó\Ýg…É—¹ŽWv z7=®Yeö\'òb±9/\ì\Ú•û\×J-s¼×º\ÝK¨d\íTKm¨›¿Öª$u¹\\µZ‘xEkX­^\ãÎ  ¤¥ ¡§¡¡¦†–’š&\ÃÆŒŽ&50\Ö5©\á­DDDDðˆ‡\Ø\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0g\Õ?é½µ_ý?ÿ\0¥1³\0\0\0p\ÛËººGiô\ìWSS2º¦^\Õ%+Zúš•LrV5\Îjqj*+œªˆ™D\Ï\'5/\Ò\Ñ\ï_Uµ«­¨ú·ßŽ>Â¹\ÑT+$G56º©\è\äcy¯š±=Zz+]©¶›l4n\×\Ø\äµ\é_¦õYU+\ÖJŠ·±¼Q\Ò=ù^-F±\ÎVµ¼”\ìÀ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0#uƒm¥´u3³\ÚÒº\é\r=$\Õ\Ô\ÔÓ¤ØŽ:vR\Ö\Ç+¥tŠ¸\â©R¹\Ê\"5#\ÎW>5\È\0\0Aº˜\ê>Íµ&ž³\Ñ\Ã}\ÕRD®}:\Í\Æ\Zsc|Ê‰—9UZ©+U[•W3,WOö;§Î©\ÔPn¶ø\ÖMqºWJµ‹c«‡\ÜõööS\ç\rj\"/ðdj#Q#k°ˆ\ègAIKACOCCM\r-%4M†!Lja¬kS\ÃZˆˆˆ‰\á°\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ç\×î…›Tm\ZŽ\ßE\ê+ô\ÕJÔ½Z²+ÒŽD\ã?5Hdr¹‹\"z\å<¢÷=0\î.\è\íu\Æj\èe\Ô416šõ9;Œ™2‰*µ\Z\ÔFÊ\î\'âŠ®j*«Š˜\0©7\ï\è\r¡\ãø®¾¸ðŠ(¡‹½\è;˜F9Xˆ¼\ævS·\æŽrc‹dt·°Ÿ@ù\ëq\'\ÅuõÇœ²\Ë4½\ïA\ÜÊ½¨õU\ç3²½\Ér¿5kW%ü\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0#o.\Î\ê\í©×±n\æ\ÃQ\Ì\æº^7-?K¥j#Üœ‘·Ì”\ï\\r¾c\\9˜j\"\Å\Ö\íV»}©­tTšÎ§\è½ýÝ¨f\î\Äõ¢šW9Z®ŽT\å\Ûg†¹{¼Qœñ\É\È\Õq¡¨*\ék\èi\ë¨jaª¤©‰³A<2#ã•ŽLµ\írxsU<*)ö8\Ímº»q¢ý[56´²\ÐT\Ñðõ~¥$«g><ƒ³2®Q\Í_\r_jòùy36­\êCpwr\éQ ö3JV\Ò\ÉUM\"\É_<¬ekbF±\\ö¯4Š›Íœ\Ü÷ªógc\Õ©ô\Õ\Óô{u]U¬5|:‡\\\ÖK+Z|±\Ó#\Õy,n‘Ï–Lª¾G\".­L\'%}\ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\Î\è\ìŽ\Ún<\Ò\ÖjM7\n\Ý$‰\ìK•#Öž¥X\Ö#\Ü\æa%sQ\ã\ÝG¢cÂª,Oò2øF§øÎŠ\Ý{ÖŸ\íz?\Ñs«‡,\âÿ\0¯ŠX³œ¿\ä\Öû]…Ï•_\Ù{\ék__-sZ\ï}D\êkü{´µ”³\Íœ\\ŽNLuZ¢\áÈŠ™Oš\"ž¦€\è\ãm,²MSUs\ÕUk™#d•i)²¯\Ë^\ÆD½Æ¹\Zˆ\ß2¹.\\|¸\ßôÞž°iª\Ð\é\Ë²\ÍI$«3à ¤e<nz¢\"½Z\ÄDWa­Lüð‰ûL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ù');
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
  `quantidade` double NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  PRIMARY KEY (`id_item_venda`),
  KEY `FK_6vheeo5tjv9y8h20jvakn8oj9` (`id_produto`),
  KEY `FK_fy5q2teu3b9cd5n67riwefne2` (`id_venda`),
  CONSTRAINT `FK_6vheeo5tjv9y8h20jvakn8oj9` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`),
  CONSTRAINT `FK_fy5q2teu3b9cd5n67riwefne2` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id_venda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (1,'','Modelo Teste',1),(2,'','TESTE',7),(3,'','TESTE',7),(4,'','TESTE',7),(5,'','TESTE',7),(6,'','TESTE',8);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `montadora`
--

LOCK TABLES `montadora` WRITE;
/*!40000 ALTER TABLE `montadora` DISABLE KEYS */;
INSERT INTO `montadora` VALUES (1,'','Montadora Teste'),(2,'','TESTE'),(3,'','TESTE'),(4,'','TESTE'),(5,'','TESTE'),(6,'','TESTE'),(7,'','TESTE'),(8,'','TESTE');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentacao`
--

LOCK TABLES `movimentacao` WRITE;
/*!40000 ALTER TABLE `movimentacao` DISABLE KEYS */;
INSERT INTO `movimentacao` VALUES (1,'2017-07-02','Obs Teste',2,1,2),(2,'2017-07-02','',2,2,2),(3,'2017-07-02','',9,3,2),(4,'2017-07-03','',2,1,2),(5,'2017-07-03','Uso pessoal',2,2,2),(6,'2017-07-03','Teste',2,2,3),(7,'2017-07-10','ObservaÃ§Ã£o Teste',3,1,2),(8,'2017-07-10','',9,3,2),(9,'2017-07-10','',2,2,3),(10,'2017-07-10','',2,1,2),(11,'2017-07-10','',3,2,5);
/*!40000 ALTER TABLE `movimentacao` ENABLE KEYS */;
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
  `nome` varchar(50) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_imagem` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `controla_estoque` bit(1) DEFAULT NULL,
  `mostra_vitrine` bit(1) DEFAULT NULL,
  `qtd_minima` int(11) DEFAULT NULL,
  `preco_compra` decimal(19,2) DEFAULT NULL,
  `preco_venda` decimal(19,2) DEFAULT NULL,
  `margem` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `FK_5rxwsr0kb6apig8cw13bximd` (`id_categoria`),
  KEY `FK_51ujkp87s34oq10ouej5hxtm9` (`id_imagem`),
  CONSTRAINT `FK_51ujkp87s34oq10ouej5hxtm9` FOREIGN KEY (`id_imagem`) REFERENCES `imagem` (`id_imagem`),
  CONSTRAINT `FK_5rxwsr0kb6apig8cw13bximd` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (2,'','Teste Casa do Ã”nibus',2,1,11,'','\0',5,100.00,120.00,20.00),(3,'','Farol Direito',1,3,0,NULL,NULL,2,50.00,52.00,4.00),(4,'','PRODUTO TESTE 2',2,4,5,NULL,NULL,5,60.00,80.00,5.00),(5,'','PRODUTO TESTE 3',5,5,7,NULL,NULL,2,20.00,21.00,5.00),(6,'','PRODUTO TESTE 4',2,6,0,NULL,NULL,2,15.00,20.00,4.00),(7,'','PRODUTO TESTE 5',5,7,9,NULL,NULL,2,10.00,10.00,5.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_modelo`
--

LOCK TABLES `produto_modelo` WRITE;
/*!40000 ALTER TABLE `produto_modelo` DISABLE KEYS */;
INSERT INTO `produto_modelo` VALUES (2,2,2),(3,3,3),(4,4,4),(5,3,5),(6,4,6),(7,5,7);
/*!40000 ALTER TABLE `produto_modelo` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `ativo` bit(1) NOT NULL,
  `data` date NOT NULL,
  `desconto` decimal(19,2) DEFAULT NULL,
  `forma_pgto` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `total` decimal(19,2) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_venda`),
  KEY `FK_fwmdliq4e53pcssq6qq4fxmp3` (`id_cliente`),
  CONSTRAINT `FK_fwmdliq4e53pcssq6qq4fxmp3` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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

-- Dump completed on 2017-07-24 14:37:20
