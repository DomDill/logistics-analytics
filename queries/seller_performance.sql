SELECT
    oi.seller_id,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(CASE WHEN o.order_status = 'canceled' THEN 1 ELSE 0 END) AS canceled_orders,
    ROUND(100.0 * SUM(CASE WHEN o.order_status = 'canceled' THEN 1 ELSE 0 END)
          / COUNT(DISTINCT o.order_id), 2) AS cancel_rate_pct,
    SUM(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1 ELSE 0 END) AS late_deliveries,
    ROUND(100.0 * SUM(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1 ELSE 0 END)
          / NULLIF(COUNT(CASE WHEN o.order_status = 'delivered' THEN 1 END), 0), 2) AS late_rate_pct
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
GROUP BY oi.seller_id
HAVING COUNT(DISTINCT o.order_id) >= 30
ORDER BY late_rate_pct DESC
LIMIT 20;                