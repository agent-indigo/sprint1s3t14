-- Total revenue, orders, customers by year and month 

SELECT 
	 TO_CHAR(order_date, 'YYYY') AS year,
	 TO_CHAR(order_date, 'Month') AS month,
	 COUNT(order_id) AS total_orders,
	 SUM(total_amount) AS total_revenue,
	 COUNT(DISTINCT customer_id) AS total_customers
FROM orders
GROUP BY  
      TO_CHAR(order_date, 'YYYY'),
      TO_CHAR(order_date, 'Month')
ORDER BY  total_revenue;


-- Get a customer's preferences  for menu items
SELECT 
     (c.first_name ||' '|| last_name) as customer_name
    ,m."name" AS menu_name
    , COUNT(*) AS total_orders_made
FROM 
	orders o
JOIN 
	customer c USING (customer_id) 
JOIN 
	order_item oi USING(order_id) 
JOIN 
	menu_item m USING (menu_item_id) 
GROUP BY 
    (c.first_name ||' '|| last_name)
    , m.menu_item_id
ORDER BY total_orders_made DESC;


--- TOP 2 MOST ordered menu category
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
	WHEN category_rank = 1 THEN 'Top Ordered Menu Category'
	WHEN category_rank = 2 THEN 'Second Ordered Menu Category'
  END AS sales_status

FROM best_selling_menu
WHERE category_rank <= 2
;

-- Top selling menu items

WITH best_selling_menu AS (
    SELECT 
        mc.name AS menu_category
        ,mi.name AS menu_item
        ,COUNT(*) AS total_orders_made
    FROM 
        menu_item mi 
    INNER JOIN 
        menu_category mc ON mi.category_id = mc.category_id
    INNER JOIN 
        order_item oi ON mi.menu_item_id = oi.menu_item_id
    GROUP BY 
        mc.name, mi.name -- Group by category and menu item names
	ORDER BY 
   		menu_category
   		, total_orders_made DESC        
),
ranked_orders AS
(
SELECT 
   * 
   , RANK() OVER (PARTITION BY menu_category ORDER BY total_orders_made DESC) order_rankings-- rank the menu items in each category
 FROM 
 	best_selling_menu
 )
 SELECT 
 		menu_category
        ,menu_item
        ,total_orders_made
        , CASE
        	WHEN order_rankings = 1 THEN 'Top Selling Menu'
          END AS order_status
 FROM 
 	ranked_orders
 WHERE 
   order_rankings = 1; -- Select the top 1 selling item withim each category

