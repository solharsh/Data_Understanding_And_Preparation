/***********************************************
** File: Assignment2.sql
** Desc: Assignment 2
** Author: Harsh Solanki
** Date:
************************************************/
# Using the Sakila database, provide the SQL queries you used. If there is more than one solution, provide only one solution.
#################################### QUESTION 1 ################################

#QUESTION 1.1 - DONE
####################
# a) Show the list of databases.

SHOW DATABASES;

#QUESTION 1.2 - DONE
####################
# b) Select sakila database.

USE sakila;

#QUESTION 1.3 - DONE
####################
# c) Show all tables in the sakila database.

SHOW TABLES;

#QUESTION 1.4 - DONE
####################
# d) Show each of the columns along with their data types for the actor table.

DESCRIBE actor;

#QUESTION 1.5 - DONE
####################
# e) Show the total number of records in the actor table.

SELECT 
	COUNT(*) 
FROM 
	actor;

#QUESTION 1.6 - DONE
####################
# f) What is the first name and last name of all the actors in the actor table ?

SELECT 
	first_name,last_name 
FROM 
	actor;

#QUESTION 1.7 - DONE
####################
# g) Insert your first name and middle initial ( in the last name column ) into the actors table.

INSERT INTO `actor`
VALUES 
('201', 'NA', 'Harsh V', '2006-02-15 04:34:33');

#QUESTION 1.8 - DONE
####################
# h) Update your middle initial with your last name in the actors table.

INSERT INTO `actor`
VALUES 
('202', 'NA', 'V Solanki', '2006-02-15 04:34:33');

#QUESTION 1.9 - DONE
####################
# i) Delete the record from the actor table where the first name matches your first name.

DELETE FROM 
	actor
WHERE 
	first_name = 'Harsh';

#QUESTION 1.10 - DONE
####################
# j) Create a table payment_type with the following specifications and appropriate data types
# Table Name : “Payment_type”
# Primary Key: "payment_type_id”
# Column: “Type”
# Insert following rows in to the table: 1, “Credit Card” ; 2, “Cash”; 3, “Paypal” ; 4 , “Cheque”

CREATE TABLE `Payment_type` (
  `payment_type_id` VARCHAR(15) NOT NULL,
  `Type` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`payment_type_id`)
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;

INSERT INTO `Payment_type`
	(`Payment_type_id`,`Type`) 
VALUES 
('1','Credit Card'),
('2','Cash'),
('3','Paypal'),
('4','Cheque');

#QUESTION 1.11 - DONE
####################
# k) Rename table payment_type to payment_types.

RENAME TABLE Payment_type TO payment_types;

#QUESTION 1.12 - DONE
####################
# l) Drop the table payment_types.

DROP TABLE IF EXISTS `payment_types`;

################################## QUESTION 2 ################################
# a) List all the movies ( title & description ) that are rated PG-13.
#QUESTION 2.1 - DONE
####################

SELECT 
	title,description,rating
FROM 
	film 
WHERE
	rating = 'PG-13';

#QUESTION 2.2 - DONE
####################
# b) List all movies that are either PG OR PG-13 using IN operator.

SELECT 
	title,description,rating
FROM 
	`film` 
WHERE 
	`rating` IN ('PG','PG-13');

#QUESTION 2.3 - DONE
####################
# c) Report all payments greater than and equal to 2$ and Less than equal to 7$.
# Using conditional operator:
####################

SELECT 
	payment_id,amount
FROM 
	payment
WHERE 
	amount >= '2' AND amount <= '7';

# Using BETWEEN keyword:
########################

SELECT 
	payment_id,amount
FROM 
	Payment
WHERE 
	amount between 2 AND 7;

#QUESTION 2.4 - DONE
####################
# d) List all addresses that have phone number that contain digits 589, start with 140 or end with 589
# Note : write 3 different queries
#Below query is for my practice. As asked, separate queries are below this one under "In different queries below:" section

SELECT 
	address_id,address,district,city_id,phone
FROM 
	address
WHERE
	phone LIKE '%589%' 
    OR 
	phone LIKE '140%' 
	OR
	phone LIKE '%589';

#In different queries below:
############################
SELECT 
	address_id,address,district,city_id,phone
FROM 
	address
WHERE
	phone LIKE '%589%';
################################################    
SELECT 
	address_id,address,district,city_id,phone
FROM 
	address
WHERE
	phone LIKE '140%'; 
################################################
SELECT 
	address_id,address,district,city_id,phone
FROM 
	address
WHERE
	phone LIKE '%589';

#QUESTION 2.5 - DONE
####################
# e) List all staff members ( first name, last name, email ) who have no password.

SELECT 
	first_name,last_name,email 
FROM 
	staff
WHERE 
	password IS NULL;

#QUESTION 2.6 - DONE
####################
# f) Select all films that have title names like ZOO and rental duration greater than or equal to 4

SELECT 
	title, rental_duration
FROM 
	film
WHERE
	title LIKE '%zoo%'
AND
	rental_duration >=4;

#QUESTION 2.7 - DONE
####################
# g) What is the cost of renting the movie ACADEMY DINOSAUR for 2 weeks ? 
# Note : use of column alias
#• rental_duration: The length of the rental period, in days.
    
#Considering rental rate is per day basis

SELECT
	film_id,
	title,
	description,
	rental_rate,
	rental_duration, 
	(14 * rental_rate) AS cost_of_renting
FROM
	film
WHERE
	title = 'ACADEMY DINOSAUR';

#Considering rental rate is per 6-day basis

SELECT
	film_id,
	title,
	description,
	rental_rate,
	rental_duration, 
	(14 * (rental_rate/rental_duration)) AS cost_of_renting
FROM
	film
WHERE
	title = 'ACADEMY DINOSAUR';
    
#QUESTION 2.8 - DONE
####################
#h) List all unique districts where the customers, staff, and stores are located
# Note : check for NOT NULL values

SELECT 
	DISTINCT(district)
FROM 
	address
WHERE
    district IS NOT NULL AND DISTRICT !=' ';
	
#QUESTION 2.9 - DONE
####################
# i) List the top 10 newest customers across all stores

SELECT 
	customer_id, store_id, first_name, last_name, email, address_id
FROM
    customer
ORDER BY 
	customer_id DESC
LIMIT 10;

################################## QUESTION 3 ################################
#QUESTION 3.1 - DONE
####################
# a) Show total number of movies
#1000

SELECT 
	COUNT(*) as OVERALL_MOVIES
from 
	film; 

#QUESTION 3.2 - DONE
####################
# b) What is the minimum payment received and max payment received across all transactions ?
#USD 0 and USD 11.99

SELECT 
	MIN(amount) AS min_payment_received, MAX(amount) AS max_payment_received
FROM 
	payment;
    
#QUESTION 3.3 - DONE
####################
# c) Number of customers that rented movies between Feb-2005 and May-2005 ( based on payment date ).
        
	SELECT
		COUNT(DISTINCT(customer_id)) AS No_Of_Customers
	FROM
		payment
	WHERE 
		payment_date BETWEEN CAST('2005-02-01' AS DATE) AND CAST('2005-05-31' AS DATE);
        
   
#QUESTION 3.4 - DONE
####################
# d) List all movies where replacement_cost is greater than 15$ or rental_duration is between 6 and 10 days

SELECT  
	title, description, release_year, rental_duration, replacement_cost
FROM
	film
WHERE
	(replacement_cost>'15')
    OR	
    (rental_duration) BETWEEN 6 AND 10;

#QUESTION 3.5 - DONE
####################
# e) What is the total amount spent by customers for movies in the year 2005 ?
#Assuming that you are asking what is the total amount in the year '2005'    
SELECT 
	sum(amount) 
FROM 
	payment
WHERE 
  YEAR(payment_date) ='2005';
  
#Assuming that you are asking what is the total amount for movies that are released in the year '2005'
SELECT 
	sum(amount) FROM payment
UNION
SELECT 
	release_year FROM film
WHERE 
	release_year = '2005';
                       
#QUESTION 3.6 - DONE
####################
# f) What is the average replacement cost across all movies ?

SELECT 
	AVG(replacement_cost) AS AVERAGE_REPLACEMENT
FROM
	film; #19.98400

#QUESTION 3.7 - DONE
####################
# g) What is the standard deviation of rental rate across all movies ?

SELECT 
	STD(rental_rate) AS Standard_deviation_rental_rate
FROM 
	film; #1.6455698101265719

#QUESTION 3.8 - DONE
####################
# h) What is the midrange of the rental duration for all movies

SELECT 
    (MAX(rental_duration) + MIN(rental_duration)) / 2 AS midRange
FROM
    film; #5.0
        
########################## QUESTION 4 ##########################

#QUESTION 4.1 - DONE
####################
# a) List all customers that live in the Nepal

SELECT 
	customer_id,first_name,last_name,city,country
FROM 
	country 
	LEFT JOIN city USING (country_id) 
	LEFT JOIN address USING (city_id) 
	LEFT JOIN customer USING (address_id)
WHERE
	country = 'Nepal';

#QUESTION 4.2 - DONE
####################
# b) List all actors that appear in the movie titled Academy Dinosaur.

SELECT 
	actor_id,first_name,last_name,title
FROM 
	actor
	LEFT JOIN film_actor USING (actor_id) 
	LEFT JOIN film USING (film_id) 
WHERE 
	title = 'Academy Dinosaur';

#QUESTION 4.3 - DONE
####################
# c) What is the revenue generated by each customer ?

SELECT 
	customer_id,first_name,last_name,sum(amount)
FROM 
	customer
	LEFT JOIN payment USING (customer_id)
	GROUP BY customer_id;

#QUESTION 4.4 - DONE
####################
# d) List top 10 customers that rented the most movies.

SELECT 
	customer_id, first_name, last_name, count(customer_id) AS movies_rented
FROM 
	rental
LEFT JOIN customer USING (customer_id)
GROUP BY customer_id
ORDER BY movies_rented DESC
LIMIT 10;    

#QUESTION 4.5 - DONE
####################
# e) List the inventory available in store to rent for each of the movies

SELECT 
	film_id, count(film_id) AS avail_inventory, store_id
FROM 
	inventory
GROUP BY 
	film_id;

#QUESTION 4.6 - DONE
####################
# f) List the top zipcodes that have the highest rental activity

SELECT 
	postal_code, count(rental_id) AS total_rented
FROM 
	address
		LEFT JOIN customer USING (address_id)
        LEFT JOIN rental USING (customer_id)
GROUP BY postal_code
ORDER BY total_rented DESC
LIMIT 10; 

########################## QUESTION 5 ##########################
#QUESTION 5.1 - DONE
####################
# Note: For questions a, b, c below use a single query with a sub query
# a) List actors and customers whose first name is the same as the first name of the actor with ID 8

SELECT 
    a.actor_id,
	a.first_name,
	a.last_name, 
    c.customer_id,
    c.first_name,
	c.last_name
FROM 
actor a
JOIN
	customer c ON a.first_name=c.first_name
WHERE
    c.first_name IN (SELECT 
            first_name
        FROM
            actor
		WHERE 
			actor_id='8');

#QUESTION 5.2 - DONE
####################
# b) List customers and payment amounts, with payments greater than average payment amount
#average amount = 4.20

SELECT 
    customer_id,
    first_name,	
    last_name,	
    email,
    address_id,
    amount
FROM 
	customer
    JOIN payment USING (customer_id)
WHERE
    amount > (SELECT 
            AVG(amount)
        FROM
            payment);

#QUESTION 5.3 - DONE
####################
# c) List customers who have rented movies at least once
# Note: use IN clause with the sub query

SELECT 
    customer_id,
    first_name,
	last_name,
	email,
	address_id
FROM
    customer
WHERE	
    customer_id IN (SELECT 
            customer_id
        FROM
            rental);

#QUESTION 5.4 - DONE
####################
# d) Find the floor of the maximum, minimum and average payment amount 

SELECT 
	floor(max(amount)) AS max_floor,
    floor(min(amount)) AS min_floor,
    floor(avg(amount)) AS avg_floor
FROM 
	payment;
########################## QUESTION 6 ##########################
#QUESTION 6.1 - DONE
####################
# a) Create a view called actors_portfolio which contains information about actors
# and films ( including titles and category).

CREATE VIEW actors_portfolio AS
    SELECT 
		a.actor_id,
        f.film_id,
        a.first_name,
        a.last_name,
        f.title,
        e.category
    FROM
        film_actor d
            INNER JOIN
        film f ON f.film_id = d.film_id
            INNER JOIN
        actor a ON d.actor_id = a.actor_id
			INNER JOIN
		film_list e ON f.title=e.title
        
    SELECT 
    *
	FROM
    actors_portfolio;
    

#QUESTION 6.2 - DONE
####################
# b) Describe the structure of the view and query the view to get information on the actor ADAM GRANT

DESCRIBE actors_portfolio;
SELECT 
    actor_id, first_name, last_name, title, category
FROM
    actors_portfolio
WHERE
    first_name LIKE '%ADAM' AND last_name LIKE 'GRANT';

#QUESTION 6.3 - DONE
####################
# c) Insert a new movie titled Data Hero in Sci-Fi Category starring ADAM GRANT
# Note: If you see an error, explain why this is not permitted

INSERT INTO actors_portfolio(actor_id,first_name,last_name,title,category)
values(9999,'ADAM','GRANT','Data Hero','Sci-Fi');

#There is an error because the view is not insertable-into, meaning, for data integrity we do not allow addition to existing 
#dataset.
#to make the tables insertable we can create views with check option to ensure data consistency so that only valid data 
#can be written to the database

################################## QUESTION 7 (Optional Practice Questions) ############
#QUESTION 7.1 - DONE
####################
# a) Customers sorted by first name and last name in ascending order.

SELECT 
    first_name, last_name
FROM
    customer
ORDER BY 
	first_name ASC, last_name;

#QUESTION 7.2 - DONE
####################
# b) Group distinct addresses by district.

SELECT 
    address,
    district
 FROM
    address
GROUP BY district;

#QUESTION 7.3 - DONE
####################
		# c) Count of movies that are either G/NC-17/PG-13/PG/R grouped by rating.

SELECT 
	 count(title) AS Count_of_movies, rating
FROM 
	film
GROUP BY rating
HAVING rating='G'OR rating='NC-17'OR rating='PG-13'OR rating='PG'OR rating='R';

#QUESTION 7.4 - DONE
####################
# d) Number of addresses in each district.

SELECT 
	address, count(address) AS No_of_addresses, district
FROM 
	address
GROUP BY district;

#QUESTION 7.5 - DONE
####################
# e) Find the movies where rental rate is greater than 1$ and order result set by descending order.

SELECT 
	title, rental_rate
FROM 
	film
WHERE rental_rate>1
ORDER BY rental_rate DESC;

#QUESTION 7.6 - DONE
####################
# f) Top 2 movies that are rated R with the highest replacement cost.

SELECT 
	title, rating, replacement_cost
FROM 
	film
WHERE 
	rating='R' 
ORDER BY replacement_cost DESC
LIMIT 2;

#QUESTION 7.7 - DONE
####################
# g) Find the most frequently occurring (mode) rental rate across products.

SELECT 
    rental_rate AS `rental_rate_mode`
FROM
    film
GROUP BY 1
ORDER BY COUNT(1) DESC
LIMIT 1;

#QUESTION 7.6 - DONE
####################
# h) Find the top 2 movies with movie length greater than 50mins and which has commentaries as a special features.

SELECT 
	title, special_features, length
FROM 
	film
WHERE
	'length'>'50' AND special_features LIKE '%Commentaries'
LIMIT 2;

#QUESTION 7.7 - DONE
####################
# i) List the years with more than 2 movies released.

SELECT 
	release_year
FROM 
	film
HAVING 
	count(*)>2;

###ANOTHER WAY
SELECT
	release_year
FROM
	film
WHERE
	title IN (
		SELECT
			title
		FROM
			film
		GROUP BY
			release_year
		HAVING
			count(*) >= 2
	)

########################## QUESTION 8 (Optional Practice Questions) ##########################
#QUESTION 8.1 - DONE
####################
# a) Extract the street number ( characters 1 through 4 ) from customer addressLine1

SELECT 
    address,
    substring(address,1,4) AS one_to_four
FROM
    address;
    
## ANOTHER_WAY
SELECT LEFT(address, 4) as 'Street_no.' FROM address;

#QUESTION 8.2 - DONE
####################
# b) Find out actors whose last name starts with character A, B or C.

SELECT 
    last_name as "Last_name_with_ABC"
FROM
    actor
WHERE
    last_name REGEXP '^(A|B|C)';
    
##ANOTHER_WAY

SELECT last_name as "Last_name_with_ABC"
from actor
WHERE last_name LIKE 'A%' OR last_name LIKE 'B%' or last_name LIKE 'C%';

#QUESTION 8.3 - DONE
####################
# c) Find film titles that contains exactly 10 characters

SELECT 
    title as 'Exactly_10'
FROM
    film
WHERE
    title REGEXP '^.{10}$';  
    
##ANOTHER WAY

SELECT title as 'Exactly_10'
FROM film
WHERE LENGTH(title) = 10;

#QUESTION 8.4 - DONE
####################
# d) Format a payment_date using the following format e.g "22/1/2016"

SELECT DATE_FORMAT(payment_date, '%d-%m-%y') as New_Format
from payment;

#QUESTION 8.5 - DONE
####################
# e) Find the number of days between two date values rental_date & return_date

SELECT 
    rental_date,
    return_date,
    DATEDIFF(return_date, rental_date) AS number_Of_Days
FROM
    rental
ORDER BY number_Of_Days DESC;