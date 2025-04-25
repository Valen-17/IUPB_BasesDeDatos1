-- 1. Agregar 'NOT NULL' y 'DEFAULT' 


-- TABLA: proyecto
ALTER TABLE proyecto
MODIFY id_proyecto BIGINT NOT NULL,
MODIFY id_tipo BIGINT NOT NULL,
MODIFY titulo VARCHAR(50) NOT NULL,
MODIFY descripcion TEXT NOT NULL,
MODIFY fecha_inscripcion DATE NOT NULL;

-- TABLA: evaluacion
ALTER TABLE evaluacion
MODIFY id_evaluacion BIGINT NOT NULL,
MODIFY puntaje DECIMAL(5,2) NOT NULL DEFAULT 0,
MODIFY comentario TEXT NOT NULL,
MODIFY id_proyecto BIGINT NOT NULL,
MODIFY id_usuario BIGINT NOT NULL;

-- TABLA: asignatura
ALTER TABLE asignatura
MODIFY id_asignatura BIGINT NOT NULL,
MODIFY id_programa BIGINT NOT NULL,
MODIFY departamento VARCHAR(30) NOT NULL,
MODIFY nombre VARCHAR(30) NOT NULL,
MODIFY nivel_estudio VARCHAR(10) NOT NULL,
MODIFY nivel_formacion VARCHAR(20) NOT NULL,
MODIFY ciencias VARCHAR(20) NOT NULL,
MODIFY modalidad VARCHAR(20) NOT NULL;

-- TABLA: era
ALTER TABLE era
MODIFY id_era BIGINT NOT NULL,
MODIFY id_asignatura BIGINT NOT NULL,
MODIFY descripcion TEXT NOT NULL;

-- TABLA: curso
ALTER TABLE curso
MODIFY id_curso BIGINT NOT NULL,
MODIFY id_asignatura BIGINT NOT NULL,
MODIFY id_profesor BIGINT NOT NULL,
MODIFY numero_grupo INT NOT NULL;

-- TABLA: programa_academico
ALTER TABLE programa_academico
MODIFY id_programa BIGINT NOT NULL,
MODIFY nombre_programa VARCHAR(30) NOT NULL,
MODIFY facultad VARCHAR(30) NOT NULL;

-- TABLA: tipo_proyecto
ALTER TABLE tipo_proyecto
MODIFY id_tipo_proyecto BIGINT NOT NULL,
MODIFY tipo_proyecto VARCHAR(8) NOT NULL;

-- TABLA: entregable
ALTER TABLE entregable
MODIFY id_entregable BIGINT NOT NULL,
MODIFY id_tipo_entregable BIGINT NOT NULL,
MODIFY descripcion TEXT NOT NULL;

-- TABLA: tipo_entregable
ALTER TABLE tipo_entregable
MODIFY id_tipo_entregable BIGINT NOT NULL,
MODIFY tipo_entregable VARCHAR(30) NOT NULL;

-- TABLA: linea_de_investigacion
ALTER TABLE linea_de_investigacion
MODIFY id_linea BIGINT NOT NULL,
MODIFY linea_investigacion VARCHAR(30) NOT NULL;

-- TABLA: profesor
ALTER TABLE profesor
MODIFY id_profesor BIGINT NOT NULL,
MODIFY nombre VARCHAR(20) NOT NULL,
MODIFY apellido VARCHAR(20) NOT NULL,
MODIFY id_usuario BIGINT NOT NULL;

-- TABLA: estudiante
ALTER TABLE estudiante
MODIFY id_estudiante BIGINT NOT NULL,
MODIFY nombre VARCHAR(20) NOT NULL,
MODIFY apellido VARCHAR(20) NOT NULL,
MODIFY id_usuario BIGINT NOT NULL,
MODIFY id_programa BIGINT NOT NULL;

-- TABLA: usuario
ALTER TABLE usuario
MODIFY id_usuario BIGINT NOT NULL,
MODIFY correo VARCHAR(100) NOT NULL,
MODIFY contrasena TEXT NOT NULL DEFAULT '12345';

-- TABLA: rol
ALTER TABLE rol
MODIFY id_rol BIGINT NOT NULL,
MODIFY rol VARCHAR(50) NOT NULL,
MODIFY id_permiso BIGINT NOT NULL;

-- TABLA: permiso
ALTER TABLE permiso
MODIFY id_permiso BIGINT NOT NULL,
MODIFY crear TINYINT(1) NOT NULL DEFAULT FALSE,
MODIFY leer TINYINT(1) NOT NULL DEFAULT FALSE,
MODIFY actualizar TINYINT(1) NOT NULL DEFAULT FALSE,
MODIFY borrar TINYINT(1) NOT NULL DEFAULT FALSE,
MODIFY leer_nota TINYINT(1) NOT NULL DEFAULT FALSE,
MODIFY actualizar_nota TINYINT(1) NOT NULL DEFAULT FALSE;

-- TABLA: usuario_proyecto_rol
ALTER TABLE usuario_proyecto_rol
MODIFY id_proyecto BIGINT NOT NULL,
MODIFY id_usuario BIGINT NOT NULL,
MODIFY id_rol BIGINT NOT NULL;

-- TABLA: curso_proyecto
ALTER TABLE curso_proyecto
MODIFY id_curso BIGINT NOT NULL,
MODIFY id_proyecto BIGINT NOT NULL;

-- TABLA: era_proyecto
ALTER TABLE era_proyecto
MODIFY id_era BIGINT NOT NULL,
MODIFY id_proyecto BIGINT NOT NULL;

-- TABLA: linea_investigacion_proyecto
ALTER TABLE linea_investigacion_proyecto
MODIFY id_linea BIGINT NOT NULL,
MODIFY id_proyecto BIGINT NOT NULL;

-- TABLA: ira
ALTER TABLE ira
MODIFY id_ira BIGINT NOT NULL,
MODIFY id_asignatura BIGINT NOT NULL;

-- TABLA: ira_proyecto
ALTER TABLE ira_proyecto
MODIFY id_ira BIGINT NOT NULL,
MODIFY id_proyecto BIGINT NOT NULL;

-- TABLA: tipo_insumo
ALTER TABLE tipo_insumo
MODIFY id_insumo BIGINT NOT NULL;

-- TABLA: prestamo_insumo
ALTER TABLE prestamo_insumo
MODIFY id_prestamo BIGINT NOT NULL,
MODIFY id_insumo BIGINT NOT NULL,
MODIFY id_proyecto BIGINT NOT NULL,
MODIFY id_universidad BIGINT NOT NULL,
MODIFY fecha_entrega DATE NOT NULL,
MODIFY fecha_aprox_devolucion DATE NOT NULL,
MODIFY descripcion_estado VARCHAR(64) DEFAULT 'Sin observaciones';

-- TABLA: universidad
ALTER TABLE universidad
MODIFY id_universidad BIGINT NOT NULL,
MODIFY id_municipio BIGINT NOT NULL,
MODIFY nombre VARCHAR(30) NOT NULL;

-- TABLA: universidad_profesor
ALTER TABLE universidad_profesor
MODIFY id_universidad BIGINT NOT NULL,
MODIFY id_profesor BIGINT NOT NULL;

-- TABLA: universidad_estudiante
ALTER TABLE universidad_estudiante
MODIFY id_universidad BIGINT NOT NULL,
MODIFY id_estudiante BIGINT NOT NULL;

-- TABLA: universidad_programa_academico
ALTER TABLE universidad_programa_academico
MODIFY id_universidad BIGINT NOT NULL,
MODIFY id_programa BIGINT NOT NULL;

-- TABLA: rep
ALTER TABLE rep
MODIFY id_rep BIGINT NOT NULL,
MODIFY id_proyecto BIGINT NOT NULL;

-- TABLA: rep_proyecto
ALTER TABLE rep_proyecto
MODIFY id_rep BIGINT NOT NULL,
MODIFY id_proyecto BIGINT NOT NULL;

-- TABLA: invitado
ALTER TABLE invitado
MODIFY id_invitado BIGINT NOT NULL,
MODIFY nombre VARCHAR(20) NOT NULL,
MODIFY apellido VARCHAR(20) NOT NULL,
MODIFY id_usuario BIGINT NOT NULL;

-- TABLA: municipio
ALTER TABLE municipio
MODIFY id_municipio BIGINT NOT NULL,
MODIFY municipio VARCHAR(20) NOT NULL,
MODIFY id_region BIGINT NOT NULL;

-- TABLA: region
ALTER TABLE region
MODIFY id_region BIGINT NOT NULL,
MODIFY region VARCHAR(20) NOT NULL,
MODIFY id_pais BIGINT NOT NULL;

-- TABLA: pais
ALTER TABLE pais
MODIFY id_pais BIGINT NOT NULL,
MODIFY pais VARCHAR(20) NOT NULL;

-- TABLA: taller_transito
ALTER TABLE taller_transito
MODIFY id_taller BIGINT NOT NULL,
MODIFY nombre VARCHAR(20) NOT NULL;

-- TABLA: taller_proyecto
ALTER TABLE taller_proyecto
MODIFY id_proyecto BIGINT NOT NULL,
MODIFY id_taller BIGINT NOT NULL;



-- 2. Agregar 'CHECK'

-- 'CHECK' para el puntaje en la tabla evaluación

DELIMITER //

CREATE TRIGGER trg_evaluacion_puntaje_before_insert
BEFORE INSERT ON evaluacion
FOR EACH ROW
BEGIN
  IF NEW.puntaje < 0 OR NEW.puntaje > 5 THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'El puntaje debe estar entre 0 y 5';
  END IF;
END;
//

DELIMITER ;


-- Usuario: el correo debe contener una arroba (@)
DELIMITER //

CREATE TRIGGER trg_usuario_correo_before_insert
BEFORE INSERT ON usuario
FOR EACH ROW
BEGIN
  IF NOT NEW.correo REGEXP '@' THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'El correo debe contener un "@"';
  END IF;
END;
//

DELIMITER ;


DELIMITER //

CREATE TRIGGER trg_usuario_correo_before_update
BEFORE UPDATE ON usuario
FOR EACH ROW
BEGIN
  IF NOT NEW.correo REGEXP '@' THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'El correo debe contener un "@"';
  END IF;
END;
//

DELIMITER ;


--Permiso: los campos booleanos deben ser 0 o 1
DELIMITER //

CREATE TRIGGER trg_permiso_crear_before_insert
BEFORE INSERT ON permiso
FOR EACH ROW
BEGIN
  IF NEW.crear NOT IN (0, 1) THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'El valor de "crear" debe ser 0 o 1';
  END IF;
END;
//

DELIMITER ;


DELIMITER //

CREATE TRIGGER trg_permiso_crear_before_update
BEFORE UPDATE ON permiso
FOR EACH ROW
BEGIN
  IF NEW.crear NOT IN (0, 1) THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'El valor de "crear" debe ser 0 o 1';
  END IF;
END;
//

DELIMITER ;


DELIMITER //

CREATE TRIGGER trg_permiso_leer_before_insert
BEFORE INSERT ON permiso
FOR EACH ROW
BEGIN
  IF NEW.leer NOT IN (0, 1) THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'El valor de "leer" debe ser 0 o 1';
  END IF;
END;
//

DELIMITER ;


DELIMITER //

CREATE TRIGGER trg_permiso_leer_before_update
BEFORE UPDATE ON permiso
FOR EACH ROW
BEGIN
  IF NEW.leer NOT IN (0, 1) THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'El valor de "leer" debe ser 0 o 1';
  END IF;
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER trg_permiso_actualizar_before_insert
BEFORE INSERT ON permiso
FOR EACH ROW
BEGIN
  IF NEW.actualizar NOT IN (0, 1) THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'El valor de "actualizar" debe ser 0 o 1';
  END IF;
END;
//

DELIMITER ;


DELIMITER //

CREATE TRIGGER trg_permiso_actualizar_before_update
BEFORE UPDATE ON permiso
FOR EACH ROW
BEGIN
  IF NEW.actualizar NOT IN (0, 1) THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'El valor de "actualizar" debe ser 0 o 1';
  END IF;
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER trg_permiso_borrar_before_insert
BEFORE INSERT ON permiso
FOR EACH ROW
BEGIN
  IF NEW.borrar NOT IN (0, 1) THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'El valor de "borrar" debe ser 0 o 1';
  END IF;
END;
//

DELIMITER ;


DELIMITER //

CREATE TRIGGER trg_permiso_borrar_before_update
BEFORE UPDATE ON permiso
FOR EACH ROW
BEGIN
  IF NEW.borrar NOT IN (0, 1) THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'El valor de "borrar" debe ser 0 o 1';
  END IF;
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER trg_permiso_leer_nota_before_insert
BEFORE INSERT ON permiso
FOR EACH ROW
BEGIN
  IF NEW.leer_nota NOT IN (0, 1) THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'El valor de "leer_nota" debe ser 0 o 1';
  END IF;
END;
//

DELIMITER ;


DELIMITER //

CREATE TRIGGER trg_permiso_leer_nota_before_update
BEFORE UPDATE ON permiso
FOR EACH ROW
BEGIN
  IF NEW.leer_nota NOT IN (0, 1) THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'El valor de "leer_nota" debe ser 0 o 1';
  END IF;
END;
//

DELIMITER ;


DELIMITER //

CREATE TRIGGER trg_permiso_actualizar_nota_before_insert
BEFORE INSERT ON permiso
FOR EACH ROW
BEGIN
  IF NEW.actualizar_nota NOT IN (0, 1) THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'El valor de "actualizar_nota" debe ser 0 o 1';
  END IF;
END;
//

DELIMITER ;


DELIMITER //

CREATE TRIGGER trg_permiso_actualizar_nota_before_update
BEFORE UPDATE ON permiso
FOR EACH ROW
BEGIN
  IF NEW.actualizar_nota NOT IN (0, 1) THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'El valor de "actualizar_nota" debe ser 0 o 1';
  END IF;
END;
//

DELIMITER ;


-- Asignatura: el nivel_estudio debe ser 'Pregrado' o 'Posgrado'

DELIMITER //

CREATE TRIGGER trg_asignatura_nivel_estudio_before_insert
BEFORE INSERT ON asignatura
FOR EACH ROW
BEGIN
  IF NEW.nivel_estudio NOT IN ('Pregrado', 'Posgrado') THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'El valor de "nivel_estudio" debe ser "Pregrado" o "Posgrado"';
  END IF;
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER trg_asignatura_nivel_estudio_before_update
BEFORE UPDATE ON asignatura
FOR EACH ROW
BEGIN
  IF NEW.nivel_estudio NOT IN ('Pregrado', 'Posgrado') THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'El valor de "nivel_estudio" debe ser "Pregrado" o "Posgrado"';
  END IF;
END;
//

DELIMITER ;


-- Prestamo_insumo: fecha_aprox_devolucion >= fecha_entrega

DELIMITER //

CREATE TRIGGER trg_prestamo_fechas_before_insert
BEFORE INSERT ON prestamo_insumo
FOR EACH ROW
BEGIN
  IF NEW.fecha_aprox_devolucion < NEW.fecha_entrega THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'La fecha de devolución debe ser igual o posterior a la fecha de entrega';
  END IF;
END;
//

DELIMITER ;


DELIMITER //

CREATE TRIGGER trg_prestamo_fechas_before_update
BEFORE UPDATE ON prestamo_insumo
FOR EACH ROW
BEGIN
  IF NEW.fecha_aprox_devolucion < NEW.fecha_entrega THEN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'La fecha de devolución debe ser igual o posterior a la fecha de entrega';
  END IF;
END;
//

DELIMITER ;
 

