/*
Purpose:
Retention reporting.
*/

SELECT

    d.full_date,

    c.customer_segment,

    SUM(f.paid_customers) active_customers,

    SUM(f.churned_customers) churned_customers,

    ROUND(

        1-

        (

            SUM(f.churned_customers)::numeric

            /

            NULLIF(SUM(f.paid_customers),0)

        ),

        4

    ) retention_rate

FROM fact_customer_activity f

JOIN dim_customer c

ON f.customer_key=c.customer_key

JOIN dim_date d

ON f.date_key=d.date_key

GROUP BY

    d.full_date,

    c.customer_segment;