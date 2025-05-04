/*Find Customers who have never ordered*/

SELECT name FROM users
WHERE user_id NOT IN 
(SELECT user_id FROM orders);


/*Average price of each dish*/

SELECT f_id, avg(price) FROM menu GROUP BY f_id;


SELECT f_name, avg(price) AS "AveragePrice" 
FROM menu m 
JOIN food f 
ON m.f_id = f.f_id 
GROUP BY m.f_id;



/*
Find top Restraunt in terms of number of orders for a given month
*/

SELECT r_id, count(*) AS "TotalOrders" 
FROM orders
WHERE date LIKE "%-07-%"
GROUP BY r_id
ORDER BY "TotalOrders" DESC LIMIT 1;

-- July
SELECT r_name, count(*) AS "TotalOrders" 
FROM orders o
JOIN restaurants r
ON o.r_id = r.r_id
WHERE date LIKE "%-07-%"
GROUP BY o.r_id
ORDER BY "TotalOrders" DESC LIMIT 1;

-- May
SELECT r_name, count(*) AS "TotalOrders" 
FROM orders o
JOIN restaurants r
ON o.r_id = r.r_id
WHERE date LIKE "%-05-%"
GROUP BY o.r_id
ORDER BY "TotalOrders" DESC LIMIT 1;

/*
Restraunt with monthly sales > x
*/

SELECT * FROM orders WHERE date LIKE "%-06-%";


SELECT r_id,sum(amount) AS "Revenue" 
FROM orders
WHERE date LIKE "%-06-%"
GROUP BY r_id;


SELECT r_id,sum(amount) AS "Revenue" 
FROM orders
WHERE date LIKE "%-06-%"
GROUP BY r_id HAVING "Revenue" > 450;

SELECT r_name,sum(amount) AS "Revenue" 
FROM orders "o"
JOIN restaurants "r"
ON o.r_id =r.r_id
WHERE date LIKE "%-06-%"
GROUP BY o.r_id HAVING "Revenue" > 450;


/*
Show all orders with order details for a particular customer in particular date range
*/


SELECT * FROM orders WHERE user_id = (SELECT user_id FROM users WHERE name LIKE "Ankit");


SELECT * FROM orders 
WHERE user_id = (SELECT user_id FROM users WHERE name LIKE "Ankit")
AND date BETWEEN "2022-06-01" AND "2022-06-30";

SELECT * FROM orders "o"
JOIN restaurants "r"
ON o.r_id = r.r_id
WHERE o.user_id = (SELECT user_id FROM users WHERE name LIKE "Ankit")
AND date BETWEEN "2022-06-01" AND "2022-06-30";

-- Final Result
SELECT o.order_id,r.r_name,od.f_id,f.f_name FROM orders "o"
JOIN restaurants "r"
ON o.r_id = r.r_id
JOIN order_details "od"
ON o.order_id = od.order_id
JOIN food "f"
ON od.f_id = f.f_id
WHERE o.user_id = (SELECT user_id FROM users WHERE name LIKE "Nitish")
AND date BETWEEN "2022-06-01" AND "2022-06-30";


/*
Find restraunts with max repeated customers
*/

SELECT r_id,user_id,count(*) AS "visit" 
FROM orders 
GROUP BY r_id,user_id
HAVING "visit" >1;


SELECT r_id, COUNT(*) AS "Loyal Customer"
FROM (
SELECT r_id,user_id,count(*) AS "visit" 
FROM orders 
GROUP BY r_id,user_id
HAVING "visit" >1
) AS "t"
GROUP BY r_id;


SELECT r.r_name, COUNT(*) AS "Loyal Customer"
FROM (
SELECT r_id,user_id,count(*) AS "visit" 
FROM orders 
GROUP BY r_id,user_id
HAVING "visit" >1
) AS "t"
JOIN restaurants "r"
ON r.r_id = t.r_id
GROUP BY t.r_id
ORDER BY "Loyal Customer" DESC LIMIT 1;


/*
Month over month revenue growth of zomato
*/

SELECT date,
CASE
	WHEN date like "%-05-%" THEN "MAY"
	WHEN date like "%-06-%" THEN "JUNE"
	ELSE "JULY"
END AS "Month"
FROM orders;

SELECT date,
CASE
	WHEN date like "%-05-%" THEN "MAY"
	WHEN date like "%-06-%" THEN "JUNE"
	ELSE "JULY"
END AS "Month",
sum(amount) AS "revenue"
FROM orders
GROUP BY "Month";


/*
Customers favourite food
*/

SELECT * 
FROM orders "o"
JOIN order_details "od"
ON o.order_id = od.order_id;



SELECT * 
FROM orders "o"
JOIN order_details "od"
ON o.order_id = od.order_id
GROUP BY o.user_id,od.f_id;


SELECT o.user_id,od.f_id
FROM orders "o"
JOIN order_details "od"
ON o.order_id = od.order_id
GROUP BY o.user_id,od.f_id;


SELECT o.user_id,od.f_id,COUNT(*) AS "Frequency"
FROM orders "o"
JOIN order_details "od"
ON o.order_id = od.order_id
GROUP BY o.user_id,od.f_id;









