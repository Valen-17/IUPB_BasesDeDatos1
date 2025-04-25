-- Creación de las tablas para MySQL sin claves ni restricciones
-- En phpMyAdmin no deja crear tablas si no hay PK definida para los campos que tienen "AUTO_INCREMENT"

CREATE TABLE proyecto (
    id_proyecto BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_tipo BIGINT,
    titulo VARCHAR(50),
    descripcion TEXT,
    fecha_inscripcion DATE
);

CREATE TABLE evaluacion (
    id_evaluacion BIGINT AUTO_INCREMENT PRIMARY KEY,
    puntaje DECIMAL(5,2),
    comentario TEXT,
    id_proyecto BIGINT,
    id_usuario BIGINT
);

CREATE TABLE asignatura (
    id_asignatura BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_programa BIGINT,
    departamento VARCHAR(30),
    nombre VARCHAR(30),
    nivel_estudio VARCHAR(10),
    nivel_formacion VARCHAR(20),
    ciencias VARCHAR(20),
    modalidad VARCHAR(20)
);

CREATE TABLE era (
    id_era BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_asignatura BIGINT,
    descripcion TEXT
);

CREATE TABLE curso (
    id_curso BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_asignatura BIGINT,
    id_profesor BIGINT,
    numero_grupo INT
);

CREATE TABLE programa_academico (
    id_programa BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre_programa VARCHAR(30),
    facultad VARCHAR(30)
);

CREATE TABLE tipo_proyecto (
    id_tipo_proyecto BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo_proyecto VARCHAR(8)
);

CREATE TABLE entregable (
    id_entregable BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_tipo_entregable BIGINT,
    descripcion TEXT
);

CREATE TABLE tipo_entregable (
    id_tipo_entregable BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo_entregable VARCHAR(30),
    descripcion TEXT
);

CREATE TABLE linea_de_investigacion (
    id_linea BIGINT AUTO_INCREMENT PRIMARY KEY,
    linea_investigacion VARCHAR(30),
    descripcion TEXT
);

CREATE TABLE profesor (
    id_profesor BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20),
    nombre_2 VARCHAR(20),
    apellido VARCHAR(20),
    apellido_2 VARCHAR(20),
    id_usuario BIGINT
);

CREATE TABLE estudiante (
    id_estudiante BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20),
    nombre_2 VARCHAR(20),
    apellido VARCHAR(20),
    apellido_2 VARCHAR(20),
    id_usuario BIGINT,
    id_programa BIGINT
);

CREATE TABLE usuario (
    id_usuario BIGINT AUTO_INCREMENT PRIMARY KEY,
    correo VARCHAR(100),
    contrasena TEXT
);

CREATE TABLE rol (
    id_rol BIGINT AUTO_INCREMENT PRIMARY KEY,
    rol VARCHAR(50),
    id_permiso BIGINT
);

CREATE TABLE permiso (
    id_permiso BIGINT AUTO_INCREMENT PRIMARY KEY,
    crear TINYINT(1),
    leer TINYINT(1),
    actualizar TINYINT(1),
    borrar TINYINT(1),
    leer_nota TINYINT(1),
    actualizar_nota TINYINT(1)
);

CREATE TABLE usuario_proyecto_rol (
    id_proyecto BIGINT,
    id_usuario BIGINT,
    id_rol BIGINT
);

CREATE TABLE curso_proyecto (
    id_curso BIGINT,
    id_proyecto BIGINT
);

CREATE TABLE era_proyecto (
    id_era BIGINT,
    id_proyecto BIGINT
);

CREATE TABLE linea_investigacion_proyecto (
    id_linea BIGINT,
    id_proyecto BIGINT
);

CREATE TABLE ira (
    id_ira BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_asignatura BIGINT,
    descripcion TEXT
);

CREATE TABLE ira_proyecto (
    id_ira BIGINT,
    id_proyecto BIGINT
);

CREATE TABLE tipo_insumo (
    id_insumo BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo_insumo VARCHAR(30),
    valor BIGINT
);

CREATE TABLE prestamo_insumo (
    id_prestamo BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_insumo BIGINT,
    id_proyecto BIGINT,
    id_universidad BIGINT,
    fecha_entrega DATE,
    fecha_aprox_devolucion DATE,
    fecha_devolucion DATE,
    descripcion_estado VARCHAR(64)
);

CREATE TABLE universidad (
    id_universidad BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_municipio BIGINT,
    nombre VARCHAR(30),
    sede VARCHAR(30)
);

CREATE TABLE universidad_profesor (
    id_universidad BIGINT,
    id_profesor BIGINT
);

CREATE TABLE universidad_estudiante (
    id_universidad BIGINT,
    id_estudiante BIGINT
);

CREATE TABLE universidad_programa_academico (
    id_universidad BIGINT,
    id_programa BIGINT
);

CREATE TABLE rep (
    id_rep BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_proyecto BIGINT,
    descripcion TEXT
);

CREATE TABLE rep_proyecto (
    id_rep BIGINT,
    id_proyecto BIGINT
);

CREATE TABLE invitado (
    id_invitado BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20),
    nombre_2 VARCHAR(20),
    apellido VARCHAR(20),
    apellido_2 VARCHAR(20),
    id_usuario BIGINT
);

CREATE TABLE municipio (
    id_municipio BIGINT AUTO_INCREMENT PRIMARY KEY,
    municipio VARCHAR(20),
    id_region BIGINT
);

CREATE TABLE region (
    id_region BIGINT AUTO_INCREMENT PRIMARY KEY,
    region VARCHAR(20),
    id_pais BIGINT
);

CREATE TABLE pais (
    id_pais BIGINT AUTO_INCREMENT PRIMARY KEY,
    pais VARCHAR(20)
);

CREATE TABLE taller_transito (
    id_taller BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20)
);

CREATE TABLE taller_proyecto (
    id_proyecto BIGINT,
    id_taller BIGINT 
);