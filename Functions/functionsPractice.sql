Select * from BolMovies;


-- ALTER TABLE BolMovies Rename COLUMN "Movie Name" To "movie";
-- ALTER TABLE BolMovies Rename COLUMN "Lead Star" To "Actor";
-- ALTER TABLE BolMovies Rename COLUMN "Number of Screens" To "screens";
-- ALTER TABLE BolMovies Rename COLUMN "Revenue(INR)" To "revenue";
-- ALTER TABLE BolMovies Rename COLUMN "Budget(INR)" To "budget";

/*
Check whether the movie was profitable or not
*/

SELECT movie , Actor, (budget-revenue) AS "Income" FROM BolMovies;

SELECT movie , Actor, abs(budget-revenue) AS "Income" FROM BolMovies;



SELECT movie , Actor, round(revenue/7) AS "IncomeInFloat" FROM BolMovies;
SELECT movie , Actor, round((revenue/7),2) AS "IncomeInFloat" FROM BolMovies;

/*Concatination*/

SELECT movie, Concat(Actor,"-",Director) As "Crew" FROM BolMovies;
SELECT movie, Concat(Actor,"-",Director,"-",revenue) As "Crew" FROM BolMovies;

-- Lenght Function
SELECT movie, length(movie) as "CharLength" FROM BolMovies;

/*Substrings
Indexing starts from 1
*/
-- substr(name,start,end)
SELECT movie, substr(movie,4) as "Short" FROM BolMovies;
SELECT movie, substr(movie,4,8) as "Short" FROM BolMovies;
SELECT movie, substr(movie,1,8) as "Short" FROM BolMovies;

/*Mathematical Operations*/
-- Maximum;

SELECT movie,max(budget) FROM BolMovies;

-- Minimum
SELECT movie,min(budget) FROM BolMovies;
SELECT movie,min(revenue) FROM BolMovies;

-- All indias Movies Gross Income

SELECT sum(revenue) FROM BolMovies;
-- In terms of Crore
SELECT sum(revenue/10000000) As "InCrore" FROM BolMovies;
SELECT round(sum(revenue/10000000)) As "InCrore" FROM BolMovies;

/*Average Income of Movies in Bollywood*/

SELECT avg(revenue) As "Average_Income" from BolMovies;

SELECT round(avg(revenue),3) As "Average_Income" from BolMovies;
SELECT round(avg(revenue/10000000),3) As "Average_Income_In_CR" from BolMovies;

/*Count and Disting COunt*/

SELECT movie , Actor FROM BolMovies;


SELECT count(Actor) FROM BolMovies;

SELECT DISTINCT Actor FROM BolMovies;

SELECT count(DISTINCT Actor) FROM BolMovies;

/*OrderBy Clause*/

-- Order with Profit

SELECT movie, (revenue-budget) As profit FROM BolMovies;

-- Ascending order
SELECT movie, (budget - revenue) As profit FROM BolMovies ORDER BY profit;

-- Descending
SELECT movie, (budget - revenue) As profit FROM BolMovies ORDER BY profit DESC;

-- Top 5
SELECT movie, (budget - revenue) As profit FROM BolMovies ORDER BY profit DESC LIMIT 5;

-- Worst 5
SELECT movie, (budget - revenue) As profit FROM BolMovies ORDER BY profit LIMIT 5;


/*
Sorting based on genre and actors
*/

SELECT * FROM BolMovies ORDER BY Genre;


SELECT * FROM BolMovies ORDER BY movie, Genre DESC;



/*GROUPING*/

-- top 5 actors who have done maximum number of movies

SELECT Actor, count(*) AS num_movies FROM BolMovies GROUP BY Actor;


SELECT Actor, count(*) AS num_movies FROM BolMovies GROUP BY Actor ORDER by num_movies DESC;


SELECT Actor, count(*) AS num_movies FROM BolMovies GROUP BY Actor ORDER by num_movies DESC LIMIT 5;








