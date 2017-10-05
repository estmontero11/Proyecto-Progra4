-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema BaseTransporte
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BaseTransporte
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BaseTransporte` DEFAULT CHARACTER SET utf8 ;
USE `BaseTransporte` ;

-- -----------------------------------------------------
-- Table `BaseTransporte`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseTransporte`.`Usuario` (
  `idUsuario` VARCHAR(45) NOT NULL,
  `contrasena` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `correoElectronico` VARCHAR(45) NULL,
  `fechaNacimiento` DATE NULL,
  `direccion` VARCHAR(45) NULL,
  `telefonoTrabajo` VARCHAR(45) NULL,
  `ultimoUsuario` VARCHAR(45) NULL,
  `ultimaFecha` DATETIME NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BaseTransporte`.`Chofer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseTransporte`.`Chofer` (
  `idChofer` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `fechaNacimiento` DATE NULL,
  `fechaVencimiento` DATE NULL,
  `tipoLicencia` VARCHAR(45) NULL,
  `estado` TINYINT NULL,
  `esClienteTransportista` TINYINT NULL,
  `ultimoUsuario` VARCHAR(45) NULL,
  `ultimaFecha` DATETIME NULL,
  PRIMARY KEY (`idChofer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BaseTransporte`.`Vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseTransporte`.`Vehiculo` (
  `idVehiculo` INT NOT NULL,
  `anno` INT NOT NULL,
  `modelo` VARCHAR(45) NULL,
  `placa` VARCHAR(45) NULL,
  `color` VARCHAR(45) NULL,
  `puntuacion` INT NOT NULL,
  `estado` TINYINT NULL,
  `ubicacionActual` VARCHAR(45) NULL,
  `idChofer` INT NOT NULL,
  `ultimoUsuario` VARCHAR(45) NULL,
  `ultimaFecha` DATETIME NULL,
  PRIMARY KEY (`idVehiculo`),
  INDEX `idChofer_idx` (`idChofer` ASC),
  CONSTRAINT `idChofer`
    FOREIGN KEY (`idChofer`)
    REFERENCES `BaseTransporte`.`Chofer` (`idChofer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BaseTransporte`.`Servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BaseTransporte`.`Servicio` (
  `idServicio` INT NOT NULL,
  `idUsuario` VARCHAR(45) NOT NULL,
  `idVehiculo` INT NOT NULL,
  `puntoLlegada` POINT NULL,
  `puntoSalida` POINT NULL,
  `horaLlegada` DATETIME NULL,
  `horaSalida` DATETIME NULL,
  `duracion` INT NOT NULL,
  `costo` FLOAT NULL,
  `idRetroalimentacion` INT NOT NULL,
  `fechaRealizado` DATE NULL,
  `puntuacion` INT NULL,
  `comentario` VARCHAR(45) NULL,
  `ultimoUsuario` VARCHAR(45) NULL,
  `ultimaFecha` DATETIME NULL,
  PRIMARY KEY (`idServicio`),
  INDEX `idUsuario_idx` (`idUsuario` ASC),
  INDEX `idVehiculo_idx` (`idVehiculo` ASC),
  CONSTRAINT `idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `BaseTransporte`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idVehiculo`
    FOREIGN KEY (`idVehiculo`)
    REFERENCES `BaseTransporte`.`Vehiculo` (`idVehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
