CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Sexo` char(1) DEFAULT 'M',
  `DataNascimento` date DEFAULT NULL,
  `Peso` double DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `Index_Sexo_Peso` (`Sexo`,`DataNascimento`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
