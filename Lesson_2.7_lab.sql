-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
USE sakila;
SELECT c.category_id, name,count(film_id) AS num_films
FROM category AS c
LEFT JOIN film_category AS f
ON c.category_id = f.category_id
GROUP BY c.category_id,name;

-- 2.Display the total amount rung up by each staff member in August of 2005.
SELECT s.staff_id, SUM(amount) AS total_amount
FROM staff AS s
LEFT JOIN payment AS p
ON s.staff_id = p.staff_id
WHERE year(payment_date) = 2005 AND month(payment_date)= 8
GROUP BY s.staff_id;


-- 3. Which actor has appeared in the most films?
SELECT a.actor_id, a.first_name, a.last_name, count(film_id) AS num_films
FROM actor AS a
LEFT JOIN film_actor AS fa
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY num_films DESC
LIMIT 1;


-- 4. Most active customer (the customer that has rented the most number of films)
SELECT r.customer_id, c.first_name,c.last_name,count(r.rental_id) AS num_rental_film
FROM rental AS r
LEFT JOIN customer AS c
ON r.customer_id = c.customer_id
GROUP BY r.customer_id, c.first_name,c.last_name
ORDER BY num_rental_film DESC
LIMIT 1;


-- 5.Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address
FROM staff AS s
LEFT JOIN address as a
ON s.address_id = s.address_id;

-- 6. List each film and the number of actors who are listed for that film.
SELECT f.title, f.film_id, count(fa.actor_id) AS num_actors
FROM film AS f
LEFT JOIN film_actor as fa
ON f.film_id = fa.film_id
GROUP BY f.title, f.film_id;

/*
7.Using the tables payment and customer and the JOIN command, 
list the total paid by each customer. List the customers alphabetically by last name.
*/
SELECT p.customer_id, c.first_name, c.last_name, SUM(amount) AS total_paid
FROM payment AS p
LEFT JOIN customer AS c
ON p.customer_id = c.customer_id
GROUP BY p.customer_id, c.first_name, c.last_name
ORDER BY c.last_name;

-- 8. List number of films per category.
SELECT c.category_id,name,count(film_id) AS num_films
FROM category AS c
LEFT JOIN film_category AS f
ON c.category_id = f.category_id
GROUP BY c.category_id,name;
