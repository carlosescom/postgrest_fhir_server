drop database fhirbase;

create database fhirbase_v4;
create user teeb;
grant all privileges on database fhirbase_v4 to teeb;

create extension if not exists "uuid-ossp";


