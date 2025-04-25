-- 1. Agregar restricciones NOT NULL
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

-- 2. Agregar restricciones CHECK
ALTER TABLE evaluacion 
    ADD CONSTRAINT chk_puntaje CHECK (puntaje >= 0 AND puntaje <= 100);

ALTER TABLE prestamo_insumo 
    ADD CONSTRAINT chk_fecha CHECK (fecha_devolucion >= fecha_entrega);

ALTER TABLE permiso 
    ADD CONSTRAINT chk_booleanos CHECK (crear IN (TRUE, FALSE) 
                                        AND leer IN (TRUE, FALSE) 
                                        AND actualizar IN (TRUE, FALSE) 
                                        AND borrar IN (TRUE, FALSE));

-- 3. Agregar valores por defecto DEFAULT
ALTER TABLE usuario 
    ALTER COLUMN contrasena SET DEFAULT '12345';

ALTER TABLE permiso 
    ALTER COLUMN crear SET DEFAULT FALSE,
    ALTER COLUMN leer SET DEFAULT FALSE,
    ALTER COLUMN actualizar SET DEFAULT FALSE,
    ALTER COLUMN borrar SET DEFAULT FALSE;

ALTER TABLE prestamo_insumo 
    ALTER COLUMN descripcion_estado SET DEFAULT 'Sin observaciones';