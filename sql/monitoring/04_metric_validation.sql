SELECT

SUM(revenue) revenue,

SUM(paid_customers) customers

FROM fact_customer_activity

HAVING SUM(revenue)>=0;