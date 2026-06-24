/*
Purpose:
Executive revenue reporting.
*/

SELECT

    d.year_number,

    d.month_number,

    r.region_name,

    p.product_name,

    SUM(f.revenue) revenue,

    SUM(f.paid_customers) paid_customers

FROM fact_customer_activity f

JOIN dim_date d

ON f.date_key=d.date_key

JOIN dim_region r

ON f.region_key=r.region_key

JOIN dim_product p

ON f.product_key=p.product_key

GROUP BY

    d.year_number,

    d.month_number,

    r.region_name,

    p.product_name;