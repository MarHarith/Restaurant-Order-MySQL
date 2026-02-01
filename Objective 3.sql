USE restaurant_db;

--  Objective 3: Analyze customer behavior

# Q1 Combine the menu_items and order_details tables into a single table
SELECT 
	* 
FROM 
	menu_items mi
		JOIN
	order_details od ON mi.menu_item_id = od.item_id;
    
# Q2(i) What were the least and most ordered items? 
# Q2(ii) What categories were they in?

# Q2(i)
# Least order item
SELECT 
	mi.item_name,
    COUNT(od.item_id) AS total_num_of_order
FROM 
	menu_items mi
		JOIN
	order_details od ON mi.menu_item_id = od.item_id
GROUP BY mi.item_name
ORDER BY total_num_of_order DESC
LIMIT 1;
# Answer: Hamburger(622)

# Most order item
SELECT
	mi.item_name,
    COUNT(od.item_id) AS total_num_of_order
FROM 
	menu_items mi
		JOIN
	order_details od ON mi.menu_item_id = od.item_id
GROUP BY item_name
ORDER BY total_num_of_order ASC
LIMIT 1;
# Answer: Chicken Tacos(123)

# Q3 What were the top 5 orders that spent the most money?
SELECT 
	od.order_id,
    SUM(mi.price) AS total_order_amount
FROM 
	menu_items mi
		JOIN
	order_details od 
		ON 
	mi.menu_item_id = od.item_id
GROUP BY od.order_id
ORDER BY total_order_amount DESC
LIMIT 5;
# Answer = 440(192.15), 192.15(191.05), 1957(190.10), 330(189.70), 2675(185.10)

# Q4 View the details of the highest spend order. Which specific items were purchased?
SELECT 
	od.order_id,
    od.item_id,
    mi.item_name
FROM 
	menu_items mi
		JOIN
	order_details od ON mi.menu_item_id = od.item_id
WHERE od.order_id = 440;

# Q5 View the details of the top 5 highest spend orders
# IN operator is use for multiple value
SELECT 
	od.order_id,
    od.item_id,
    mi.item_name
FROM 
	menu_items mi
		JOIN
	order_details od ON mi.menu_item_id = od.item_id
WHERE od.order_id IN (440,2075, 1957, 330, 2675);

	

    
