# Host: localhost  (Version: 5.6.17)
# Date: 2016-05-09 16:25:55
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES latin1 */;

#
# Structure for table "usuarios"
#

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `senha` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `status` bigint(20) DEFAULT '1',
  `ultimo_acesso` bigint(20) DEFAULT '0',
  `atualizado_em` bigint(20) DEFAULT '0',
  `criado_em` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

#
# Data for table "usuarios"
#

INSERT INTO `usuarios` VALUES (1,'guilherme@gmail.com','teste',1,1439075650,1439075650,1439075650),(21,'guilhermeborgesbastos@gmail.com','teste',1,0,1462276470,1458412274),(22,'camilla@gmail.com','teste',1,0,1462719643,1458417574),(24,'onilda@hotmail.com','teste',1,0,1462276196,1458427135),(25,'thiago@gmail.com','teste',1,1439075650,1461287019,1458427819),(26,'simone@gmail.com','teste',1,0,1459694479,1458497466),(28,'rafatavares@gmail.com','teste',1,0,1459516379,1459516379),(29,'birielramos@gmail.com','teste',1,0,1459516490,1459516490),(30,'bellapereira@gmail.com','teste',1,0,1459516540,1459516540),(31,'gabipereira@gmail.com','teste',1,0,1459516562,1459516562),(32,'izaelnines@gmail.com','teste',1,0,1459516594,1459516594),(33,'ramossouza@gmail.com','teste',1,0,1459516637,1459516637),(34,'thiagocorrea@gmail.com','teste',1,0,1459516669,1459516669),(35,'ranierecunha@gmail.com','teste',1,0,1459516700,1459516700),(36,'rosecleide@gmail.com','teste',1,0,1459516727,1459516727),(37,'robertinho@gmail.com','teste',1,0,1459517024,1459517024),(38,'erick@gmail.com','teste',1,0,1459517086,1459517086),(39,'rosangela@gmail.com','teste',1,0,1459517121,1459517121),(40,'eliza.turan@gmail.com','teste',1,0,1459517152,1459517152),(41,'rogerio.alcantra@gmail.com','teste',1,0,1459517281,1459517281),(42,'reinaldo.silva_@gmail.com','teste',1,0,1459517316,1459517316),(43,'rafael.da.silva@hotmail.com','teste',1,0,1459517363,1459517363),(44,'rozeiro.costa@hotmail.com','teste',1,0,1459517397,1459517397),(45,'allan.nazare@hotmail.com','teste',1,0,1459517438,1459517438),(46,'alisson.de.mello@hotmail.com','teste',1,0,1459517465,1459517465),(47,'luan.santana@hotmail.com','teste',1,0,1459517487,1459517487),(48,'roberto.carlos@hotmail.com','teste',1,0,1459517534,1459517534),(49,'racionais.mc@hotmail.com','teste',1,0,1459517565,1459517565),(50,'camila.berre@hotmail.com','teste',1,0,1459517646,1459517646),(51,'izabelle.de.sa@outlook.com.br','teste',1,0,1459517682,1459517682),(52,'fernanda.mello.sa@outlook.com.br','teste',1,0,1459517712,1459517712),(53,'roberta.lima@outlook.com.br','teste',1,0,1459517807,1459517807),(54,'luiz.felipe@bol.com.br','teste',1,0,1459517851,1459517851),(55,'regiz.bitencur@bol.com.br','teste',1,0,1459517882,1459517882),(56,'paulo.nasher@bol.com.br','teste',1,0,1459517909,1459517909),(57,'alexandre.bastos@bol.com.br','teste',1,0,1459517977,1459517977),(58,'simone.bastos@bol.com.br','teste',1,0,1459518006,1459518006),(59,'doriz.bastos@bol.com.br','teste',1,0,1459518025,1459518025),(60,'rafael.zeroni@outlook.com','teste',1,0,1460552360,1460552360),(61,'bruno.amaro@outlook.com','teste',1,0,1460552405,1460552405),(62,'jose.nunes@outlook.com','teste',1,0,1460552445,1460552445),(63,'alex.nunes@outlook.com','teste',1,0,1460552485,1460552485),(64,'simoneborgesbastos@gmail.com','131187',1,0,1461944794,1461944794);

#
# Structure for table "cadastros"
#

DROP TABLE IF EXISTS `cadastros`;
CREATE TABLE `cadastros` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) unsigned NOT NULL,
  `foto` varchar(200) CHARACTER SET utf8 DEFAULT 'uploads/user_profile/default.png',
  `nome` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `sobrenome` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `nascimento` bigint(20) DEFAULT '0' COMMENT 'Em timestamp',
  `latitude` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `longitude` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `atualizado_em` bigint(20) DEFAULT '0',
  `criado_em` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_cadastro_usuarios` (`id_usuario`),
  CONSTRAINT `fk_cadastro_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

#
# Data for table "cadastros"
#

INSERT INTO `cadastros` VALUES (1,1,'uploads/userprofile/A20CF1B8FFB203B95C40EB3BAFE4F78C.jpg','Admin','Master',741322800,'44.089224','6.853764',1439075650,1439075650),(19,21,'uploads/userprofile/A20CF1B8FFB203B95C40EB3BAFE4F78C.jpg','Guilherme','Borges Bastos',741322800,'-19.746576','-47.931526',1462715192,1458412274),(20,22,'uploads/userprofile/74D0800973CFAE578AC6552E38ED666E.jpg','Camilla','Almeida',718686000,'-19.746551','-47.931526',1462715185,1458417574),(22,24,'uploads/userprofile/66958D6A5E99766EE6A5D9FBFAE542E5.jpg','Onilda','Alves',718686000,'-19.746576','-47.931526',1462279442,1458427135),(23,25,'uploads/userprofile/58B25FA1B9F3B6C7BD890322D624A806.jpg','Thiago','Borges',685335600,'-19.752254','-47.9607933',1461343020,1458427819),(24,26,'uploads/userprofile/0DDBEA55BA12B580CC3277475F47CB26.jpg','Simone','Pereira',104468400,'-19.765946','-47.95157',1461286708,1458497466),(25,28,'uploads/user_profile/default.png','Rafael','Tavares',1459343633,'-19.748982','-47.957554',1459516379,1459516379),(26,29,'uploads/user_profile/default.png','Gabriel','Ramos',1459343633,'-19.731855','-47.917042',1459516490,1459516490),(27,30,'uploads/user_profile/default.png','Izabella','Pereira',1459343633,'-19.759806','-47.937984',1459516540,1459516540),(28,31,'uploads/user_profile/default.png','Gabriela','Pereira',1459343633,'-19.761745','-47.898502',1459516562,1459516562),(29,32,'uploads/user_profile/default.png','Izael','Nunes',1459343633,'-19.761422','-47.991028',1459516594,1459516594),(30,33,'uploads/user_profile/default.png','Ramos','de Souza',1459343633,'-19.773538','-47.956181',1459516637,1459516637),(31,34,'uploads/user_profile/default.png','Tiago','Correa',1459343633,'-19.755768','-47.960987',1459516669,1459516669),(32,35,'uploads/user_profile/default.png','Raniere','Cunha',1459343633,'-19.773053','-47.918930',1459516700,1459516700),(33,36,'uploads/user_profile/default.png','Rose','Cliede',1459343633,'-19.727169','-47.919102',1459516727,1459516727),(34,37,'uploads/user_profile/default.png','Robertoq','Tavares',1459343633,'-19.750759','-47.936268',1459517024,1459517024),(35,38,'uploads/user_profile/default.png','Erick','Ramos',1459343633,'-23.550520','-46.633309',1459517086,1459517086),(36,39,'uploads/user_profile/default.png','Rosangela','Tami',1459343633,'-23.548977','-46.653442',1459517121,1459517121),(37,40,'uploads/user_profile/default.png','Eliza','Turan',1459343633,'-23.549292','-46.566925',1459517152,1459517152),(38,41,'uploads/user_profile/default.png','Rogério','Alcantra',1459343633,'-23.533240','-46.577225',1459517282,1459517282),(39,42,'uploads/user_profile/default.png','Reinaldo','da Silva Campos',1459343633,'-23.571007','-46.654129',1459517316,1459517316),(40,43,'uploads/user_profile/default.png','Rafael','da Silva Campos',1459343633,'-23.504908','-46.587524',1459517363,1459517363),(41,44,'uploads/user_profile/default.png','Rozeiro','da Costa',1459343633,'-23.517186','-46.693954',1459517397,1459517397),(42,45,'uploads/user_profile/default.png','Allan','de Nazaré',1459343633,'-23.537961','-46.521263',1459517438,1459517438),(43,46,'uploads/user_profile/default.png','Alisson','de Mello',1459343633,'-23.555587','-46.725197',1459517465,1459517465),(44,47,'uploads/user_profile/default.png','Luan','Santana',1459343633,'-23.487906','-46.626663',1459517487,1459517487),(45,48,'uploads/user_profile/default.png','Roberto','Carlos',1459343633,'-23.496092','-46.587524',1459517534,1459517534),(46,49,'uploads/user_profile/default.png','Mano','Brown',1459343633,'-23.595549','-46.555595',1459517565,1459517565),(47,50,'uploads/user_profile/default.png','Calila','de Costa Berre',1459343633,'-23.593347','-46.740646',1459517646,1459517646),(48,51,'uploads/user_profile/default.png','Izabelle','de Sá',1459343633,'-23.595235','-46.555939',1459517682,1459517682),(49,52,'uploads/user_profile/default.png','Fernanda','de Mello Sá',1459343633,'-23.506797','-46.525040',1459517712,1459517712),(50,53,'uploads/user_profile/default.png','Roberta','de Limma',1459343633,'-22.906847','-43.172896',1459517807,1459517807),(51,54,'uploads/user_profile/default.png','Luiz','Felipe',1459343633,'-22.917023','-43.194637',1459517851,1459517851),(52,55,'uploads/user_profile/default.png','Regiz','Bitencur',1459343633,'-22.917655','-43.219357',1459517882,1459517882),(53,56,'uploads/user_profile/default.png','Paulo','Nasher',1459343633,'-22.894569','-43.229656',1459517909,1459517909),(54,57,'uploads/user_profile/default.png','Alexandre','C. Bastos',1459343633,'-22.908801','-43.219013',1459517977,1459517977),(55,58,'uploads/user_profile/default.png','Simone','B. Bastos',1459343633,'-22.897890','-43.269310',1459518006,1459518006),(56,59,'uploads/user_profile/default.png','Doriz','B. Bastos',1459343633,'-22.906429','-43.282871',1459518025,1459518025),(57,60,'uploads/user_profile/default.png','Rafael','Zeroni',1459091636,'-25.428379','-49.265163',1460552360,1460552360),(58,61,'uploads/user_profile/default.png','Bruno','Amaro',1459091636,'-25.438648','-49.299173',1460552405,1460552405),(59,62,'uploads/user_profile/default.png','José','Souza Nunes',1459091636,'-25.416633','-49.237118',1460552445,1460552445),(60,63,'uploads/user_profile/default.png','Alex','Freitas Nunes',1459091636,'-25.443686','-49.255228',1460552485,1460552485),(61,64,'uploads/userprofile/5D03F46C880347A6DE4648E6406ACC68.jpg','Simone','Borges Bastos',1882321200,NULL,NULL,1461944795,1461944794);
