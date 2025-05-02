-- Max budget movie using subqueries

SELECT * FROM BolMovies WHERE budget = (SELECT MAX(budget) FROM BolMovies);


-- List of movies where actors name start with a letter

SELECT DISTINCT Actor FROM BolMovies WHERE Actor like "A%";

/*
We are using in because it returns multiple outputs
*/
SELECT * FROM BolMovies WHERE Actor IN (SELECT DISTINCT Actor FROM BolMovies WHERE Actor like "A%");

SELECT Actor,Genre,movie FROM BolMovies WHERE Actor IN (SELECT DISTINCT Actor FROM BolMovies WHERE Actor like "A%");


/*
Top 5 actors based on profit , we need all movies of that top 5 actors
*/

SELECT Actor, (sum(budget-revenue)) as profit FROM BolMovies GROUP by Actor ORDER BY profit DESC LIMIT 5;


-- the below means select actors from A because from is used
SELECT actor FROM (SELECT Actor, (sum(budget-revenue)) as profit FROM BolMovies GROUP by Actor ORDER BY profit DESC LIMIT 5) as A;


-- Final result
SELECT * FROM BolMovies WHERE Actor IN (SELECT actor FROM (SELECT Actor, (sum(budget-revenue)) as profit FROM BolMovies GROUP by Actor ORDER BY profit DESC LIMIT 5) as A);


/*
Example of correlated query: top most earned movie of each genre
*/

SELECT movie,Genre FROM BolMovies;

-- Profit of each movie
SELECT movie,Genre, (budget - revenue) AS profit FROM BolMovies;


SELECT movie,Genre, abs(budget - revenue) AS profit FROM BolMovies A 
WHERE (budget - revenue) = (SELECT MAX(budget - revenue) FROM BolMovies B WHERE(A.Genre = B.Genre)) ORDER BY profit DESC;


