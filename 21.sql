

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


DROP SCHEMA IF EXISTS `donde_nelson` ;


CREATE SCHEMA IF NOT EXISTS `donde_nelson` DEFAULT CHARACTER SET utf8mb4 ;
USE `donde_nelson` ;


CREATE TABLE IF NOT EXISTS `donde_nelson`.`tipo_documento` (
  `ID_TipoDoc` INT(10) NOT NULL AUTO_INCREMENT,
  `Nombre_Tipodoc` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`ID_TipoDoc`),
  UNIQUE INDEX `Nombre_Tipodoc` (`Nombre_Tipodoc` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS `donde_nelson`.`personas` (
  `ID_personas` INT(10) NOT NULL AUTO_INCREMENT,
  `Nombre1` VARCHAR(15) NOT NULL,
  `Nombre2` VARCHAR(15) NULL DEFAULT NULL,
  `Apellido1` VARCHAR(15) NOT NULL,
  `Apellido2` VARCHAR(15) NULL DEFAULT NULL,
  `Telefono` INT(13) NOT NULL,
  `ID_TipoDoc` INT(10) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_personas`),
  INDEX `Tipo_Documento_Personas` (`ID_TipoDoc` ASC) VISIBLE,
  CONSTRAINT `Tipo_Documento_Personas`
    FOREIGN KEY (`ID_TipoDoc`)
    REFERENCES `donde_nelson`.`tipo_documento` (`ID_TipoDoc`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS `donde_nelson`.`administrador` (
  `ID_Administrador` INT(10) NOT NULL AUTO_INCREMENT,
  `ID_personas` INT(10) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Administrador`),
  INDEX `Administrador_Personas` (`ID_personas` ASC) VISIBLE,
  CONSTRAINT `Administrador_Personas`
    FOREIGN KEY (`ID_personas`)
    REFERENCES `donde_nelson`.`personas` (`ID_personas`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS `donde_nelson`.`categoria` (
  `ID_Categoria` INT(10) NOT NULL AUTO_INCREMENT,
  `Nombre_Categoria` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`ID_Categoria`),
  UNIQUE INDEX `Nombre_Categoria` (`Nombre_Categoria` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS `donde_nelson`.`cliente` (
  `ID_Cliente` INT(10) NOT NULL AUTO_INCREMENT,
  `ID_personas` INT(10) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Cliente`),
  INDEX `Cliente_Personas` (`ID_personas` ASC) VISIBLE,
  CONSTRAINT `Cliente_Personas`
    FOREIGN KEY (`ID_personas`)
    REFERENCES `donde_nelson`.`personas` (`ID_personas`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS `donde_nelson`.`equipo` (
  `ID_Equipo` INT(10) NOT NULL AUTO_INCREMENT,
  `ID_Cliente` INT(10) NULL DEFAULT NULL,
  `ID_Categoria` INT(10) NULL DEFAULT NULL,
  `Marca` VARCHAR(20) NULL DEFAULT NULL,
  `Num_Serie` INT(40) NULL DEFAULT NULL,
  `Modelo` VARCHAR(20) NOT NULL,
  `Precio` INT(7) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Equipo`),
  UNIQUE INDEX `Modelo` (`Modelo` ASC) VISIBLE,
  UNIQUE INDEX `Marca` (`Marca` ASC) VISIBLE,
  INDEX `FK_Cliente_Equipo` (`ID_Cliente` ASC) VISIBLE,
  INDEX `FK_Equipo_Categoria` (`ID_Categoria` ASC) VISIBLE,
  CONSTRAINT `FK_Cliente_Equipo`
    FOREIGN KEY (`ID_Cliente`)
    REFERENCES `donde_nelson`.`cliente` (`ID_Cliente`),
  CONSTRAINT `FK_Equipo_Categoria`
    FOREIGN KEY (`ID_Categoria`)
    REFERENCES `donde_nelson`.`categoria` (`ID_Categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS `donde_nelson`.`diagnostico` (
  `ID_Diagnostico` INT(10) NULL DEFAULT NULL,
  `Num_Diagnostico` INT(100) NULL DEFAULT NULL,
  `Descripcion_Diag` VARCHAR(200) NULL DEFAULT NULL,
  `ID_Administrador` INT(10) NULL DEFAULT NULL,
  `ID_Equipo` INT(10) NULL DEFAULT NULL,
  INDEX `Diagnostico_Admin` (`ID_Administrador` ASC) VISIBLE,
  INDEX `ID_Equipo` (`ID_Equipo` ASC) VISIBLE,
  CONSTRAINT `Diagnostico_Admin`
    FOREIGN KEY (`ID_Administrador`)
    REFERENCES `donde_nelson`.`administrador` (`ID_Administrador`),
  CONSTRAINT `ID_Equipo`
    FOREIGN KEY (`ID_Equipo`)
    REFERENCES `donde_nelson`.`equipo` (`ID_Equipo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS `donde_nelson`.`rol` (
  `ID_Rol` INT(10) NOT NULL AUTO_INCREMENT,
  `Nombre_Rol` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`ID_Rol`),
  UNIQUE INDEX `Nombre_Rol` (`Nombre_Rol` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS `donde_nelson`.`tecnico` (
  `ID_Tecnico` INT(10) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NULL DEFAULT NULL,
  `ID_personas` INT(10) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Tecnico`),
  INDEX `FK_Personas_Tecnico` (`ID_personas` ASC) VISIBLE,
  CONSTRAINT `FK_Personas_Tecnico`
    FOREIGN KEY (`ID_personas`)
    REFERENCES `donde_nelson`.`personas` (`ID_personas`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS `donde_nelson`.`soporte` (
  `ID_Soporte` INT(10) NOT NULL AUTO_INCREMENT,
  `FechaDeIngreso` INT(10) NOT NULL,
  `FechaDeSalida` INT(10) NULL DEFAULT NULL,
  `ID_Tecnico` INT(10) NULL DEFAULT NULL,
  `ID_Diagnostico` INT(10) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Soporte`),
  INDEX `Soporte_Personas` (`ID_Tecnico` ASC) VISIBLE,
  CONSTRAINT `Soporte_Personas`
    FOREIGN KEY (`ID_Tecnico`)
    REFERENCES `donde_nelson`.`tecnico` (`ID_Tecnico`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



CREATE TABLE IF NOT EXISTS `donde_nelson`.`usuario` (
  `ID_Usuario` INT(10) NOT NULL AUTO_INCREMENT,
  `Nombre_Usuario` VARCHAR(20) NOT NULL,
  `ID_personas` INT(10) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE INDEX `Nombre_Usuario` (`Nombre_Usuario` ASC) VISIBLE,
  INDEX `Personas_Usuario` (`ID_personas` ASC) VISIBLE,
  CONSTRAINT `Personas_Usuario`
    FOREIGN KEY (`ID_personas`)
    REFERENCES `donde_nelson`.`personas` (`ID_personas`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



CREATE TABLE IF NOT EXISTS `donde_nelson`.`usuario__rol` (
  `ID_Usuario` INT(10) NULL DEFAULT NULL,
  `ID_ROL` INT(10) NULL DEFAULT NULL,
  INDEX `Usuario_rol` (`ID_Usuario` ASC) VISIBLE,
  INDEX `Rol__Usuario` (`ID_ROL` ASC) VISIBLE,
  CONSTRAINT `Rol__Usuario`
    FOREIGN KEY (`ID_ROL`)
    REFERENCES `donde_nelson`.`rol` (`ID_Rol`),
  CONSTRAINT `Usuario_rol`
    FOREIGN KEY (`ID_Usuario`)
    REFERENCES `donde_nelson`.`usuario` (`ID_Usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
