--Equipo 16:
--Ramírez Reyes Gael Alejandro
--Ramírez Sandoval Cynthia
--Integridad de la BD


ALTER TABLE Paciente
    ADD PRIMARY KEY (id_paciente);
 
ALTER TABLE Paciente
    ALTER COLUMN num_afiliacion  SET NOT NULL,
    ALTER COLUMN nombre          SET NOT NULL,
    ALTER COLUMN ap_paterno      SET NOT NULL,
    ALTER COLUMN ap_materno      SET NOT NULL,
    ALTER COLUMN fecha_nacimiento SET NOT NULL,
    ALTER COLUMN genero          SET NOT NULL,
    ALTER COLUMN curp            SET NOT NULL;
 
ALTER TABLE Paciente
    ADD CONSTRAINT chk_paciente_genero
        CHECK (genero IN ('M', 'F', 'O'));
 
ALTER TABLE Paciente
    ADD CONSTRAINT uq_paciente_curp
        UNIQUE (curp);
 
ALTER TABLE Paciente
    ADD CONSTRAINT uq_paciente_num_afiliacion
        UNIQUE (num_afiliacion);


ALTER TABLE Medico
    ADD PRIMARY KEY (id_medico);
 
ALTER TABLE Medico
    ALTER COLUMN cedula_prof  SET NOT NULL,
    ALTER COLUMN nombre       SET NOT NULL,
    ALTER COLUMN ap_paterno   SET NOT NULL,
    ALTER COLUMN ap_materno   SET NOT NULL,
    ALTER COLUMN especialidad SET NOT NULL,
    ALTER COLUMN telefono      SET NOT NULL,
    ALTER COLUMN correo       SET NOT NULL,
    ALTER COLUMN turno        SET NOT NULL;
 
ALTER TABLE Medico
    ADD CONSTRAINT chk_medico_turno
        CHECK (turno IN ('Matutino', 'Vespertino', 'Nocturno', 'Guardia'));
 
ALTER TABLE Medico
    ADD CONSTRAINT uq_medico_cedula
        UNIQUE (cedula_prof);


ALTER TABLE Enfermero
    ADD PRIMARY KEY (id_enfermero);
 
ALTER TABLE Enfermero
    ALTER COLUMN num_empleado SET NOT NULL,
    ALTER COLUMN nombre       SET NOT NULL,
    ALTER COLUMN ap_paterno   SET NOT NULL,
    ALTER COLUMN ap_materno   SET NOT NULL,
    ALTER COLUMN turno        SET NOT NULL;
 
ALTER TABLE Enfermero
    ADD CONSTRAINT chk_enfermero_turno
        CHECK (turno IN ('Matutino', 'Vespertino', 'Nocturno', 'Guardia'));
 
ALTER TABLE Enfermero
    ADD CONSTRAINT uq_enfermero_num_empleado
        UNIQUE (num_empleado);


ALTER TABLE Administrador
    ADD PRIMARY KEY (id_admin);
 
ALTER TABLE Administrador
    ALTER COLUMN num_empleado SET NOT NULL,
    ALTER COLUMN nombre       SET NOT NULL,
    ALTER COLUMN ap_paterno   SET NOT NULL,
    ALTER COLUMN turno        SET NOT NULL;
 
ALTER TABLE Administrador
    ADD CONSTRAINT chk_admin_turno
        CHECK (turno IN ('Matutino', 'Vespertino', 'Nocturno'));
 
ALTER TABLE Administrador
    ADD CONSTRAINT uq_admin_num_empleado
        UNIQUE (num_empleado);


ALTER TABLE Cama
    ADD PRIMARY KEY (id_cama);
 
ALTER TABLE Cama
    ALTER COLUMN numero_cama SET NOT NULL,
    ALTER COLUMN area        SET NOT NULL;
 
ALTER TABLE Cama
    ADD CONSTRAINT uq_cama_numero
        UNIQUE (numero_cama);
 
ALTER TABLE Cama
    ADD CONSTRAINT chk_cama_area
        CHECK (area IN (
            'Urgencias', 'Observacion', 'Reanimacion',
            'Pediatria', 'Geriatria', 'Aislamiento'
        ));
 

ALTER TABLE Medicamento
    ADD PRIMARY KEY (id_medicamento);
 
ALTER TABLE Medicamento
    ALTER COLUMN nombre             SET NOT NULL,
    ALTER COLUMN presentacion       SET NOT NULL,
    ALTER COLUMN via_administracion SET NOT NULL;
 
ALTER TABLE Medicamento
    ADD CONSTRAINT chk_medicamento_via
        CHECK (via_administracion IN (
            'Oral', 'Intravenosa', 'Intramuscular',
            'Subcutanea', 'Topica', 'Inhalatoria', 'Sublingual'
        ));


ALTER TABLE Contacto_Emergencia
    ADD PRIMARY KEY (id_contacto);
 
ALTER TABLE Contacto_Emergencia
    ADD CONSTRAINT fk_contacto_paciente
        FOREIGN KEY (id_paciente) REFERENCES Paciente (id_paciente);
 
ALTER TABLE Contacto_Emergencia
    ALTER COLUMN id_paciente SET NOT NULL,
    ALTER COLUMN nombre      SET NOT NULL,
    ALTER COLUMN parentesco  SET NOT NULL,
    ALTER COLUMN telefono    SET NOT NULL;
 
ALTER TABLE Contacto_Emergencia
    ADD CONSTRAINT chk_contacto_parentesco
        CHECK (parentesco IN (
            'Padre', 'Madre', 'Hijo', 'Hija', 'Hermano',
            'Hermana', 'Conyuge', 'Tutor', 'Otro'
        ));


ALTER TABLE Ingreso
    ADD PRIMARY KEY (id_ingreso);
 
ALTER TABLE Ingreso
    ADD CONSTRAINT fk_ingreso_paciente
        FOREIGN KEY (id_paciente) REFERENCES Paciente (id_paciente),
    ADD CONSTRAINT fk_ingreso_cama
        FOREIGN KEY (id_cama) REFERENCES Cama (id_cama);
 
ALTER TABLE Ingreso
    ALTER COLUMN id_paciente        SET NOT NULL,
    ALTER COLUMN id_cama            SET NOT NULL,
    ALTER COLUMN fecha_hora_ingreso SET NOT NULL,
    ALTER COLUMN motivo_ingreso     SET NOT NULL,
    ALTER COLUMN nivel_gravedad     SET NOT NULL;
 
ALTER TABLE Ingreso
    ADD CONSTRAINT chk_ingreso_nivel_gravedad
        CHECK (nivel_gravedad IN (
            'Verde', 'Amarillo', 'Naranja', 'Rojo', 'Negro'
        ));
 
ALTER TABLE Ingreso
    ADD CONSTRAINT chk_ingreso_estado_egreso
        CHECK (estado_egreso IN (
            'Alta', 'Traslado', 'Defuncion', 'Fuga', 'En tratamiento'
        ));
 
ALTER TABLE Ingreso
    ADD CONSTRAINT chk_ingreso_fechas
        CHECK (fecha_hora_egreso IS NULL OR
               fecha_hora_egreso >= fecha_hora_ingreso);


ALTER TABLE Diagnostico
    ADD PRIMARY KEY (id_diagnostico);
 
ALTER TABLE Diagnostico
    ADD CONSTRAINT fk_diagnostico_ingreso
        FOREIGN KEY (id_ingreso) REFERENCES Ingreso (id_ingreso);
 
ALTER TABLE Diagnostico
    ALTER COLUMN id_ingreso  SET NOT NULL,
    ALTER COLUMN fecha_hora  SET NOT NULL,
    ALTER COLUMN descripcion SET NOT NULL;



ALTER TABLE Atencion_Medica
    ADD PRIMARY KEY (id_atencion);
 
ALTER TABLE Atencion_Medica
    ADD CONSTRAINT fk_atmed_ingreso
        FOREIGN KEY (id_ingreso) REFERENCES Ingreso (id_ingreso),
    ADD CONSTRAINT fk_atmed_medico
        FOREIGN KEY (id_medico) REFERENCES Medico (id_medico);
 
ALTER TABLE Atencion_Medica
    ALTER COLUMN id_ingreso SET NOT NULL,
    ALTER COLUMN id_medico  SET NOT NULL,
    ALTER COLUMN fecha_hora SET NOT NULL;


ALTER TABLE Atencion_Enfermeria
    ADD PRIMARY KEY (id_aten_enf);
 
ALTER TABLE Atencion_Enfermeria
    ADD CONSTRAINT fk_atenf_ingreso
        FOREIGN KEY (id_ingreso) REFERENCES Ingreso (id_ingreso),
    ADD CONSTRAINT fk_atenf_enfermero
        FOREIGN KEY (id_enfermero) REFERENCES Enfermero (id_enfermero);
 
ALTER TABLE Atencion_Enfermeria
    ALTER COLUMN id_ingreso   SET NOT NULL,
    ALTER COLUMN id_enfermero SET NOT NULL,
    ALTER COLUMN fecha_hora   SET NOT NULL;


ALTER TABLE Receta
    ADD PRIMARY KEY (id_receta);
 
ALTER TABLE Receta
    ADD CONSTRAINT fk_receta_ingreso
        FOREIGN KEY (id_ingreso) REFERENCES Ingreso (id_ingreso),
    ADD CONSTRAINT fk_receta_medico
        FOREIGN KEY (id_medico) REFERENCES Medico (id_medico);
 
ALTER TABLE Receta
    ALTER COLUMN id_ingreso SET NOT NULL,
    ALTER COLUMN id_medico  SET NOT NULL,
    ALTER COLUMN fecha_hora SET NOT NULL;


ALTER TABLE Receta_Detalle
    ADD PRIMARY KEY (id_detalle);
 
ALTER TABLE Receta_Detalle
    ADD CONSTRAINT fk_rdet_receta
        FOREIGN KEY (id_receta) REFERENCES Receta (id_receta),
    ADD CONSTRAINT fk_rdet_medicamento
        FOREIGN KEY (id_medicamento) REFERENCES Medicamento (id_medicamento);
 
ALTER TABLE Receta_Detalle
    ALTER COLUMN id_receta      SET NOT NULL,
    ALTER COLUMN id_medicamento SET NOT NULL,
    ALTER COLUMN dosis          SET NOT NULL,
    ALTER COLUMN frecuencia     SET NOT NULL;


ALTER TABLE Med_Administrado
    ADD PRIMARY KEY (id_med_admin);
 
ALTER TABLE Med_Administrado
    ADD CONSTRAINT fk_medadm_ingreso
        FOREIGN KEY (id_ingreso) REFERENCES Ingreso (id_ingreso),
    ADD CONSTRAINT fk_medadm_medicamento
        FOREIGN KEY (id_medicamento) REFERENCES Medicamento (id_medicamento);
 
ALTER TABLE Med_Administrado
    ALTER COLUMN id_ingreso      SET NOT NULL,
    ALTER COLUMN id_medicamento  SET NOT NULL,
    ALTER COLUMN dosis           SET NOT NULL,
    ALTER COLUMN fecha_hora_admin SET NOT NULL,
    ALTER COLUMN administrado_por SET NOT NULL;
