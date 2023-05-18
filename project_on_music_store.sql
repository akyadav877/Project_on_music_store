--Q1: Who is the senior most employee based on job title?
 select * from employee
  order by levels desc
  limit 1
  
  --Q2: which countries have the most invoices?
  
   select count(*), billing_country  from invoice
   group by billing_country
   order by count(*) desc
   
  -- Q3: What are the top 3 values of the total invoice?
   
   select total from invoice
   order by total desc
   limit 3
   
  -- Q4: whict city has the best customers? we would like to throw 
   --a promotional music Festival in the city we made the most money. write a query that returns one city that has 
   --the highest sum invoice totals. Return the city name & sum of all invoices totals.
    select sum(total) as invoice_total, billing_city
	from invoice
	group by billing_city
	order by invoice_total desc
	
	Q5: Who is the best customer? the customer who has spent 
	the most money will be declared the best customer. Write a query 
	that returns the person who has spent the most money.
	 
	select customer.customer_id, customer.first_name,customer.last_name,sum(invoice.total) as total
from customer join invoice on customer.customer_id=invoice.customer_id
	group by customer.customer_id
	order by total desc
	limit 1
	
	--Q6: write  query to return the email, first name , last name & genre of all Rock music listeners,
	--Return your list ordered alphabatically by email starting with A?
	 select distinct email,first_name, last_name
	 from customer join invoice on customer.customer_id=invoice.customer_id
	 join invoice_line on invoice.invoice_id=invoice_line.invoice_id
	 where track_id in(select track_id from track
					  join genre on track.genre_id=genre.genre_id
					  where genre.name like 'Rock')
					  order by email;
	
	
	--Q7: let's invite the artist who have the wrtten the most rock music in our dataset 
	--wrte a query that returns the artist name and total track count of the top 10 rock bands.
	
	select artist.artist_id, artist.name, count(artist.artist_id) as number_of_songs
	from track join album on album.album_id=track.album_id join artist on artist.artist_id= album.artist_id
	join genre on genre.genre_id=track.genre_id
	where genre.name like 'Rock'
	group by artist.artist_id
	order by number_of_songs desc
	limit 10
	
	--Q8: Return the all track name that have a song length longer than the average
	--song length.return the name and millisecond for each track. Order by the song length with the longest songs listed first
	
	select name, milliseconds
	from track 
	where milliseconds>(select avg(milliseconds)as avg_track_length
					   from track )
					   order by milliseconds desc
					   
					   
					   
	
	
	
	
   