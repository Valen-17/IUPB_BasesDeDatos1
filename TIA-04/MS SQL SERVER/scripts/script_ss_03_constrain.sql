-- Constrain
-- 1. RESTRICCIONES NOT NULL
ALTER TABLE proyecto ALTER COLUMN id_proyecto BIGINT NOT NULL
ALTER TABLE proyecto ALTER COLUMN id_tipo BIGINT NOT NULL
ALTER TABLE proyecto ALTER COLUMN titulo VARCHAR(50) NOT NULL
ALTER TABLE proyecto ALTER COLUMN descripcion VARCHAR(255) NOT NULL
ALTER TABLE proyecto ALTER COLUMN fecha_inscripcion DATE NOT NULL

ALTER TABLE evaluacion ALTER COLUMN id_evaluacion BIGINT NOT NULL
ALTER TABLE evaluacion ALTER COLUMN puntaje DECIMAL(5,2) NOT NULL 
ALTER TABLE evaluacion ALTER COLUMN comentario VARCHAR(255) NOT NULL
ALTER TABLE evaluacion ALTER COLUMN id_proyecto BIGINT NOT NULL
ALTER TABLE evaluacion ALTER COLUMN id_usuario BIGINT NOT NULL

ALTER TABLE asignatura ALTER COLUMN id_asignatura BIGINT NOT NULL
ALTER TABLE asignatura ALTER COLUMN id_programa BIGINT NOT NULL
ALTER TABLE asignatura ALTER COLUMN departamento VARCHAR(30) NOT NULL
ALTER TABLE asignatura ALTER COLUMN nombre VARCHAR(30) NOT NULL
ALTER TABLE asignatura ALTER COLUMN nivel_estudio VARCHAR(10) NOT NULL
ALTER TABLE asignatura ALTER COLUMN nivel_formacion VARCHAR(20) NOT NULL
ALTER TABLE asignatura ALTER COLUMN ciencias VARCHAR(20) NOT NULL
ALTER TABLE asignatura ALTER COLUMN modalidad VARCHAR(20) NOT NULL

ALTER TABLE era ALTER COLUMN id_era BIGINT NOT NULL
ALTER TABLE era ALTER COLUMN id_asignatura BIGINT NOT NULL
ALTER TABLE era ALTER COLUMN descripcion VARCHAR(255) NOT NULL

ALTER TABLE curso ALTER COLUMN id_curso BIGINT NOT NULL
ALTER TABLE curso ALTER COLUMN id_asignatura BIGINT NOT NULL
ALTER TABLE curso ALTER COLUMN id_profesor BIGINT NOT NULL
ALTER TABLE curso ALTER COLUMN numero_grupo INT NOT NULL

ALTER TABLE programa_academico ALTER COLUMN id_programa BIGINT NOT NULL
ALTER TABLE programa_academico ALTER COLUMN nombre_programa VARCHAR(30) NOT NULL
ALTER TABLE programa_academico ALTER COLUMN facultad VARCHAR(30) NOT NULL

ALTER TABLE tipo_proyecto ALTER COLUMN id_tipo_proyecto BIGINT NOT NULL
ALTER TABLE tipo_proyecto ALTER COLUMN tipo_proyecto VARCHAR(8) NOT NULL

ALTER TABLE entregable ALTER COLUMN id_entregable BIGINT NOT NULL
ALTER TABLE entregable ALTER COLUMN id_tipo_entregable BIGINT NOT NULL
ALTER TABLE entregable ALTER COLUMN descripcion VARCHAR(255) NOT NULL

ALTER TABLE tipo_entregable ALTER COLUMN id_tipo_entregable BIGINT NOT NULL
ALTER TABLE tipo_entregable ALTER COLUMN tipo_entregable VARCHAR(30) NOT NULL

ALTER TABLE linea_de_investigacion ALTER COLUMN id_linea BIGINT NOT NULL
ALTER TABLE linea_de_investigacion ALTER COLUMN linea_investigacion VARCHAR(30) NOT NULL

ALTER TABLE profesor ALTER COLUMN id_profesor BIGINT NOT NULL
ALTER TABLE profesor ALTER COLUMN nombre VARCHAR(20) NOT NULL
ALTER TABLE profesor ALTER COLUMN apellido VARCHAR(20) NOT NULL
ALTER TABLE profesor ALTER COLUMN id_usuario BIGINT NOT NULL

ALTER TABLE estudiante ALTER COLUMN id_estudiante BIGINT NOT NULL
ALTER TABLE estudiante ALTER COLUMN nombre VARCHAR(20) NOT NULL
ALTER TABLE estudiante ALTER COLUMN apellido VARCHAR(20) NOT NULL
ALTER TABLE estudiante ALTER COLUMN id_usuario BIGINT NOT NULL
ALTER TABLE estudiante ALTER COLUMN id_programa BIGINT NOT NULL

ALTER TABLE usuario ALTER COLUMN id_usuario BIGINT NOT NULL
ALTER TABLE usuario ALTER COLUMN correo VARCHAR(100) NOT NULL
ALTER TABLE usuario ALTER COLUMN contrasena VARCHAR(255) NOT NULL

ALTER TABLE rol ALTER COLUMN id_rol BIGINT NOT NULL
ALTER TABLE rol ALTER COLUMN rol VARCHAR(50) NOT NULL
ALTER TABLE rol ALTER COLUMN id_permiso BIGINT NOT NULL

ALTER TABLE permiso ALTER COLUMN id_permiso BIGINT NOT NULL
ALTER TABLE permiso ALTER COLUMN crear BIT NOT NULL
ALTER TABLE permiso ALTER COLUMN leer BIT NOT NULL 
ALTER TABLE permiso ALTER COLUMN actualizar BIT NOT NULL
ALTER TABLE permiso ALTER COLUMN borrar BIT NOT NULL 
ALTER TABLE permiso ALTER COLUMN leer_nota BIT NOT NULL 
ALTER TABLE permiso ALTER COLUMN actualizar_nota BIT NOT NULL

ALTER TABLE usuario_proyecto_rol ALTER COLUMN id_proyecto BIGINT NOT NULL
ALTER TABLE usuario_proyecto_rol ALTER COLUMN id_usuario BIGINT NOT NULL
ALTER TABLE usuario_proyecto_rol ALTER COLUMN id_rol BIGINT NOT NULL

ALTER TABLE curso_proyecto ALTER COLUMN id_curso BIGINT NOT NULL
ALTER TABLE curso_proyecto ALTER COLUMN id_proyecto BIGINT NOT NULL

ALTER TABLE era_proyecto ALTER COLUMN id_era BIGINT NOT NULL
ALTER TABLE era_proyecto ALTER COLUMN id_proyecto BIGINT NOT NULL

ALTER TABLE linea_investigacion_proyecto ALTER COLUMN id_linea BIGINT NOT NULL
ALTER TABLE linea_investigacion_proyecto ALTER COLUMN id_proyecto BIGINT NOT NULL

ALTER TABLE ira ALTER COLUMN id_ira BIGINT NOT NULL
ALTER TABLE ira ALTER COLUMN id_asignatura BIGINT NOT NULL

ALTER TABLE ira_proyecto ALTER COLUMN id_ira BIGINT NOT NULL
ALTER TABLE ira_proyecto ALTER COLUMN id_proyecto BIGINT NOT NULL

ALTER TABLE tipo_insumo ALTER COLUMN id_insumo BIGINT NOT NULL

ALTER TABLE prestamo_insumo ALTER COLUMN id_prestamo BIGINT NOT NULL
ALTER TABLE prestamo_insumo ALTER COLUMN id_insumo BIGINT NOT NULL
ALTER TABLE prestamo_insumo ALTER COLUMN id_proyecto BIGINT NOT NULL
ALTER TABLE prestamo_insumo ALTER COLUMN id_universidad BIGINT NOT NULL
ALTER TABLE prestamo_insumo ALTER COLUMN fecha_entrega DATE NOT NULL
ALTER TABLE prestamo_insumo ALTER COLUMN fecha_aprox_devolucion DATE NOT NULL

ALTER TABLE universidad ALTER COLUMN id_universidad BIGINT NOT NULL
ALTER TABLE universidad ALTER COLUMN id_municipio BIGINT NOT NULL
ALTER TABLE universidad ALTER COLUMN nombre VARCHAR(30) NOT NULL

ALTER TABLE universidad_profesor ALTER COLUMN id_universidad BIGINT NOT NULL
ALTER TABLE universidad_profesor ALTER COLUMN id_profesor BIGINT NOT NULL

ALTER TABLE universidad_estudiante ALTER COLUMN id_universidad BIGINT NOT NULL
ALTER TABLE universidad_estudiante ALTER COLUMN id_estudiante BIGINT NOT NULL

ALTER TABLE universidad_programa_academico ALTER COLUMN id_universidad BIGINT NOT NULL
ALTER TABLE universidad_programa_academico ALTER COLUMN id_programa BIGINT NOT NULL

ALTER TABLE rep ALTER COLUMN id_rep BIGINT NOT NULL
ALTER TABLE rep ALTER COLUMN id_proyecto BIGINT NOT NULL

ALTER TABLE rep_proyecto ALTER COLUMN id_rep BIGINT NOT NULL
ALTER TABLE rep_proyecto ALTER COLUMN id_proyecto BIGINT NOT NULL

ALTER TABLE invitado ALTER COLUMN id_invitado BIGINT NOT NULL
ALTER TABLE invitado ALTER COLUMN nombre VARCHAR(20) NOT NULL
ALTER TABLE invitado ALTER COLUMN apellido VARCHAR(20) NOT NULL
ALTER TABLE invitado ALTER COLUMN id_usuario BIGINT NOT NULL

ALTER TABLE municipio ALTER COLUMN id_municipio BIGINT NOT NULL
ALTER TABLE municipio ALTER COLUMN municipio VARCHAR(20) NOT NULL
ALTER TABLE municipio ALTER COLUMN id_region BIGINT NOT NULL

ALTER TABLE region ALTER COLUMN id_region BIGINT NOT NULL
ALTER TABLE region ALTER COLUMN region VARCHAR(20) NOT NULL
ALTER TABLE region ALTER COLUMN id_pais BIGINT NOT NULL

ALTER TABLE pais ALTER COLUMN id_pais BIGINT NOT NULL
ALTER TABLE pais ALTER COLUMN pais VARCHAR(20) NOT NULL

ALTER TABLE taller_transito ALTER COLUMN id_taller BIGINT NOT NULL
ALTER TABLE taller_transito ALTER COLUMN nombre VARCHAR(20) NOT NULL

ALTER TABLE taller_proyecto ALTER COLUMN id_proyecto BIGINT NOT NULL
ALTER TABLE taller_proyecto ALTER COLUMN id_taller BIGINT NOT NULL

-- 2. RESTRICCIONES DEFAULT

ALTER TABLE evaluacion ADD CONSTRAINT DF_evaluacion_puntaje DEFAULT 0 FOR puntaje;

ALTER TABLE usuario ADD CONSTRAINT DF_usuario_contrasena DEFAULT '12345' FOR contrasena;

ALTER TABLE permiso ADD CONSTRAINT DF_permiso_crear DEFAULT 0 FOR crear;
ALTER TABLE permiso ADD CONSTRAINT DF_permiso_leer DEFAULT 0 FOR leer;
ALTER TABLE permiso ADD CONSTRAINT DF_permiso_actualizar DEFAULT 0 FOR actualizar;
ALTER TABLE permiso ADD CONSTRAINT DF_permiso_borrar DEFAULT 0 FOR borrar;
ALTER TABLE permiso ADD CONSTRAINT DF_permiso_leer_nota DEFAULT 0 FOR leer_nota;
ALTER TABLE permiso ADD CONSTRAINT DF_permiso_actualizar_nota DEFAULT 0 FOR actualizar_nota;

ALTER TABLE prestamo_insumo ADD CONSTRAINT DF_prestamo_descripcion_estado DEFAULT 'Sin observaciones' FOR descripcion_estado;
 
-- 3. RESTRICCIONES CHECK

ALTER TABLE evaluacion ADD CONSTRAINT evaluacion_puntaje CHECK (puntaje >= 0 AND puntaje <= 5);

-- Usuario: el correo debe contener una arroba (@)
ALTER TABLE usuario ADD CONSTRAINT usuario_correo CHECK (correo LIKE '@');

-- Permiso: los campos booleanos deben ser 0 o 1
ALTER TABLE permiso ADD CONSTRAINT permiso_crear CHECK (crear IN (0, 1));
ALTER TABLE permiso ADD CONSTRAINT permiso_leer CHECK (leer IN (0, 1));
ALTER TABLE permiso ADD CONSTRAINT permiso_actualizar CHECK (actualizar IN (0, 1));
ALTER TABLE permiso ADD CONSTRAINT permiso_borrar CHECK (borrar IN (0, 1));
ALTER TABLE permiso ADD CONSTRAINT permiso_leer_nota CHECK (leer_nota IN (0, 1));
ALTER TABLE permiso ADD CONSTRAINT permiso_actualizar_nota CHECK (actualizar_nota IN (0, 1));

ALTER TABLE asignatura ADD CONSTRAINT asignatura_nivel_estudio CHECK (nivel_estudio IN ('Pregrado', 'Posgrado'));

ALTER TABLE prestamo_insumo ADD CONSTRAINT prestamo_fechas CHECK (fecha_aprox_devolucion >= fecha_entrega);
