--Equipo 16:
--Ramírez Reyes Gael Alejandro
--Ramírez Sandoval Cynthia
--Practica 03, 5 consultas por cada tabla


--Tabla Paciente
--______________

SELECT nombre, ap_paterno, ap_materno FROM Paciente WHERE genero = 'F';

SELECT nombre, ap_paterno, ap_materno FROM Paciente WHERE genero = 'M';

SELECT ap_paterno, ap_materno, nombre FROM Paciente ORDER BY ap_paterno ASC, ap_materno ASC, nombre ASC;

SELECT ap_paterno, ap_materno, nombre, fecha_nacimiento FROM Paciente ORDER BY fecha_nacimiento DESC;

SELECT ap_paterno, ap_materno, nombre FROM Paciente WHERE ap_paterno IN ('Ramírez', 'Ramirez') ORDER BY ap_paterno ASC, ap_materno ASC;


--Tabla Medico
--____________

SELECT * FROM Medico WHERE turno = 'Matutino';

SELECT cedula_prof, ap_paterno, ap_materno, nombre FROM Medico ORDER BY ap_paterno ASC, ap_materno ASC, nombre ASC;

SELECT cedula_prof, nombre, ap_paterno, ap_materno FROM Medico WHERE especialidad = 'Cardiología';

SELECT nombre, ap_paterno, correo FROM Medico WHERE correo LIKE '%ciencias.unam.mx';

SELECT cedula_prof, nombre, ap_paterno, ap_materno FROM Medico WHERE nombre IN ('Carlos', 'Silvia');


--Tabla Enfermero
--_______________

SELECT * FROM Enfermero WHERE asignacion = 'Urgencias';

SELECT id_enfermero, nombre, ap_paterno, ap_materno turno FROM Enfermero WHERE turno = 'Nocturno';

SELECT id_enfermero, nombre, ap_paterno, ap_materno, asignacion FROM Enfermero ORDER BY asignacion;

SELECT * FROM Enfermero WHERE num_empleado = 'ENF-015';

SELECT id_enfermero, nombre, ap_paterno, ap_materno FROM Enfermero WHERE nombre LIKE 'A%';



--Tabla Administrador
--_____________________

SELECT * FROM Administrador WHERE turno = 'Vespertino';

SELECT nombre, ap_paterno, ap_materno FROM Administrador ORDER BY ap_paterno ASC, ap_materno ASC, nombre ASC;

SELECT * FROM Administrador WHERE num_empleado = 'ADM-010';

SELECT nombre, ap_paterno, ap_materno correo FROM Administrador WHERE correo LIKE '%hospital.mx';

SELECT ap_paterno, ap_materno, nombre, turno FROM Administrador WHERE turno = 'Nocturno' ORDER BY nombre;


--Tabla Cama
--__________

SELECT * FROM Cama WHERE area = 'Urgencias';

SELECT area, COUNT(*) AS total_camas FROM Cama GROUP BY area;

SELECT * FROM Cama WHERE numero_cama = 'U-03';

SELECT * FROM Cama WHERE area IN ('Reanimacion', 'Aislamiento');

SELECT numero_cama, area FROM Cama ORDER BY area;


--Tabla Medicamentos
--__________________

SELECT * FROM Medicamento WHERE via_administracion = 'Intravenosa';

SELECT via_administracion, COUNT(*) AS total FROM Medicamento GROUP BY via_administracion;

SELECT nombre, presentacion FROM Medicamento WHERE nombre LIKE '%ina%';

SELECT * FROM Medicamento WHERE id_medicamento = 16;

SELECT nombre, via_administracion FROM Medicamento ORDER BY via_administracion, nombre;


--Tabla Contacto_Emergencia
--_________________________

SELECT * FROM Contacto_Emergencia WHERE parentesco = 'Conyuge';

SELECT parentesco, COUNT(*) AS total FROM Contacto_Emergencia GROUP BY parentesco;

SELECT * FROM Contacto_Emergencia WHERE id_paciente = '5';

SELECT nombre, parentesco FROM Contacto_Emergencia WHERE nombre LIKE 'M%';

SELECT * FROM Contacto_Emergencia WHERE parentesco = 'Madre';


--Tabla Ingreso
--_____________

SELECT * FROM Ingreso WHERE nivel_gravedad = 'Rojo';

SELECT * FROM Ingreso WHERE fecha_hora_egreso IS NULL;

SELECT * FROM Ingreso WHERE estado_egreso = 'Alta';

SELECT nivel_gravedad, COUNT(*) AS total FROM Ingreso GROUP BY nivel_gravedad;

SELECT id_ingreso, id_paciente, fecha_hora_ingreso, nivel_gravedad FROM Ingreso ORDER BY fecha_hora_ingreso;


--Tabla Diagnostico
--_________________

SELECT * FROM Diagnostico WHERE id_ingreso = 9;

SELECT * FROM Diagnostico WHERE fecha_hora BETWEEN '2025-01-01' AND '2025-01-31 23:59:59';

SELECT id_diagnostico, descripcion FROM Diagnostico WHERE descripcion ILIKE '%fractura%';

SELECT id_diagnostico, fecha_hora, descripcion FROM Diagnostico ORDER BY fecha_hora;

SELECT * FROM Diagnostico WHERE fecha_hora >= '2025-03-01';


--Tabla Atencion_Medica
--_____________________

SELECT * FROM Atencion_Medica WHERE id_medico = 8;

SELECT id_medico, COUNT(*) AS total_atenciones FROM Atencion_Medica GROUP BY id_medico ORDER BY total_atenciones DESC;

SELECT * FROM Atencion_Medica WHERE id_ingreso = 15;

SELECT * FROM Atencion_Medica WHERE fecha_hora BETWEEN '2025-01-01' AND '2025-01-31 23:59:59';

SELECT id_atencion, id_ingreso, id_medico, fecha_hora FROM Atencion_Medica ORDER BY fecha_hora;


--Tabla Atencion_Enfermeria
--_________________________

SELECT * FROM Atencion_Enfermeria WHERE id_enfermero = 1;

SELECT id_enfermero, COUNT(*) AS total FROM Atencion_Enfermeria GROUP BY id_enfermero ORDER BY total DESC;

SELECT * FROM Atencion_Enfermeria WHERE id_ingreso = 27;

SELECT * FROM Atencion_Enfermeria WHERE fecha_hora >= '2025-02-01';

SELECT id_aten_enf, id_ingreso, id_enfermero, fecha_hora FROM Atencion_Enfermeria ORDER BY fecha_hora;


--Tabla Receta
--____________

SELECT * FROM Receta WHERE id_medico = 8;

SELECT id_medico, COUNT(*) AS total_recetas FROM Receta GROUP BY id_medico ORDER BY total_recetas DESC;

SELECT * FROM Receta WHERE id_ingreso = 12;

SELECT * FROM Receta WHERE fecha_hora BETWEEN '2025-01-01' AND '2025-01-31 23:59:59';

SELECT id_receta, id_ingreso, id_medico, fecha_hora FROM Receta ORDER BY fecha_hora;


--Tabla Receta_Detalle
--____________________

SELECT * FROM Receta_Detalle WHERE id_receta = 12;

SELECT * FROM Receta_Detalle WHERE id_medicamento = 7;

SELECT id_medicamento, COUNT(*) AS veces_recetado FROM Receta_Detalle GROUP BY id_medicamento ORDER BY veces_recetado DESC;

SELECT * FROM Receta_Detalle WHERE dosis LIKE '%IV%';

SELECT id_detalle, id_receta, id_medicamento, dosis, frecuencia FROM Receta_Detalle ORDER BY id_receta;


--Tabla Med_Administrado
--______________________

SELECT * FROM Med_Administrado WHERE id_ingreso = 5;

SELECT id_medicamento, COUNT(*) AS total FROM Med_Administrado GROUP BY id_medicamento ORDER BY total DESC;

SELECT * FROM Med_Administrado WHERE administrado_por = 'Enf. Alicia Barrera';

SELECT * FROM Med_Administrado WHERE fecha_hora_admin >= '2025-02-01';

SELECT id_med_admin, id_ingreso, id_medicamento, fecha_hora_admin FROM Med_Administrado ORDER BY fecha_hora_admin;


