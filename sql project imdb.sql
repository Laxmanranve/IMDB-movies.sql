SELECT * FROM project_movie_database.movies;
-- all data about movies
select * from movies;

-- all data  about directors
select * from directors;

-- how many movies in IMDB
select count(title)  as total_movie from movies;

-- find the 3 directors 'james camron' , 'luc besson' , 'john woo'
SELECT * 
FROM directors
WHERE name IN ('James Cameron', 'Luc Besson', 'John Woo');

-- find all directors name starting with 'steven'
select * from directors where name like 'steven%';

-- count of female directors here we consider '0' is female
select count(gender)  as total_female_directors from directors where gender=0;

-- find the  name of the tenth woman  directors
SELECT name
FROM directors
WHERE gender = 0
ORDER BY id
LIMIT 1 OFFSET 9;

-- what are three most popular movie
select * from movies  order by popularity desc limit 3;

-- what are the three most bankable movies
select * from movies order by revenue desc limit 3;

-- most awarded  average vote since january first 2000
SELECT *
FROM movies
WHERE vote_average = (SELECT MAX(vote_average) FROM movies)
   OR release_date = '2000-01-01';
 
 -- which movies were directed by brenda chapman
 SELECT movies.title
FROM movies
JOIN directors ON movies.director_id = directors.id; 
# where directors.name = 'Brenda Chapman';
 
 
 -- whose director made the most movies
 SELECT directors.name, COUNT(movies.title) AS movie_count
FROM directors
JOIN movies ON directors.id = movies.director_id
GROUP BY directors.id
ORDER BY movie_count DESC
LIMIT 1;

-- most bankable director
SELECT directors.name, max(movies.revenue)  as movie_revenue
FROM directors
JOIN movies ON directors.id = movies.director_id
GROUP BY directors.id
ORDER BY movie_revenue DESC
LIMIT 1;
 
 

