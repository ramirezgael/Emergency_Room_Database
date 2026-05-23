--Equipo 16:
--Ramírez Reyes Gael Alejandro
--Ramírez Sandoval Cynthia
--Practica 03, 2 eliminaciones por cada tabla


--El orden de las eliminaciones es el siguiente: primero se elimina la información de las tablas más dependientes, después las más independientes, así evitaremos errores en el compilador.


--Tabla Med_Administrado
--______________________

DELETE FROM Med_Administrado WHERE id_med_admin = 30;
 
DELETE FROM Med_Administrado WHERE id_med_admin = 29;

--Se añadió ya que no se podía eliminar el medicamento con id_medicamento=30
DELETE FROM Med_Administrado WHERE id_medicamento = 30;


--Tabla Receta_Detalle
--____________________

DELETE FROM Receta_Detalle WHERE id_detalle = 30;
 
DELETE FROM Receta_Detalle WHERE id_detalle = 29;

--Se añadió por la misma razón de arriba, pues esta referenciado en ambas tablas
DELETE FROM Receta_Detalle WHERE id_medicamento = 30;

--Tabla Receta
--____________

DELETE FROM Receta WHERE id_receta = 30;
 
DELETE FROM Receta WHERE id_receta = 29;


--Tabla Diagnostico
--_________________

DELETE FROM Diagnostico WHERE id_diagnostico = 30;

DELETE FROM Diagnostico WHERE id_diagnostico = 29;


--Tabla Atencion_Medica
--_____________________

DELETE FROM Atencion_Medica WHERE id_atencion = 30;

DELETE FROM Atencion_Medica WHERE id_atencion = 29;


--Tabla Atencion_Enfermeria
--_________________________

DELETE FROM Atencion_Enfermeria WHERE id_aten_enf = 30;

DELETE FROM Atencion_Enfermeria WHERE id_aten_enf = 29;


--Tabla Ingreso
--_____________

DELETE FROM Ingreso WHERE id_ingreso = 30;

DELETE FROM Ingreso WHERE id_ingreso = 29;


--Tabla Contacto_Emergencia
--_________________________

DELETE FROM Contacto_Emergencia WHERE id_contacto = 30;

DELETE FROM Contacto_Emergencia WHERE id_contacto = 29;


--Tabla Paciente
--______________

DELETE FROM Paciente WHERE id_paciente = 30;
 
DELETE FROM Paciente WHERE curp = 'VAOF631205HDFRRR29';


--Tabla Medico
--____________

DELETE FROM Medico WHERE id_medico = 30;

DELETE FROM Medico WHERE cedula_prof = 'CED-MED-029';


--Tabla Enfermero
--_______________

DELETE FROM Enfermero WHERE id_enfermero = 30;

DELETE FROM Enfermero WHERE num_empleado = 'ENF-029';


--Tabla Administrador
--___________________

DELETE FROM Administrador WHERE id_admin = 30;

DELETE FROM Administrador WHERE num_empleado = 'ADM-029';


--Tabla Cama
--__________

DELETE FROM Cama WHERE id_cama = 30;

DELETE FROM Cama WHERE numero_cama = 'A-04';


--Tabla Medicamento
--_________________

DELETE FROM Medicamento WHERE id_medicamento = 30;
 
DELETE FROM Medicamento WHERE nombre = 'Propofol';









 





