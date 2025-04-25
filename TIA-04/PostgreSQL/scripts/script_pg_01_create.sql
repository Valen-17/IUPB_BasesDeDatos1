-- Creación de las tablas para PostgreSQL sin claves ni restricciones
CREATE TABLE proyecto (
    id_proyecto SERIAL,
    id_tipo INT,
    titulo VARCHAR(50),
    descripcion TEXT,
    fecha_inscripcion DATE
);

CREATE TABLE evaluacion (
    id_evaluacion SERIAL,
    puntaje NUMERIC(5,2),
    comentario TEXT,
    id_proyecto INT,
    id_usuario INT
);

CREATE TABLE asignatura (
    id_asignatura SERIAL,
    id_programa INT,
    departamento VARCHAR(30),
    nombre VARCHAR(30),
    nivel_estudio VARCHAR(10),
    nivel_formacion VARCHAR(20),
    ciencias VARCHAR(20),
    modalidad VARCHAR(20)
);

CREATE TABLE era (
    id_era SERIAL,
    id_asignatura INT,
    descripcion TEXT
);

CREATE TABLE curso (
    id_curso SERIAL,
    id_asignatura INT,
    id_profesor INT,
    numero_grupo INT
);

CREATE TABLE programa_academico (
    id_programa SERIAL,
    nombre_programa VARCHAR(30),
    facultad VARCHAR(30)
);

CREATE TABLE tipo_proyecto (
    id_tipo_proyecto SERIAL,
    tipo_proyecto VARCHAR(8)
);

CREATE TABLE entregable (
    id_entregable SERIAL,
    id_tipo_entregable INT,
    descripcion TEXT
);

CREATE TABLE tipo_entregable (
    id_tipo_entregable SERIAL,
    tipo_entregable VARCHAR(30),
    descripcion TEXT
);

CREATE TABLE linea_de_investigacion (
    id_linea SERIAL,
    linea_investigacion VARCHAR(30),
    descripcion TEXT
);

CREATE TABLE linea_de_investigacion_proyecto (
    id_linea INT,
    id_proyecto INT
);

CREATE TABLE profesor (
    id_profesor SERIAL,
    nombre VARCHAR(20),
    nombre_2 VARCHAR(20),
    apellido VARCHAR(20),
    apellido_2 VARCHAR(20),
    id_usuario INT
);

CREATE TABLE estudiante (
    id_estudiante SERIAL,
    nombre VARCHAR(20),
    nombre_2 VARCHAR(20),
    apellido VARCHAR(20),
    apellido_2 VARCHAR(20),
    id_usuario INT,
    id_programa INT
);

CREATE TABLE usuario (
    id_usuario SERIAL,
    correo VARCHAR(100),
    contrasena TEXT
);

CREATE TABLE rol (
    id_rol SERIAL,
    rol VARCHAR(50),
    id_permiso INT
);

CREATE TABLE permiso (
    id_permiso SERIAL,
    crear BOOLEAN DEFAULT FALSE,
    leer BOOLEAN DEFAULT FALSE,
    actualizar BOOLEAN DEFAULT FALSE,
    borrar BOOLEAN DEFAULT FALSE,
    leer_nota BOOLEAN DEFAULT FALSE,
    actualizar_nota BOOLEAN DEFAULT FALSE
);

CREATE TABLE usuario_proyecto_rol (
    id_proyecto INT,
    id_usuario INT,
    id_rol INT
);

CREATE TABLE curso_proyecto (
    id_curso INT,
    id_proyecto INT
);

CREATE TABLE era_proyecto (
    id_era INT,
    id_proyecto INT
);

CREATE TABLE linea_investigacion_proyecto (
    id_linea INT,
    id_proyecto INT
);

CREATE TABLE ira (
    id_ira SERIAL,
    id_asignatura INT,
    descripcion TEXT
);

CREATE TABLE ira_proyecto (
    id_ira INT,
    id_proyecto INT
);

CREATE TABLE tipo_insumo (
    id_insumo SERIAL,
    tipo_insumo VARCHAR(30),
    valor INT
);

CREATE TABLE prestamo_insumo (
    id_prestamo SERIAL,
    id_insumo INT,
    id_proyecto INT,
    id_universidad INT,
    fecha_entrega DATE,
    fecha_aprox_devolucion DATE,
    fecha_devolucion DATE,
    descripcion_estado VARCHAR(64)
);

CREATE TABLE universidad (
    id_universidad SERIAL,
    id_municipio VARCHAR(30),
    nombre VARCHAR(30),
    sede VARCHAR(30)
);

CREATE TABLE universidad_profesor (
    id_universidad INT,
    id_profesor INT
);

CREATE TABLE universidad_estudiante (
    id_universidad INT,
    id_estudiante INT
);

CREATE TABLE universidad_programa_academico (
    id_universidad INT,
    id_programa INT
);

CREATE TABLE rep (
    id_rep SERIAL,
    id_proyecto INT,
    descripcion TEXT
);

CREATE TABLE rep_proyecto (
    id_rep INT,
    id_proyecto INT
);

CREATE TABLE invitado (
    id_invitado SERIAL,
    nombre VARCHAR(20),
    nombre_2 VARCHAR(20),
    apellido VARCHAR(20),
    apellido_2 VARCHAR(20),
    id_usuario INT
);

CREATE TABLE municipio (
    id_municipio SERIAL,
    municipio VARCHAR(20),
    id_region VARCHAR(10)
);

CREATE TABLE region (
    id_region SERIAL,
    region VARCHAR(20),
    id_pais INT
);

CREATE TABLE pais (
    id_pais SERIAL,
    pais VARCHAR(20)
);

CREATE TABLE taller_transito (
    id_taller SERIAL,
    nombre VARCHAR(20)
);

CREATE TABLE taller_proyecto (
    id_proyecto INT,
    id_taller INT
);

