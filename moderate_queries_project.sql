-- Question Set 2 - Moderate
-- 1. Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
-- Return your list ordered alphabetically by email starting with A

SELECT DISTINCT c.email,c.first_name, c.last_name
FROM customer as c
JOIN invoice as i ON c.customer_id = i.customer_id
JOIN invoice_line as il ON i.invoice_id = il.invoice_id
WHERE track_id IN(
	SELECT track_id FROM track as t
	JOIN genre as g ON t.genre_id = g.genre_id
	WHERE g.name LIKE 'Rock'
)
ORDER BY email;


-- 2. Let's invite the artists who have written the most rock music in our dataset.
-- Write a query that returns the Artist name and total track count of the top 10 rock bands
select art.name,count(art.artist_id) as no_of_songs from track as t
join album as a on t.album_id=a.album_id
join artist as art on a.artist_id=art.artist_id
join genre as g on g.genre_id=t.genre_id
where g.name like 'Rock'
group by art.artist_id
order by no_of_songs desc
limit 10;


-- 3. Return all the track names that have song length longer than the average song length. 
-- Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first
select name,milliseconds from track
where milliseconds >(
	select avg(milliseconds) as average from track)
order by milliseconds desc;
