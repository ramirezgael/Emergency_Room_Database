# Emergency_Room_Database

Relational database system designed to manage the full operational workflow 
of a hospital emergency department, including patient admissions, medical 
and nursing care, prescriptions, medication administration, and staff management.

---

## Database Schema

The database consists of 14 tables organized by dependency level:

**Independent entities**
- `Paciente` — Patient records (CURP, affiliation number, personal data)
- `Medico` — Physicians (professional license, specialty, shift)
- `Enfermero` — Nurses (employee number, shift, assignment area)
- `Administrador` — Administrative staff
- `Cama` — Hospital beds (number, area: Urgencias, Observación, Reanimación, etc.)
- `Medicamento` — Medications (name, presentation, administration route)

**Dependent entities**
- `Contacto_Emergencia` — Emergency contacts linked to a patient
- `Ingreso` — Patient admission records (bed assignment, severity level, discharge status)
- `Diagnostico` — Diagnoses associated with an admission
- `Atencion_Medica` — Medical care events per admission
- `Atencion_Enfermeria` — Nursing care events per admission
- `Receta` — Prescriptions issued during an admission
- `Med_Administrado` — Medications actually administered during admission
- `Receta_Detalle` — Prescription line items (medication, dose, frequency)
  
---

## Repository Structure

- EsquemaBD.sql — Table definitions (CREATE TABLE)
- IntegridadBD.sql — Constraints: PKs, FKs, NOT NULL, CHECK, UNIQUE
- 1.1_Inserts.sql — 30 insertions per table
- 2_Update.sql — 2 updates per table (10 tables)
- 3_SELECT.sql — 5 queries per table using SELECT, WHERE, LIKE, WHERE IN, ORDER BY, COUNT(*), BETWEEN
- 4_Delete.sql — 2 deletions per table
- 5_DML_JOIN.sql — JOIN queries: pagination (LIMIT, OFFSET), composition (INNER, LEFT, RIGHT JOIN), GROUP BY, COUNT, renamed tables
- 6_DML_avanzado.sql — Advanced JOIN queries with comparison operators, aggregation, and combined grouping

---

## Technologies Used
- PostgreSQL
- SQL (DDL + DML)

---

## Authors
- Gael Alejandro Ramírez Reyes
- Cynthia Ramírez Sandoval

Developed as part of the Actuarial Science program at Facultad de Ciencias, UNAM.


