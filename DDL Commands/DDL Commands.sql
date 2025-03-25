-- Create the database 
-- CREATE DATABASE IF NOT EXISTS sample;

-- Delete the Database
-- DROP DATABASE sample;

-- Create table 

CREATE TABLE IF NOT EXISTS users(
	id INT NOT NULL,
	name VARCHAR(255),
	email VARCHAR(255),
	PRIMARY KEY (id)
);

-- Delete TABLE
DROP TABLE users;
DROP TABLE orders;

-- Empty the TABLE
-- TRUNCATE TABLE users;

-- Inserting the Values in the db
INSERT INTO users VALUES (1 , "Anas", "anas@gmail.com");
INSERT INTO users VALUES (2 , "Umar", "umar@gmail.com");


-- Foreign key example

CREATE TABLE IF NOT EXISTS orders(
	order_id INT,
	id VARCHAR(255),
	order_name VARCHAR(255),
	PRIMARY KEY (order_id),
	FOREIGN KEY (id) REFERENCES users(id)
);

INSERT INTO orders VALUES (101 , 2, );

-- CHeck CONSTRAINT
CREATE TABLE IF NOT EXISTS students(
	std_id INT,
	name VARCHAR(255),
	age INT CHECK (age > 6 AND age<26 ),
	PRIMARY KEY (std_id)
);

INSERT INTO students VALUES (211, "Anas", 18);
INSERT INTO students VALUES (222, "Umar", 7);


-- Default constraints
CREATE TABLE IF NOT EXISTS passanger(
	p_id INT,
	name VARCHAR(255),
	residence VARCHAR(255) DEFAULT Indian,
	PRIMARY KEY (p_id)
);

INSERT INTO passanger VALUES (1, "Anas","Indian");
INSERT INTO passanger (p_id, name) VALUES (2, "Umar");
-- The above will default stored as Indian

-- DROP TABLE passanger;

-- AutoIncrement Example;

-- CREATE TABLE IF NOT EXISTS "passanger"(
-- 	p_id PRIMARY KEY AUTOINCREMENT , 
-- 	name VARCHAR(255)
-- );

INSERT INTO passanger VALUES (1, "Anas");


-- Alter Example

ALTER TABLE students ADD COLUMN "college" VARCHAR(255);
ALTER TABLE students DROP COLUMN "age";



