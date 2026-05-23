--Equipo 16:
--Ramírez Reyes Gael Alejandro
--Ramírez Sandoval Cynthia
--Practica 03, JOIN avanzado


--4 Consultas JOIN con operadores de comparación
--______________________________________________

--1
SELECT p.nombre, p.ap_paterno, p.ap_materno, i.motivo_ingreso, i.nivel_gravedad, c.area
FROM Ingreso i
INNER JOIN Paciente p ON i.id_paciente = p.id_paciente
INNER JOIN Cama c ON i.id_cama = c.id_cama
WHERE i.nivel_gravedad IN ('Rojo', 'Negro')
ORDER BY i.fecha_hora_ingreso;


--2
SELECT m.nombre, m.ap_paterno, m.ap_materno, m.especialidad, r.fecha_hora, i.motivo_ingreso
FROM Receta r
INNER JOIN Medico m ON r.id_medico = m.id_medico
INNER JOIN Ingreso i ON r.id_ingreso = i.id_ingreso
WHERE r.fecha_hora BETWEEN '2025-01-01' AND '2025-01-31 23:59:59'
ORDER BY r.fecha_hora;


--3
SELECT med.nombre AS medicamento, med.via_administracion, ma.dosis, ma.administrado_por, i.motivo_ingreso
FROM Med_Administrado ma
INNER JOIN Medicamento med ON ma.id_medicamento = med.id_medicamento
INNER JOIN Ingreso i ON ma.id_ingreso = i.id_ingreso
WHERE ma.dosis LIKE '%IV%'
ORDER BY ma.fecha_hora_admin;


--4
SELECT p.nombre, p.ap_paterno, c.numero_cama, c.area, i.motivo_ingreso, i.nivel_gravedad, d.descripcion AS diagnostico
FROM Ingreso i
INNER JOIN Paciente p ON i.id_paciente = p.id_paciente
INNER JOIN Cama c ON i.id_cama = c.id_cama
LEFT JOIN Diagnostico d ON i.id_ingreso = d.id_ingreso
WHERE i.fecha_hora_egreso IS NULL
ORDER BY i.fecha_hora_ingreso;


--4 Consultas JOIN con agregación y agrupación
--____________________________________________

1--
SELECT c.area, COUNT(i.id_ingreso) AS total_ingresos
FROM Ingreso i
INNER JOIN Cama c ON i.id_cama = c.id_cama
GROUP BY c.area
ORDER BY total_ingresos DESC;


2--
SELECT m.especialidad, COUNT(a.id_atencion) AS total_atenciones
FROM Atencion_Medica a
INNER JOIN Medico m ON a.id_medico = m.id_medico
GROUP BY m.especialidad
ORDER BY total_atenciones DESC;


3--
SELECT med.nombre, med.via_administracion, COUNT(rd.id_detalle) AS veces_recetado
FROM Receta_Detalle rd
INNER JOIN Medicamento med ON rd.id_medicamento = med.id_medicamento
GROUP BY med.id_medicamento, med.nombre, med.via_administracion
ORDER BY veces_recetado DESC;


4--
SELECT i.nivel_gravedad, i.estado_egreso, COUNT(*) AS total
FROM Ingreso i
INNER JOIN Paciente p ON i.id_paciente = p.id_paciente
GROUP BY i.nivel_gravedad, i.estado_egreso
ORDER BY i.nivel_gravedad, total DESC;


--2 Consultas JOIN usando comparación, agregación y agrupación
--____________________________________________________________

--1
SELECT m.nombre, m.ap_paterno, m.ap_materno, m.especialidad, m.turno, COUNT(a.id_atencion) AS total_atenciones
FROM Medico m
INNER JOIN Atencion_Medica a ON m.id_medico = a.id_medico
WHERE m.turno IN ('Matutino', 'Vespertino')
GROUP BY m.id_medico, m.nombre, m.ap_paterno, m.especialidad, m.turno
HAVING COUNT(a.id_atencion) > 1
ORDER BY total_atenciones DESC;


--2
SELECT c.area, i.nivel_gravedad, COUNT(i.id_ingreso) AS total_ingresos
FROM Ingreso i
INNER JOIN Cama c ON i.id_cama = c.id_cama
WHERE i.nivel_gravedad IN ('Naranja', 'Rojo') AND i.fecha_hora_ingreso BETWEEN '2025-01-01' AND '2025-02-28 23:59:59'
GROUP BY c.area, i.nivel_gravedad
HAVING COUNT(i.id_ingreso) > 3
ORDER BY total_ingresos DESC;

