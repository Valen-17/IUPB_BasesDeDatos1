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

ALTER TABLE ira ADD PRIMARY KEY (id_ira);

ALTER TABLE tipo_insumo ADD PRIMARY KEY (id_insumo);

ALTER TABLE prestamo_insumo ADD PRIMARY KEY (id_prestamo);

ALTER TABLE universidad ADD PRIMARY KEY (id_universidad);

ALTER TABLE rep ADD PRIMARY KEY (id_rep);

ALTER TABLE invitado ADD PRIMARY KEY (id_invitado);

ALTER TABLE municipio ADD PRIMARY KEY (id_municipio);

ALTER TABLE region ADD PRIMARY KEY (id_region);

ALTER TABLE pais ADD PRIMARY KEY (id_pais);

ALTER TABLE taller_transito ADD PRIMARY KEY (id_taller);


-- Agregar Foreing Keys 

ALTER TABLE proyecto 
ADD CONSTRAINT fk_proyecto_id_tipo 
FOREIGN KEY (id_tipo) REFERENCES tipo_proyecto(id_tipo_proyecto);

ALTER TABLE evaluacion 
ADD CONSTRAINT fk_evaluacion_id_proyecto 
FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto),
ADD CONSTRAINT fk_evaluacion_id_usuario 
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);

ALTER TABLE asignatura 
ADD CONSTRAINT fk_asignatura_id_programa 
FOREIGN KEY (id_programa) REFERENCES programa_academico(id_programa);

ALTER TABLE era 
ADD CONSTRAINT fk_era_id_asignatura 
FOREIGN KEY (id_asignatura) REFERENCES asignatura(id_asignatura);

ALTER TABLE curso 
ADD CONSTRAINT fk_curso_id_asignatura 
FOREIGN KEY (id_asignatura) REFERENCES asignatura(id_asignatura),
ADD CONSTRAINT fk_curso_id_profesor 
FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor);

ALTER TABLE entregable 
ADD CONSTRAINT fk_entregable_id_tipo_entregable 
FOREIGN KEY (id_tipo_entregable) REFERENCES tipo_entregable(id_tipo_entregable);

ALTER TABLE profesor 
ADD CONSTRAINT fk_profesor_id_usuario 
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);

ALTER TABLE estudiante 
ADD CONSTRAINT fk_estudiante_id_usuario 
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
ADD CONSTRAINT fk_estudiante_id_programa 
FOREIGN KEY (id_programa) REFERENCES programa_academico(id_programa);

ALTER TABLE rol 
ADD CONSTRAINT fk_rol_id_permiso 
FOREIGN KEY (id_permiso) REFERENCES permiso(id_permiso);

ALTER TABLE usuario_proyecto_rol 
ADD CONSTRAINT fk_usuario_proyecto_rol_id_proyecto 
FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto),
ADD CONSTRAINT fk_usuario_proyecto_rol_id_usuario 
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
ADD CONSTRAINT fk_usuario_proyecto_rol_id_rol 
FOREIGN KEY (id_rol) REFERENCES rol(id_rol);

ALTER TABLE curso_proyecto 
ADD CONSTRAINT fk_curso_proyecto_id_curso 
FOREIGN KEY (id_curso) REFERENCES curso(id_curso),
ADD CONSTRAINT fk_curso_proyecto_id_proyecto 
FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto);

ALTER TABLE era_proyecto 
ADD CONSTRAINT fk_era_proyecto_id_era 
FOREIGN KEY (id_era) REFERENCES era(id_era),
ADD CONSTRAINT fk_era_proyecto_id_proyecto 
FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto);

ALTER TABLE linea_investigacion_proyecto 
ADD CONSTRAINT fk_linea_investigacion_proyecto_id_linea 
FOREIGN KEY (id_linea) REFERENCES linea_de_investigacion(id_linea),
ADD CONSTRAINT fk_linea_investigacion_proyecto_id_proyecto 
FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto);

ALTER TABLE ira 
ADD CONSTRAINT fk_ira_id_asignatura 
FOREIGN KEY (id_asignatura) REFERENCES asignatura(id_asignatura);

ALTER TABLE ira_proyecto 
ADD CONSTRAINT fk_ira_proyecto_id_ira 
FOREIGN KEY (id_ira) REFERENCES ira(id_ira),
ADD CONSTRAINT fk_ira_proyecto_id_proyecto 
FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto);

ALTER TABLE prestamo_insumo 
ADD CONSTRAINT fk_prestamo_insumo_id_insumo 
FOREIGN KEY (id_insumo) REFERENCES tipo_insumo(id_insumo),
ADD CONSTRAINT fk_prestamo_insumo_id_proyecto 
FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto),
ADD CONSTRAINT fk_prestamo_insumo_id_universidad 
FOREIGN KEY (id_universidad) REFERENCES universidad(id_universidad);

ALTER TABLE universidad 
ADD CONSTRAINT fk_universidad_id_municipio 
FOREIGN KEY (id_municipio) REFERENCES municipio(id_municipio);

ALTER TABLE universidad_profesor 
ADD CONSTRAINT fk_universidad_profesor_id_universidad 
FOREIGN KEY (id_universidad) REFERENCES universidad(id_universidad),
ADD CONSTRAINT fk_universidad_profesor_id_profesor 
FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor);

ALTER TABLE universidad_estudiante 
ADD CONSTRAINT fk_universidad_estudiante_id_universidad 
FOREIGN KEY (id_universidad) REFERENCES universidad(id_universidad),
ADD CONSTRAINT fk_universidad_estudiante_id_estudiante 
FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante);

ALTER TABLE universidad_programa_academico 
ADD CONSTRAINT fk_universidad_programa_academico_id_universidad 
FOREIGN KEY (id_universidad) REFERENCES universidad(id_universidad),
ADD CONSTRAINT fk_universidad_programa_academico_id_programa 
FOREIGN KEY (id_programa) REFERENCES programa_academico(id_programa);

ALTER TABLE rep 
ADD CONSTRAINT fk_rep_id_proyecto 
FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto);

ALTER TABLE rep_proyecto 
ADD CONSTRAINT fk_rep_proyecto_id_rep 
FOREIGN KEY (id_rep) REFERENCES rep(id_rep),
ADD CONSTRAINT fk_rep_proyecto_id_proyecto 
FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto);

ALTER TABLE invitado 
ADD CONSTRAINT fk_invitado_id_usuario 
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);

ALTER TABLE municipio 
ADD CONSTRAINT fk_municipio_id_region 
FOREIGN KEY (id_region) REFERENCES region(id_region);

ALTER TABLE region 
ADD CONSTRAINT fk_region_id_pais 
FOREIGN KEY (id_pais) REFERENCES pais(id_pais);

ALTER TABLE taller_proyecto 
ADD CONSTRAINT fk_taller_proyecto_id_proyecto 
FOREIGN KEY (id_proyecto) REFERENCES proyecto(id_proyecto),
ADD CONSTRAINT fk_taller_proyecto_id_taller 
FOREIGN KEY (id_taller) REFERENCES taller_transito(id_taller);


-- Agregar Primary Keys compuestas 

ALTER TABLE usuario_proyecto_rol 
ADD CONSTRAINT pk_usuario_proyecto_rol 
PRIMARY KEY (id_proyecto, id_usuario, id_rol);

ALTER TABLE curso_proyecto 
ADD CONSTRAINT pk_curso_proyecto 
PRIMARY KEY (id_curso, id_proyecto);

ALTER TABLE era_proyecto 
ADD CONSTRAINT pk_era_proyecto 
PRIMARY KEY (id_era, id_proyecto);

ALTER TABLE linea_investigacion_proyecto 
ADD CONSTRAINT pk_linea_investigacion_proyecto 
PRIMARY KEY (id_linea, id_proyecto);

ALTER TABLE ira_proyecto 
ADD CONSTRAINT pk_ira_proyecto 
PRIMARY KEY (id_ira, id_proyecto);

ALTER TABLE universidad_profesor 
ADD CONSTRAINT pk_universidad_profesor 
PRIMARY KEY (id_universidad, id_profesor);

ALTER TABLE universidad_estudiante 
ADD CONSTRAINT pk_universidad_estudiante 
PRIMARY KEY (id_universidad, id_estudiante);

ALTER TABLE universidad_programa_academico 
ADD CONSTRAINT pk_universidad_programa_academico 
PRIMARY KEY (id_universidad, id_programa);

ALTER TABLE rep_proyecto 
ADD CONSTRAINT pk_rep_proyecto 
PRIMARY KEY (id_rep, id_proyecto);

ALTER TABLE taller_proyecto 
ADD CONSTRAINT pk_taller_proyecto 
PRIMARY KEY (id_proyecto, id_taller);


-- Agregar Unique Keys 

ALTER TABLE usuario
ADD CONSTRAINT uk_usuario_correo UNIQUE (correo);



