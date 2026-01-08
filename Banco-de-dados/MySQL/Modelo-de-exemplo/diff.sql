-- MySQL Workbench Synchronization

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE `dbrecepcao`.`config_geral` 
DROP COLUMN `IMPORTADESPESA`;

CREATE TABLE IF NOT EXISTS `dbrecepcao`.`vw016_pt_mov_caixa` (
  `forma_pagamento` VARCHAR(60) NULL DEFAULT NULL COMMENT '',
  `valor` DOUBLE NULL DEFAULT NULL COMMENT '',
  `fluxocaixa` BIGINT(20) NULL DEFAULT NULL COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `dbrecepcao`.`vw018_pt_pedidos_cortesia` (
  `QUANTIDADE` DOUBLE(4,2) NULL DEFAULT NULL COMMENT '',
  `DESCRICAO` VARCHAR(50) NULL DEFAULT NULL COMMENT '',
  `CONTROLE` INT(11) NULL DEFAULT NULL COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `dbrecepcao`.`vw021_pt_consumo` (
  `TIPO` VARCHAR(12) NULL DEFAULT NULL COMMENT '',
  `CONTROLE` INT(11) NULL DEFAULT NULL COMMENT '',
  `QUANTIDADE` DOUBLE(4,2) NULL DEFAULT NULL COMMENT '',
  `DESCRICAO` VARCHAR(50) NULL DEFAULT NULL COMMENT '',
  `PRECO` DOUBLE(6,2) NULL DEFAULT NULL COMMENT '',
  `DEPARTAMENTOID` INT(11) NULL DEFAULT NULL COMMENT '',
  `REPOSICAO` VARCHAR(50) NULL DEFAULT NULL COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `dbrecepcao`.`vw023_pt_status_turno` (
  `CTRL_ENTRADA` BIGINT(21) NULL DEFAULT NULL COMMENT '',
  `CTRL_VENDA` BIGINT(11) NULL DEFAULT NULL COMMENT '',
  `CTRL_CORTESIA` BIGINT(11) NULL DEFAULT NULL COMMENT '',
  `INICIO_TURNO` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `TEMPO_TURNO` VARCHAR(10) NULL DEFAULT NULL COMMENT '',
  `ENTRADAS` BIGINT(11) NULL DEFAULT NULL COMMENT '',
  `EMITIDAS` INT(11) NULL DEFAULT NULL COMMENT '',
  `RECEBIDAS` INT(11) NULL DEFAULT NULL COMMENT '',
  `RECEBER` INT(11) NULL DEFAULT NULL COMMENT '',
  `CANCELADAS` INT(11) NULL DEFAULT NULL COMMENT '',
  `OCUPADAS` INT(11) NULL DEFAULT NULL COMMENT '',
  `EM_CONTA` INT(11) NULL DEFAULT NULL COMMENT '',
  `LIBERAR` INT(11) NULL DEFAULT NULL COMMENT '',
  `TOTAL_SUITE` INT(11) NULL DEFAULT NULL COMMENT '',
  `TOTAL_INTERDITADA` INT(11) NULL DEFAULT NULL COMMENT '',
  `VENDA` DOUBLE NULL DEFAULT NULL COMMENT '',
  `PEDIDO_CANC` INT(11) NULL DEFAULT NULL COMMENT '',
  `TOTAL_CAIXA` DOUBLE NULL DEFAULT NULL COMMENT '',
  `CONSUMIDOS` DOUBLE NULL DEFAULT NULL COMMENT '',
  `TOTAL_AARRUMAR` INT(11) NULL DEFAULT NULL COMMENT '',
  `TOTAL_ARRUMACAO` INT(11) NULL DEFAULT NULL COMMENT '',
  `ENTRADA_CANC` INT(11) NULL DEFAULT NULL COMMENT '',
  `TOTAL_PGANTECIPADO` DOUBLE NULL DEFAULT NULL COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

DROP TABLE IF EXISTS `dbrecepcao`.`trocadecaixa` ;

DROP TABLE IF EXISTS `dbrecepcao`.`desp_subgrupo` ;

DROP TABLE IF EXISTS `dbrecepcao`.`desp_grupo` ;

DROP TABLE IF EXISTS `dbrecepcao`.`desp_despesa` ;


-- -----------------------------------------------------
-- Placeholder table for view `dbrecepcao`.`vw003_mov_financeira`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbrecepcao`.`vw003_mov_financeira` (`data` INT, `descricao` INT, `valor` INT, `forma_pagamentoid` INT, `dataturno` INT, `turno` INT, `acaocaixa` INT, `fluxocaixa` INT, `registrocaixa` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbrecepcao`.`vw023_pt_status_turno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbrecepcao`.`vw023_pt_status_turno` (`CTRL_ENTRADA` INT, `CTRL_VENDA` INT, `CTRL_CORTESIA` INT, `INICIO_TURNO` INT, `TEMPO_TURNO` INT, `ENTRADAS` INT, `EMITIDAS` INT, `RECEBIDAS` INT, `RECEBER` INT, `CANCELADAS` INT, `OCUPADAS` INT, `EM_CONTA` INT, `LIBERAR` INT, `TOTAL_SUITE` INT, `TOTAL_INTERDITADA` INT, `VENDA` INT, `PEDIDO_CANC` INT, `TOTAL_CAIXA` INT, `CONSUMIDOS` INT, `TOTAL_AARRUMAR` INT, `TOTAL_ARRUMACAO` INT, `ENTRADA_CANC` INT, `TOTAL_PGANTECIPADO` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbrecepcao`.`vw021_pt_consumo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbrecepcao`.`vw021_pt_consumo` (`TIPO` INT, `CONTROLE` INT, `QUANTIDADE` INT, `DESCRICAO` INT, `PRECO` INT, `DEPARTAMENTOID` INT, `REPOSICAO` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbrecepcao`.`vw018_pt_pedidos_cortesia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbrecepcao`.`vw018_pt_pedidos_cortesia` (`QUANTIDADE` INT, `DESCRICAO` INT, `CONTROLE` INT);

-- -----------------------------------------------------
-- Placeholder table for view `dbrecepcao`.`vw016_pt_mov_caixa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbrecepcao`.`vw016_pt_mov_caixa` (`forma_pagamento` INT, `valor` INT, `fluxocaixa` INT);


USE `dbrecepcao`;

-- -----------------------------------------------------
-- View `dbrecepcao`.`vw003_mov_financeira`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbrecepcao`.`vw003_mov_financeira`;
USE `dbrecepcao`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw003_mov_financeira` AS select `p`.`DATA` AS `data`,`f`.`DESCRICAO` AS `descricao`,`p`.`VALOR` AS `valor`,`p`.`FORMA_PAGAMENTOID` AS `forma_pagamentoid`,`p`.`DATATURNO` AS `dataturno`,`p`.`TURNO` AS `turno`,`f`.`ACAOCAIXA` AS `acaocaixa`,`f`.`FLUXOCAIXA` AS `fluxocaixa`,`f`.`REGISTROCAIXA` AS `registrocaixa` from (`pg_antecipado` `p` join `forma_pagamento` `f`) where (`p`.`FORMA_PAGAMENTOID` = `f`.`FORMA_PAGAMENTOID`) union all select `f`.`DATAINCLUSAO` AS `data`,`fp`.`DESCRICAO` AS `descricao`,`ff`.`VALOR` AS `valor`,`ff`.`FORMA_PAGAMENTOID` AS `forma_pagamentoid`,`ff`.`DATATURNO` AS `dataturno`,`ff`.`TURNO` AS `turno`,`fp`.`ACAOCAIXA` AS `acaocaixa`,`fp`.`FLUXOCAIXA` AS `fluxocaixa`,`fp`.`REGISTROCAIXA` AS `registrocaixa` from ((`financeiro_formapgto` `ff` join `forma_pagamento` `fp`) join `financeiro` `f`) where ((`ff`.`FORMA_PAGAMENTOID` = `fp`.`FORMA_PAGAMENTOID`) and (`f`.`LANCAMENTOID` = `ff`.`LANCAMENTOID`)) union all select `l`.`DATAINCLUSAO` AS `datainclusao`,`f`.`DESCRICAO` AS `descricao`,`l`.`VALOR` AS `valor`,`l`.`FORMA_PAGAMENTOID` AS `forma_pagamentoid`,`l`.`DATATURNO` AS `dataturno`,`l`.`TURNO` AS `turno`,`f`.`ACAOCAIXA` AS `acaocaixa`,`f`.`FLUXOCAIXA` AS `fluxocaixa`,`f`.`REGISTROCAIXA` AS `registrocaixa` from (`lancamentos` `l` join `forma_pagamento` `f`) where ((`l`.`FORMA_PAGAMENTOID` = `f`.`FORMA_PAGAMENTOID`) and (`l`.`DESCRICAO` <> 'SANGRIA DE CAIXA')) union all select `l`.`DATAINCLUSAO` AS `datainclusao`,concat('SANGRIA [',`f`.`DESCRICAO`,']') AS `DESCRICAO`,`l`.`VALOR` AS `valor`,95 AS `95`,`l`.`DATATURNO` AS `dataturno`,`l`.`TURNO` AS `turno`,-(1) AS `-1`,0 AS `0`,0 AS `0` from (`lancamentos` `l` join `forma_pagamento` `f`) where ((`l`.`FORMA_PAGAMENTOID` = `f`.`FORMA_PAGAMENTOID`) and (`l`.`DESCRICAO` = 'SANGRIA DE CAIXA')) union all select `f`.`DATAINCLUSAO` AS `datainclusao`,'TROCO' AS `TROCO`,`f`.`DIFERENCA` AS `DIFERENCA`,0 AS `0`,`f`.`DATATURNO` AS `DATATURNO`,`f`.`TURNO` AS `TURNO`,-(1) AS `-1`,-(1) AS `-1`,0 AS `0` from `financeiro` `f` where (`f`.`DIFERENCA` > 0);


USE `dbrecepcao`;

-- -----------------------------------------------------
-- View `dbrecepcao`.`vw023_pt_status_turno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbrecepcao`.`vw023_pt_status_turno`;
DROP VIEW IF EXISTS `dbrecepcao`.`vw023_pt_status_turno` ;


USE `dbrecepcao`;

-- -----------------------------------------------------
-- View `dbrecepcao`.`vw021_pt_consumo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbrecepcao`.`vw021_pt_consumo`;
DROP VIEW IF EXISTS `dbrecepcao`.`vw021_pt_consumo` ;


USE `dbrecepcao`;

-- -----------------------------------------------------
-- View `dbrecepcao`.`vw018_pt_pedidos_cortesia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbrecepcao`.`vw018_pt_pedidos_cortesia`;
DROP VIEW IF EXISTS `dbrecepcao`.`vw018_pt_pedidos_cortesia` ;


USE `dbrecepcao`;

-- -----------------------------------------------------
-- View `dbrecepcao`.`vw016_pt_mov_caixa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbrecepcao`.`vw016_pt_mov_caixa`;
DROP VIEW IF EXISTS `dbrecepcao`.`vw016_pt_mov_caixa` ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
