--   1. RESTRICCIONES NOT NULL
ALTER TABLE proyecto 
    ALTER COLUMN id_tipo SET NOT NULL,
    ALTER COLUMN titulo SET NOT NULL,
    ALTER COLUMN descripcion SET NOT NULL,
    ALTER COLUMN fecha_inscripcion SET NOT NULL;

ALTER TABLE evaluacion 
    ALTER COLUMN puntaje SET NOT NULL,
    ALTER COLUMN comentario SET NOT NULL,
    ALTER COLUMN id_proyecto SET NOT NULL,
    ALTER COLUMN id_usuario SET NOT NULL;

ALTER TABLE asignatura 
    ALTER COLUMN id_programa SET NOT NULL,
    ALTER COLUMN departamento SET NOT NULL,
    ALTER COLUMN nombre SET NOT NULL,
    ALTER COLUMN nivel_estudio SET NOT NULL,
    ALTER COLUMN nivel_formacion SET NOT NULL,
    ALTER COLUMN ciencias SET NOT NULL,
    ALTER COLUMN modalidad SET NOT NULL;

ALTER TABLE usuario 
    ALTER COLUMN correo SET NOT NULL,
    ALTER COLUMN contrasena SET NOT NULL;

--     2. RESTRICCIONES CHECK
ALTER TABLE evaluacion 
    ADD CONSTRAINT chk_puntaje 
    CHECK (puntaje BETWEEN 0 AND 100);

ALTER TABLE prestamo_insumo 
    ADD CONSTRAINT chk_fecha 
    CHECK (fecha_devolucion >= fecha_entrega);

ALTER TABLE permiso 
    ADD CONSTRAINT chk_booleanos 
    CHECK (
        crear IN (0, 1) AND
        leer IN (0, 1) AND
        actualizar IN (0, 1) AND
        borrar IN (0, 1)
    );

--     3. VALORES POR DEFECTO
ALTER TABLE usuario 
    ALTER COLUMN contrasena 
    SET DEFAULT '12345';

ALTER TABLE permiso 
    ALTER COLUMN crear SET DEFAULT 0,
    ALTER COLUMN leer SET DEFAULT 0,
    ALTER COLUMN actualizar SET DEFAULT 0,
    ALTER COLUMN borrar SET DEFAULT 0;

ALTER TABLE prestamo_insumo 
    ALTER COLUMN descripcion_estado 
    SET DEFAULT 'Sin observaciones';
