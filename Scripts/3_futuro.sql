/* 
EJECUTAR ESTO CONECTADO A LA BASE DE DATOS DE INTERÉS.

Desde la consola de psql se puede seleccionar 
a que base de datos conectarse usando el comando:

    \c nombre_bd

 */


/* Creación de roles */


CREATE SCHEMA futuro
    AUTHORIZATION futuro_admin;

CREATE SCHEMA futuro_priv
    AUTHORIZATION futuro_admin;

/* Para que todos nuestros cambios se realicen en nuestro esquema */
set schema 'futuro';
/* Instalar la extension necesaria para encriptar */
CREATE EXTENSION IF NOT EXISTS "pgcrypto" SCHEMA futuro;


/* Creamos nuestras tablas */

--
-- Create model Item
--
CREATE TABLE "items_type" (
"idItems_type" serial NOT NULL PRIMARY KEY, 
"name" varchar(100) NOT NULL, 
"type" varchar(20) NOT NULL);
--
-- Create model Risk
--
CREATE TABLE "rysk_type" (
"idrysk_type" serial NOT NULL PRIMARY KEY, 
"name" varchar(100) NOT NULL);
--
-- Create model occupation
--
CREATE TABLE "occupation" (
"idoccupation" serial NOT NULL PRIMARY KEY, 
"name" varchar(100) NOT NULL);
--
-- Create model Country
--
CREATE TABLE "countries_country" (
"idcountries_country" serial NOT NULL PRIMARY KEY, 
"iso" varchar(10) NOT NULL, 
"name" varchar(250) NOT NULL);
--
-- Create model Item
--
CREATE TABLE "itemsRequest" (
"idRequest" serial NOT NULL PRIMARY KEY, 
"iditems_type" integer references items_type(iditems_type)
"idtype" integer references items_type(idItems_type);
--
-- Create model State
--
CREATE TABLE "countries_state" (
"id" serial NOT NULL PRIMARY KEY, 
"name" varchar(250) NOT NULL, 
"country_id" integer references countries_country(idcountries_country));
--
-- Create model Volunteer
--
CREATE TABLE "volunteers_volunteer" (
"idvolunteers_volunteer" serial NOT NULL PRIMARY KEY, 
"mobility" bit NOT NULL, 
"nni" varchar(40) NOT NULL, 
"age" integer NOT NULL, 
"gender" varchar(10) NOT NULL, 
"blood_type" varchar(20) NOT NULL,
"phone" integer NOT NULL,
"ocupation_id" integer references occupation(idoccupation),
"created_at" date NOT NULL,  
"state_id" integer references countries_state(idcountries_state), 
"user_id" integer NOT NULL UNIQUE),
"email"  text not null unique check (email ~* '^.+@.+\..+$')
"f_creacion" timestamp default now(),
"ultima_actualizacion" timestamp default now(),;

create table futuro_priv.usuarios (
  id_usuario       integer primary key references futuro.volunteers_volunteer(idvolunteers_volunteer) on delete cascade,
  password_hash    text not null,
  f_creacion timestamp default now(),
  ultima_actualizacion timestamp default now()
);
--
-- Create model RiskPoint
--
CREATE TABLE "risk_points_riskpoint" (
"idrisk_points_riskpoint" serial NOT NULL PRIMARY KEY, 
"name" varchar(250) NOT NULL, 
"lat" double precision NOT NULL, 
"lon" double precision NOT NULL, 
"risk" varchar(15) NOT NULL, 
"description" text NOT NULL, 
"created_at" date NOT NULL,
"update_at" date NOT NULL);

--
-- Create model Request
--
CREATE TABLE "requests_request" (
"idRequests_request" serial NOT NULL PRIMARY KEY, 
"title" varchar(250) NOT NULL, 
"description" text NOT NULL, 
"created_at" date NOT NULL, 
"start_at" date NULL, 
"completed" boolean NOT NULL),
"risk_point_id" integer references risk_points_riskpoint(idrisk_points_riskpoint);


--
-- Create model RequestItem
--
CREATE TABLE "requests_item" (
"idRequests_requestitem" serial NOT NULL PRIMARY KEY, 
"amount" integer NOT NULL, 
"item_id" integer references items_type(idItems_type), 
"request_id" integer references itemsRequest(idRequest));
--
-- Create model RequestOcupation
--
CREATE TABLE "requests_request_ocupation" (
"idrequests_request_ocupation" serial NOT NULL PRIMARY KEY, 
"amount" integer NOT NULL, 
"ocupation_id" integer references occupation(idoccupation), 
"request_id" integer references requests_request(idrequests_request));
--
-- Add field volunteer to request
--
CREATE TABLE "requests_request_volunteer" (
"idrequests_request_volunteer" serial NOT NULL PRIMARY KEY, 
"request_id" integer references volunteers_volunteer(idridequests_request), 
"volunteer_id" integer references volunteers_volunteer(idvolunteers_volunteer));
