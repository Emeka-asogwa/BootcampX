CREATE TABLE users (
  id INTEGER PRIMARY KEY, -- number
  name VARCHAR(255), -- string
  birth_year SMALLINT, -- smaller number
  member_since TIMESTAMP -- time stamp
);

-- -- #######################################
-- Alter table
-- -- ###############################################
ALTER TABLE users DROP COLUMN member_since;
ALTER TABLE users
ADD COLUMN name VARCHAR(255), 
ADD COLUMN  birth_year SMALLINT, 
ADD COLUMN  member_since TIMESTAMP;

-- -- #######################################
-- DROP TABLE
-- -- ###############################################
DROP TABLE IF EXISTS users CASCADE;

-- -- #######################################
-- Create table
-- -- ###############################################
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  birth_year SMALLINT NOT NULL,
  member_since TIMESTAMP NOT NULL DEFAULT Now()
);

-- -- #######################################
-- Update a column
-- -- ###############################################
ALTER TABLE users 
ALTER COLUMN member_since 
SET DEFAULT Now();

-- -- -- #######################################
-- -- insert values in the Table
-- -- -- ###############################################
INSERT INTO users (name, birth_year)
VALUES ('Susan Hudson', 2000),
('Malloy Jenkins', 1000);

-- -- #######################################
-- CREATE a Table
-- -- ###############################################
CREATE TABLE pets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  owner_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE
);
