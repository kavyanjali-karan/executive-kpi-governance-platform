/*
Purpose:
Executive command center dataset.
*/

SELECT

    d.full_date,

    SUM(f.revenue) revenue,

    SUM(f.visitors) visitors,

    SUM(f.signups) signups,

    SUM(f.paid_customers) paid_customers,

    SUM(f.churned_customers) churned_customers

FROM fact_customer_activity f

JOIN dim_date d

ON f.date_key=d.date_key

GROUP BY

    d.full_date;