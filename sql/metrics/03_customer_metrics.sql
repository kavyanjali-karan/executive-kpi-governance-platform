SELECT

customer_segment,

COUNT(DISTINCT customer_id) customers,

SUM(revenue) revenue

FROM customer_mart

GROUP BY customer_segment;