-- MySQL Workbench Synchronization

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER SCHEMA `dbhotel`  DEFAULT CHARACTER SET latin1  DEFAULT COLLATE latin1_swedish_ci ;

CREATE TABLE IF NOT EXISTS `dbhotel`.`cardapio` (
  `CARDAPIOID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `DESTINO` INT(11) NOT NULL COMMENT '',
  `REPOSICAO` INT(11) NOT NULL COMMENT '',
  `CODIGO` INT(11) NOT NULL COMMENT '',
  `DESCRICAO` VARCHAR(50) NOT NULL COMMENT '',
  `PRECO` DOUBLE(6,2) NOT NULL COMMENT '',
  `DATAINCLUSAO` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `DATAATUALIZACAO` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '',
  `FRIGOBAR` CHAR(1) NOT NULL DEFAULT 'S' COMMENT '',
  `AVULSO` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '',
  `ALTERAPERIODO` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '',
  `COPA` CHAR(1) NOT NULL DEFAULT 'S' COMMENT '',
  `COZINHA` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '',
  `EXTRA` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '',
  `EXCLUIDO` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '',
  PRIMARY KEY (`CARDAPIOID`)  COMMENT '',
  INDEX `DESTINO` (`DESTINO` ASC)  COMMENT '',
  INDEX `REPOSICAO` (`REPOSICAO` ASC)  COMMENT '',
  INDEX `CODIGO` (`CODIGO` ASC)  COMMENT '',
  CONSTRAINT `cardapio_ibfk_1`
    FOREIGN KEY (`DESTINO`)
    REFERENCES `dbhotel`.`departamento` (`DEPARTAMENTOID`),
  CONSTRAINT `cardapio_ibfk_2`
    FOREIGN KEY (`REPOSICAO`)
    REFERENCES `dbhotel`.`departamento` (`DEPARTAMENTOID`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = FIXED;

CREATE TABLE IF NOT EXISTS `dbhotel`.`config_geral` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `DATATURNO` DATETIME NULL DEFAULT NULL COMMENT '',
  `TURNOATIVO` CHAR(1) NOT NULL COMMENT '',
  `SENHAMASTER` VARCHAR(10) NOT NULL COMMENT '',
  `PATHPEDIDO` VARCHAR(100) NULL DEFAULT NULL COMMENT '',
  `FILEPEDIDO` VARCHAR(30) NULL DEFAULT NULL COMMENT '',
  `FUNDO_CAIXA` DOUBLE NOT NULL DEFAULT '0' COMMENT '',
  `TOLERANCIA_CANCELAMENTO` TIME NOT NULL COMMENT '',
  `CONTROLE_TURNO` INT(10) UNSIGNED NOT NULL COMMENT '',
  `PASSAGEMTURNO` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '',
  `CONTROLE_CONTAS` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '',
  `IMPORTADESPESA` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '',
  `HORANOSHOW` TIME NOT NULL DEFAULT '08:00:00' COMMENT '',
  `DiasFatura` INT(11) NOT NULL DEFAULT '1' COMMENT '',
  `TrabalhaPeriodo` CHAR(1) NULL DEFAULT 'N' COMMENT '',
  PRIMARY KEY (`ID`)  COMMENT '')
ENGINE = MyISAM
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = DYNAMIC;

ALTER TABLE `dbhotel`.`config_impressao` 
ENGINE = MyISAM ;

CREATE TABLE IF NOT EXISTS `dbhotel`.`config_periodo` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `TOLERANCIA` TIME NOT NULL COMMENT '',
  `HORAADICIONAL` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '',
  `LIMITEADICIONAL` INT(11) NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (`ID`)  COMMENT '')
ENGINE = MyISAM
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `dbhotel`.`desp_despesa` (
  `Lancamentoid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `Funcionarioid` VARCHAR(11) NULL DEFAULT '0' COMMENT '',
  `DataInclusao` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `DataPagamento` DATE NULL DEFAULT NULL COMMENT '',
  `DataVencimento` DATE NOT NULL DEFAULT '0000-00-00' COMMENT '',
  `Descricao` VARCHAR(50) NOT NULL COMMENT '',
  `Grupoid` INT(11) NOT NULL DEFAULT '0' COMMENT '',
  `Subgrupoid` INT(11) NOT NULL DEFAULT '0' COMMENT '',
  `FormaPagamentoid` INT(11) NULL DEFAULT '0' COMMENT '',
  `Valor` DOUBLE(10,2) NULL DEFAULT '0.00' COMMENT '',
  `Banco` CHAR(10) NULL DEFAULT '' COMMENT '',
  `Agencia` VARCHAR(10) NULL DEFAULT '' COMMENT '',
  `Cheque` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `Status` VARCHAR(10) NULL DEFAULT 'A PAGAR' COMMENT '',
  `origem` CHAR(1) NOT NULL DEFAULT 'D' COMMENT '',
  `dataatualizacao` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '',
  `Excluido` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '',
  `Excluidoid` INT(11) NULL DEFAULT '0' COMMENT '',
  `motivo` VARCHAR(150) NULL DEFAULT '' COMMENT '',
  `Tb_Lancamentoid` INT(11) NOT NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY USING BTREE (`Lancamentoid`)  COMMENT '',
  INDEX `DataVencimento` (`DataVencimento` ASC)  COMMENT '',
  INDEX `Forma_Pagamento` (`FormaPagamentoid` ASC)  COMMENT '',
  INDEX `Grupo` (`Grupoid` ASC, `Subgrupoid` ASC)  COMMENT '',
  INDEX `SubGrupo` (`Subgrupoid` ASC)  COMMENT '',
  CONSTRAINT `Grupo`
    FOREIGN KEY (`Grupoid`)
    REFERENCES `dbhotel`.`desp_grupo` (`Grupoid`),
  CONSTRAINT `SubGrupo`
    FOREIGN KEY (`Subgrupoid`)
    REFERENCES `dbhotel`.`desp_subgrupo` (`SubGrupoid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ROW_FORMAT = FIXED;

CREATE TABLE IF NOT EXISTS `dbhotel`.`desp_forma_pagamento` (
  `Forma_Pagamentoid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `Codigo` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '',
  `Descricao` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '',
  `Datainclusao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `DataAtualizacao` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '',
  PRIMARY KEY (`Forma_Pagamentoid`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ROW_FORMAT = FIXED;

CREATE TABLE IF NOT EXISTS `dbhotel`.`desp_grupo` (
  `Grupoid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `Codigo` INT(11) NOT NULL DEFAULT '0' COMMENT '',
  `Descricao` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '',
  `DataInclusao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `DataAtualizacao` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '',
  PRIMARY KEY (`Grupoid`)  COMMENT '',
  INDEX `DescricaoGrupo` (`Descricao` ASC)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ROW_FORMAT = FIXED;

CREATE TABLE IF NOT EXISTS `dbhotel`.`desp_subgrupo` (
  `SubGrupoid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `Codigo` INT(11) NULL DEFAULT NULL COMMENT '',
  `DescricaoSub` VARCHAR(50) NULL DEFAULT NULL COMMENT '',
  `Grupoid` INT(11) NULL DEFAULT NULL COMMENT '',
  `DataInclusao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `DataAtualizacao` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '',
  PRIMARY KEY (`SubGrupoid`)  COMMENT '',
  INDEX `DescricaoSub` (`DescricaoSub` ASC)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ROW_FORMAT = FIXED;

CREATE TABLE IF NOT EXISTS `dbhotel`.`est_ajusteproduto` (
  `AjusteProdutoid` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `Produtoid` INT(11) NOT NULL DEFAULT '0' COMMENT '',
  `QuantidadeAntiga` DOUBLE(10,3) NULL DEFAULT '0.000' COMMENT '',
  `QuantidadeNova` DOUBLE(10,3) NOT NULL DEFAULT '0.000' COMMENT '',
  `usuarioid` INT(11) NOT NULL DEFAULT '0' COMMENT '',
  `Motivo` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '',
  `datainclusao` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  PRIMARY KEY (`AjusteProdutoid`)  COMMENT '',
  INDEX `Produtoid` (`Produtoid` ASC)  COMMENT '',
  CONSTRAINT `Produtoid`
    FOREIGN KEY (`Produtoid`)
    REFERENCES `dbhotel`.`est_produto` (`PRODUTOID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_swedish_ci
ROW_FORMAT = FIXED;

CREATE TABLE IF NOT EXISTS `dbhotel`.`est_baixaestoque` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `PRODUTOID` INT(11) NOT NULL COMMENT '',
  `CARDAPIOID` INT(11) NOT NULL COMMENT '',
  `QUANTIDADE` DECIMAL(10,3) NOT NULL COMMENT '',
  `ATIVO` CHAR(1) NOT NULL DEFAULT 'S' COMMENT '',
  `DATAINCLUSAO` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `dataatualizacao` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '',
  PRIMARY KEY (`ID`)  COMMENT '',
  UNIQUE INDEX `Index_2` (`PRODUTOID` ASC, `CARDAPIOID` ASC)  COMMENT '',
  INDEX `FK_est_baixaestoque_1` (`CARDAPIOID` ASC)  COMMENT '',
  CONSTRAINT `FK_est_baixaestoque_1`
    FOREIGN KEY (`CARDAPIOID`)
    REFERENCES `dbhotel`.`cardapio` (`CARDAPIOID`),
  CONSTRAINT `FK_est_baixaestoque_2`
    FOREIGN KEY (`PRODUTOID`)
    REFERENCES `dbhotel`.`est_produto` (`PRODUTOID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = FIXED;

CREATE TABLE IF NOT EXISTS `dbhotel`.`est_entrada` (
  `ENTRADAID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `FORNECEDORID` INT(11) NOT NULL COMMENT '',
  `EMISSAO` DATE NOT NULL COMMENT '',
  `NOTAFISCAL` INT(11) NOT NULL COMMENT '',
  `VALORPRODUTO` DOUBLE(10,2) NOT NULL DEFAULT '0.00' COMMENT '',
  `VALORNOTA` DOUBLE(10,2) NOT NULL DEFAULT '0.00' COMMENT '',
  `USUARIOID` INT(11) NOT NULL COMMENT '',
  `DATAINCLUSAO` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `CHAVENFE` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `Excluido` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '',
  `dataexclusao` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '',
  `UsuarioExclusao` INT(11) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`ENTRADAID`)  COMMENT '',
  INDEX `FORNECEDORID` (`FORNECEDORID` ASC)  COMMENT '',
  INDEX `USUARIOID` (`USUARIOID` ASC)  COMMENT '',
  CONSTRAINT `est_entrada_ibfk_1`
    FOREIGN KEY (`FORNECEDORID`)
    REFERENCES `dbhotel`.`est_fornecedor` (`FORNECEDORID`),
  CONSTRAINT `est_entrada_ibfk_2`
    FOREIGN KEY (`USUARIOID`)
    REFERENCES `dbhotel`.`funcionario` (`FUNCIONARIOID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = FIXED;

CREATE TABLE IF NOT EXISTS `dbhotel`.`est_entradaproduto` (
  `ENTRADAPRODUTOID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `ENTRADAID` INT(11) NOT NULL COMMENT '',
  `PRODUTOID` INT(11) NOT NULL COMMENT '',
  `QUANTIDADE` DOUBLE(10,3) NULL DEFAULT NULL COMMENT '',
  `PRECOBRUTO` DOUBLE(10,2) NULL DEFAULT NULL COMMENT '',
  `DESCONTO` DOUBLE(10,2) NOT NULL DEFAULT '0.00' COMMENT '',
  `PRECOLIQUIDO` DOUBLE(10,2) NULL DEFAULT NULL COMMENT '',
  `DATAINCLUSAO` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `DATAATUALIZACAO` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '',
  `EXCLUIDO` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '',
  PRIMARY KEY (`ENTRADAPRODUTOID`)  COMMENT '',
  INDEX `PRODUTOID` (`PRODUTOID` ASC)  COMMENT '',
  INDEX `ENTRADAID` (`ENTRADAID` ASC)  COMMENT '',
  CONSTRAINT `est_entradaproduto_ibfk_1`
    FOREIGN KEY (`PRODUTOID`)
    REFERENCES `dbhotel`.`est_produto` (`PRODUTOID`),
  CONSTRAINT `est_entradaproduto_ibfk_2`
    FOREIGN KEY (`ENTRADAID`)
    REFERENCES `dbhotel`.`est_entrada` (`ENTRADAID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = FIXED;

CREATE TABLE IF NOT EXISTS `dbhotel`.`est_fornecedor` (
  `FORNECEDORID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `DESCRICAO` VARCHAR(100) NOT NULL COMMENT '',
  `TIPO` CHAR(1) NOT NULL DEFAULT 'J' COMMENT '',
  `CPFCNPJ` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `RGIE` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `ENDERECO` VARCHAR(50) NULL DEFAULT '' COMMENT '',
  `BAIRRO` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `CIDADE` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `CEP` CHAR(8) NULL DEFAULT NULL COMMENT '',
  `TELEFONE` VARCHAR(15) NULL DEFAULT NULL COMMENT '',
  `EMAIL` VARCHAR(250) NULL DEFAULT NULL COMMENT '',
  `VENDEDOR` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `CELULAR1` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `CELULAR2` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `DATAINCLUSAO` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `DATAATUALIZACAO` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '',
  PRIMARY KEY (`FORNECEDORID`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = FIXED;

CREATE TABLE IF NOT EXISTS `dbhotel`.`faixapernoite` (
  `FAIXAPERNOITEID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `TIPO_SUITEID` INT(11) NOT NULL COMMENT '',
  `PERIODOID` INT(11) NOT NULL COMMENT '',
  `TIPO_PERIODOID` INT(11) NOT NULL COMMENT '',
  `HORAINICIO` TIME NOT NULL COMMENT '',
  `HORAFIM` TIME NOT NULL COMMENT '',
  `VALOR` DOUBLE(6,3) NOT NULL COMMENT '',
  `INICIOSEGUNDOS` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT '',
  `FIMSEGUNDOS` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`FAIXAPERNOITEID`)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = FIXED;

CREATE TABLE IF NOT EXISTS `dbhotel`.`funcao` (
  `FUNCAOID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `DESCRICAO` VARCHAR(50) NOT NULL COMMENT '',
  `DATAINCLUSAO` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `RECEBECONTA` CHAR(1) CHARACTER SET 'latin1' NOT NULL DEFAULT 'N' COMMENT '',
  `DATAATUALIZACAO` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '',
  PRIMARY KEY (`FUNCAOID`)  COMMENT '',
  UNIQUE INDEX `DESCRICAO` (`DESCRICAO` ASC)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = FIXED;

CREATE TABLE IF NOT EXISTS `dbhotel`.`pedidos` (
  `PEDIDOSID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `HOSPEDAGEMID` INT(11) NOT NULL DEFAULT '0' COMMENT '',
  `CARDAPIOID` INT(11) NOT NULL DEFAULT '0' COMMENT '',
  `PEDIDOPOR` INT(11) NOT NULL DEFAULT '0' COMMENT '',
  `QUANTIDADE` DOUBLE(4,2) NOT NULL DEFAULT '0.00' COMMENT '',
  `PRECO` DOUBLE(6,2) NOT NULL DEFAULT '0.00' COMMENT '',
  `DESCONTO` DOUBLE(3,2) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '',
  `DATAINCLUSAO` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `DATAATUALIZACAO` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '',
  `PEDIDOORIGEM` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '',
  `STATUS` VARCHAR(10) NOT NULL DEFAULT 'A' COMMENT '',
  `DATATURNO` DATETIME NULL DEFAULT NULL COMMENT '',
  `TURNO` CHAR(1) NULL DEFAULT NULL COMMENT '',
  `FRIGOBAR` CHAR(1) NOT NULL DEFAULT 'N' COMMENT '',
  PRIMARY KEY (`PEDIDOSID`)  COMMENT '',
  INDEX `PEDIDOPOR` (`PEDIDOPOR` ASC)  COMMENT '',
  INDEX `CARDAPIOID` (`CARDAPIOID` ASC)  COMMENT '',
  INDEX `HOSPEDAGEMID` (`HOSPEDAGEMID` ASC)  COMMENT '',
  CONSTRAINT `pedidos_ibfk_1`
    FOREIGN KEY (`PEDIDOPOR`)
    REFERENCES `dbhotel`.`funcionario` (`FUNCIONARIOID`),
  CONSTRAINT `pedidos_ibfk_2`
    FOREIGN KEY (`CARDAPIOID`)
    REFERENCES `dbhotel`.`cardapio` (`CARDAPIOID`)
    ON UPDATE CASCADE,
  CONSTRAINT `pedidos_ibfk_3`
    FOREIGN KEY (`HOSPEDAGEMID`)
    REFERENCES `dbhotel`.`hospedagem` (`HOSPEDAGEMID`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1997
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = FIXED;

ALTER TABLE `dbhotel`.`sequence` 
ENGINE = MyISAM ;

ALTER TABLE `dbhotel`.`turno` 
CHANGE COLUMN `DATAINCLUSAO` `DATAINCLUSAO` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '' ;


-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw001_totais_hospedagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw001_totais_hospedagem` (`hospedagemid` INT, `periodos` INT, `totalperiodo` INT, `totaldesconto` INT, `copa` INT, `cozinha` INT, `frigobar` INT, `extra` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw002_consumo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw002_consumo` (`tipo` INT, `controle` INT, `cardapioid` INT, `codigo` INT, `quantidade` INT, `descricao` INT, `departamentoid` INT, `reposicao` INT, `preco` INT, `dataturno` INT, `turno` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw003_mov_financeira`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw003_mov_financeira` (`data` INT, `descricao` INT, `valor` INT, `forma_pagamentoid` INT, `dataturno` INT, `turno` INT, `acaocaixa` INT, `fluxocaixa` INT, `registrocaixa` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw004_fluxo_caixa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw004_fluxo_caixa` (`data` INT, `descricao` INT, `entradas` INT, `saidas` INT, `datahora` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw005_pt_total_ent_ts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw005_pt_total_ent_ts` (`descricao` INT, `qtde` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw006_pt_contas_recebidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw006_pt_contas_recebidas` (`tipo_suiteid` INT, `tiposuite` INT, `hospedagemid` INT, `suite` INT, `conta` INT, `deposito` INT, `valorreal` INT, `diferenca` INT, `formapagamento` INT, `valorformapgto` INT, `totalperiodo` INT, `totalconsumo` INT, `descontodinheiro` INT, `descontoporcentagem` INT, `sigla` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw007_pt_total_recebidas_ts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw007_pt_total_recebidas_ts` (`qtde` INT, `tiposuite` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw008_pt_unidades_passantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw008_pt_unidades_passantes` (`suite` INT, `hospedagemid` INT, `datahoraentrada` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw009_pt_contas_pedidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw009_pt_contas_pedidas` (`suite` INT, `hospedagemid` INT, `datahoraconta` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw010_a_liberar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw010_a_liberar` (`suite` INT, `hospedagemid` INT, `datahorapagamento` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw011_pt_total_hosp_ts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw011_pt_total_hosp_ts` (`tipo_suiteid` INT, `tiposuite` INT, `total_periodo` INT, `totalconsumo` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw014_pt_canc_pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw014_pt_canc_pedidos` (`suite` INT, `hospedagemid` INT, `quantidade` INT, `descricao` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw015_pt_canc_contas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw015_pt_canc_contas` (`apartamento` INT, `suite` INT, `hospedagemid` INT, `datainclusao` INT, `motivo` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw016_pt_mov_caixa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw016_pt_mov_caixa` (`forma_pagamento` INT, `valor` INT, `fluxocaixa` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw017_permanencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw017_permanencia` (`tempo` INT, `quantidade` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw018_pt_pedidos_cortesia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw018_pt_pedidos_cortesia` (`quantidade` INT, `descricao` INT, `controle` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw019_pt_sangria_suprimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw019_pt_sangria_suprimento` (`froma_pagamento` INT, `valor` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw020_pt_recebidas_forma_pgto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw020_pt_recebidas_forma_pgto` (`tipo_suiteid` INT, `tiposuite` INT, `formapagamento` INT, `total` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw021_pt_consumo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw021_pt_consumo` (`tipo` INT, `controle` INT, `codigo` INT, `quantidade` INT, `descricao` INT, `preco` INT, `departamentoid` INT, `reposicao` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw022_ocupadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw022_ocupadas` (`suite` INT, `hospedagemid` INT, `datahoraentrada` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw023_pt_status_turno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw023_pt_status_turno` (`ctrl_entrada` INT, `ctrl_venda` INT, `ctrl_cortesia` INT, `inicio_turno` INT, `tempo_turno` INT, `entradas` INT, `emitidas` INT, `recebidas` INT, `receber` INT, `canceladas` INT, `ocupadas` INT, `em_conta` INT, `liberar` INT, `total_suite` INT, `total_interditada` INT, `venda` INT, `pedido_canc` INT, `total_caixa` INT, `consumidos` INT, `total_aarrumar` INT, `total_arrumacao` INT, `entrada_canc` INT, `total_pgantecipado` INT, `total_livre` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw024_totais_formapgto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw024_totais_formapgto` (`data` INT, `dinheiro` INT, `cheque` INT, `cart�o visa` INT, `cart�o mastercard` INT, `visa eletron` INT, `debito mastercard` INT, `penhor` INT, `vale` INT, `despesa` INT, `bruto` INT, `liquido` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw028_entradas_hora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw028_entradas_hora` (`dataturno` INT, `turno` INT, `1h` INT, `2h` INT, `3h` INT, `4h` INT, `5h` INT, `6h` INT, `7h` INT, `8h` INT, `9h` INT, `10h` INT, `11h` INT, `12h` INT, `13h` INT, `14h` INT, `15h` INT, `16h` INT, `17h` INT, `18h` INT, `19h` INT, `20h` INT, `21h` INT, `22h` INT, `23h` INT, `0h` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw029_pt_financeiro_formapg_turno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw029_pt_financeiro_formapg_turno` (`controle` INT, `suiteid` INT, `suite` INT, `dataturno` INT, `turno` INT, `formapagamento` INT, `valor` INT, `formapagamentoid` INT, `LANCAMENTOID` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw030_hospedes_chek_in`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw030_hospedes_chek_in` (`nome` INT, `empresa` INT, `apartamento` INT, `suite` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw031_mov_financeira_com_depositos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw031_mov_financeira_com_depositos` (`data` INT, `descricao` INT, `valor` INT, `forma_pagamentoid` INT, `dataturno` INT, `turno` INT, `acaocaixa` INT, `fluxocaixa` INT, `registrocaixa` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbhotel`.`vw_extrato_detalhado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhotel`.`vw_extrato_detalhado` (`tipo` INT, `id` INT, `quantidade` INT, `descricao` INT, `valor` INT, `datainclusao` INT, `data` INT, `hospedagemid` INT);


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw001_totais_hospedagem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw001_totais_hospedagem`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw001_totais_hospedagem` AS select `h`.`HOSPEDAGEMID` AS `hospedagemid`,ifnull(count(`hd`.`Hospedagemid`),0) AS `periodos`,ifnull(sum(`hd`.`ValorCobrado`),0) AS `totalperiodo`,ifnull((sum((`hd`.`ValorCobrado` * (`h`.`DESCONTOPORCENTAGEM` / 100))) + `h`.`DESCONTODINHEIRO`),0) AS `totaldesconto`,ifnull(sum((case when ((`c`.`COPA` = 's') and (`p`.`FRIGOBAR` = 'n') and (`p`.`STATUS` <> 'c')) then (`p`.`QUANTIDADE` * `p`.`PRECO`) else NULL end)),0) AS `copa`,ifnull(sum((case when ((`c`.`COZINHA` = 's') and (`p`.`FRIGOBAR` = 'n') and (`p`.`STATUS` <> 'c')) then (`p`.`QUANTIDADE` * `p`.`PRECO`) else NULL end)),0) AS `cozinha`,ifnull(sum((case when ((`p`.`FRIGOBAR` = 's') and (`p`.`STATUS` <> 'c')) then (`p`.`QUANTIDADE` * `p`.`PRECO`) else NULL end)),0) AS `frigobar`,ifnull(sum((case when ((`c`.`EXTRA` = 's') and (`p`.`FRIGOBAR` = 'n') and (`p`.`STATUS` <> 'c')) then (`p`.`QUANTIDADE` * `p`.`PRECO`) else NULL end)),0) AS `extra` from (((`dbhotel`.`hospedagem` `h` left join `dbhotel`.`pedidos` `p` on((`h`.`HOSPEDAGEMID` = `p`.`HOSPEDAGEMID`))) left join `dbhotel`.`cardapio` `c` on((`p`.`CARDAPIOID` = `c`.`CARDAPIOID`))) left join `dbhotel`.`hospedagem_diarias` `hd` on((`h`.`HOSPEDAGEMID` = `hd`.`Hospedagemid`))) group by `h`.`HOSPEDAGEMID`;


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw002_consumo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw002_consumo`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw002_consumo` AS select 'pedido' AS `tipo`,`p`.`HOSPEDAGEMID` AS `controle`,`c`.`CARDAPIOID` AS `cardapioid`,`c`.`CODIGO` AS `codigo`,`p`.`QUANTIDADE` AS `quantidade`,`c`.`DESCRICAO` AS `descricao`,`d`.`DEPARTAMENTOID` AS `departamentoid`,`d`.`DESCRICAO` AS `reposicao`,`p`.`PRECO` AS `preco`,`p`.`DATATURNO` AS `dataturno`,`p`.`TURNO` AS `turno` from ((`dbhotel`.`cardapio` `c` join `dbhotel`.`pedidos` `p`) join `dbhotel`.`departamento` `d`) where ((`p`.`CARDAPIOID` = `c`.`CARDAPIOID`) and (`c`.`REPOSICAO` = `d`.`DEPARTAMENTOID`) and (`c`.`CODIGO` <> 9999)) union all select 'pedido' AS `pedido`,`p`.`HOSPEDAGEMID` AS `controle`,`c`.`CARDAPIOID` AS `cardapioid`,`c`.`CODIGO` AS `codigo`,`p`.`QUANTIDADE` AS `quantidade`,`pa`.`DESCRICAO` AS `descricao`,`d`.`DEPARTAMENTOID` AS `departamentoid`,`d`.`DESCRICAO` AS `destino`,`p`.`PRECO` AS `preco`,`pa`.`DATATURNO` AS `dataturno`,`pa`.`TURNO` AS `turno` from (((`dbhotel`.`cardapio` `c` join `dbhotel`.`pedidos` `p`) join `dbhotel`.`departamento` `d`) join `dbhotel`.`pedidos_avulso` `pa`) where ((`p`.`CARDAPIOID` = `c`.`CARDAPIOID`) and (`p`.`PEDIDOSID` = `pa`.`PEDIDOSID`) and (`c`.`REPOSICAO` = `d`.`DEPARTAMENTOID`)) union all select 'cortesia' AS `cortesia`,`co`.`CORTESIAID` AS `cortesiaid`,`c`.`CARDAPIOID` AS `cardapioid`,`c`.`CODIGO` AS `codigo`,`ci`.`QUANTIDADE` AS `quantidade`,(case `c`.`CODIGO` when 9999 then `ci`.`DESCRICAO` else `c`.`DESCRICAO` end) AS `case c.codigo when 9999 then ci.descricao else c.descricao end`,`d`.`DEPARTAMENTOID` AS `departamentoid`,`d`.`DESCRICAO` AS `destino`,`ci`.`PRECO` AS `preco`,`co`.`DATATURNO` AS `dataturno`,`co`.`TURNO` AS `turno` from (((`dbhotel`.`cardapio` `c` join `dbhotel`.`cortesia` `co`) join `dbhotel`.`departamento` `d`) join `dbhotel`.`cortesia_itens` `ci`) where ((`ci`.`CARDAPIOID` = `c`.`CARDAPIOID`) and (`co`.`CORTESIAID` = `ci`.`CORTESIA_ORIGEM`) and (`c`.`REPOSICAO` = `d`.`DEPARTAMENTOID`)) union all select 'vendainterna' AS `vendainterna`,`v`.`VENDAINTERNA_ORIGEM` AS `vendainterna_origem`,`c`.`CARDAPIOID` AS `cardapioid`,`c`.`CODIGO` AS `codigo`,`v`.`QUANTIDADE` AS `quantidade`,`v`.`DESCRICAO` AS `descricao`,`d`.`DEPARTAMENTOID` AS `departamentoid`,`d`.`DESCRICAO` AS `destino`,`v`.`PRECO` AS `preco`,`v`.`DATATURNO` AS `dataturno`,`v`.`TURNO` AS `turno` from ((`dbhotel`.`cardapio` `c` join `dbhotel`.`departamento` `d`) join `dbhotel`.`vendainterna` `v`) where ((`v`.`CARDAPIOID` = `c`.`CARDAPIOID`) and (`c`.`REPOSICAO` = `d`.`DEPARTAMENTOID`)) order by 1,2;


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw003_mov_financeira`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw003_mov_financeira`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw003_mov_financeira` AS select `p`.`DATA` AS `data`,`f`.`DESCRICAO` AS `descricao`,`p`.`VALOR` AS `valor`,`p`.`FORMA_PAGAMENTOID` AS `forma_pagamentoid`,`p`.`DATATURNO` AS `dataturno`,`p`.`TURNO` AS `turno`,`f`.`ACAOCAIXA` AS `acaocaixa`,`f`.`FLUXOCAIXA` AS `fluxocaixa`,`f`.`REGISTROCAIXA` AS `registrocaixa` from (`dbhotel`.`pg_antecipado` `p` join `dbhotel`.`forma_pagamento` `f`) where (`p`.`FORMA_PAGAMENTOID` = `f`.`FORMA_PAGAMENTOID`) union all select `f`.`DATAINCLUSAO` AS `data`,`fp`.`DESCRICAO` AS `descricao`,`ff`.`VALOR` AS `valor`,`ff`.`FORMA_PAGAMENTOID` AS `forma_pagamentoid`,`ff`.`DATATURNO` AS `dataturno`,`ff`.`TURNO` AS `turno`,`fp`.`ACAOCAIXA` AS `acaocaixa`,`fp`.`FLUXOCAIXA` AS `fluxocaixa`,`fp`.`REGISTROCAIXA` AS `registrocaixa` from ((`dbhotel`.`financeiro_formapgto` `ff` join `dbhotel`.`forma_pagamento` `fp`) join `dbhotel`.`financeiro` `f`) where ((`ff`.`FORMA_PAGAMENTOID` = `fp`.`FORMA_PAGAMENTOID`) and (`f`.`LANCAMENTOID` = `ff`.`LANCAMENTOID`)) union all select `l`.`DATAINCLUSAO` AS `datainclusao`,`f`.`DESCRICAO` AS `descricao`,`l`.`VALOR` AS `valor`,`l`.`FORMA_PAGAMENTOID` AS `forma_pagamentoid`,`l`.`DATATURNO` AS `dataturno`,`l`.`TURNO` AS `turno`,`f`.`ACAOCAIXA` AS `acaocaixa`,`f`.`FLUXOCAIXA` AS `fluxocaixa`,`f`.`REGISTROCAIXA` AS `registrocaixa` from (`dbhotel`.`lancamentos` `l` join `dbhotel`.`forma_pagamento` `f`) where ((`l`.`FORMA_PAGAMENTOID` = `f`.`FORMA_PAGAMENTOID`) and (`l`.`DESCRICAO` <> 'sangria de caixa')) union all select `l`.`DATAINCLUSAO` AS `datainclusao`,'SANGRIA DE CAIXA' AS `descricao`,`l`.`VALOR` AS `valor`,`l`.`FORMA_PAGAMENTOID` AS `forma_pagamentoid`,`l`.`DATATURNO` AS `dataturno`,`l`.`TURNO` AS `turno`,-(1) AS `-1`,0 AS `0`,0 AS `0` from (`dbhotel`.`lancamentos` `l` join `dbhotel`.`forma_pagamento` `f`) where ((`l`.`FORMA_PAGAMENTOID` = `f`.`FORMA_PAGAMENTOID`) and (`l`.`DESCRICAO` = 'sangria de caixa')) union all select `f`.`DATAINCLUSAO` AS `datainclusao`,'troco' AS `troco`,`f`.`DIFERENCA` AS `diferenca`,0 AS `0`,`f`.`DATATURNO` AS `dataturno`,`f`.`TURNO` AS `turno`,-(1) AS `-1`,-(1) AS `-1`,0 AS `0` from `dbhotel`.`financeiro` `f` where (`f`.`DIFERENCA` > 0);


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw004_fluxo_caixa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw004_fluxo_caixa`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw004_fluxo_caixa` AS select date_format(`v`.`data`,'%d/%m/%y') AS `data`,`v`.`descricao` AS `descricao`,`v`.`valor` AS `entradas`,0 AS `saidas`,`v`.`data` AS `datahora` from (`dbhotel`.`vw003_mov_financeira` `v` join `dbhotel`.`forma_pagamento` `fp`) where ((`v`.`forma_pagamentoid` = `fp`.`FORMA_PAGAMENTOID`) and (`fp`.`FLUXOCAIXA` = 1)) union select date_format(`v`.`data`,'%d/%m/%y') AS `data`,`v`.`descricao` AS `descricao`,0 AS `entradas`,`v`.`valor` AS `saidas`,`v`.`data` AS `datahora` from (`dbhotel`.`vw003_mov_financeira` `v` join `dbhotel`.`forma_pagamento` `fp`) where ((`v`.`forma_pagamentoid` = `fp`.`FORMA_PAGAMENTOID`) and (`fp`.`FLUXOCAIXA` = -(1))) order by `datahora`;


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw005_pt_total_ent_ts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw005_pt_total_ent_ts`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw005_pt_total_ent_ts` AS select `ts`.`DESCRICAO` AS `descricao`,count(`h`.`HOSPEDAGEMID`) AS `qtde` from (((`dbhotel`.`hospedagem` `h` join `dbhotel`.`suite` `s`) join `dbhotel`.`tipo_suite` `ts`) join `dbhotel`.`config_geral` `c`) where ((`h`.`SUITEID` = `s`.`SUITEID`) and (`s`.`TIPO_SUITEID` = `ts`.`TIPO_SUITEID`) and (`h`.`DATATURNO` = `c`.`DATATURNO`) and (`h`.`TURNO` = `c`.`TURNOATIVO`)) group by `ts`.`DESCRICAO`;


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw006_pt_contas_recebidas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw006_pt_contas_recebidas`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw006_pt_contas_recebidas` AS select `ts`.`TIPO_SUITEID` AS `tipo_suiteid`,`ts`.`DESCRICAO` AS `tiposuite`,`h`.`HOSPEDAGEMID` AS `hospedagemid`,`s`.`DESCRICAO` AS `suite`,`f`.`CONTA` AS `conta`,`f`.`DEPOSITO` AS `deposito`,`f`.`VALORREAL` AS `valorreal`,`f`.`DIFERENCA` AS `diferenca`,`fp`.`DESCRICAO` AS `formapagamento`,`ff`.`VALOR` AS `valorformapgto`,(`vw001`.`totalperiodo` - `vw001`.`totaldesconto`) AS `totalperiodo`,(((`vw001`.`copa` + `vw001`.`cozinha`) + `vw001`.`extra`) + `vw001`.`frigobar`) AS `totalconsumo`,`h`.`DESCONTODINHEIRO` AS `descontodinheiro`,`h`.`DESCONTOPORCENTAGEM` AS `descontoporcentagem`,`fp`.`SIGLA` AS `sigla` from (((((((`dbhotel`.`hospedagem` `h` join `dbhotel`.`suite` `s`) join `dbhotel`.`tipo_suite` `ts`) join `dbhotel`.`config_geral` `c`) join `dbhotel`.`financeiro` `f`) join `dbhotel`.`financeiro_formapgto` `ff`) join `dbhotel`.`forma_pagamento` `fp`) join `dbhotel`.`vw001_totais_hospedagem` `vw001`) where ((`h`.`SUITEID` = `s`.`SUITEID`) and (`s`.`TIPO_SUITEID` = `ts`.`TIPO_SUITEID`) and (`ff`.`DATATURNO` = `c`.`DATATURNO`) and (`ff`.`TURNO` = `c`.`TURNOATIVO`) and (`h`.`HOSPEDAGEMID` = `f`.`HOSPEDAGEMID`) and (`f`.`LANCAMENTOID` = `ff`.`LANCAMENTOID`) and (`ff`.`FORMA_PAGAMENTOID` = `fp`.`FORMA_PAGAMENTOID`) and (`vw001`.`hospedagemid` = `h`.`HOSPEDAGEMID`));


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw007_pt_total_recebidas_ts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw007_pt_total_recebidas_ts`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw007_pt_total_recebidas_ts` AS select count(0) AS `qtde`,`vw006_pt_contas_recebidas`.`tiposuite` AS `tiposuite` from `dbhotel`.`vw006_pt_contas_recebidas` group by `vw006_pt_contas_recebidas`.`tiposuite`;


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw008_pt_unidades_passantes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw008_pt_unidades_passantes`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw008_pt_unidades_passantes` AS select `s`.`DESCRICAO` AS `suite`,`h`.`HOSPEDAGEMID` AS `hospedagemid`,`h`.`DATAHORAENTRADA` AS `datahoraentrada` from (`dbhotel`.`hospedagem` `h` join `dbhotel`.`suite` `s`) where ((`h`.`SUITEID` = `s`.`SUITEID`) and (`h`.`STATUS` in ('c','a','r')));


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw009_pt_contas_pedidas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw009_pt_contas_pedidas`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw009_pt_contas_pedidas` AS select `s`.`DESCRICAO` AS `suite`,`h`.`HOSPEDAGEMID` AS `hospedagemid`,`f`.`DATAINCLUSAO` AS `datahoraconta` from (((`dbhotel`.`hospedagem` `h` join `dbhotel`.`suite` `s`) join `dbhotel`.`config_geral` `c`) join `dbhotel`.`financeiro` `f`) where ((`h`.`SUITEID` = `s`.`SUITEID`) and (`f`.`HOSPEDAGEMID` = `h`.`HOSPEDAGEMID`) and (`f`.`DATATURNO` = `c`.`DATATURNO`) and (`f`.`TURNO` = `c`.`TURNOATIVO`) and (`h`.`STATUS` = 'c'));


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw010_a_liberar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw010_a_liberar`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw010_a_liberar` AS select `s`.`DESCRICAO` AS `suite`,`h`.`HOSPEDAGEMID` AS `hospedagemid`,`f`.`DATAPAGAMENTO` AS `datahorapagamento` from ((`dbhotel`.`hospedagem` `h` join `dbhotel`.`suite` `s`) join `dbhotel`.`financeiro` `f`) where ((`h`.`SUITEID` = `s`.`SUITEID`) and (`f`.`HOSPEDAGEMID` = `h`.`HOSPEDAGEMID`) and (`h`.`STATUS` = 'r'));


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw011_pt_total_hosp_ts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw011_pt_total_hosp_ts`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw011_pt_total_hosp_ts` AS select `vw006_pt_contas_recebidas`.`tipo_suiteid` AS `tipo_suiteid`,`vw006_pt_contas_recebidas`.`tiposuite` AS `tiposuite`,sum(`vw006_pt_contas_recebidas`.`totalperiodo`) AS `total_periodo`,sum(`vw006_pt_contas_recebidas`.`totalconsumo`) AS `totalconsumo` from `dbhotel`.`vw006_pt_contas_recebidas` group by `vw006_pt_contas_recebidas`.`tipo_suiteid`,`vw006_pt_contas_recebidas`.`tiposuite`;


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw014_pt_canc_pedidos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw014_pt_canc_pedidos`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw014_pt_canc_pedidos` AS select `s`.`DESCRICAO` AS `suite`,`h`.`HOSPEDAGEMID` AS `hospedagemid`,`p`.`QUANTIDADE` AS `quantidade`,`c`.`DESCRICAO` AS `descricao` from (((((`dbhotel`.`suite` `s` join `dbhotel`.`hospedagem` `h`) join `dbhotel`.`pedidos` `p`) join `dbhotel`.`cardapio` `c`) join `dbhotel`.`cancelamentos` `cn`) join `dbhotel`.`config_geral` `cg`) where ((`s`.`SUITEID` = `h`.`SUITEID`) and (`h`.`HOSPEDAGEMID` = `p`.`HOSPEDAGEMID`) and (`p`.`CARDAPIOID` = `c`.`CARDAPIOID`) and (`cn`.`PEDIDOSID` = `p`.`PEDIDOSID`) and (`cn`.`DATATURNO` = `cg`.`DATATURNO`) and (`cn`.`TURNO` = `cg`.`TURNOATIVO`));


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw015_pt_canc_contas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw015_pt_canc_contas`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw015_pt_canc_contas` AS select `s`.`APARTAMENTO` AS `apartamento`,`s`.`DESCRICAO` AS `suite`,`h`.`HOSPEDAGEMID` AS `hospedagemid`,`cn`.`DATAINCLUSAO` AS `datainclusao`,`cn`.`MOTIVO` AS `motivo` from (((`dbhotel`.`suite` `s` join `dbhotel`.`hospedagem` `h`) join `dbhotel`.`cancelamentos` `cn`) join `dbhotel`.`config_geral` `cg`) where ((`s`.`SUITEID` = `h`.`SUITEID`) and (`cn`.`HOSPEDAGEMID` = `h`.`HOSPEDAGEMID`) and (`cn`.`DATATURNO` = `cg`.`DATATURNO`) and (`cn`.`TURNO` = `cg`.`TURNOATIVO`) and (`cn`.`TIPO` = 'conta'));


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw016_pt_mov_caixa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw016_pt_mov_caixa`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw016_pt_mov_caixa` AS select 'DINHEIRO' AS `forma_pagamento`,`f001_pt_valor_dinheiro`() AS `valor`,1 AS `fluxocaixa` union select `v`.`descricao` AS `forma_pagamento`,sum(`v`.`valor`) AS `valor`,`v`.`fluxocaixa` AS `fluxocaixa` from (`dbhotel`.`vw003_mov_financeira` `v` join `dbhotel`.`config_geral` `c`) where ((`v`.`dataturno` = `c`.`DATATURNO`) and (`v`.`turno` = `c`.`TURNOATIVO`) and (`v`.`forma_pagamentoid` not in (0,100,95,96))) group by `v`.`descricao`;


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw017_permanencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw017_permanencia`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw017_permanencia` AS select _utf8'00h - 01h' AS `tempo`,count(0) AS `quantidade` from (`dbhotel`.`hospedagem` `h` join `dbhotel`.`config_geral` `c`) where ((`h`.`DATATURNO` = `c`.`DATATURNO`) and (`h`.`TURNO` = `c`.`TURNOATIVO`) and (time_to_sec(timediff(now(),`h`.`DATAHORAENTRADA`)) between 0 and 3600)) union select _utf8'01h - 02h' AS `tempo`,count(0) AS `quantidade` from (`dbhotel`.`hospedagem` `h` join `dbhotel`.`config_geral` `c`) where ((`h`.`DATATURNO` = `c`.`DATATURNO`) and (`h`.`TURNO` = `c`.`TURNOATIVO`) and (time_to_sec(timediff(now(),`h`.`DATAHORAENTRADA`)) between 3601 and 7200)) union select _utf8'02h - 03h' AS `tempo`,count(0) AS `quantidade` from (`dbhotel`.`hospedagem` `h` join `dbhotel`.`config_geral` `c`) where ((`h`.`DATATURNO` = `c`.`DATATURNO`) and (`h`.`TURNO` = `c`.`TURNOATIVO`) and (time_to_sec(timediff(now(),`h`.`DATAHORAENTRADA`)) between 7201 and 10800)) union select _utf8'03h - 04h' AS `tempo`,count(0) AS `quantidade` from (`dbhotel`.`hospedagem` `h` join `dbhotel`.`config_geral` `c`) where ((`h`.`DATATURNO` = `c`.`DATATURNO`) and (`h`.`TURNO` = `c`.`TURNOATIVO`) and (time_to_sec(timediff(now(),`h`.`DATAHORAENTRADA`)) between 10801 and 14400)) union select _utf8'04h - 05h' AS `tempo`,count(0) AS `quantidade` from (`dbhotel`.`hospedagem` `h` join `dbhotel`.`config_geral` `c`) where ((`h`.`DATATURNO` = `c`.`DATATURNO`) and (`h`.`TURNO` = `c`.`TURNOATIVO`) and (time_to_sec(timediff(now(),`h`.`DATAHORAENTRADA`)) between 14401 and 18000)) union select _utf8'05h - 06h' AS `tempo`,count(0) AS `quantidade` from (`dbhotel`.`hospedagem` `h` join `dbhotel`.`config_geral` `c`) where ((`h`.`DATATURNO` = `c`.`DATATURNO`) and (`h`.`TURNO` = `c`.`TURNOATIVO`) and (time_to_sec(timediff(now(),`h`.`DATAHORAENTRADA`)) between 18001 and 21600)) union select _utf8'06h - 07h' AS `tempo`,count(0) AS `quantidade` from (`dbhotel`.`hospedagem` `h` join `dbhotel`.`config_geral` `c`) where ((`h`.`DATATURNO` = `c`.`DATATURNO`) and (`h`.`TURNO` = `c`.`TURNOATIVO`) and (time_to_sec(timediff(now(),`h`.`DATAHORAENTRADA`)) between 21601 and 25200)) union select _utf8'07h - 08h' AS `tempo`,count(0) AS `quantidade` from (`dbhotel`.`hospedagem` `h` join `dbhotel`.`config_geral` `c`) where ((`h`.`DATATURNO` = `c`.`DATATURNO`) and (`h`.`TURNO` = `c`.`TURNOATIVO`) and (time_to_sec(timediff(now(),`h`.`DATAHORAENTRADA`)) between 25201 and 28800)) union select _utf8'08h - 09h' AS `tempo`,count(0) AS `quantidade` from (`dbhotel`.`hospedagem` `h` join `dbhotel`.`config_geral` `c`) where ((`h`.`DATATURNO` = `c`.`DATATURNO`) and (`h`.`TURNO` = `c`.`TURNOATIVO`) and (time_to_sec(timediff(now(),`h`.`DATAHORAENTRADA`)) between 28801 and 32400)) union select _utf8'09h - 10h' AS `tempo`,count(0) AS `quantidade` from (`dbhotel`.`hospedagem` `h` join `dbhotel`.`config_geral` `c`) where ((`h`.`DATATURNO` = `c`.`DATATURNO`) and (`h`.`TURNO` = `c`.`TURNOATIVO`) and (time_to_sec(timediff(now(),`h`.`DATAHORAENTRADA`)) between 32401 and 36000)) union select _utf8'10h - 11h' AS `tempo`,count(0) AS `quantidade` from (`dbhotel`.`hospedagem` `h` join `dbhotel`.`config_geral` `c`) where ((`h`.`DATATURNO` = `c`.`DATATURNO`) and (`h`.`TURNO` = `c`.`TURNOATIVO`) and (time_to_sec(timediff(now(),`h`.`DATAHORAENTRADA`)) between 36001 and 39600)) union select _utf8'11h - 12h' AS `tempo`,count(0) AS `quantidade` from (`dbhotel`.`hospedagem` `h` join `dbhotel`.`config_geral` `c`) where ((`h`.`DATATURNO` = `c`.`DATATURNO`) and (`h`.`TURNO` = `c`.`TURNOATIVO`) and (time_to_sec(timediff(now(),`h`.`DATAHORAENTRADA`)) between 39601 and 43200)) union select _utf8'> 12h' AS `tempo`,count(0) AS `quantidade` from (`dbhotel`.`hospedagem` `h` join `dbhotel`.`config_geral` `c`) where ((`h`.`DATATURNO` = `c`.`DATATURNO`) and (`h`.`TURNO` = `c`.`TURNOATIVO`) and (time_to_sec(timediff(now(),`h`.`DATAHORAENTRADA`)) > 43201));


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw018_pt_pedidos_cortesia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw018_pt_pedidos_cortesia`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw018_pt_pedidos_cortesia` AS select `vw021_pt_consumo`.`quantidade` AS `quantidade`,`vw021_pt_consumo`.`descricao` AS `descricao`,`vw021_pt_consumo`.`controle` AS `controle` from `dbhotel`.`vw021_pt_consumo` where (`vw021_pt_consumo`.`tipo` = 'cortesia');


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw019_pt_sangria_suprimento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw019_pt_sangria_suprimento`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw019_pt_sangria_suprimento` AS select `v`.`descricao` AS `froma_pagamento`,sum(`v`.`valor`) AS `valor` from (`dbhotel`.`vw003_mov_financeira` `v` join `dbhotel`.`config_geral` `c`) where ((`v`.`dataturno` = `c`.`DATATURNO`) and (`v`.`turno` = `c`.`TURNOATIVO`) and (`v`.`forma_pagamentoid` in (95,96))) group by `v`.`descricao`;


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw020_pt_recebidas_forma_pgto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw020_pt_recebidas_forma_pgto`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw020_pt_recebidas_forma_pgto` AS select `v`.`tipo_suiteid` AS `tipo_suiteid`,`v`.`tiposuite` AS `tiposuite`,`v`.`formapagamento` AS `formapagamento`,sum(`v`.`valorformapgto`) AS `total` from `dbhotel`.`vw006_pt_contas_recebidas` `v` group by `v`.`tipo_suiteid`,`v`.`tiposuite`,`v`.`formapagamento`;


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw021_pt_consumo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw021_pt_consumo`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw021_pt_consumo` AS select `v`.`tipo` AS `tipo`,`v`.`controle` AS `controle`,`v`.`codigo` AS `codigo`,`v`.`quantidade` AS `quantidade`,`v`.`descricao` AS `descricao`,`v`.`preco` AS `preco`,`v`.`departamentoid` AS `departamentoid`,`v`.`reposicao` AS `reposicao` from (`dbhotel`.`vw002_consumo` `v` join `dbhotel`.`config_geral` `cg`) where ((`v`.`dataturno` = `cg`.`DATATURNO`) and (`v`.`turno` = `cg`.`TURNOATIVO`));


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw022_ocupadas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw022_ocupadas`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw022_ocupadas` AS select `s`.`DESCRICAO` AS `suite`,`h`.`HOSPEDAGEMID` AS `hospedagemid`,`h`.`DATAHORAENTRADA` AS `datahoraentrada` from (`dbhotel`.`hospedagem` `h` join `dbhotel`.`suite` `s`) where ((`h`.`SUITEID` = `s`.`SUITEID`) and (`h`.`STATUS` = 'a'));


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw023_pt_status_turno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw023_pt_status_turno`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw023_pt_status_turno` AS select (max(`h`.`HOSPEDAGEMID`) + 1) AS `ctrl_entrada`,(select `dbhotel`.`sequence`.`NEXTVALUE` from `dbhotel`.`sequence` where (`dbhotel`.`sequence`.`TABLENAME` = 'vendainternaorigem')) AS `ctrl_venda`,(select `dbhotel`.`sequence`.`NEXTVALUE` from `dbhotel`.`sequence` where (`dbhotel`.`sequence`.`TABLENAME` = 'cortesia')) AS `ctrl_cortesia`,cast(date_format(`cg`.`DATATURNO`,'%d/%m/%y %H:%i') as char(20) charset utf8) AS `inicio_turno`,cast(timediff(now(),`cg`.`DATATURNO`) as char(10) charset utf8) AS `tempo_turno`,ifnull(`f002_pt_total_entradas`(),0) AS `entradas`,`f008_pt_total_contas_emitidas`() AS `emitidas`,`f009_pt_total_contas_recebidas`() AS `recebidas`,`f010_pt_total_contas_a_receber`() AS `receber`,`f011_pt_total_contas_canc`() AS `canceladas`,`f017_total_ocupadas`() AS `ocupadas`,`f022_total_emconta`() AS `em_conta`,`f005_total_a_liberar`() AS `liberar`,`f018_total_suite`() AS `total_suite`,`f019_total_interditada`() AS `total_interditada`,ifnull(`f012_pt_total_venda_interna`(),0) AS `venda`,`f014_pt_total_pedidos_canc`() AS `pedido_canc`,ifnull(`f015_pt_total_mov_caixa`(),0) AS `total_caixa`,ifnull(`f016_pt_total_itens_consumidos`(),0) AS `consumidos`,`f020_total_aarrumar`() AS `total_aarrumar`,`f021_total_arrumacao`() AS `total_arrumacao`,`f023_total_entrada_canc`() AS `entrada_canc`,ifnull(`f024_pt_total_pgantecipado`(),0) AS `total_pgantecipado`,ifnull(`f025_total_livre`(),0) AS `total_livre` from (`dbhotel`.`hospedagem` `h` join `dbhotel`.`config_geral` `cg`);


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw024_totais_formapgto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw024_totais_formapgto`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw024_totais_formapgto` AS select date_format(`v`.`dataturno`,'%d/%m/%y') AS `data`,(ifnull(sum((case when (`v`.`forma_pagamentoid` = 100) then `v`.`valor` else NULL end)),0) - ifnull(sum((case when ((`v`.`forma_pagamentoid` = 0) and (`v`.`descricao` = 'troco')) then `v`.`valor` else NULL end)),0)) AS `dinheiro`,ifnull(sum((case when (`v`.`forma_pagamentoid` = 4) then `v`.`valor` else NULL end)),0) AS `cheque`,ifnull(sum((case when (`v`.`forma_pagamentoid` = 2) then `v`.`valor` else NULL end)),0) AS `cart�o visa`,ifnull(sum((case when (`v`.`forma_pagamentoid` = 3) then `v`.`valor` else NULL end)),0) AS `cart�o mastercard`,ifnull(sum((case when (`v`.`forma_pagamentoid` = 5) then `v`.`valor` else NULL end)),0) AS `visa eletron`,ifnull(sum((case when (`v`.`forma_pagamentoid` = 6) then `v`.`valor` else NULL end)),0) AS `debito mastercard`,ifnull(sum((case when (`v`.`forma_pagamentoid` = 99) then `v`.`valor` else NULL end)),0) AS `penhor`,ifnull(sum((case when (`v`.`forma_pagamentoid` = 98) then `v`.`valor` else NULL end)),0) AS `vale`,ifnull(sum((case when (`v`.`forma_pagamentoid` = 97) then `v`.`valor` else NULL end)),0) AS `despesa`,(((((((((ifnull(sum((case when (`v`.`forma_pagamentoid` = 100) then `v`.`valor` else NULL end)),0) + ifnull(sum((case when (`v`.`forma_pagamentoid` = 4) then `v`.`valor` else NULL end)),0)) + ifnull(sum((case when (`v`.`forma_pagamentoid` = 2) then `v`.`valor` else NULL end)),0)) + ifnull(sum((case when (`v`.`forma_pagamentoid` = 3) then `v`.`valor` else NULL end)),0)) + ifnull(sum((case when (`v`.`forma_pagamentoid` = 5) then `v`.`valor` else NULL end)),0)) + ifnull(sum((case when (`v`.`forma_pagamentoid` = 6) then `v`.`valor` else NULL end)),0)) + ifnull(sum((case when (`v`.`forma_pagamentoid` = 99) then `v`.`valor` else NULL end)),0)) + ifnull(sum((case when (`v`.`forma_pagamentoid` = 98) then `v`.`valor` else NULL end)),0)) + ifnull(sum((case when (`v`.`forma_pagamentoid` = 97) then `v`.`valor` else NULL end)),0)) - ifnull(sum((case when ((`v`.`forma_pagamentoid` = 0) and (`v`.`descricao` = 'troco')) then `v`.`valor` else NULL end)),0)) AS `bruto`,((((((((ifnull(sum((case when (`v`.`forma_pagamentoid` = 100) then `v`.`valor` else NULL end)),0) + ifnull(sum((case when (`v`.`forma_pagamentoid` = 2) then `v`.`valor` else NULL end)),0)) + ifnull(sum((case when (`v`.`forma_pagamentoid` = 4) then `v`.`valor` else NULL end)),0)) + ifnull(sum((case when (`v`.`forma_pagamentoid` = 3) then `v`.`valor` else NULL end)),0)) + ifnull(sum((case when (`v`.`forma_pagamentoid` = 6) then `v`.`valor` else NULL end)),0)) + ifnull(sum((case when (`v`.`forma_pagamentoid` = 98) then `v`.`valor` else NULL end)),0)) + ifnull(sum((case when (`v`.`forma_pagamentoid` = 5) then `v`.`valor` else NULL end)),0)) + ifnull(sum((case when (`v`.`forma_pagamentoid` = 97) then `v`.`valor` else NULL end)),0)) - ifnull(sum((case when ((`v`.`forma_pagamentoid` = 0) and (`v`.`descricao` = 'troco')) then `v`.`valor` else NULL end)),0)) AS `liquido` from `dbhotel`.`vw003_mov_financeira` `v` group by date_format(`v`.`dataturno`,'%d/%m/%y');


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw028_entradas_hora`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw028_entradas_hora`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw028_entradas_hora` AS select `h`.`DATATURNO` AS `dataturno`,`h`.`TURNO` AS `turno`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 1) then `h`.`HOSPEDAGEMID` else NULL end)) AS `1h`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 2) then `h`.`HOSPEDAGEMID` else NULL end)) AS `2h`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 3) then `h`.`HOSPEDAGEMID` else NULL end)) AS `3h`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 4) then `h`.`HOSPEDAGEMID` else NULL end)) AS `4h`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 5) then `h`.`HOSPEDAGEMID` else NULL end)) AS `5h`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 6) then `h`.`HOSPEDAGEMID` else NULL end)) AS `6h`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 7) then `h`.`HOSPEDAGEMID` else NULL end)) AS `7h`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 8) then `h`.`HOSPEDAGEMID` else NULL end)) AS `8h`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 9) then `h`.`HOSPEDAGEMID` else NULL end)) AS `9h`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 10) then `h`.`HOSPEDAGEMID` else NULL end)) AS `10h`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 11) then `h`.`HOSPEDAGEMID` else NULL end)) AS `11h`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 12) then `h`.`HOSPEDAGEMID` else NULL end)) AS `12h`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 13) then `h`.`HOSPEDAGEMID` else NULL end)) AS `13h`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 14) then `h`.`HOSPEDAGEMID` else NULL end)) AS `14h`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 15) then `h`.`HOSPEDAGEMID` else NULL end)) AS `15h`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 16) then `h`.`HOSPEDAGEMID` else NULL end)) AS `16h`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 17) then `h`.`HOSPEDAGEMID` else NULL end)) AS `17h`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 18) then `h`.`HOSPEDAGEMID` else NULL end)) AS `18h`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 19) then `h`.`HOSPEDAGEMID` else NULL end)) AS `19h`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 20) then `h`.`HOSPEDAGEMID` else NULL end)) AS `20h`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 21) then `h`.`HOSPEDAGEMID` else NULL end)) AS `21h`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 22) then `h`.`HOSPEDAGEMID` else NULL end)) AS `22h`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 23) then `h`.`HOSPEDAGEMID` else NULL end)) AS `23h`,count((case when (hour(`h`.`DATAHORAENTRADA`) = 0) then `h`.`HOSPEDAGEMID` else NULL end)) AS `0h` from `dbhotel`.`hospedagem` `h` where (`h`.`STATUS` = 'f') group by `h`.`DATATURNO`,`h`.`TURNO`;


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw029_pt_financeiro_formapg_turno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw029_pt_financeiro_formapg_turno`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw029_pt_financeiro_formapg_turno` AS select `h`.`HOSPEDAGEMID` AS `controle`,`h`.`SUITEID` AS `suiteid`,`s`.`DESCRICAO` AS `suite`,cast(`ff`.`DATATURNO` as date) AS `dataturno`,`ff`.`TURNO` AS `turno`,`fp`.`DESCRICAO` AS `formapagamento`,`ff`.`VALOR` AS `valor`,`ff`.`FORMA_PAGAMENTOID` AS `formapagamentoid`,`ff`.`LANCAMENTOID` AS `LANCAMENTOID` from (((((`dbhotel`.`hospedagem` `h` join `dbhotel`.`suite` `s`) join `dbhotel`.`financeiro` `f`) join `dbhotel`.`financeiro_formapgto` `ff`) join `dbhotel`.`forma_pagamento` `fp`) join `dbhotel`.`config_geral` `cg`) where ((`h`.`SUITEID` = `s`.`SUITEID`) and (`f`.`HOSPEDAGEMID` = `h`.`HOSPEDAGEMID`) and (`fp`.`FORMA_PAGAMENTOID` = `ff`.`FORMA_PAGAMENTOID`) and (`ff`.`LANCAMENTOID` = `f`.`LANCAMENTOID`) and (`ff`.`DATATURNO` = `cg`.`DATATURNO`) and (`ff`.`TURNO` = `cg`.`TURNOATIVO`)) order by `ff`.`DataInclusao`;


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw030_hospedes_chek_in`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw030_hospedes_chek_in`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw030_hospedes_chek_in` AS select `ho`.`Hospede1` AS `nome`,`e`.`RAZAOSOCIAL` AS `empresa`,`s`.`APARTAMENTO` AS `apartamento`,`s`.`DESCRICAO` AS `suite` from (((`dbhotel`.`hospedagem` `h` join `dbhotel`.`hospedagem_hospedes` `ho`) join `dbhotel`.`suite` `s`) join `dbhotel`.`empresa` `e`) where ((`h`.`SUITEID` = `s`.`SUITEID`) and (`h`.`HOSPEDAGEMID` = `ho`.`hospedagemid`) and (`h`.`EMPRESAID` = `e`.`EMPRESAID`) and (`h`.`STATUS` <> 'F') and (`ho`.`Hospede1` <> '')) union select `ho`.`Hospede2` AS `nome`,`e`.`RAZAOSOCIAL` AS `empresa`,`s`.`APARTAMENTO` AS `apartamento`,`s`.`DESCRICAO` AS `suite` from (((`dbhotel`.`hospedagem` `h` join `dbhotel`.`hospedagem_hospedes` `ho`) join `dbhotel`.`suite` `s`) join `dbhotel`.`empresa` `e`) where ((`h`.`SUITEID` = `s`.`SUITEID`) and (`h`.`HOSPEDAGEMID` = `ho`.`hospedagemid`) and (`h`.`EMPRESAID` = `e`.`EMPRESAID`) and (`h`.`STATUS` <> 'F') and (`ho`.`Hospede2` <> '')) union select `ho`.`Hospede3` AS `nome`,`e`.`RAZAOSOCIAL` AS `empresa`,`s`.`APARTAMENTO` AS `apartamento`,`s`.`DESCRICAO` AS `suite` from (((`dbhotel`.`hospedagem` `h` join `dbhotel`.`hospedagem_hospedes` `ho`) join `dbhotel`.`suite` `s`) join `dbhotel`.`empresa` `e`) where ((`h`.`SUITEID` = `s`.`SUITEID`) and (`h`.`HOSPEDAGEMID` = `ho`.`hospedagemid`) and (`h`.`EMPRESAID` = `e`.`EMPRESAID`) and (`h`.`STATUS` <> 'F') and (`ho`.`Hospede3` <> '')) union select `ho`.`Hospede4` AS `nome`,`e`.`RAZAOSOCIAL` AS `empresa`,`s`.`APARTAMENTO` AS `apartamento`,`s`.`DESCRICAO` AS `suite` from (((`dbhotel`.`hospedagem` `h` join `dbhotel`.`hospedagem_hospedes` `ho`) join `dbhotel`.`suite` `s`) join `dbhotel`.`empresa` `e`) where ((`h`.`SUITEID` = `s`.`SUITEID`) and (`h`.`HOSPEDAGEMID` = `ho`.`hospedagemid`) and (`h`.`EMPRESAID` = `e`.`EMPRESAID`) and (`h`.`STATUS` <> 'F') and (`ho`.`Hospede4` <> '')) union select `ho`.`Hospede5` AS `nome`,`e`.`RAZAOSOCIAL` AS `empresa`,`s`.`APARTAMENTO` AS `apartamento`,`s`.`DESCRICAO` AS `suite` from (((`dbhotel`.`hospedagem` `h` join `dbhotel`.`hospedagem_hospedes` `ho`) join `dbhotel`.`suite` `s`) join `dbhotel`.`empresa` `e`) where ((`h`.`SUITEID` = `s`.`SUITEID`) and (`h`.`HOSPEDAGEMID` = `ho`.`hospedagemid`) and (`h`.`EMPRESAID` = `e`.`EMPRESAID`) and (`h`.`STATUS` <> 'F') and (`ho`.`Hospede5` <> '')) order by `nome`;


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw031_mov_financeira_com_depositos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw031_mov_financeira_com_depositos`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw031_mov_financeira_com_depositos` AS select `p`.`DATA` AS `data`,`f`.`DESCRICAO` AS `descricao`,`p`.`VALOR` AS `valor`,`p`.`FORMA_PAGAMENTOID` AS `forma_pagamentoid`,`p`.`DATATURNO` AS `dataturno`,`p`.`TURNO` AS `turno`,`f`.`ACAOCAIXA` AS `acaocaixa`,`f`.`FLUXOCAIXA` AS `fluxocaixa`,`f`.`REGISTROCAIXA` AS `registrocaixa` from (`dbhotel`.`pg_antecipado` `p` join `dbhotel`.`forma_pagamento` `f`) where (`p`.`FORMA_PAGAMENTOID` = `f`.`FORMA_PAGAMENTOID`) union all select `f`.`DATAINCLUSAO` AS `datainclusao`,`fp`.`DESCRICAO` AS `descricao`,`ff`.`VALOR` AS `valor`,`ff`.`FORMA_PAGAMENTOID` AS `forma_pagamentoid`,`ff`.`DATATURNO` AS `dataturno`,`ff`.`TURNO` AS `turno`,`fp`.`ACAOCAIXA` AS `acaocaixa`,`fp`.`FLUXOCAIXA` AS `fluxocaixa`,`fp`.`REGISTROCAIXA` AS `registrocaixa` from ((`dbhotel`.`financeiro_formapgto` `ff` join `dbhotel`.`forma_pagamento` `fp`) join `dbhotel`.`financeiro` `f`) where ((`ff`.`FORMA_PAGAMENTOID` = `fp`.`FORMA_PAGAMENTOID`) and (`f`.`LANCAMENTOID` = `ff`.`LANCAMENTOID`)) union all select `l`.`DATAINCLUSAO` AS `datainclusao`,`f`.`DESCRICAO` AS `descricao`,`l`.`VALOR` AS `valor`,`l`.`FORMA_PAGAMENTOID` AS `forma_pagamentoid`,`l`.`DATATURNO` AS `dataturno`,`l`.`TURNO` AS `turno`,`f`.`ACAOCAIXA` AS `acaocaixa`,`f`.`FLUXOCAIXA` AS `fluxocaixa`,`f`.`REGISTROCAIXA` AS `registrocaixa` from (`dbhotel`.`lancamentos` `l` join `dbhotel`.`forma_pagamento` `f`) where ((`l`.`FORMA_PAGAMENTOID` = `f`.`FORMA_PAGAMENTOID`) and (`l`.`DESCRICAO` <> 'SANGRIA DE CAIXA')) union all select `l`.`DATAINCLUSAO` AS `datainclusao`,concat('SANGRIA [',`f`.`DESCRICAO`,']') AS `DESCRICAO`,`l`.`VALOR` AS `valor`,`l`.`FORMA_PAGAMENTOID` AS `forma_pagamentoid`,`l`.`DATATURNO` AS `dataturno`,`l`.`TURNO` AS `turno`,-(1) AS `-1`,0 AS `0`,0 AS `0` from (`dbhotel`.`lancamentos` `l` join `dbhotel`.`forma_pagamento` `f`) where ((`l`.`FORMA_PAGAMENTOID` = `f`.`FORMA_PAGAMENTOID`) and (`l`.`DESCRICAO` = 'SANGRIA DE CAIXA')) union all select `f`.`DATAINCLUSAO` AS `datainclusao`,'TROCO' AS `TROCO`,`f`.`DIFERENCA` AS `DIFERENCA`,0 AS `0`,`f`.`DATATURNO` AS `DATATURNO`,`f`.`TURNO` AS `TURNO`,-(1) AS `-1`,-(1) AS `-1`,0 AS `0` from `dbhotel`.`financeiro` `f` where (`f`.`DIFERENCA` > 0) union all select `d`.`datainclusao` AS `data`,`fp`.`DESCRICAO` AS `descricao`,(`d`.`Valor` * `d`.`acao`) AS `valor`,`d`.`forma_pagamentoid` AS `forma_pagamentoid`,`d`.`data` AS `dataturno`,0 AS `0`,`fp`.`ACAOCAIXA` AS `acaocaixa`,`fp`.`FLUXOCAIXA` AS `fluxocaixa`,`fp`.`REGISTROCAIXA` AS `registrocaixa` from (`dbhotel`.`depositos` `d` join `dbhotel`.`forma_pagamento` `fp`) where (`d`.`forma_pagamentoid` = `fp`.`FORMA_PAGAMENTOID`);


USE `dbhotel`;

-- -----------------------------------------------------
-- View `dbhotel`.`vw_extrato_detalhado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbhotel`.`vw_extrato_detalhado`;
USE `dbhotel`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbhotel`.`vw_extrato_detalhado` AS select 1 AS `tipo`,`hd`.`Id` AS `id`,1 AS `quantidade`,`hd`.`descricao` AS `descricao`,(`hd`.`ValorCobrado` - (`hd`.`ValorCobrado` * (`h`.`DESCONTOPORCENTAGEM` / 100))) AS `valor`,`hd`.`datainclusao` AS `datainclusao`,cast(`hd`.`datainclusao` as date) AS `data`,`h`.`HOSPEDAGEMID` AS `hospedagemid` from (`dbhotel`.`hospedagem_diarias` `hd` join `dbhotel`.`hospedagem` `h`) where (`hd`.`Hospedagemid` = `h`.`HOSPEDAGEMID`) union select 2 AS `2`,`p`.`PEDIDOSID` AS `pedidosid`,`p`.`QUANTIDADE` AS `quantidade`,`c`.`DESCRICAO` AS `descricao`,`p`.`PRECO` AS `preco`,`p`.`DATAINCLUSAO` AS `datainclusao`,cast(`p`.`DATAINCLUSAO` as date) AS `date(p.datainclusao)`,`h`.`HOSPEDAGEMID` AS `hospedagemid` from ((`dbhotel`.`pedidos` `p` join `dbhotel`.`cardapio` `c`) join `dbhotel`.`hospedagem` `h`) where ((`p`.`CARDAPIOID` = `c`.`CARDAPIOID`) and (`p`.`HOSPEDAGEMID` = `h`.`HOSPEDAGEMID`) and (`p`.`STATUS` = 'a')) union select 3 AS `3`,`l`.`ligacoesid` AS `ligacoesid`,1 AS `1`,concat('ligação para ',`l`.`telefone`) AS `concat('ligação para ',l.telefone)`,`l`.`valor` AS `valor`,`l`.`datainclusao` AS `datainclusao`,cast(`l`.`datainclusao` as date) AS `date(l.datainclusao)`,`h`.`HOSPEDAGEMID` AS `hospedagemid` from (`dbhotel`.`ligacoes` `l` join `dbhotel`.`hospedagem` `h`) where (`l`.`hospedagemid` = `h`.`HOSPEDAGEMID`) union select 4 AS `4`,`pa`.`PGANTECIPADOID` AS `pgantecipadoid`,1 AS `1`,concat('Pagamento Antecipado em ',`f`.`DESCRICAO`) AS `concat('Pagamento Antecipado em ',f.descricao)`,(`pa`.`VALOR` * -(1)) AS `(pa.valor)*-1`,`pa`.`DATA` AS `data`,cast(`pa`.`DATA` as date) AS `date(pa.data)`,`h`.`HOSPEDAGEMID` AS `hospedagemid` from ((`dbhotel`.`pg_antecipado` `pa` join `dbhotel`.`forma_pagamento` `f`) join `dbhotel`.`hospedagem` `h`) where ((`pa`.`FORMA_PAGAMENTOID` = `f`.`FORMA_PAGAMENTOID`) and (`pa`.`HOSPEDAGEMID` = `h`.`HOSPEDAGEMID`)) union select 5 AS `tipo`,`t`.`transferenciaid` AS `id`,1 AS `quantidade`,concat('Transferido da Unidade ',`s`.`DESCRICAO`) AS `descricao`,0 AS `valor`,`t`.`datatransferencia` AS `datainclusao`,cast(`t`.`datatransferencia` as date) AS `data`,`h`.`HOSPEDAGEMID` AS `hospedagemid` from ((`dbhotel`.`transferencia` `t` join `dbhotel`.`suite` `s`) join `dbhotel`.`hospedagem` `h`) where ((`t`.`suiteantiga` = `s`.`SUITEID`) and (`t`.`Hospedagemid` = `h`.`HOSPEDAGEMID`)) union select 6 AS `tipo`,`d`.`DepositoId` AS `id`,1 AS `quantidade`,concat('Depósito em ',`f`.`DESCRICAO`) AS `descricao`,`d`.`Valor` AS `valor`,`d`.`datainclusao` AS `datainclusao`,`d`.`data` AS `data`,`h`.`HOSPEDAGEMID` AS `hospedagemid` from (((`dbhotel`.`forma_pagamento` `f` join `dbhotel`.`hospedagem` `h`) join `dbhotel`.`depositos` `d`) join `dbhotel`.`reserva` `r`) where ((`d`.`forma_pagamentoid` = `f`.`FORMA_PAGAMENTOID`) and (`d`.`Reservaid` = `h`.`Reservaid`) and (`d`.`Excluido` = 'N') and (`r`.`ReservaId` = `h`.`Reservaid`));

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `F003_PT_TOTAL_UN_PASSANTES`() RETURNS int(11)
BEGIN
  DECLARE V_QTDE INT;

  select count(*) INTO V_QTDE from VW008_PT_UNIDADES_PASSANTES;

  RETURN V_QTDE;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `F004_PT_TOTAL_CONTAS_PEDIDAS`() RETURNS int(11)
BEGIN
  DECLARE V_QTDE INT;

  select count(*) INTO V_QTDE from VW009_PT_CONTAS_PEDIDAS;

  RETURN V_QTDE;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `F006_TOTAL_CONSUMO`(P_HOSPEDAGEMID INT ) RETURNS double
BEGIN
  DECLARE V_VALOR DOUBLE;

  SELECT SUM(QUANTIDADE*PRECO) VALOR_CONSUMO INTO V_VALOR
    FROM VW002_CONSUMO
   WHERE controle = P_HOSPEDAGEMID
GROUP BY controle;

  RETURN V_VALOR;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `F007_PT_TOTAL_REC_TURNO_ANT`() RETURNS int(11)
BEGIN
  DECLARE V_QTDE INT;

  select count(*) INTO V_QTDE
    from financeiro f, config_geral c
   where f.datainclusao < c.dataturno
     and f.datapagamento > c.dataturno;

  RETURN V_QTDE;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `F013_PT_TOTAL_PENHOR`() RETURNS double
BEGIN
  DECLARE V_QTDE double;

  
  select   sum(v.valor) AS VALOR into v_qtde
      from VW003_MOV_FINANCEIRA v, config_geral c
     where v.dataturno = c.dataturno
       and v.turno     = c.turnoativo
       and v.forma_pagamentoid = 99
  group by v.descricao;


  RETURN V_QTDE;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `F026_TOTAL_DIARIAS`(P_HOSPEDAGEMID INT ) RETURNS double
BEGIN
  DECLARE V_VALOR DOUBLE;

  SELECT SUM(valorcobrado)  INTO V_VALOR
    FROM hospedagem_diarias
   WHERE hospedagemid = P_HOSPEDAGEMID;

  RETURN V_VALOR;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `F027_TOTAL_LIGACOES`(P_HOSPEDAGEMID INT ) RETURNS double
BEGIN
  DECLARE V_TOTAL DOUBLE;

  SELECT SUM(valor)  INTO V_TOTAL
    FROM ligacoes
   WHERE hospedagemid = P_HOSPEDAGEMID;

  RETURN V_TOTAL;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `F_CANCELACONTA`(P_HOSPEDAGEMID INT) RETURNS int(11)
BEGIN

DECLARE V_RETURN INT;

  select (sum(hh.valorcobrado)-(sum(hh.valorcobrado*(h.descontoporcentagem/100)))) > f.conta+h.deposito INTO V_RETURN
    from hospedagem h, financeiro f, hospedagem_diarias hh
   where f.hospedagemid = h.hospedagemid
     and h.hospedagemid = hh.hospedagemid
     and h.hospedagemid = P_HOSPEDAGEMID;

  RETURN V_RETURN;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f001_pt_valor_dinheiro`() RETURNS double
BEGIN
 DECLARE V_VALOR DOUBLE;

SELECT SUM(M.VALOR*F.acaocaixa) INTO V_VALOR
   FROM VW003_MOV_FINANCEIRA M, CONFIG_GERAL C, FORMA_PAGAMENTO F
  WHERE M.TURNO     = C.TURNOATIVO
    AND M.DATATURNO = C.DATATURNO
    AND M.FORMA_PAGAMENTOID = F.FORMA_PAGAMENTOID
    AND f.ACAOCAIXA <> 0;

	RETURN V_VALOR;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f002_pt_total_entradas`() RETURNS int(11)
BEGIN
  DECLARE V_QTDE INT;

  select sum(qtde) INTO V_QTDE from VW005_PT_TOTAL_ENT_TS;

  RETURN V_QTDE;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f005_total_a_liberar`() RETURNS int(11)
BEGIN
  DECLARE V_QTDE INT;

  select count(*)  INTO V_QTDE from VW010_A_LIBERAR;

  RETURN V_QTDE;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f008_pt_total_contas_emitidas`() RETURNS int(11)
BEGIN
  DECLARE V_QTDE INT;

  select count(*)+F011_PT_TOTAL_CONTAS_CANC() into v_qtde
    from financeiro f, config_geral c
   where f.dataturno = c.dataturno
     and f.turno = c.turnoativo
     AND f.hospedagemid is not null;



  RETURN V_QTDE;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f009_pt_total_contas_recebidas`() RETURNS int(11)
BEGIN
  DECLARE V_QTDE INT;

  select count(distinct hospedagemid) INTO V_QTDE
   from VW006_PT_CONTAS_RECEBIDAS;

  RETURN V_QTDE;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f010_pt_total_contas_a_receber`() RETURNS int(11)
BEGIN
  DECLARE V_QTDE INT;

  select count(*) into v_qtde
    from financeiro f, config_geral c
   where f.dataturno = c.dataturno
     and f.turno = c.turnoativo
     and f.datapagamento is null;

  RETURN V_QTDE;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f011_pt_total_contas_canc`() RETURNS int(11)
BEGIN
  DECLARE V_QTDE INT;

  select count(*) into v_qtde
    from VW015_PT_CANC_CONTAS;

  RETURN V_QTDE;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f012_pt_total_venda_interna`() RETURNS double
BEGIN
  DECLARE V_QTDE double;

  SELECT sum(total) into v_qtde
    FROM VW013_PT_VENDA_INTERNA;

  RETURN V_QTDE;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f014_pt_total_pedidos_canc`() RETURNS int(11)
BEGIN
  DECLARE V_QTDE INT;


  select count(*) into v_qtde
    from vw014_pt_canc_pedidos;


  RETURN V_QTDE;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f015_pt_total_mov_caixa`() RETURNS double
BEGIN
  DECLARE V_VALOR DOUBLE;


  SELECT sum(valor*fluxoCaixa) INTO V_VALOR
    FROM vw016_pt_mov_caixa;


  RETURN V_VALOR;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f016_pt_total_itens_consumidos`() RETURNS double
BEGIN
  DECLARE V_VALOR DOUBLE;

  SELECT  SUM(QUANTIDADE*PRECO) into V_VALOR
    FROM VW021_PT_CONSUMO
   WHERE TIPO = 'PEDIDO';


  RETURN V_VALOR;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f017_total_ocupadas`() RETURNS int(11)
BEGIN
  DECLARE V_QTDE INT;

  select count(*)  INTO V_QTDE from VW022_OCUPADAS;

  RETURN V_QTDE;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f018_total_suite`() RETURNS int(11)
BEGIN
  DECLARE V_QTDE INT;

  select count(*)  INTO V_QTDE from SUITE;

  RETURN V_QTDE;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f019_total_interditada`() RETURNS int(11)
BEGIN
  DECLARE V_QTDE INT;

  select count(*)  INTO V_QTDE from SUITE where status_suiteid = 5;

  RETURN V_QTDE;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f020_total_aarrumar`() RETURNS int(11)
BEGIN
  DECLARE V_QTDE INT;

  select count(*)  INTO V_QTDE from SUITE where status_suiteid = 6;

  RETURN V_QTDE;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f021_total_arrumacao`() RETURNS int(11)
BEGIN
  DECLARE V_QTDE INT;

  select count(*)  INTO V_QTDE from SUITE where status_suiteid = 7;

  RETURN V_QTDE;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f022_total_emconta`() RETURNS int(11)
BEGIN
  DECLARE V_QTDE INT;

  select count(*)  INTO V_QTDE from SUITE where status_suiteid = 2;

  RETURN V_QTDE;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f023_total_entrada_canc`() RETURNS int(11)
BEGIN
  DECLARE V_QTDE INT;

  select count(*)  INTO V_QTDE from VW025_PT_CANC_ENTRADAS;

  RETURN V_QTDE;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f024_pt_total_pgantecipado`() RETURNS double
BEGIN
  DECLARE V_VALOR DOUBLE;

  SELECT SUM(VALOR) VALOR INTO V_VALOR FROM vw027_pt_total_pgantecipado v;

  RETURN V_VALOR;

END$$

DELIMITER ;

DELIMITER $$
USE `dbhotel`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f025_total_livre`() RETURNS int(11)
BEGIN
  DECLARE V_QTDE INT;

  select count(*)  INTO V_QTDE from SUITE where status_suiteid = 0;

  RETURN V_QTDE;

END$$

DELIMITER ;

DELIMITER $$

USE `dbhotel`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `dbhotel`.`BU_CARDAPIO`
BEFORE UPDATE ON `dbhotel`.`cardapio`
FOR EACH ROW
SET new.dataatualizacao = current_timestamp$$

USE `dbhotel`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `dbhotel`.`Bu_Desp_despesa`
BEFORE UPDATE ON `dbhotel`.`desp_despesa`
FOR EACH ROW
SET NEW.DATAATUALIZACAO = CURRENT_TIMESTAMP$$

USE `dbhotel`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `dbhotel`.`BU_FORMAPG`
BEFORE UPDATE ON `dbhotel`.`desp_forma_pagamento`
FOR EACH ROW
SET NEW.DATAATUALIZACAO = CURRENT_TIMESTAMP$$

USE `dbhotel`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `dbhotel`.`BU_GRUPO`
BEFORE UPDATE ON `dbhotel`.`desp_grupo`
FOR EACH ROW
SET NEW.DATAATUALIZACAO = CURRENT_TIMESTAMP$$

USE `dbhotel`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `dbhotel`.`BU_SUBGRUPO`
BEFORE UPDATE ON `dbhotel`.`desp_subgrupo`
FOR EACH ROW
SET NEW.DATAATUALIZACAO = CURRENT_TIMESTAMP$$

USE `dbhotel`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `dbhotel`.`BI_AJUSTEESTOQUE`
BEFORE INSERT ON `dbhotel`.`est_ajusteproduto`
FOR EACH ROW
UPDATE EST_PRODUTO
SET ESTOQUE=NEW.QUANTIDADENOVA
where PRODUTOID = NEW.PRODUTOID$$

USE `dbhotel`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `dbhotel`.`BU_Baixaestoque`
BEFORE UPDATE ON `dbhotel`.`est_baixaestoque`
FOR EACH ROW
SET NEW.DATAATUALIZACAO = CURRENT_TIMESTAMP$$

USE `dbhotel`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `dbhotel`.`BI_EntradaProduto`
BEFORE INSERT ON `dbhotel`.`est_entradaproduto`
FOR EACH ROW
BEGIN
      UPDATE EST_PRODUTO
     SET ESTOQUE = ESTOQUE+NEW.QUANTIDADE
   WHERE PRODUTOID = NEW.PRODUTOID;

END$$

USE `dbhotel`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `dbhotel`.`BU_Entradaproduto`
BEFORE UPDATE ON `dbhotel`.`est_entradaproduto`
FOR EACH ROW
BEGIN
  SET NEW.DATAATUALIZACAO = CURRENT_TIMESTAMP;
  
  IF NEW.EXCLUIDO = 'S' THEN
    UPDATE EST_PRODUTO
     SET ESTOQUE = ESTOQUE-NEW.QUANTIDADE
   WHERE PRODUTOID = NEW.PRODUTOID;
  END IF;
END$$

USE `dbhotel`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `dbhotel`.`BU_Fornecedor`
BEFORE UPDATE ON `dbhotel`.`est_fornecedor`
FOR EACH ROW
SET NEW.DATAATUALIZACAO = CURRENT_TIMESTAMP$$

USE `dbhotel`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `dbhotel`.`BI_FAIXAPERNOITE`
BEFORE INSERT ON `dbhotel`.`faixapernoite`
FOR EACH ROW
BEGIN
  SET NEW.INICIOSEGUNDOS = TIME_TO_SEC(NEW.HORAINICIO);
  SET NEW.FIMSEGUNDOS    = TIME_TO_SEC(NEW.HORAFIM);

  IF NEW.FIMSEGUNDOS < NEW.INICIOSEGUNDOS THEN
     SET NEW.FIMSEGUNDOS = NEW.FIMSEGUNDOS+86400;
  END IF;
END$$

USE `dbhotel`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `dbhotel`.`BU_FAIXAPERNOITE`
BEFORE UPDATE ON `dbhotel`.`faixapernoite`
FOR EACH ROW
BEGIN
  SET NEW.INICIOSEGUNDOS = TIME_TO_SEC(NEW.HORAINICIO);
  SET NEW.FIMSEGUNDOS    = TIME_TO_SEC(NEW.HORAFIM);

  IF NEW.FIMSEGUNDOS < NEW.INICIOSEGUNDOS THEN
     SET NEW.FIMSEGUNDOS = NEW.FIMSEGUNDOS+86400;
  END IF;
END$$

USE `dbhotel`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `dbhotel`.`BU_FUNCAO`
BEFORE UPDATE ON `dbhotel`.`funcao`
FOR EACH ROW
SET NEW.DATAATUALIZACAO = CURRENT_TIMESTAMP$$

USE `dbhotel`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `dbhotel`.`BI_PEDIDOS`
BEFORE INSERT ON `dbhotel`.`pedidos`
FOR EACH ROW
BEGIN
DECLARE V_TURNOATIVO CHAR(1);
DECLARE V_DATATURNO DATETIME;
DECLARE V_EXIT CHAR(1) DEFAULT 'N';
DECLARE V_ID INTEGER;
DECLARE V_QTDE DOUBLE(6,3);
DECLARE C_BAIXA CURSOR FOR SELECT PRODUTOID, QUANTIDADE
                             FROM EST_BAIXAESTOQUE
                            WHERE CARDAPIOID = NEW.CARDAPIOID
                              AND ATIVO = 'S';
DECLARE CONTINUE HANDLER FOR NOT FOUND SET V_EXIT = 'S';

OPEN C_BAIXA;

MYLOOP: LOOP

  FETCH C_BAIXA INTO V_ID, V_QTDE;
  IF V_EXIT = 'S' THEN
    LEAVE MYLOOP;
  END IF;

  UPDATE EST_PRODUTO
     SET ESTOQUE = ESTOQUE-(V_QTDE*NEW.QUANTIDADE)
   WHERE PRODUTOID = V_ID;

END LOOP;

CLOSE C_BAIXA;

SET NEW.DATAATUALIZACAO = CURRENT_TIMESTAMP;


  SELECT TURNOATIVO, DATATURNO INTO V_TURNOATIVO, V_DATATURNO FROM CONFIG_GERAL;

  SET NEW.TURNO = V_TURNOATIVO;
  SET NEW.DATATURNO = V_DATATURNO;

END$$

USE `dbhotel`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `dbhotel`.`BU_PEDIDOS`
BEFORE UPDATE ON `dbhotel`.`pedidos`
FOR EACH ROW
BEGIN

  DECLARE V_EXIT CHAR(1) DEFAULT 'N';
  DECLARE V_ID INTEGER;
  DECLARE V_QTDE DOUBLE(6,3);
  DECLARE C_BAIXA CURSOR FOR SELECT PRODUTOID, QUANTIDADE
                               FROM EST_BAIXAESTOQUE
                            WHERE CARDAPIOID = NEW.CARDAPIOID
                              AND ATIVO = 'S';
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET V_EXIT = 'S';


SET NEW.DATAATUALIZACAO = CURRENT_TIMESTAMP;

IF NEW.STATUS = 'C' THEN
  
  OPEN C_BAIXA;
  
  MYLOOP: LOOP
  
    FETCH C_BAIXA INTO V_ID, V_QTDE;
    IF V_EXIT = 'S' THEN
      LEAVE MYLOOP;
    END IF;
  
    UPDATE EST_PRODUTO
       SET ESTOQUE = ESTOQUE+(V_QTDE*NEW.QUANTIDADE)
     WHERE PRODUTOID = V_ID;
  
  END LOOP;
  
  CLOSE C_BAIXA;

END IF;

END$$


DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
