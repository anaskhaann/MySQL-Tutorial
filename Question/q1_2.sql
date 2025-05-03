Create TABLE IF NOT EXISTS users (
user_id INT PRIMARY KEY,
name VARCHAR(50),
age INT
);


-- Q.1: To insert multiple values in database
INSERT INTO users (user_id, name, age) VALUES 
( 1 , "Anas", 21),
(2, "Umar", 8),
(3, "Salman", 54),
(4, "Shahrukh", 60),
(5, "Nazmul Hasan", 55);


/*-- Q.2: To add/delete multiple cols in database, we can use multiple add commands but this is not working in sqlite*/

ALTER TABLE users ADD email_id VARCHAR(25);

-- TO delete the column
ALTER TABLE users DROP email_id;



