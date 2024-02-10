-- Corelated Subquires 

-- Q1. Find all the movies that have rating greater than avg. rating of movies with same genre ?
-- Q2. Find the fav food of each customers ?

-- Answer 1
SELECT * FROM movies m1 
WHERE score> (SELECT AVG(score) FROM movies m2 WHERE m1.genre=m2.genre)

-- Answer 2
USE subquery_zomato;
WITH fav_food AS (SELECT t2.user_id, name, COUNT(*) AS 'frequency', f_name
FROM users t1
JOIN orders t2 ON t1.user_id=t2.user_id
JOIN order_details t3 ON t2.order_id=t3.order_id
JOIN food t4 ON t3.f_id=t4.f_id
GROUP BY t2.user_id,t3.f_id)
SELECT*FROM fav_food f1 WHERE frequency = (SELECT MAX(frequency) FROM fav_food f2 WHERE f2.user_id=f1.user_i
