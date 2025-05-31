CREATE TABLE students (
 student_id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    branch VARCHAR(255),
    marks INTEGER
);

INSERT INTO students (student_id,name,branch,marks)VALUES 
(1,'Nitish','EEE',82),
(2,'Rishabh','EEE',91),
(3,'Anukant','EEE',69),
(4,'Rupesh','EEE',55),
(5,'Shubham','CSE',78),
(6,'Ved','CSE',43),
(7,'Deepak','CSE',98),
(8,'Arpan','CSE',95),
(9,'Vinay','ECE',95),
(10,'Ankit','ECE',88),
(11,'Anand','ECE',81),
(12,'Rohit','ECE',95),
(13,'Prashant','MECH',75),
(14,'Amit','MECH',69),
(15,'Sunny','MECH',39),
(16,'Gautam','MECH',51)


SELECT * FROM students;

-- This will give us the number of rows equivalent to number of branches
SELECT *, avg(marks) FROM students GROUP BY branch;


-- This will give us all the rows and the average. This had created a window of the entire data and performed aggregation on that
SELECT *, avg(marks) OVER() FROM students;


-- If we need same result with average of the branch beside student marks then we can add a clause named PARTITION BY

SELECT *, avg(marks) OVER(PARTITION BY branch) FROM students;

/*
Q. find all students who have marks higher than there average branch marks
*/

-- with group by
SELECT * FROM (select name, marks, avg(marks) as "avg_marks"
from students 
GROUP by branch) as "t1"
WHERE t1.marks > t1.avg_marks

-- with window

SELECT * FROM (SELECT *, avg(marks) 
OVER(PARTITION BY branch) AS "branch_avg" 
FROM students) as t
WHERE t.marks > t.branch_avg


-- Rank()
/*
topper from each branch
*/

-- Overall topper
SELECT *,
rank() OVER(ORDER BY marks DESC) 
FROM students;

-- Branch wise
SELECT *,
rank() OVER(PARTITION BY branch ORDER BY marks DESC) 
FROM students;

-- dense_rank very similar to rank
SELECT *,
rank() OVER(PARTITION BY branch ORDER BY marks DESC) as "Rank",
dense_rank() OVER(PARTITION BY branch ORDER BY marks DESC) as "Dense Rank"
FROM students;

-- row number
SELECT *,
row_number() OVER(PARTITION BY branch)
FROM students;

-- use case for row_number(create roll number)
SELECT *,
CONCATINATE(branch,row_number() OVER(PARTITION BY branch)
FROM students;


/*
Example for first,last,nth values
*/


SELECT * FROM students;

-- first value
SELECT *, 
first_value(marks) OVER(ORDER BY marks DESC)
FROM students;

-- Last value
SELECT *, 
last_value(marks) OVER(ORDER BY marks DESC)
FROM students;

/*
Default frame: ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
*/

-- Last value with rows unbounded PRECEDING and FOLLOWING [for accurate result]
SELECT *, 
last_value(name) OVER(PARTITION BY branch ORDER BY marks DESC
								ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Last_Result_Value"
FROM students;

SELECT *, 
last_value(marks) OVER(PARTITION BY branch ORDER BY marks DESC
								ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Last_Result_Value"
FROM students;

/*
nth_value
*/

-- Name of 2nd topper of each branch
SELECT *, 
nth_value(name,2) OVER(PARTITION BY branch ORDER BY marks DESC
								ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "2nd Topper"
FROM students;


-- Q. Name of the topper of each branch and their marks

SELECT name,branch,marks FROM (SELECT *,
first_value(name) OVER(PARTITION BY branch ORDER BY marks DESC) AS "BranchTopperName",
first_value(marks) OVER(PARTITION BY branch ORDER BY marks DESC) AS "BranchTopperMarks"
FROM students)as "t"
WHERE t.name = t.BranchTopperName AND t.marks = BranchTopperMarks;


-- Q. Name of the last guy of each branch and their marks

SELECT name,branch,marks FROM (SELECT *,
last_value(name) OVER(PARTITION BY branch ORDER BY marks DESC
							  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "BranchLastName",
last_value(marks) OVER(PARTITION BY branch ORDER BY marks DESC
								ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "BranchLastMarks"
FROM students)as "t"
WHERE t.name = t.BranchLastName AND t.marks = BranchLastMarks;

/* Now we can see query is big so we can define a window function directly for frames and use them*/
-- This need to be done, skip for the time beign


/*LEAD AND LAG functions*/

SELECT *,
LAG(marks) OVER(ORDER BY marks DESC)
FROM students;


SELECT *,
LEAD(marks) OVER(ORDER BY marks DESC)
FROM students;
-- 
-- 
SELECT *,
LAG(marks) OVER(PARTITION BY branch ORDER BY marks DESC)
FROM students;


SELECT *,
LEAD(marks) OVER(PARTITION BY branch ORDER BY marks DESC)
FROM students;

