-- Table Subquery 

-- Q1. Find the most profitable movie of each year ?
-- Q2. Find the highest rated movie of each genre votes cutoff of 25000 ?
-- Q3. Find the highest grossing movies of top 5 actor/director combo in terms of total gross income ?

-- Answer 1. 
-- Method 1. Using Subquery 
SELECT*FROM movies WHERE (year,gross-budget) IN (SELECT year, max(gross-budget) FROM movies 
GROUP BY year);

-- Answer 2.
SELECT * FROM movies 
WHERE(genre,score) IN (SELECT genre,MAX(score) FROM movies 
WHERE votes>25000
GROUP BY genre)
AND votes>25000;

-- Answer 3. 
WITH top_5 AS (SELECT star,director,MAX(gross) FROM movies
GROUP BY star,director 
ORDER BY SUM(gross) DESC LIMIT 5)
SELECT*FROM movies WHERE (star,director,gross) IN (SELECT * FROM top_5);
