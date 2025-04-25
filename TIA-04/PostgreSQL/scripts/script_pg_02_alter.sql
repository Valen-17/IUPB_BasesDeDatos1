-- Agregar Primary Keys
ALTER TABLE proyecto ADD PRIMARY KEY (id_proyecto);
ALTER TABLE evaluacion ADD PRIMARY KEY (id_evaluacion);
ALTER TABLE asignatura ADD PRIMARY KEY (id_asignatura);
ALTER TABLE era ADD PRIMARY KEY (id_era);
ALTER TABLE curso ADD PRIMARY KEY (id_curso);
ALTER TABLE programa_academico ADD PRIMARY KEY (id_programa);
ALTER TABLE tipo_proyecto ADD PRIMARY KEY (id_tipo_proyecto);
ALTER TABLE entregable ADD PRIMARY KEY (id_entregable);
ALTER TABLE tipo_entregable ADD PRIMARY KEY (id_tipo_entregable);
ALTER TABLE linea_de_investigacion ADD PRIMARY KEY (id_linea);
ALTER TABLE profesor ADD PRIMARY KEY (id_profesor);
ALTER TABLE estudiante ADD PRIMARY KEY (id_estudiante);
ALTER TABLE usuario ADD PRIMARY KEY (id_usuario);
ALTER TABLE rol ADD PRIMARY KEY (id_rol);
ALTER TABLE permiso ADD PRIMARY KEY (id_permiso);
ALTER TABLE usuario_proyecto_rol ADD PRIMARY KEY (id_proyecto, id_usuario, id_rol);
ALTER TABLE curso_proyecto ADD PRIMARY KEY (id_curso, id_proyecto);
ALTER TABLE era_proyecto ADD PRIMARY KEY (id_era, id_proyecto);
ALTER TABLE linea_investigacion_proyecto ADD PRIMARY KEY (id_linea, id_proyecto);
ALTER TABLE ira ADD PRIMARY KEY (id_ira);
ALTER TABLE ira_proyecto ADD PRIMARY KEY (id_ira, id_proyecto);
ALTER TABLE tipo_insumo ADD PRIMARY KEY (id_insumo);
ALTER TABLE prestamo_insumo ADD PRIMARY KEY (id_prestamo);
ALTER TABLE universidad ADD PRIMARY KEY (id_universidad);
ALTER TABLE universidad_profesor ADD PRIMARY KEY (id_universidad, id_profesor);
ALTER TABLE universidad_estudiante ADD PRIMARY KEY (id_universidad, id_estudiante);
ALTER TABLE universidad_programa_academico ADD PRIMARY KEY (id_universidad, id_programa);
ALTER TABLE rep ADD PRIMARY KEY (id_rep);
ALTER TABLE rep_proyecto ADD PRIMARY KEY (id_rep, id_proyecto);
ALTER TABLE invitado ADD PRIMARY KEY (id_invitado);
ALTER TABLE municipio ADD PRIMARY KEY (id_municipio);
ALTER TABLE region ADD PRIMARY KEY (id_region);
ALTER TABLE pais ADD PRIMARY KEY (id_pais);
ALTER TABLE taller_transito ADD PRIMARY KEY (id_taller);
ALTER TABLE taller_proyecto ADD PRIMARY KEY (id_proyecto, id_taller);

ALTER TABLE proyecto 
    ADD CONSTRAINT fk_proyecto_tipo FOREIGN KEY (id_tipo) REFERENCES tipo_proyecto(id_tipo_proyecto);

ALTER TABLE evaluacion 
    ADD CONSTRAINT fk_evaluacion_proyecto FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto),
    ADD CONSTRAINT fk_evaluacion_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);

ALTER TABLE asignatura 
    ADD CONSTRAINT fk_asignatura_programa FOREIGN KEY (id_programa) REFERENCES programa_academico(id_programa);

ALTER TABLE era 
    ADD CONSTRAINT fk_era_asignatura FOREIGN KEY (id_asignatura) REFERENCES asignatura(id_asignatura);

ALTER TABLE curso 
    ADD CONSTRAINT fk_curso_asignatura FOREIGN KEY (id_asignatura) REFERENCES asignatura(id_asignatura),
    ADD CONSTRAINT fk_curso_profesor FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor);

ALTER TABLE entregable 
    ADD CONSTRAINT fk_entregable_tipo FOREIGN KEY (id_tipo_entregable) REFERENCES tipo_entregable(id_tipo_entregable);

ALTER TABLE linea_de_investigacion_proyecto 
    ADD CONSTRAINT fk_linea_proyecto FOREIGN KEY (id_linea) REFERENCES linea_de_investigacion(id_linea),
    ADD CONSTRAINT fk_linea_investigacion_proyecto FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto);

ALTER TABLE usuario_proyecto_rol 
    ADD CONSTRAINT fk_usuario_proyecto FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto),
    ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    ADD CONSTRAINT fk_usuario_rol FOREIGN KEY (id_rol) REFERENCES rol(id_rol);

ALTER TABLE universidad_profesor 
    ADD CONSTRAINT fk_universidad_profesor FOREIGN KEY (id_universidad) REFERENCES universidad(id_universidad),
    ADD CONSTRAINT fk_profesor_universidad FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor);

ALTER TABLE universidad_estudiante 
    ADD CONSTRAINT fk_universidad_estudiante FOREIGN KEY (id_universidad) REFERENCES universidad(id_universidad),
    ADD CONSTRAINT fk_estudiante_universidad FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante);

ALTER TABLE universidad_programa_academico 
    ADD CONSTRAINT fk_universidad_programa FOREIGN KEY (id_universidad) REFERENCES universidad(id_universidad),
    ADD CONSTRAINT fk_programa_universidad FOREIGN KEY (id_programa) REFERENCES programa_academico(id_programa);

ALTER TABLE prestamo_insumo 
    ADD CONSTRAINT fk_prestamo_insumo FOREIGN KEY (id_insumo) REFERENCES tipo_insumo(id_insumo),
    ADD CONSTRAINT fk_prestamo_proyecto FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto),
    ADD CONSTRAINT fk_prestamo_universidad FOREIGN KEY (id_universidad) REFERENCES universidad(id_universidad);
