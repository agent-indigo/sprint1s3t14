-- Total revenue, orders, customers by year
SELECT 
	 EXTRACT(YEAR FROM order_date) AS year
	, COUNT(order_id) AS total_orders
	, SUM(total_amount) AS total_revenue
	, COUNT(DISTINCT customer_id) AS total_customers
FROM orders
GROUP BY  
    EXTRACT(YEAR FROM order_date) 
ORDER BY  total_revenue ;

-- Get a customer's preferences  for menu items
SELECT 
    c.customer_id
    , m.menu_item_id
    , COUNT(*) AS total_orders
FROM 
	orders o
JOIN 
	customer c USING (customer_id) 
JOIN 
	order_item oi USING(order_id) 
JOIN 
	menu_item m USING (menu_item_id) 
GROUP BY 
    c.customer_id
    , m.menu_item_id
ORDER BY total_orders DESC;

--- TOP 2 MOST purchased menu category
WITH best_selling_menu AS (
SELECT 
	mc."name" category_name
	, COUNT (*) total_orders
	, DENSE_RANK () OVER ( ORDER BY COUNT(*) DESC) category_rank
FROM 
	menu_item mi 
INNER JOIN 
	menu_category mc USING (category_id)
INNER JOIN 
	order_item oi USING (menu_item_id)
GROUP BY mc."name" 
)
SELECT 
*
, CASE 
	WHEN category_rank = 1 THEN 'Top selling MENU'
	WHEN category_rank = 2 THEN 'Second selling MENU'
  END AS sales_status

FROM best_selling_menu
WHERE category_rank <= 2
;

-- Top selling menu items

WITH best_selling_menu AS (
    SELECT 
        mc.name AS category_name
        ,mi.name AS menu_item
        ,COUNT(*) AS item_orders
        ,RANK() OVER (ORDER BY COUNT(*) DESC) AS item_rank
    FROM 
        menu_item mi 
    INNER JOIN 
        menu_category mc ON mi.category_id = mc.category_id
    INNER JOIN 
        order_item oi ON mi.menu_item_id = oi.menu_item_id
    GROUP BY 
        mc.name, mi.name -- Group by category and menu item names
)
SELECT 
    category_name
    ,menu_item
    ,item_orders
FROM 
    best_selling_menu
WHERE 
    item_rank <= 1 -- Select the top 1 selling items
ORDER BY 
    item_orders DESC; -- Order by item orders descending to find the best-selling item in each category

