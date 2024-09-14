SELECT p.product_name, SUM(od.quantity * od.price_per_unit) AS total_sales
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC;
