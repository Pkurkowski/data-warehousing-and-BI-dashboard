SELECT TO_CHAR(order_date, 'YYYY-MM') AS month, SUM(total_amount) AS total_sales
FROM orders
GROUP BY TO_CHAR(order_date, 'YYYY-MM')
ORDER BY month;
