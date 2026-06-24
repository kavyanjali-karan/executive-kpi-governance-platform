SELECT

customer_segment,

AVG(retention_rate) retention_rate

FROM retention_mart

GROUP BY customer_segment;