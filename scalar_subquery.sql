-- Scalar Subquery Example 

USE subquery_prep;

-- Q1. Find the movies with Highest Profit
-- Q2. How many movies having rating > avg of all movies rating 
-- Q3. Find the highest rating movie of 2000
-- Q4. Find the highest rated movies among all the movies whose votes > avg votes of dataset avg votes

-- Answer 1 
-- Method 1. Using Subquery
SELECT*FROM movies where (gross-budget)=(SELECT Max(gross-budget) from movies);

-- Method 2. Without using subquery(Using Order By with Limit 1)
SELECT*FROM movies 
ORDER BY budget DESC LIMIT 1;

-- Answer 2
SELECT COUNT(*) FROM movies WHERE score>(SELECT AVG(score) FROM movies);

-- Answer 3
SELECT * FROM movies WHERE year=2000 AND score=(SELECT MAX(score) FROM movies WHERE year=2000);

-- Answer 4
-- Method 1. Using Subquery
SELECT*FROM movies WHERE votes = (SELECT MAX(votes) FROM movies WHERE votes >(SELECT AVG(votes) FROM movies));

-- Method 2. Using Order By with Limit 1
SELECT*FROM movies order by votes DESC LIMIT 1;
