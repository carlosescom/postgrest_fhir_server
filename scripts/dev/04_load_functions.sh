#!/bin/sh
set -e

psql -h localhost -p 5435 -U postgres -d fhir_db \
< ./sql/functions/agenda/r_slots.sql

psql -h localhost -p 5435 -U postgres -d fhir_db \
< ./sql/functions/consultas/r_appointments_by_actor.sql
psql -h localhost -p 5435 -U postgres -d fhir_db \
< ./sql/functions/consultas/r_appointments_by_serviceCategory.sql
psql -h localhost -p 5435 -U postgres -d fhir_db \
< ./sql/functions/consultas/r_appointments_by_serviceType.sql
psql -h localhost -p 5435 -U postgres -d fhir_db \
< ./sql/functions/consultas/r_appointments_by_specialty.sql

psql -h localhost -p 5435 -U postgres -d fhir_db \
< ./sql/functions/consultorios/r_locations.sql
psql -h localhost -p 5435 -U postgres -d fhir_db \
< ./sql/functions/consultorios/r_locations_by_practitioner.sql

psql -h localhost -p 5435 -U postgres -d fhir_db \
< ./sql/functions/estudios_laboratorio/hemograma/r_diagnosticreport_blood_count.sql
psql -h localhost -p 5435 -U postgres -d fhir_db \
< ./sql/functions/estudios_laboratorio/urinalisis/r_diagnosticreport_urinalysis.sql
psql -h localhost -p 5435 -U postgres -d fhir_db \
< ./sql/functions/estudios_laboratorio/tomografía/r_diagnosticreport_imaging.sql

psql -h localhost -p 5435 -U postgres -d fhir_db \
< ./sql/functions/horarios/r_schedules.sql

psql -h localhost -p 5435 -U postgres -d fhir_db \
< ./sql/functions/médicos/r_generalPractitioners_of_patient.sql

psql -h localhost -p 5435 -U postgres -d fhir_db \
< ./sql/functions/pacientes/r_patients.sql
psql -h localhost -p 5435 -U postgres -d fhir_db \
< ./sql/functions/pacientes/r_patients_of_practitioner.sql