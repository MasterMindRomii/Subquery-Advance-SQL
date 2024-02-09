USE subquery_zomato;

-- Row Subquery Questions 

-- Q1. Find all user who never ordered 
SELECT * FROM users
WHERE user_id NOT IN (SELECT DISTINCT(user_id) FROM orders );

-- Q2. Find all the movies made by top 3 director (IN terms of total gross margin) 
-- Method 1. USING with() - 
	WITH top_director AS (SELECT director FROM movies
	GROUP BY director
	ORDER BY SUM(gross) DESC LIMIT 3)
	SELECT * FROM movies WHERE director IN (SELECT* FROM top_director);

-- Method 2. Only Applicable for some database(Limitation) 
	SELECT*FROM movies WHERE director IN (SELECT director FROM movies
	GROUP BY director
	ORDER BY SUM(gross) DESC LIMIT 3);
    
-- Q3. Find all movies of all those actors whose filmography's rating > 8.5 (take 25000 votes as cutoff)
	SELECT * FROM movies 
	WHERE star IN (SELECT star FROM movies 
	WHERE votes>25000
	GROUP BY star 
	HAVING AVG(score)>8.5)
