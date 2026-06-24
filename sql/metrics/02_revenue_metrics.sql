SELECT

SUM(revenue) total_revenue,

SUM(paid_customers) paid_customers,

ROUND(

SUM(revenue)/

NULLIF(SUM(paid_customers),0),

2

) revenue_per_customer

FROM revenue_mart;