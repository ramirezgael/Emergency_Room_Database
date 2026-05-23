--Equipo 16:
--Ramírez Reyes Gael Alejandro
--Ramírez Sandoval Cynthia
--Practica 03, Actualización de datos, dos por tabla para 10 tablas

--Tabla Pacientes
--_______________

UPDATE Paciente SET correo = 'gael@urgencias.com' WHERE num_afiliacion = 'IMSS-001-2025';

UPDATE Paciente SET correo = 'cynthia@hospital.com' WHERE num_afiliacion = 'IMSS-002-2025';


--Tabla Medico
--____________

UPDATE Medico SET turno = 'Nocturno' WHERE cedula_prof = 'CED-MED-001';

UPDATE Medico SET especialidad = 'Traumatología' WHERE cedula_prof = 'CED-MED-002';


--Tabla Enfermero
--_______________

UPDATE Enfermero SET asignacion = 'Pediatria' WHERE num_empleado = 'ENF-001';

UPDATE Enfermero SET turno = 'Guardia' WHERE num_empleado = 'ENF-002';


--Tabla Administrador
--___________________

UPDATE Administrador SET turno = 'Nocturno' WHERE num_empleado = 'ADM-002';

UPDATE Administrador SET correo = 'alejandra@admin.com' WHERE num_empleado = 'ADM-001';



--Tabla Cama
--__________

UPDATE Cama SET area = 'Reanimacion' WHERE numero_cama = 'U-01';

UPDATE Cama SET area = 'Reanimacion' WHERE numero_cama = 'U-02';



--Tabla Medicamento
--_________________

UPDATE Medicamento SET presentacion = 'Tableta 650mg' WHERE nombre = 'Paracetamol';

UPDATE Medicamento SET presentacion = 'Tableta 500mg' WHERE nombre = 'Ibuprofeno';



--Tabla Contacto_Emergencia (Dos modificaciones a una misma tupla)
--_________________________

UPDATE Contacto_Emergencia SET nombre = 'Leticia Reyes', parentesco = 'Madre' WHERE id_paciente = '1';


--Tabla Ingreso (Dos modificaciones a una misma tupla)
--_____________

UPDATE Ingreso SET nivel_gravedad = 'Rojo', estado_egreso = 'En tratamiento' WHERE id_paciente = '2';


--Tabla Diagnostico
--_________________

UPDATE Diagnostico SET descripcion = 'Fractura diafisaria de fémur izquierdo. Requiere intervención quirúrgica ortopédica' WHERE id_diagnostico = '2';

UPDATE Diagnostico SET descripcion = 'Vómitos y síndrome coronario agudo sin elevación del ST. Se indica manejo médico con antiagregantes.' WHERE id_diagnostico = '1';


--TABLA Atencion_Medica
--_____________________

UPDATE Atencion_Medica SET fecha_hora = '2025-01-05 09:01:01' WHERE id_atencion = '1';

UPDATE Atencion_Medica SET fecha_hora = '2025-01-06 15:01:01' WHERE id_atencion = '2';



