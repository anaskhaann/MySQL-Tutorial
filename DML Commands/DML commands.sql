
SELECT * FROM passengers;



SELECT Name,Sex,Survived FROM passengers;


-- Alias i.e my own name for tables

SELECT Name AS PassengerName , Sex AS Gender ,Survived AS ZindaYaMurda FROM passengers;

-- SibSp means siblings and Parch means parent child
-- Check how many family member in total

SELECT Name, SibSp + Parch AS FamilyMembers FROM passengers;

-- Constant example

SELECT Name, 10000 AS Compensation FROM passengers;

-- Distinct values from a single col (List of unique values in table

SELECT DISTINCT Sex FROM passengers;
SELECT DISTINCT Embarked FROM passengers;
SELECT DISTINCT Pclass FROM passengers;


-- Distinct values from a multiple col (Combination)

SELECT DISTINCT Pclass,Embarked FROM passengers;


-- Comparision operations

-- Give the list of all dead passengers
SELECT * FROM passengers WHERE Survived = 0;

-- List of all passenger from 1st class
SELECT * FROM passengers WHERE Pclass = 1;

-- List all people with age criteria
-- We are using text in age because our csv data has stored age in text format not integer
SELECT Name from passengers WHERE Age > "22";

-- And Operator
SELECT * from passengers WHERE (Pclass = 3 AND Survived=0);

SELECT * from passengers WHERE (Age BETWEEN "10" AND "20")




