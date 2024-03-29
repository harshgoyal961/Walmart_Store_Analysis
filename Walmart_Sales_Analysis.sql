/* Q1:How many unique cities does the data have? */ 
select distinct(city)
from sales


/* Q2: In which city is each branch? */
select distinct city , branch from sales 


/* Q3: How many unique product lines does the data have? */
select distinct product_line
from sales


/* Q4: What is the most common payment method? */
select payment, count(*) as frequency
from sales
group by payment
order by frequency desc
limit 1


/* Q5: What is the most selling product line? */
select product_line, sum(quantity) as qty
from sales
group by product_line
order by qty desc


/* Q6: What is the total revenue by month? */
select month_name as month, round(sum(total),2) as total_sales
from sales
group by month
order by total_sales desc


/* Q7: What month had the largest COGS? */
select month_name as month, sum(cogs) as cogs
from sales
group by month
order by cogs desc 
limit 1


/* Q8: What product line had the largest revenue? */
select product_line, sum(total) as revenue
from sales
group by product_line
order by revenue desc
limit 1


/* Q9: What is the city with the largest revenue? */
select city, round(sum(total),2) as revenue
from sales
group by city
order by revenue desc
limit 1


/* Q10: What product line had the largest VAT? */
select product_line, avg(tax_pct) as vat
from sales
group by product_line
order by vat desc
limit 1


/* Q11: Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales */
select avg(quantity)
from sales

select product_line, case 
when avg(quantity) > 5.51 then 'Good'
else 'Bad'
end as Remark
from sales
group by product_line


/* Q12: Which branch sold more products than average product sold? */
select branch, sum(quantity) as qty
from sales
group by branch
having sum(quantity) > (select avg(quantity) from sales)


/* Q13: What is the most common product line by gender? */
select product_line, gender, count(gender) as gender_count
from sales
group by gender, product_line
order by gender_count desc


/* Q14: What is the average rating of each product line? */
select product_line, avg(rating) as average_rating
from sales
group by product_line


/* Q15: How many unique customer types does the data have? */
select distinct(customer_type)
from sales


/* Q16: Which customer type buys the most? */
select customer_type, count(*)
from sales
group by customer_type


/* Q17: What is the gender of most of the customers? */
select gender, count(*) as gender_count
from sales
group by gender
order by gender_count desc


/* Q18: What is the gender distribution per branch? */
select branch, gender, count(*) as gender_count
from sales
group by gender, branch
order by branch asc


/* Q19: Which time of the day do customers give most ratings? */
select time_of_day, avg(rating)
from sales
group by time_of_day
order by avg(rating) desc


/* Q20: Which time of the day do customers give most ratings per branch? */
select branch, time_of_day, avg(rating)
from sales
group by branch, time_of_day
order by branch asc


/* Q21: Which day fo the week has the best avg ratings? */
select day_name as day, avg(rating) 
from sales
group by day
order by avg(rating) desc
limit 1


/* Q22: Which day of the week has the best average ratings per branch? */
select branch, day_name as day, avg(rating) 
from sales
group by branch, day
order by avg(rating)


/* Q23: Number of sales made in each time of the day per weekday */
select day_name as day, sum(quantity) as sales
from sales
group by day
order by sales desc


/* Q24: Which of the customer types brings the most revenue? */
select customer_type, sum(total) as total_sales
from sales
group by customer_type
order by total_sales desc
limit 1


/* Q25: Which city has the largest tax/VAT percent? */
select city, sum(tax_pct) as total_tax
from sales
group by city
order by total_tax


/* Q26: Which customer type pays the most in VAT? */
select customer_type, sum(tax_pct) as total_tax
from sales
group by customer_type
order by total_tax desc
limit 1
