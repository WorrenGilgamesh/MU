	BEGIN;
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
	"user_id" integer NOT NULL UNIQUE);
	---
	--- CHECAR USAUARIO
	---
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
CREATE TABLE "requests_requestocupation" (
	"id" serial NOT NULL PRIMARY KEY, 
	"amount" integer NOT NULL, 
	"ocupation_id" integer references occupation(idoccupation), 
	"request_id" integer references requests_request(idrequests_request));
--
-- Add field volunteer to request
--
CREATE TABLE "requests_request_volunteer" (
	"idrequests_request_volunteer" serial NOT NULL PRIMARY KEY, 
	"request_id" integer references volunteers_volunteer(idridequests_request), 
	"volunteer_id" integer references volunteers_volunteer(idvolunteers_volunteer);


create table person_account (
  person_id        integer primary key references person(id) on delete cascade,
  email            text not null unique check (email ~* '^.+@.+\..+$'),
  password_hash    text not null
);

comment on table person_account is 'Private information about a person’s account.';
comment on column person_account.person_id is 'The id of the person associated with this account.';
comment on column person_account.email is 'The email address of the person.';
comment on column person_account.password_hash is 'An opaque hash of the person’s password.';

create extension if not exists "pgcrypto";

create function register_person(
  first_name text,
  last_name text,
  email text,
  password text
) returns person as $$
declare
  person person;
begin
  insert into person (first_name, last_name) values
    (first_name, last_name)
    returning * into person;

  insert into person_account (person_id, email, password_hash) values
    (person.id, email, crypt(password, gen_salt('bf')));

  return person;
end;
$$ language plpgsql strict security definer;

comment on function register_person(text, text, text, text) is 'Registers a single user and creates an account in our forum.';

