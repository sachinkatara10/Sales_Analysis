-- Q1>> How many total transactions are there ??
Select count(*) from  transactions ;

-- Q2>> How many unique customers do customer table have ???
select count(distinct customer_code) from customers; 
 
 -- Q3>> Show the transactions made in USD 
 select * from transactions where currency = 'USD';
 
 -- Q4>> Show all the transactions of the year 2020
  select  transactions.* , date.* from transactions
  inner join date on date.date = transactions.order_date  where year = 2020;
  
 -- Q5>> Total sales in the year 2020
 select  sum(sales_amount) from transactions 
 inner join date on date.date = transactions.order_date  where year = 2020;
  
 -- Q6>> Which city has highest sales overall and its value ?  
 select markets_name,sum(t.sales_amount) as total_sales from markets m 
 join transactions t on t.market_code =m.markets_code
 group by markets_name order by total_sales desc limit 1;
 
 -- Q7>> What are the total distinct products sold by  company ??
  SELECT count(distinct product_code) FROM products;
 
 -- Q8>> What are the top 5 revenue generating products in lucknow market ??
 select product_code,sum(sales_amount) from transactions  where market_code = "Mark008" group by product_code order by sum(sales_amount) desc limit 5;
 
 -- Q9>> Find total transactions  where sales amount is negative or zero ?
  select count(*) from transactions where sales_amount<=0;
  

  -- running query to find duplicate transactions becoz of inconsistency in currency names
  Select distinct(currency) from transactions;
  
  select count(*) from transactions where currency = 'INR';     -- These are the foul entries coz they are less in numbers 
  select count(*) from transactions where currency = 'INR\r';
