-- 1. Agregar restricciones NOT NULL

ALTER TABLE proyecto ALTER COLUMN id_proyecto SET NOT NULL;
ALTER TABLE proyecto ALTER COLUMN id_tipo SET NOT NULL;
ALTER TABLE proyecto ALTER COLUMN titulo SET NOT NULL;
ALTER TABLE proyecto ALTER COLUMN descripcion SET NOT NULL;
ALTER TABLE proyecto ALTER COLUMN fecha_inscripcion SET NOT NULL;

ALTER TABLE evaluacion ALTER COLUMN id_evaluacion SET NOT NULL;
ALTER TABLE evaluacion ALTER COLUMN puntaje SET NOT NULL;
ALTER TABLE evaluacion ALTER COLUMN comentario SET NOT NULL;
ALTER TABLE evaluacion ALTER COLUMN id_proyecto SET NOT NULL;
ALTER TABLE evaluacion ALTER COLUMN id_usuario SET NOT NULL;

ALTER TABLE asignatura ALTER COLUMN id_asignatura SET NOT NULL;
ALTER TABLE asignatura ALTER COLUMN id_programa SET NOT NULL;
ALTER TABLE asignatura ALTER COLUMN departamento SET NOT NULL;
ALTER TABLE asignatura ALTER COLUMN nombre SET NOT NULL;
ALTER TABLE asignatura ALTER COLUMN nivel_estudio SET NOT NULL;
ALTER TABLE asignatura ALTER COLUMN nivel_formacion SET NOT NULL;
ALTER TABLE asignatura ALTER COLUMN ciencias SET NOT NULL;
ALTER TABLE asignatura ALTER COLUMN modalidad SET NOT NULL;

ALTER TABLE era ALTER COLUMN id_era SET NOT NULL;
ALTER TABLE era ALTER COLUMN id_asignatura SET NOT NULL;
ALTER TABLE era ALTER COLUMN descripcion SET NOT NULL;

ALTER TABLE curso ALTER COLUMN id_curso SET NOT NULL;
ALTER TABLE curso ALTER COLUMN id_asignatura SET NOT NULL;
ALTER TABLE curso ALTER COLUMN id_profesor SET NOT NULL;
ALTER TABLE curso ALTER COLUMN numero_grupo SET NOT NULL;

ALTER TABLE programa_academico ALTER COLUMN id_programa SET NOT NULL;
ALTER TABLE programa_academico ALTER COLUMN nombre_programa SET NOT NULL;
ALTER TABLE programa_academico ALTER COLUMN facultad SET NOT NULL;

ALTER TABLE tipo_proyecto ALTER COLUMN id_tipo_proyecto SET NOT NULL;
ALTER TABLE tipo_proyecto ALTER COLUMN tipo_proyecto SET NOT NULL;

ALTER TABLE entregable ALTER COLUMN id_entregable SET NOT NULL;
ALTER TABLE entregable ALTER COLUMN id_tipo_entregable SET NOT NULL;
ALTER TABLE entregable ALTER COLUMN descripcion SET NOT NULL;

ALTER TABLE tipo_entregable ALTER COLUMN id_tipo_entregable SET NOT NULL;
ALTER TABLE tipo_entregable ALTER COLUMN tipo_entregable SET NOT NULL;

ALTER TABLE linea_de_investigacion ALTER COLUMN id_linea SET NOT NULL;
ALTER TABLE linea_de_investigacion ALTER COLUMN linea_investigacion SET NOT NULL;

ALTER TABLE profesor ALTER COLUMN id_profesor SET NOT NULL;
ALTER TABLE profesor ALTER COLUMN nombre SET NOT NULL;
ALTER TABLE profesor ALTER COLUMN apellido SET NOT NULL;
ALTER TABLE profesor ALTER COLUMN id_usuario SET NOT NULL;

ALTER TABLE estudiante ALTER COLUMN id_estudiante SET NOT NULL;
ALTER TABLE estudiante ALTER COLUMN nombre SET NOT NULL;
ALTER TABLE estudiante ALTER COLUMN apellido SET NOT NULL;
ALTER TABLE estudiante ALTER COLUMN id_usuario SET NOT NULL;
ALTER TABLE estudiante ALTER COLUMN id_programa SET NOT NULL;

ALTER TABLE usuario ALTER COLUMN id_usuario SET NOT NULL;
ALTER TABLE usuario ALTER COLUMN correo SET NOT NULL;
ALTER TABLE usuario ALTER COLUMN contrasena SET NOT NULL;

ALTER TABLE rol ALTER COLUMN id_rol SET NOT NULL;
ALTER TABLE rol ALTER COLUMN rol SET NOT NULL;
ALTER TABLE rol ALTER COLUMN id_permiso SET NOT NULL;

ALTER TABLE permiso ALTER COLUMN id_permiso SET NOT NULL;
ALTER TABLE permiso ALTER COLUMN crear SET NOT NULL;
ALTER TABLE permiso ALTER COLUMN leer SET NOT NULL;
ALTER TABLE permiso ALTER COLUMN actualizar SET NOT NULL;
ALTER TABLE permiso ALTER COLUMN borrar SET NOT NULL;
ALTER TABLE permiso ALTER COLUMN leer_nota SET NOT NULL;
ALTER TABLE permiso ALTER COLUMN actualizar_nota SET NOT NULL;

ALTER TABLE usuario_proyecto_rol ALTER COLUMN id_proyecto SET NOT NULL;
ALTER TABLE usuario_proyecto_rol ALTER COLUMN id_usuario SET NOT NULL;
ALTER TABLE usuario_proyecto_rol ALTER COLUMN id_rol SET NOT NULL;

ALTER TABLE curso_proyecto ALTER COLUMN id_curso SET NOT NULL;
ALTER TABLE curso_proyecto ALTER COLUMN id_proyecto SET NOT NULL;

ALTER TABLE era_proyecto ALTER COLUMN id_era SET NOT NULL;
ALTER TABLE era_proyecto ALTER COLUMN id_proyecto SET NOT NULL;

ALTER TABLE linea_investigacion_proyecto ALTER COLUMN id_linea SET NOT NULL;
ALTER TABLE linea_investigacion_proyecto ALTER COLUMN id_proyecto SET NOT NULL;

ALTER TABLE ira ALTER COLUMN id_ira SET NOT NULL;
ALTER TABLE ira ALTER COLUMN id_asignatura SET NOT NULL;

ALTER TABLE ira_proyecto ALTER COLUMN id_ira SET NOT NULL;
ALTER TABLE ira_proyecto ALTER COLUMN id_proyecto SET NOT NULL;

ALTER TABLE tipo_insumo ALTER COLUMN id_insumo SET NOT NULL;

ALTER TABLE prestamo_insumo ALTER COLUMN id_prestamo SET NOT NULL;
ALTER TABLE prestamo_insumo ALTER COLUMN id_insumo SET NOT NULL;
ALTER TABLE prestamo_insumo ALTER COLUMN id_proyecto SET NOT NULL;
ALTER TABLE prestamo_insumo ALTER COLUMN id_universidad SET NOT NULL;
ALTER TABLE prestamo_insumo ALTER COLUMN fecha_entrega SET NOT NULL;
ALTER TABLE prestamo_insumo ALTER COLUMN fecha_aprox_devolucion SET NOT NULL;

ALTER TABLE universidad ALTER COLUMN id_universidad SET NOT NULL;
ALTER TABLE universidad ALTER COLUMN id_municipio SET NOT NULL;
ALTER TABLE universidad ALTER COLUMN nombre SET NOT NULL;

ALTER TABLE universidad_profesor ALTER COLUMN id_universidad SET NOT NULL;
ALTER TABLE universidad_profesor ALTER COLUMN id_profesor SET NOT NULL;

ALTER TABLE universidad_estudiante ALTER COLUMN id_universidad SET NOT NULL;
ALTER TABLE universidad_estudiante ALTER COLUMN id_estudiante SET NOT NULL;

ALTER TABLE universidad_programa_academico ALTER COLUMN id_universidad SET NOT NULL;
ALTER TABLE universidad_programa_academico ALTER COLUMN id_programa SET NOT NULL;

ALTER TABLE rep ALTER COLUMN id_rep SET NOT NULL;
ALTER TABLE rep ALTER COLUMN id_proyecto SET NOT NULL;

ALTER TABLE rep_proyecto ALTER COLUMN id_rep SET NOT NULL;
ALTER TABLE rep_proyecto ALTER COLUMN id_proyecto SET NOT NULL;

ALTER TABLE invitado ALTER COLUMN id_invitado SET NOT NULL;
ALTER TABLE invitado ALTER COLUMN nombre SET NOT NULL;
ALTER TABLE invitado ALTER COLUMN apellido SET NOT NULL;
ALTER TABLE invitado ALTER COLUMN id_usuario SET NOT NULL;

ALTER TABLE municipio ALTER COLUMN id_municipio SET NOT NULL;
ALTER TABLE municipio ALTER COLUMN municipio SET NOT NULL;
ALTER TABLE municipio ALTER COLUMN id_region SET NOT NULL;

ALTER TABLE region ALTER COLUMN id_region SET NOT NULL;
ALTER TABLE region ALTER COLUMN region SET NOT NULL;
ALTER TABLE region ALTER COLUMN id_pais SET NOT NULL;

ALTER TABLE pais ALTER COLUMN id_pais SET NOT NULL;
ALTER TABLE pais ALTER COLUMN pais SET NOT NULL;

ALTER TABLE taller_transito ALTER COLUMN id_taller SET NOT NULL;
ALTER TABLE taller_transito ALTER COLUMN nombre SET NOT NULL;

ALTER TABLE taller_proyecto ALTER COLUMN id_proyecto SET NOT NULL;
ALTER TABLE taller_proyecto ALTER COLUMN id_taller SET NOT NULL;


-- 2. Agregar restricciones DEFAULT

ALTER TABLE evaluacion ALTER COLUMN puntaje SET DEFAULT 0;

ALTER TABLE usuario ALTER COLUMN contrasena SET DEFAULT '12345';

ALTER TABLE permiso ALTER COLUMN crear SET DEFAULT FALSE;
ALTER TABLE permiso ALTER COLUMN leer SET DEFAULT FALSE;
ALTER TABLE permiso ALTER COLUMN actualizar SET DEFAULT FALSE;
ALTER TABLE permiso ALTER COLUMN borrar SET DEFAULT FALSE;
ALTER TABLE permiso ALTER COLUMN leer_nota SET DEFAULT FALSE;
ALTER TABLE permiso ALTER COLUMN actualizar_nota SET DEFAULT FALSE;

ALTER TABLE prestamo_insumo ALTER COLUMN descripcion_estado SET DEFAULT 'Sin observaciones';


-- 3. Restricciones CHECK 

-- Evaluación: el puntaje debe estar entre 0 y 5
ALTER TABLE evaluacion ADD CONSTRAINT evaluacion_puntaje CHECK (puntaje >= 0 AND puntaje <= 5);

-- Usuario: el correo debe contener una arroba (@)
ALTER TABLE usuario ADD CONSTRAINT usuario_correo CHECK (correo LIKE '%@%');

-- Permiso: los campos booleanos deben ser 0 o 1
ALTER TABLE permiso ADD CONSTRAINT permiso_crear CHECK (crear IN (FALSE, TRUE));
ALTER TABLE permiso ADD CONSTRAINT permiso_leer CHECK (leer IN (FALSE, TRUE));
ALTER TABLE permiso ADD CONSTRAINT permiso_actualizar CHECK (actualizar IN (FALSE, TRUE));
ALTER TABLE permiso ADD CONSTRAINT permiso_borrar CHECK (borrar IN (FALSE, TRUE));
ALTER TABLE permiso ADD CONSTRAINT permiso_leer_nota CHECK (leer_nota IN (FALSE, TRUE));
ALTER TABLE permiso ADD CONSTRAINT permiso_actualizar_nota CHECK (actualizar_nota IN (FALSE, TRUE));

-- Asignatura: el nivel de estudio debe ser 'Pregrado' o 'Posgrado'
ALTER TABLE asignatura ADD CONSTRAINT asignatura_nivel_estudio CHECK (nivel_estudio IN ('Pregrado', 'Posgrado'));

-- Prestamo Insumo: la fecha de devolución aproximada debe ser después de la fecha de entrega
ALTER TABLE prestamo_insumo ADD CONSTRAINT prestamo_fechas CHECK (fecha_aprox_devolucion >= fecha_entrega);

