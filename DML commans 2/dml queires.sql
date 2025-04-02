SELECT * FROM movies;

-- In and notIn
/*
List of movies of specific genre
*/

SELECT name FROM movies WHERE genre like "ACTION" OR genre like "Drama";

-- In is used to club multiple or conditions

SELECT name FROM movies WHERE genre IN ("Action","Drama");
SELECT name FROM movies WHERE genre NOT IN ("Action","Drama");


-- Wildcard (Mostly used with Like keyword)
-- CHeck string in or not (%)
-- Start with 
SELECT name FROM movies WHERE name like "A%";
-- ENds with 
SELECT name FROM movies WHERE name like "%A";

-- COunt of Letters(_)
-- count names having 6 letters exactly
SELECT name from movies WHERE name like "______";
-- count names having 6 letters exactly starting with something
SELECT name from movies WHERE name like "A_____";
-- count names having 6 letters exactly ending with something
SELECT name from movies WHERE name like "____A";

-- Delete (Used to Delete A tuple with conditions)
DELETE FROM movies WHERE budget=0;

SELECT * from movies WHERE budget=0;



