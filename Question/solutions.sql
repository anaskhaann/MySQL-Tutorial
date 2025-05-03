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


/*Q.3 - 2nd highest VALUES from database(we are using movies database to solve this query*/

SELECT * from movies;

SELECT * FROM movies ORDER BY score DESC;

SELECT * FROM movies ORDER BY score DESC LIMIT 5;

SELECT * FROM movies ORDER BY score DESC LIMIT 1,5;

-- Final result
SELECT * FROM movies ORDER BY score DESC LIMIT 1,1;

-- 2nd Lowest
SELECT * FROM movies ORDER BY score LIMIT 5;

SELECT * FROM movies ORDER BY score LIMIT 1,1;

/*q.4 Find max without order by.
1- first we are converting our varchar budget to integer
ALTER TABLE movies MODIFY COLUMN budget int;
2- nested queries will be used
*/

SELECT name,budget FROM movies WHERE budget = (SELECT MAX(budget) FROM movies);


