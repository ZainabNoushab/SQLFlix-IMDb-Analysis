-- ================================================
-- SQLFlix: IMDb 1000 Movies Analysis
-- Author: Zainab Noushab
-- Date: June 2025
-- Description: This SQL script analyzes trends from the IMDb Top 1000 Movies
--              dataset. The insights include top-rated movies, frequent actors,
--              genre-wise ratings, duration trends, and more.
-- Tools Used: MySQL Workbench
-- Dataset Source: Kaggle (IMDb Top 1000 Movies by omarhanyyy)
-- ================================================

-- =============== BASIC LEVEL QUERIES ===============

-- 1. Top 10 Highest-Rated Movies
-- Insight: Showcases the most critically acclaimed movies in the dataset.
SELECT Title, Rate, Genre, Certificate 
FROM imdb
ORDER BY Rate DESC 
LIMIT 10;

-- 2. Top 5 Longest Movies
-- Insight: Identifies the movies with the longest screen time.
SELECT Title, CAST(SUBSTRING_INDEX(Duration, ' ', 1) AS UNSIGNED) AS DurationInMinutes, Genre 
FROM imdb 
ORDER BY DurationInMinutes DESC 
LIMIT 5;

-- 3. Sample Casts Display
-- Insight: Displays raw cast data to prepare for extraction.
SELECT Title, Cast 
FROM imdb 
LIMIT 5;

-- 4. Most Common Movie Certificates
-- Insight: Highlights the most frequent certification ratings.
SELECT Certificate, COUNT(*) AS Movie_Count
FROM imdb
GROUP BY Certificate
ORDER BY Movie_Count DESC;

-- 5. Most Common Durations
-- Insight: Identifies typical movie lengths in the dataset.
SELECT Duration, COUNT(*) AS Count
FROM imdb
GROUP BY Duration
ORDER BY Count DESC
LIMIT 5;

-- =============== INTERMEDIATE LEVEL QUERIES ===============

-- 6. Average Rating by Genre
-- Insight: Reveals how movie ratings vary by genre.
SELECT Genre, AVG(Rate) AS Avg_Rating
FROM imdb
GROUP BY Genre
ORDER BY Avg_Rating DESC;

-- 7. Genre + Certificate Pair Analysis
-- Insight: Explores the effect of certification on genre performance.
SELECT Genre, Certificate, COUNT(*) AS Count, AVG(Rate) AS AvgRating
FROM imdb
GROUP BY Genre, Certificate
ORDER BY AvgRating DESC
LIMIT 10;

-- 8. Top 5 Most Frequent Actors
-- Insight: Identifies actors who appear most often in the dataset.
-- Step 0: Drop table if already exists to avoid error
DROP TABLE IF EXISTS imdb_actors;

-- Step 1: Create imdb_actors table
CREATE TABLE imdb_actors (
  actor_name VARCHAR(255)
);

-- Step 2: Extract top 4 actors from each movie into the table
INSERT INTO imdb_actors (actor_name)
SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Cast, ',', 1), ',', -1)) FROM imdb
UNION
SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Cast, ',', 2), ',', -1)) FROM imdb
UNION
SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Cast, ',', 3), ',', -1)) FROM imdb
UNION
SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Cast, ',', 4), ',', -1)) FROM imdb;

-- Step 3: Count actor appearances across movies
SELECT actor_name, COUNT(*) AS appearances
FROM imdb_actors
GROUP BY actor_name
ORDER BY appearances DESC
LIMIT 5;

-- =============== ADVANCED LEVEL QUERIES ===============

-- 9. Top 3 Movies per Genre
-- Insight: Identifies the highest-rated titles for each genre.
WITH RankedMovies AS (
  SELECT 
    Title AS title,
    Genre AS genre,
    Rate AS rating,
    RANK() OVER(PARTITION BY Genre ORDER BY Rate DESC) AS genre_rank
  FROM imdb
)
SELECT * 
FROM RankedMovies
WHERE genre_rank <= 3
ORDER BY genre, genre_rank;

-- 10. Movies with Above-Average Ratings
-- Insight: Finds movies rated above the average IMDb rating

WITH avg_rating AS (
  SELECT AVG(Rate) AS avg_rate FROM imdb
)
SELECT Title, Rate
FROM imdb, avg_rating
WHERE Rate > avg_rate
ORDER BY Rate DESC;



-- 11. Most Frequent Certificates (Appearing More Than 20 Times)
-- Insight: Useful for identifying popular certification types in top movies

SELECT Certificate, COUNT(*) AS Count
FROM imdb
GROUP BY Certificate
HAVING COUNT(*) > 20
ORDER BY Count DESC;



-- ================================================
-- End of SQLFlix IMDb Analysis by Zainab Noushab
-- Thank you for reviewing my project!
-- ================================================
