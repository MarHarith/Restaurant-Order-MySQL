USE restaurant_db;

-- Objective 1: Explore menu table

# Q1: Find the number of items on the menu
# View menu_items table
SELECT item_name FROM menu_items;

# Alternative (More preferable)
SELECT COUNT(*) AS Total_num_of_item_in_menu FROM menu_items;
# Answer: There is 32 items in the menu

# Q2: What is the least and most expensive items on the menu?
# Lease item on the menu
SELECT 
	item_name,
    price
FROM 
	menu_items
ORDER BY price ASC
LIMIT 1; 
# Answer: Edamame, $5

# Expensive item on the menu
SELECT 
	item_name,
    price
FROM 
	menu_items
ORDER BY price DESC
LIMIT 1; 
# Answer: Shrimp Scampi, $19.95

# Q3(i): How many italian dishes are on the menu?
# Q3(ii): What are the least and most expensive Italian dishes on the menu?

# Q3(i)
SELECT 
	item_name, 
    category
FROM 
	menu_items
WHERE category = "Italian";
# Answer: There are 9 italian dishes

# Q3(ii)
# Least italian dishes
SELECT 
	item_name,
    price
FROM
	menu_items
WHERE category = "Italian"
ORDER BY price ASC
LIMIT 2;
# Answer: Spaghetti & Fettuccine Alfredo, $14.50

# Expensive italian dishes
SELECT 
	item_name,
    price
FROM
	menu_items
WHERE category = "Italian"
ORDER BY price DESC
LIMIT 1;

# Checking Answer Q3
SELECT item_name, price FROM menu_items
WHERE category = "Italian"
ORDER BY price DESC;

# Q4(i) How many dishes are in each category? 
# Q4 (ii) What is the average dish price within each category?

# Q4(i)
SELECT 
	category,
    COUNT(item_name) AS num_of_dishes
FROM 
	menu_items
GROUP BY category;
# Answer: American(6), Asian(8), Mexican(9), Italian(9)

# Q4(ii)
SELECT 
	category,
    ROUND(AVG(price),2) AS avg_price
FROM
	menu_items
GROUP BY category;
# Answer: American(10.07), Asian(13.48), Mexican(11.80), Italian(16.75)

