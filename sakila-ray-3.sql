USE sakila;

#1 How many films are there for each of the categories in the category table. 

SELECT * FROM sakila.category;
SELECT * FROM sakila.film_category;

SELECT c.name , COUNT(fc.film_id)
FROM sakila.category c
JOIN sakila.film_category fc
ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY c.name ASC;

#2 Display the total amount rung up by each staff member in August of 2005.

SELECT * FROM sakila.staff;
SELECT * FROM sakila.payment;

SELECT staff.staff_id, staff.first_name, last_name, COUNT(payment.amount) AS total_by_staff
FROM sakila.staff
JOIN sakila.payment
ON staff.staff_id = payment.staff_id
WHERE YEAR(payment.payment_date) = 2005 AND MONTH(payment.payment_date) = 8
GROUP BY staff.staff_id
ORDER BY staff.staff_id ASC;

#3 Which actor appeared in most films

SELECT * FROM sakila.actor;
SELECT * FROM sakila.film_actor;

SELECT actor.actor_id, actor.first_name, last_name, COUNT(film_actor.film_id) AS total_movies
FROM sakila.actor
JOIN sakila.film_actor
ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY total_movies DESC;


#4 Most active customer (the customer that has rented the most number of films)

SELECT * FROM sakila.customer;
SELECT * FROM sakila.rental;

SELECT customer.customer_id, customer.first_name, customer.last_name, COUNT(rental.customer_id) AS rental_counts
FROM sakila.customer
JOIN sakila.rental
ON customer.customer_id = rental.customer_id
GROUP BY customer.customer_id
ORDER BY rental_counts DESC Limit 1;

#5 Display the first and last names, as well as the address, of each staff member.

SELECT * FROM sakila.staff;
SELECT * FROM sakila.address;

SELECT staff.address_id, staff.first_name, staff.last_name, CONCAT(address.address,' ', address.district) AS staff_address
FROM sakila.staff
JOIN sakila.address
USING (address_id);

#6 List each film and the number of actors who are listed for that film.

SELECT * FROM sakila.film;
SELECT * FROM sakila.film_actor;

SELECT film.title, COUNT(DISTINCT film_actor.actor_id) AS number_actors
FROM sakila.film
JOIN sakila.film_actor
USING (film_id)
GROUP BY film.title;

#7 Using the tables payment and customer and the JOIN command, list the total paid by each customer.

SELECT * FROM sakila.payment;
SELECT * FROM sakila.customer;

SELECT customer.customer_id, customer.last_name AS customer_name, SUM(payment.amount) AS total_paid
FROM sakila.payment
JOIN sakila.customer
USING (customer_id)
GROUP BY customer.customer_id
ORDER BY customer_name ASC;

#8 List the titles of films per category.

SELECT * FROM sakila.film;
SELECT * FROM sakila.film_category;

SELECT film.title, film_category.category_id AS category
FROM sakila.film
JOIN sakila.film_category
USING (film_id);