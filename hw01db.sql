-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hw01-1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hw01-1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hw01-1` DEFAULT CHARACTER SET utf8 ;
USE `hw01-1` ;

-- -----------------------------------------------------
-- Table `hw01-1`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hw01-1`.`client` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `adress` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hw01-1`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hw01-1`.`order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `number` INT NOT NULL,
  `clientid` INT NOT NULL,
  `date` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_client_idx` (`clientid` ASC) VISIBLE,
  CONSTRAINT `fk_order_client`
    FOREIGN KEY (`clientid`)
    REFERENCES `hw01-1`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hw01-1`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hw01-1`.`product` (
  `id` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  `stock` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hw01-1`.`orderItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hw01-1`.`orderItem` (
  `id` INT NOT NULL,
  `productid` INT NOT NULL,
  `orderid` INT NOT NULL,
  `amount` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orderItem_product_idx` (`productid` ASC) VISIBLE,
  INDEX `fk_orderItem_order_idx` (`orderid` ASC) VISIBLE,
  CONSTRAINT `fk_orderItem_product`
    FOREIGN KEY (`productid`)
    REFERENCES `hw01-1`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderItem_order`
    FOREIGN KEY (`orderid`)
    REFERENCES `hw01-1`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
