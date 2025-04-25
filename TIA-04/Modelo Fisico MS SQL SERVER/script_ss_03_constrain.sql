-- Agregar restricciones NOT NULL
ALTER TABLE proyecto 
    ALTER COLUMN id_tipo BIGINT NOT NULL;
ALTER TABLE proyecto 
    ALTER COLUMN titulo VARCHAR(50) NOT NULL;
ALTER TABLE proyecto 
    ALTER COLUMN descripcion VARCHAR(650) NOT NULL;
ALTER TABLE proyecto 
    ALTER COLUMN fecha_inscripcion DATE NOT NULL;

ALTER TABLE evaluacion 
    ALTER COLUMN puntaje DECIMAL(5,2) NOT NULL;
ALTER TABLE evaluacion 
    ALTER COLUMN comentario VARCHAR(650) NOT NULL;
ALTER TABLE evaluacion 
    ALTER COLUMN id_proyecto BIGINT NOT NULL;
ALTER TABLE evaluacion 
    ALTER COLUMN id_usuario BIGINT NOT NULL;

ALTER TABLE asignatura 
    ALTER COLUMN id_programa BIGINT NOT NULL;
ALTER TABLE asignatura 
    ALTER COLUMN departamento VARCHAR(30) NOT NULL;
ALTER TABLE asignatura 
    ALTER COLUMN nombre VARCHAR(30) NOT NULL;
ALTER TABLE asignatura 
    ALTER COLUMN nivel_estudio VARCHAR(10) NOT NULL;
ALTER TABLE asignatura 
    ALTER COLUMN nivel_formacion VARCHAR(20) NOT NULL;
ALTER TABLE asignatura 
    ALTER COLUMN ciencias VARCHAR(20) NOT NULL;
ALTER TABLE asignatura 
    ALTER COLUMN modalidad VARCHAR(20) NOT NULL;

ALTER TABLE usuario 
    ALTER COLUMN correo VARCHAR(100) NOT NULL;
ALTER TABLE usuario 
    ALTER COLUMN contrasena VARCHAR(64) NOT NULL;

--restricciones CHECK
ALTER TABLE evaluacion 
    ADD CONSTRAINT chk_puntaje CHECK (puntaje BETWEEN 0 AND 100);

ALTER TABLE prestamo_insumo 
    ADD CONSTRAINT chk_fecha CHECK (fecha_devolucion >= fecha_entrega);

ALTER TABLE permiso 
    ADD CONSTRAINT chk_booleanos CHECK (crear IN (0, 1) 
                                        AND leer IN (0, 1) 
                                        AND actualizar IN (0, 1) 
                                        AND borrar IN (0, 1));

--default
ALTER TABLE usuario 
    ADD CONSTRAINT df_contrasena DEFAULT '12345' FOR contrasena;

ALTER TABLE permiso 
    ADD CONSTRAINT df_crear DEFAULT 0 FOR crear;
ALTER TABLE permiso 
    ADD CONSTRAINT df_leer DEFAULT 0 FOR leer;
ALTER TABLE permiso 
    ADD CONSTRAINT df_actualizar DEFAULT 0 FOR actualizar;
ALTER TABLE permiso 
    ADD CONSTRAINT df_borrar DEFAULT 0 FOR borrar;

ALTER TABLE prestamo_insumo 
    ADD CONSTRAINT df_descripcion_estado DEFAULT 'Sin observaciones' FOR descripcion_estado;
