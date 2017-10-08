BEGIN;
--
-- Create model Request
--
CREATE TABLE "requests_request" ("id" serial NOT NULL PRIMARY KEY, "title" varchar(250) NOT NULL, "description" text NOT NULL, "created_at" date NOT NULL, "start_at" date NULL, "completed" boolean NOT NULL);
--
-- Create model RequestItem
--
CREATE TABLE "requests_requestitem" ("id" serial NOT NULL PRIMARY KEY, "amount" integer NOT NULL, "item_id" integer NOT NULL, "request_id" integer NOT NULL);
--
-- Create model RequestOcupation
--
CREATE TABLE "requests_requestocupation" ("id" serial NOT NULL PRIMARY KEY, "amount" integer NOT NULL, "ocupation_id" integer NOT NULL, "request_id" integer NOT NULL);
--
-- Add field items to request
--
--
-- Add field ocupations to request
--
--
-- Add field risk_point to request
--
ALTER TABLE "requests_request" ADD COLUMN "risk_point_id" integer NOT NULL;
--
-- Add field volunteer to request
--
CREATE TABLE "requests_request_volunteer" ("id" serial NOT NULL PRIMARY KEY, "request_id" integer NOT NULL, "volunteer_id" integer NOT NULL);
ALTER TABLE "requests_requestitem" ADD CONSTRAINT "requests_requestitem_item_id_8cf1476a_fk_items_item_id" FOREIGN KEY ("item_id") REFERENCES "items_item" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "requests_requestitem" ADD CONSTRAINT "requests_requestitem_request_id_4fb52de5_fk_requests_request_id" FOREIGN KEY ("request_id") REFERENCES "requests_request" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "requests_requestitem_item_id_8cf1476a" ON "requests_requestitem" ("item_id");
CREATE INDEX "requests_requestitem_request_id_4fb52de5" ON "requests_requestitem" ("request_id");
ALTER TABLE "requests_requestocupation" ADD CONSTRAINT "requests_requestocup_ocupation_id_940dfdf0_fk_volunteer" FOREIGN KEY ("ocupation_id") REFERENCES "volunteers_ocupation" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "requests_requestocupation" ADD CONSTRAINT "requests_requestocup_request_id_cdec2d65_fk_requests_" FOREIGN KEY ("request_id") REFERENCES "requests_request" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "requests_requestocupation_ocupation_id_940dfdf0" ON "requests_requestocupation" ("ocupation_id");
CREATE INDEX "requests_requestocupation_request_id_cdec2d65" ON "requests_requestocupation" ("request_id");
CREATE INDEX "requests_request_risk_point_id_0121cea3" ON "requests_request" ("risk_point_id");
ALTER TABLE "requests_request" ADD CONSTRAINT "requests_request_risk_point_id_0121cea3_fk_risk_poin" FOREIGN KEY ("risk_point_id") REFERENCES "risk_points_riskpoint" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "requests_request_volunteer" ADD CONSTRAINT "requests_request_vol_request_id_3c8b55cf_fk_requests_" FOREIGN KEY ("request_id") REFERENCES "requests_request" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "requests_request_volunteer" ADD CONSTRAINT "requests_request_vol_volunteer_id_8ce3f89c_fk_volunteer" FOREIGN KEY ("volunteer_id") REFERENCES "volunteers_volunteer" ("id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "requests_request_volunteer" ADD CONSTRAINT "requests_request_volunte_request_id_volunteer_id_230d8e5c_uniq" UNIQUE ("request_id", "volunteer_id");
CREATE INDEX "requests_request_volunteer_request_id_3c8b55cf" ON "requests_request_volunteer" ("request_id");
CREATE INDEX "requests_request_volunteer_volunteer_id_8ce3f89c" ON "requests_request_volunteer" ("volunteer_id");
COMMIT;

