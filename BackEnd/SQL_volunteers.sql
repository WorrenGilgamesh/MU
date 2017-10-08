BEGIN;
--
-- Create model Ocupation
--
CREATE TABLE "volunteers_ocupation" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(50) NOT NULL);
--
-- Create model Volunteer
--
CREATE TABLE "volunteers_volunteer" ("id" serial NOT NULL PRIMARY KEY, "avatar" varchar(300) NOT NULL, "nni" varchar(20) NOT NULL, "phone" varchar(20) NOT NULL, "mobility" boolean NOT NULL, "age" integer NOT NULL, "genre" varchar(10) NOT NULL, "blood_type" varchar(20) NOT NULL, "created_at" date NOT NULL, "ocupation_id" integer NOT NULL, "state_id" integer NOT NULL, "user_id" integer NOT NULL UNIQUE);
ALTER TABLE "volunteers_volunteer" ADD CONSTRAINT "volunteers_volunteer_ocupation_id_8d8c9cb1_fk_volunteer" FOREIGN KEY ("ocupation_id") REFERENCES "volunteers_ocupation" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "volunteers_volunteer" ADD CONSTRAINT "volunteers_volunteer_state_id_7f8eb8c9_fk_countries_state_id" FOREIGN KEY ("state_id") REFERENCES "countries_state" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "volunteers_volunteer" ADD CONSTRAINT "volunteers_volunteer_user_id_1b8ed0c2_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "volunteers_volunteer_ocupation_id_8d8c9cb1" ON "volunteers_volunteer" ("ocupation_id");
CREATE INDEX "volunteers_volunteer_state_id_7f8eb8c9" ON "volunteers_volunteer" ("state_id");
COMMIT;

