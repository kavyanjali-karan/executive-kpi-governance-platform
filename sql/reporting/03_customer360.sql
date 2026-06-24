SELECT

customer_segment,

COUNT(DISTINCT customer_id) customers,

SUM(revenue) revenue,

AVG(retention_rate) retention_rate

FROM retention_mart

GROUP BY

customer_segment

ORDER BY

revenue DESC;