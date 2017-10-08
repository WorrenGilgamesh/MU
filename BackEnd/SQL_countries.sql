BEGIN;
--
-- Create model Country
--
CREATE TABLE "countries_country" ("iso" varchar(10) NOT NULL PRIMARY KEY, "name" varchar(250) NOT NULL);
--
-- Create model State
--
CREATE TABLE "countries_state" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(250) NOT NULL, "country_id" varchar(10) NOT NULL);
CREATE INDEX "countries_country_iso_f7f258ff_like" ON "countries_country" ("iso" varchar_pattern_ops);
ALTER TABLE "countries_state" ADD CONSTRAINT "countries_state_country_id_85083d40_fk_countries_country_iso" FOREIGN KEY ("country_id") REFERENCES "countries_country" ("iso") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "countries_state_country_id_85083d40" ON "countries_state" ("country_id");
CREATE INDEX "countries_state_country_id_85083d40_like" ON "countries_state" ("country_id" varchar_pattern_ops);
COMMIT;
##[jetbrains/home/diego/PycharmProjects/futuro_mex_back/SQL_countries.sql
