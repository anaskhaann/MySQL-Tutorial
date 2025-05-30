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















