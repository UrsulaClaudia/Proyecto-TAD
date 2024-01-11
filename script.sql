-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `bd_store` DEFAULT CHARACTER SET latin1 ;
USE `bd_store` ;

-- -----------------------------------------------------
-- Table `bd_store`.`Articulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_store`.`Producto` (
  `ProductID` INT(11) NOT NULL AUTO_INCREMENT,
  `NombreProducto` VARCHAR(25) NOT NULL,
  `Descripcion` VARCHAR(150) NOT NULL,
  `Precio` FLOAT(4) NOT NULL,
  `Stock` INT(4) NOT NULL,
  `FotoProducto` INT(255) NOT NULL,
  PRIMARY KEY (`ProductID`),
  UNIQUE INDEX `u01_Producto` (`NombreProducto` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1005
DEFAULT CHARACTER SET = latin1;

-- -----------------------------------------------------
-- Table `bd_store`.`Usuario`
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_store` DEFAULT CHARACTER SET latin1 ;
USE `bd_store` ;
CREATE TABLE IF NOT EXISTS `bd_store`.`Usuario` (
  `DNI` VARCHAR(25) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `User` VARCHAR(45) NOT NULL,
  `Contrasena` VARCHAR(45) NOT NULL,
  `Rol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

CREATE SCHEMA IF NOT EXISTS `bd_store` DEFAULT CHARACTER SET latin1 ;
USE `bd_store` ;
-- -----------------------------------------------------
-- Table `bd_store`.`Solicitante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_store`.`Solicitante` (
  `codigo_solicitante` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  `Telefono` VARCHAR(25) NOT NULL,
  `FotoProducto` MEDIUMBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`codigo_solicitante`),
  UNIQUE INDEX `u01_Solicitante` (`Email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 22000005
DEFAULT CHARACTER SET = latin1;

CREATE SCHEMA IF NOT EXISTS `bd_store` DEFAULT CHARACTER SET latin1 ;
USE `bd_store` ;
-- -----------------------------------------------------
-- Table `bd_store`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_store`.`Pedido` (
  `codigo_pedido` INT(11) NOT NULL AUTO_INCREMENT,
  `codigo_solicitante` INT(11) NOT NULL,
  `Estado` VARCHAR(25) NOT NULL,
  `Fecha_pedido` DATE NOT NULL,
  PRIMARY KEY (`codigo_pedido`),
  INDEX `fk02_solicitante_idx` (`codigo_solicitante` ASC) VISIBLE,
  CONSTRAINT `fk02_solicitante`
    FOREIGN KEY (`codigo_solicitante`)
    REFERENCES `bd_store`.`Solicitante` (`codigo_solicitante`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1029
DEFAULT CHARACTER SET = latin1;


CREATE SCHEMA IF NOT EXISTS `bd_store` DEFAULT CHARACTER SET latin1 ;
USE `bd_store` ;
-- -----------------------------------------------------
-- Table `bd_store`.`Devolucion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_store`.`Devolucion` (
  `codigo_devolucion` INT(11) NOT NULL AUTO_INCREMENT,
  `codigo_pedido` INT(11) NOT NULL,
  `Fecha_devolucion` DATE NOT NULL,
  `Detalles` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`codigo_devolucion`),
  INDEX `fk01_pedido_idx` (`codigo_pedido` ASC) VISIBLE,
  CONSTRAINT `fk01_pedido`
    FOREIGN KEY (`codigo_pedido`)
    REFERENCES `bd_store`.`Pedido` (`codigo_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1031
DEFAULT CHARACTER SET = latin1;

CREATE SCHEMA IF NOT EXISTS `bd_store` DEFAULT CHARACTER SET latin1 ;
USE `bd_store` ;
-- -----------------------------------------------------
-- Table `bd_store`.`Rel_Pedido_Articulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_store`.`Rel_Pedido_Articulo` (
  `codigo_pedido` INT(11) NOT NULL,
  `codigo_articulo` INT(11) NOT NULL,
  `Cantidad` INT(11) NOT NULL,
  INDEX `fk_cod_pedido_idx` (`codigo_pedido` ASC) VISIBLE,
  INDEX `fk_cod_articulo_idx` (`codigo_articulo` ASC) VISIBLE,
  CONSTRAINT `fk_cod_articulo`
    FOREIGN KEY (`codigo_articulo`)
    REFERENCES `bd_store`.`Producto` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cod_pedido`
    FOREIGN KEY (`codigo_pedido`)
    REFERENCES `bd_store`.`Pedido` (`codigo_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;





SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
