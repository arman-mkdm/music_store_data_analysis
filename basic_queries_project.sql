-- Question Set 1 - Easy
-- 1. Who is the senior most employee based on job title?
SELECT * FROM EMPLOYEE
ORDER BY LEVELS DESC
LIMIT 1;

-- 2. Which countries have the most Invoices?
select billing_country,count(*) as total
from invoice group by billing_country order by total desc;

-- 3. What are top 3 values of total invoice?
select total from invoice order by total desc limit 3;

-- 4. Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money.
-- Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals
select billing_city,sum(total) as total from invoice
group by billing_city
order by total desc;

-- 5. Who is the best customer? The customer who has spent the most money will be declared the best customer.
-- Write a query that returns the person who has spent the most money
select * from customer;
select * from invoice;
select c.customer_id,c.first_name,c.last_name,sum(i.total) as total
from customer as c join invoice as i
on c.customer_id=i.customer_id
group by c.customer_id
order by total desc
limit 1;
