USE restaurant_db;

-- Objective 1: Explore menu table

# Q1(i) View the order_details table
# Q1(ii) What is the date range of the table?

# Q1(i)
SELECT * FROM order_details;

# Q1(ii)
# Min date
SELECT MIN(order_date) FROM order_details;

# Max date
SELECT MAX(order_date) FROM order_details;
# Answer: 2023-01-01 - 2023-03-31

# Q2(i) How many orders were made within this date range? 
# Q2(ii) How many items were ordered within this date range?

# Q2(i)
SELECT COUNT(DISTINCT order_id) AS Total_num_of_order FROM order_details;
# Answer: 5370 orders

# Q2(ii)
SELECT COUNT(order_details_id) AS Total_num_of_order FROM order_details;
# Answer: 12234 items

# Q3 Which orders had the most number of items?
SELECT 
	order_id,
    COUNT(item_id) AS num_item
FROM 
	order_details
GROUP BY order_id
ORDER BY num_item DESC, order_id
LIMIT 7;
# Answer: There are seven order_id(1957, 4305, 440, 443, 3473, 330, 2675) which has 14 items per order

# Q4 How many orders had more than 12 items?
SELECT COUNT(*) AS order_more_than_12_item FROM
(SELECT 
	order_id,
    COUNT(item_id) AS num_item
FROM 
	order_details
GROUP BY order_id
HAVING num_item > 12
ORDER BY num_item DESC, order_id) AS num_orders;
# Answer: 20 orders