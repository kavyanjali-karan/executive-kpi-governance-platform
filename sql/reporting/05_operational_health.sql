SELECT

CURRENT_DATE report_date,

COUNT(*) total_records,

COUNT(DISTINCT customer_key) customers,

SUM(revenue) revenue_loaded

FROM fact_customer_activity;