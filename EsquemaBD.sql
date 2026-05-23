--Equipo 16:
--Ramírez Reyes Gael Alejandro
--Ramírez Sandoval Cynthia
--Esquema de la BD

CREATE DATABASE Urgencias;
\c Urgencias

--Primero creamos las tablas independientes

CREATE TABLE Paciente
(
    id_paciente      SERIAL,
    num_afiliacion   VARCHAR(20),
    nombre           VARCHAR(50),
    ap_paterno       VARCHAR(50),
    ap_materno       VARCHAR(50),
    fecha_nacimiento DATE,
    nacionalidad     VARCHAR(50),
    genero           CHAR(1),
    curp             VARCHAR(18),
    correo           VARCHAR(100)
);
 
CREATE TABLE Medico
(
    id_medico    SERIAL,
    cedula_prof  VARCHAR(20),
    nombre       VARCHAR(50),
    ap_paterno   VARCHAR(50),
    ap_materno   VARCHAR(50),
    especialidad VARCHAR(60),
    turno        VARCHAR(15),
    telefono     VARCHAR(15),
    correo       VARCHAR(100)
);
 
CREATE TABLE Enfermero
(
    id_enfermero SERIAL,
    num_empleado VARCHAR(15),
    nombre       VARCHAR(50),
    ap_paterno   VARCHAR(50),
    ap_materno   VARCHAR(50),
    turno        VARCHAR(15),
    asignacion   VARCHAR(40)
);
 
CREATE TABLE Administrador
(
    id_admin     SERIAL,
    num_empleado VARCHAR(15),
    nombre       VARCHAR(50),
    ap_paterno   VARCHAR(50),
    ap_materno   VARCHAR(50),
    turno        VARCHAR(15),
    correo       VARCHAR(100)
);
 
CREATE TABLE Cama
(
    id_cama      SERIAL,
    numero_cama  VARCHAR(10),
    area         VARCHAR(40)
);
 
CREATE TABLE Medicamento
(
    id_medicamento     SERIAL,
    nombre             VARCHAR(100),
    presentacion       VARCHAR(50),
    via_administracion VARCHAR(30)
);


--Ahora creamos las tablas que dependen de paciente


CREATE TABLE Contacto_Emergencia
(
    id_contacto  SERIAL,
    id_paciente  INTEGER,
    nombre       VARCHAR(100),
    parentesco   VARCHAR(30),
    telefono     VARCHAR(15)
);

--Aqui ingreso depende de paciente y de cama


CREATE TABLE Ingreso
(
    id_ingreso         SERIAL,
    id_paciente        INTEGER,
    id_cama            INTEGER,
    fecha_hora_ingreso TIMESTAMP,
    motivo_ingreso     TEXT,
    nivel_gravedad     VARCHAR(20),
    fecha_hora_egreso  TIMESTAMP,
    estado_egreso      VARCHAR(20)
);


--Tablas que dependen de ingreso


CREATE TABLE Diagnostico
(
    id_diagnostico INTEGER,
    id_ingreso     INTEGER,
    fecha_hora     TIMESTAMP,
    descripcion    TEXT
);
 
CREATE TABLE Atencion_Medica
(
    id_atencion INTEGER,
    id_ingreso  INTEGER,
    id_medico   INTEGER,
    fecha_hora  TIMESTAMP
);
 
CREATE TABLE Atencion_Enfermeria
(
    id_aten_enf  INTEGER,
    id_ingreso   INTEGER,
    id_enfermero INTEGER,
    fecha_hora   TIMESTAMP
);
 
CREATE TABLE Receta
(
    id_receta  INTEGER,
    id_ingreso INTEGER,
    id_medico  INTEGER,
    fecha_hora TIMESTAMP
);
 
CREATE TABLE Med_Administrado
(
    id_med_admin    INTEGER,
    id_ingreso      INTEGER,
    id_medicamento  INTEGER,
    dosis           VARCHAR(50),
    fecha_hora_admin TIMESTAMP,
    administrado_por VARCHAR(100)
);


--Por ultimo, la entidad que depende de receta y medicamento


CREATE TABLE Receta_Detalle
(
    id_detalle     INTEGER,
    id_receta      INTEGER,
    id_medicamento INTEGER,
    dosis          VARCHAR(50),
    frecuencia     VARCHAR(50)
);



