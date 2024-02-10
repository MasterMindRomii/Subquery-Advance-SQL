-- Using Subquery with Select Statement 

-- Q1. Get the percantage of votes for each movie compared to the number of votes ?
-- Q2. Display all movie names, genre, score and avg(score) of genre ? 

-- Answer 1
SELECT name,(votes/(SELECT SUM(votes) FROM movies))*100 FROM movies;

-- Answer 2
SELECT name, genre, score, (SELECT AVG(score) FROM movies m2 WHERE m2.genre=m1.genre) FROM movies m1;

-- Using Subquery with From Statement 

-- Q1. Display average rating of all restrurants 
SELECT r_name,avg_rating FROM 
(SELECT r_id, AVG(restaurant_rating) AS avg_rating FROM orders
GROUP BY r_id) t1
JOIN restaurants t2 ON t1.r_id=t2.r_id;

-- Using Subquery with HAVING 

-- Q1. Find the genre having > avg score of all the movies 
SELECT genre,AVG(score)
FROM movies 
GROUP BY genre 
HAVING AVG(score) > (SELECT AVG(score) FROM movies);

-- Using Subquery with INSERT statement (i'm not making new table here just query)

INSERT INTO loyal_customer(user_id,name) 
SELECT t1.user_id,name FROM orders t1 
JOIN users t2 ON t1.user_id=t2.user_id 
GROUP BY user_id 
HAVING COUNT(*) > 3;

-- Using Subquery with UPDATE statement 
UPDATE loyal_users 
SET money = (SELECT MAX(money)*0.01 FROM orders GROUP BY user_id);

-- Using Subquery with DELETE statement 

DELETE FROM user 
WHERE user_id IN (SELECT user_id FROM users 
WHERE user_id NOT IN (SELECT DISTINCT(user_id) FROM users))
