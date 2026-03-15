SELECT
    strftime('%Y-%m', o.order_purchase_timestamp) AS order_month,
    COUNT(o.order_id) AS total_orders,
    SUM(CASE WHEN o.order_status = 'delivered' THEN 1 ELSE 0 END) AS delivered_orders,
    SUM(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date
        THEN 1 ELSE 0 END) AS late_orders,
    ROUND(100.0 * SUM(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date 
        THEN 1 ELSE 0 END)
          / NULLIF(SUM(CASE WHEN o.order_status = 'delivered'
                        AND o.order_delivered_customer_date IS NOT NULL
                        THEN 1 END), 0), 2) AS late_rate_pct
FROM orders o
WHERE o.order_purchase_timestamp IS NOT NULL
GROUP BY order_month
ORDER BY order_month ASC;                        
                            