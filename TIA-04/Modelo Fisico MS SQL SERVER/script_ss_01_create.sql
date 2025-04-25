CREATE TABLE proyecto (
    id_proyecto BIGINT IDENTITY(1,1),
    id_tipo BIGINT,
    titulo VARCHAR(50),
    descripcion VARCHAR(650),
    fecha_inscripcion DATE
);

CREATE TABLE evaluacion (
    id_evaluacion BIGINT IDENTITY(1,1),
    puntaje DECIMAL(5,2),
    comentario VARCHAR(650),
    id_proyecto BIGINT,
    id_usuario BIGINT
);

CREATE TABLE asignatura (
    id_asignatura BIGINT IDENTITY(1,1),
    id_programa BIGINT,
    departamento VARCHAR(30),
    nombre VARCHAR(30),
    nivel_estudio VARCHAR(10),
    nivel_formacion VARCHAR(20),
    ciencias VARCHAR(20),
    modalidad VARCHAR(20)
);

CREATE TABLE era (
    id_era BIGINT IDENTITY(1,1),
    id_asignatura BIGINT,
    descripcion VARCHAR(650)
);

CREATE TABLE curso (
    id_curso BIGINT IDENTITY(1,1),
    id_asignatura BIGINT,
    id_profesor BIGINT,
    numero_grupo INT
);

CREATE TABLE programa_academico (
    id_programa BIGINT IDENTITY(1,1),
    nombre_programa VARCHAR(30),
    facultad VARCHAR(30)
);

CREATE TABLE tipo_proyecto (
    id_tipo_proyecto BIGINT IDENTITY(1,1),
    tipo_proyecto VARCHAR(8)
);

CREATE TABLE entregable (
    id_entregable BIGINT IDENTITY(1,1),
    id_tipo_entregable BIGINT,
    descripcion VARCHAR(650)
);

CREATE TABLE tipo_entregable (
    id_tipo_entregable BIGINT IDENTITY(1,1),
    tipo_entregable VARCHAR(30),
    descripcion VARCHAR(650)
);

CREATE TABLE linea_de_investigacion (
    id_linea BIGINT IDENTITY(1,1),
    linea_investigacion VARCHAR(30),
    descripcion VARCHAR(650)
);

CREATE TABLE profesor (
    id_profesor BIGINT IDENTITY(1,1),
    nombre VARCHAR(20),
    nombre_2 VARCHAR(20),
    apellido VARCHAR(20),
    apellido_2 VARCHAR(20),
    id_usuario BIGINT
);

CREATE TABLE estudiante (
    id_estudiante BIGINT IDENTITY(1,1),
    nombre VARCHAR(20),
    nombre_2 VARCHAR(20),
    apellido VARCHAR(20),
    apellido_2 VARCHAR(20),
    id_usuario BIGINT,
    id_programa BIGINT
);

CREATE TABLE usuario (
    id_usuario BIGINT IDENTITY(1,1),
    correo VARCHAR(100),
    contrasena VARCHAR(64)
);

CREATE TABLE rol (
    id_rol INT IDENTITY(1,1),
    rol VARCHAR(50),
    id_permiso INT
);

CREATE TABLE permiso (
    id_permiso INT IDENTITY(1,1),
    crear BIT DEFAULT 0,
    leer BIT DEFAULT 0,
    actualizar BIT DEFAULT 0,
    borrar BIT DEFAULT 0,
    leer_nota BIT DEFAULT 0,
    actualizar_nota BIT DEFAULT 0
);

CREATE TABLE usuario_proyecto_rol (
    id_proyecto BIGINT,
    id_usuario BIGINT,
    id_rol INT
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
    id_ira BIGINT IDENTITY(1,1),
    id_asignatura BIGINT,
    descripcion VARCHAR(650)
);

CREATE TABLE ira_proyecto (
    id_ira BIGINT,
    id_proyecto BIGINT
);

CREATE TABLE tipo_insumo (
    id_insumo BIGINT IDENTITY(1,1),
    tipo_insumo VARCHAR(30),
    valor BIGINT
);

CREATE TABLE prestamo_insumo (
    id_prestamo BIGINT IDENTITY(1,1),
    id_insumo BIGINT,
    id_proyecto BIGINT,
    id_universidad BIGINT,
    fecha_entrega DATE,
    fecha_aprox_devolucion DATE,
    fecha_devolucion DATE,
    descripcion_estado VARCHAR(64)
);

CREATE TABLE universidad (
    id_universidad BIGINT IDENTITY(1,1),
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
    id_rep BIGINT IDENTITY(1,1),
    id_proyecto BIGINT,
    descripcion VARCHAR(650)
);

CREATE TABLE rep_proyecto (
    id_rep BIGINT,
    id_proyecto BIGINT
);

CREATE TABLE invitado (
    id_invitado BIGINT IDENTITY(1,1),
    nombre VARCHAR(20),
    nombre_2 VARCHAR(20),
    apellido VARCHAR(20),
    apellido_2 VARCHAR(20),
    id_usuario BIGINT
);

CREATE TABLE municipio (
    id_municipio BIGINT IDENTITY(1,1),
    municipio VARCHAR(20),
    id_region BIGINT
);

CREATE TABLE region (
    id_region BIGINT IDENTITY(1,1),
    region VARCHAR(20),
    id_pais BIGINT
);

CREATE TABLE pais (
    id_pais BIGINT IDENTITY(1,1),
    pais VARCHAR(20)
);

CREATE TABLE taller_transito (
    id_taller BIGINT IDENTITY(1,1),
    nombre VARCHAR(20)
);

CREATE TABLE taller_proyecto (
    id_proyecto BIGINT,
    id_taller BIGINT
);
