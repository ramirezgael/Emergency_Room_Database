--Equipo 16:
--Ramírez Reyes Gael Alejandro
--Ramírez Sandoval Cynthia
--Practica 03, JOIN

--5 Consultas JOIN, Funciones de paginación
--_________________________________________

--1
SELECT p.nombre, p.ap_paterno, p.ap_materno, i.fecha_hora_ingreso, i.motivo_ingreso, i.nivel_gravedad 
FROM Ingreso i 
INNER JOIN Paciente p ON i.id_paciente = p.id_paciente 
ORDER BY i.fecha_hora_ingreso LIMIT 5;

--2
SELECT p.nombre, p.ap_paterno, p.ap_materno, c.numero_cama, c.area, i.fecha_hora_ingreso, i.nivel_gravedad
FROM Ingreso i
INNER JOIN Paciente p ON i.id_paciente = p.id_paciente
INNER JOIN Cama c ON i.id_cama = c.id_cama
ORDER BY i.fecha_hora_ingreso 
OFFSET 5 LIMIT 5;

--3
SELECT m.nombre, m.ap_paterno,m.ap_materno, m.especialidad,
COUNT(a.id_atencion) AS total_atenciones
FROM Medico m
INNER JOIN Atencion_Medica a ON m.id_medico = a.id_medico
GROUP BY m.id_medico, m.nombre, m.ap_paterno, m.ap_materno, m.especialidad
ORDER BY total_atenciones DESC
LIMIT 5;

--4
SELECT r.id_receta, r.fecha_hora, m.nombre, m.ap_paterno, m.ap_materno, i.motivo_ingreso
FROM Receta r
INNER JOIN Medico m ON r.id_medico = m.id_medico
INNER JOIN Ingreso i ON r.id_ingreso = i.id_ingreso
ORDER BY r.fecha_hora
LIMIT 5; 

--5
SELECT ma.id_med_admin, ma.dosis, ma.fecha_hora_admin, med.nombre AS medicamento, ma.administrado_por
FROM Med_Administrado ma
INNER JOIN Medicamento med ON ma.id_medicamento = med.id_medicamento
WHERE ma.fecha_hora_admin >= '2025-02-01'
ORDER BY ma.fecha_hora_admin
OFFSET 3 FETCH NEXT 5 ROWS ONLY;


--5 Consultas con JOIN usando funciones de composición
--____________________________________________________

--1
SELECT p.nombre, p.ap_paterno, p.ap_materno, ce.nombre AS contacto, ce.parentesco, ce.telefono
FROM Paciente p
INNER JOIN Contacto_Emergencia ce ON p.id_paciente = ce.id_paciente;


--2
SELECT m.nombre, m.ap_paterno, m.ap_materno, m.especialidad, m.turno, COUNT(a.id_atencion) AS total_atenciones
FROM Medico m
LEFT JOIN Atencion_Medica a ON m.id_medico = a.id_medico
GROUP BY m.id_medico, m.nombre, m.ap_paterno, m.ap_materno, m.especialidad, m.turno
ORDER BY total_atenciones DESC;


--3
SELECT i.id_ingreso, i.motivo_ingreso, i.nivel_gravedad, d.descripcion AS diagnostico
FROM Diagnostico d
RIGHT JOIN Ingreso i ON d.id_ingreso = i.id_ingreso;


--4
SELECT r.id_receta, r.fecha_hora, m.nombre AS medico, m.ap_paterno, m.ap_materno, med.nombre AS medicamento, rd.dosis, rd.frecuencia
FROM Receta_Detalle rd
INNER JOIN Receta r ON rd.id_receta = r.id_receta
INNER JOIN Medico m ON r.id_medico = m.id_medico
INNER JOIN Medicamento med ON rd.id_medicamento = med.id_medicamento;


--5
SELECT e.nombre, e.ap_paterno, e.ap_materno, e.asignacion, e.turno, COUNT(ae.id_aten_enf) AS total_atenciones
FROM Enfermero e
LEFT JOIN Atencion_Enfermeria ae ON e.id_enfermero = ae.id_enfermero
GROUP BY e.id_enfermero, e.nombre, e.ap_paterno, e.ap_materno, e.asignacion, e.turno
ORDER BY total_atenciones DESC;


--2 Consultas con JOIN en tablas renombradas

-- 1
SELECT p.nombre, p.ap_paterno, p.ap_materno, c.numero_cama, c.area, i.motivo_ingreso, i.nivel_gravedad, i.fecha_hora_ingreso, i.fecha_hora_egreso
FROM Ingreso i
INNER JOIN Paciente p ON i.id_paciente = p.id_paciente
INNER JOIN Cama c ON i.id_cama = c.id_cama
ORDER BY i.fecha_hora_ingreso;
 
-- 2
SELECT e.nombre AS enfermero, e.ap_paterno, e.ap_materno, e.asignacion, i.motivo_ingreso, i.nivel_gravedad, ae.fecha_hora AS fecha_atencion
FROM Atencion_Enfermeria ae
INNER JOIN Enfermero e ON ae.id_enfermero = e.id_enfermero
INNER JOIN Ingreso i ON ae.id_ingreso = i.id_ingreso
ORDER BY ae.fecha_hora;