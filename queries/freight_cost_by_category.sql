SELECT
    p.product_category_name AS category,
    COUNT(oi.order_id) AS total_orders,
    ROUND(AVG(oi.price), 2) AS avg_item_price,
    ROUND(AVG(oi.freight_value), 2) AS avg_freight_cost,
    ROUND(100.0 * AVG(oi.freight_value) / AVG(oi.price), 2) AS freight_to_price_pct
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
WHERE p.product_category_name IS NOT NULL
GROUP BY p.product_category_name
HAVING COUNT(oi.order_id) > 50
ORDER BY freight_to_price_pct DESC
LIMIT 20;