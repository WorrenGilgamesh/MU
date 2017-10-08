BEGIN;
--
-- Create model RiskPoint
--
CREATE TABLE "risk_points_riskpoint" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(250) NOT NULL, "lat" double precision NOT NULL, "lon" double precision NOT NULL, "risk" varchar(15) NOT NULL, "description" jsonb NOT NULL, "created_at" date NOT NULL);
COMMIT;

