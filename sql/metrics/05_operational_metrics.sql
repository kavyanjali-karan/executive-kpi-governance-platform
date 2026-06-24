SELECT

CURRENT_DATE refresh_date,

COUNT(*) total_records,

COUNT(DISTINCT customer_key) unique_customers,

SUM(revenue) revenue_loaded

FROM fact_customer_activity;