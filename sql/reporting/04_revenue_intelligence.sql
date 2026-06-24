SELECT

region_name,

product_name,

SUM(revenue) revenue,

SUM(paid_customers) paid_customers

FROM revenue_mart

GROUP BY

region_name,

product_name

ORDER BY

revenue DESC;