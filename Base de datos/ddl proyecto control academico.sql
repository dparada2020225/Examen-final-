DROP DATABASE IF EXISTS control_academico;
CREATE DATABASE  IF NOT EXISTS control_academico;
USE control_academico;

-- -----------------------------------------------------
-- Table alumno
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS alumno (
  carne VARCHAR(16) NOT NULL,
  apellidos VARCHAR(45) NULL,
  nombres VARCHAR(45) NULL,
  email VARCHAR(32) NULL,
  PRIMARY KEY (carne))
;


-- -----------------------------------------------------
-- Table Horario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Horario (
  horario_id INT NOT NULL auto_increment,
  horario_final TIME NOT NULL,
  horario_inicio TIME NOT NULL,
  PRIMARY KEY (horario_id))
;


-- -----------------------------------------------------
-- Table instructor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS instructor (
  instructor_id INT NOT NULL auto_increment,
  apellidos VARCHAR(45) NULL,
  nombres VARCHAR(45) NULL,
  direccion VARCHAR(45) NULL,
  telefono VARCHAR(45) NULL,
  PRIMARY KEY (instructor_id))
;


-- -----------------------------------------------------
-- Table Carrera_tecnica
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Carrera_tecnica (
  codigo_carrera VARCHAR(128) NOT NULL,
  nombres VARCHAR(45) NULL,
  PRIMARY KEY (codigo_carrera))
;


-- -----------------------------------------------------
-- Table Salon
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Salon (
  salon_id INT NOT NULL auto_increment,
  capacidad INT NULL,
  descripcion VARCHAR(255) NULL,
  nombre_salon VARCHAR(255) NULL,
  PRIMARY KEY (salon_id))
;


-- -----------------------------------------------------
-- Table Curso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Curso (
  curso_id INT NOT NULL auto_increment,
  ciclo INT NULL,
  cupo_maximo INT NULL,
  cupo_minimo INT NULL,
  descipcion VARCHAR(255) NULL,
  codigo_carrera VARCHAR(128) NOT NULL,
  horario_id INT NOT NULL,
  instructor_id INT NOT NULL,
  salon_id INT NOT NULL,
  PRIMARY KEY (curso_id),
  CONSTRAINT fk_Curso_Horario
    FOREIGN KEY (horario_id)
    REFERENCES Horario (horario_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
  CONSTRAINT fk_Curso_Salon
    FOREIGN KEY (salon_id)
    REFERENCES Salon (salon_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
  CONSTRAINT fk_Curso_Carrera_tecnica
    FOREIGN KEY (codigo_carrera)
    REFERENCES Carrera_tecnica (codigo_carrera)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
  CONSTRAINT fk_Curso_instructor
    FOREIGN KEY (instructor_id)
    REFERENCES instructor (instructor_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table Asignacion_alumno
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Asignacion_alumno (
  asignacion_id INT NOT NULL auto_increment,
  fecha_asignacion DATETIME NULL,
  carne VARCHAR(16) NOT NULL,
  curso_id INT NOT NULL,
  PRIMARY KEY (asignacion_id),
  CONSTRAINT fk_Asignacion_alumno_alumno
    FOREIGN KEY (carne)
    REFERENCES alumno (carne)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
  CONSTRAINT fk_Asignacion_alumno_Curso
    FOREIGN KEY (curso_id)
    REFERENCES Curso (curso_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE)
;

-- -----------------------------------------------------
-- Table Nota
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Nota (
  id_nota INT NOT NULL auto_increment,
  nombre_actividad VARCHAR(45) ,
  nota_actividad int NOT NULL,
  fecha_entrega DATE NULL,
  asignacion_id INT NOT NULL,
  PRIMARY KEY (id_nota),
  CONSTRAINT fk_Nota_Asignacion_alumno
    FOREIGN KEY (asignacion_id)
    REFERENCES Asignacion_alumno (asignacion_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE)
;
