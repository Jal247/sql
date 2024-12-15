-- AGGREGATE
/* 1. Write a query that determines how many times each vendor has rented a booth 
at the farmer’s market by counting the vendor booth assignments per vendor_id. */

SELECT vendor_id
,count (booth_number) as [Times_rented_booth]

FROM vendor_booth_assignments
group by vendor_id


/* 2. The Farmer’s Market Customer Appreciation Committee wants to give a bumper 
sticker to everyone who has ever spent more than $2000 at the market. Write a query that generates a list 
of customers for them to give stickers to, sorted by last name, then first name. 

HINT: This query requires you to join two tables, use an aggregate function, and use the HAVING keyword. */

  SELECT customer_last_name, customer_first_name, spent
FROM customer c
INNER JOIN (
  SELECT customer_id, sum(quantity*cost_to_customer_per_qty) as spent
  FROM customer_purchases cp
  GROUP BY customer_id
  HAVING sum(quantity*cost_to_customer_per_qty)>2000 
) x
ON c.customer_id = x.customer_id
ORDER BY c.customer_last_name, c.customer_first_name



--Temp Table
/* 1. Insert the original vendor table into a temp.new_vendor and then add a 10th vendor: 
Thomass Superfood Store, a Fresh Focused store, owned by Thomas Rosenthal

HINT: This is two total queries -- first create the table from the original, then insert the new 10th vendor. 
When inserting the new vendor, you need to appropriately align the columns to be inserted 
(there are five columns to be inserted, I've given you the details, but not the syntax) 

-> To insert the new row use VALUES, specifying the value you want for each column:
VALUES(col1,col2,col3,col4,col5) 
*/

DROP TABLE if EXISTS new_vendor;

/*make table */
CREATE Temp TABLE IF NOT EXISTS temp.new_vendor as
SELECT *   
FROM vendor;
INSERT INTO temp.new_vendor 
VALUES (10, 'Thomass Superfood Store', 'Fresh Focused', 'Thomas', 'Rosenthal');
SELECT * 
FROM new_vendor 



-- Date
/*1. Get the customer_id, month, and year (in separate columns) of every purchase in the customer_purchases table.

HINT: you might need to search for strfrtime modifers sqlite on the web to know what the modifers for month 
and year are! */

SELECT 
  customer_id,
  strftime('%m', market_date) as month,
  strftime('%Y', market_date) as year
FROM customer_purchases


/* 2. Using the previous query as a base, determine how much money each customer spent in April 2022. 
Remember that money spent is quantity*cost_to_customer_per_qty. 

HINTS: you will need to AGGREGATE, GROUP BY, and filter...
but remember, STRFTIME returns a STRING for your WHERE statement!! */

/* please note - added customer name with customer spent in decreasing order */
SELECT customer_first_name,customer_last_name,x.spent,x.month,x.year 
FROM customer c
INNER JOIN
(
SELECT customer_id, sum(quantity*cost_to_customer_per_qty) as spent,
  strftime('%m', market_date) as month,
  strftime('%Y', market_date) as year
FROM customer_purchases cp
 WHERE year = '2022'
  AND month = '04'
  GROUP BY customer_id
  )x
  ON c.customer_id = x.customer_id
  ORDER BY x.spent DESC

/* if adding columns are not allowed then please consider below code */

SELECT customer_id, sum(quantity*cost_to_customer_per_qty) as spent,
  strftime('%m', market_date) as month,
  strftime('%Y', market_date) as year
FROM customer_purchases cp
 WHERE year = '2022'
  AND month = '04'
  GROUP BY customer_id

