-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER4` ;
USE `MER4` ;

-- -----------------------------------------------------
-- Table `MER4`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Client` (
  `DNI` VARCHAR(9) NOT NULL,
  `COGNOM` VARCHAR(45) NULL,
  `NOM` VARCHAR(45) NULL,
  `ADRECA` VARCHAR(100) NULL,
  `TELEFON` INT(9) NULL,
  `VIP` INT NULL,
  PRIMARY KEY (`DNI`));


-- -----------------------------------------------------
-- Table `MER4`.`Tipus_Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Tipus_Polissa` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NOM` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `MER4`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Vendedor` (
  `DNI` VARCHAR(9) NOT NULL,
  `NOM` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `Telefono` INT(9) NULL,
  PRIMARY KEY (`DNI`));


-- -----------------------------------------------------
-- Table `MER4`.`Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Polissa` (
  `NUM_POLISSA` INT(10) NOT NULL,
  `PREU_ANUAL` INT NULL,
  `TIPUS_PAGAMENT` VARCHAR(45) NULL,
  `DATA_CONTRACIO` DATE NULL,
  `Client_DNI` VARCHAR(9) NOT NULL,
  `Tipus_Polissa_ID` INT NOT NULL,
  `Vendedor_DNI` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`NUM_POLISSA`),
  INDEX `fk_Polissa_Client_idx` (`Client_DNI` ASC) VISIBLE,
  INDEX `fk_Polissa_Tipus_Polissa1_idx` (`Tipus_Polissa_ID` ASC) VISIBLE,
  INDEX `fk_Polissa_Vendedor1_idx` (`Vendedor_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Polissa_Client`
    FOREIGN KEY (`Client_DNI`)
    REFERENCES `MER4`.`Client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Tipus_Polissa1`
    FOREIGN KEY (`Tipus_Polissa_ID`)
    REFERENCES `MER4`.`Tipus_Polissa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Vendedor1`
    FOREIGN KEY (`Vendedor_DNI`)
    REFERENCES `MER4`.`Vendedor` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
