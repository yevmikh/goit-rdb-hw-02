-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hw01
-- -------------------------------------A---------------

-- -----------------------------------------------------
-- Schema hw01
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hw01` DEFAULT CHARACTER SET utf8 ;
USE `hw01` ;

-- -----------------------------------------------------
-- Table `hw01`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hw01`.`client` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `adress` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hw01`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hw01`.`order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `number` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  `amount` INT NULL,
  `clientid` INT NOT NULL,
  `date` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_client_idx` (`clientid` ASC) VISIBLE,
  CONSTRAINT `fk_order_client`
    FOREIGN KEY (`clientid`)
    REFERENCES `hw01`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
