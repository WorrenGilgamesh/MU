BEGIN;
--
-- Create model Item
--
CREATE TABLE "items_item" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(100) NOT NULL, "type" varchar(20) NOT NULL);
COMMIT;

