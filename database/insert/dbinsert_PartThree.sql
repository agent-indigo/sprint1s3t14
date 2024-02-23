
-- select items which were orderd most based on their count 
WITH order_items AS
(
SELECT 
    o.order_id
    ,oi.order_item
    ,o.customer_id
    ,o.order_date
    ,o.total_amount total_order_amount
   
    ,COALESCE (m.promo_code, '0')
    ,m.menu_item_id
    , CASE 
        m.promo_code
        WHEN 'PROMO1' THEN	10.00
		WHEN 'PROMO2' THEN	15.00
		WHEN 'PROMO3' THEN	20.00
		WHEN 'PROMO4' THEN	25.00
		WHEN 'PROMO5' THEN	30.00
		ELSE 0
      END AS discount_percent
    ,oi.quantity
    , oi.unit_price
    , oi.unit_price * oi.quantity price_by_quantity

FROM orders o
  	INNER JOIN order_item oi
    	USING (order_id) 
    INNER JOIN menu_item m
    	USING (menu_item_id)
 ), 
 calculate_discount AS 
(
SELECT
 *
	  ,(price_by_quantity * discount_percent/100) AS calculated_discount -- compute discount as a percentage of the item price, some items appear more than one so use the  price by quantity
	  ,price_by_quantity - ((price_by_quantity * discount_percent/100)) AS discount_price 
	  ,(price_by_quantity - ((price_by_quantity * discount_percent/100))) * 0.15 hst -- compute hst on unit price after discount
FROM order_items
 ),
calculate_payment AS 
(
SELECT 
	* 
	, (discount_price + hst) as payment
FROM calculate_discount
)
INSERT INTO purchases 
( 
	order_id
	, customer_id
	, payment_date
	, quantity_purchased
	, total_order_amount
	, discount_applied
	, discount_price
	, total_hst
	, payment_amount
)
SELECT 
	order_id
	, customer_id
	, order_date payment_date
	, SUM(quantity) AS quantity_purchased
	, SUM(total_order_amount)  AS total_order_amount
	, SUM(calculated_discount) discount_applied
	, SUM(discount_price ) AS discount_price
	, SUM(hst) as total_hst
	, SUM(payment) AS payment_amount
FROM calculate_payment
GROUP BY 
	order_id
	, customer_id
	, order_date
;


-- payment enitity
-- Insert into payment details
INSERT INTO payment_details 
(
    customer_id,
    order_id,
    total_amount,
    payment_method,
    payment_date
)
SELECT 
    customer_id,
    order_id,
    payment_amount,
    CASE 
        -- use random function to assign payments methods to purchases
        WHEN random() < 0.3 THEN 'Credit Card'
        WHEN random() < 0.6 THEN 'Interac'
        ELSE 'PayPal'
    END AS payment_method,
    payment_date
FROM purchases;


 
