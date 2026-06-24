/*
Business Mart

Purpose:
Customer-level business reporting.

Grain:
One row per customer per reporting date.
*/

WITH activity AS (

    SELECT

        customer_key,

        date_key,

        SUM(revenue) revenue,

        SUM(paid_customers) paid_customers,

        SUM(churned_customers) churned_customers

    FROM fact_customer_activity

    GROUP BY

        customer_key,

        date_key

)

SELECT

    d.full_date,

    c.customer_id,

    c.customer_name,

    c.customer_segment,

    c.region,

    activity.revenue,

    activity.paid_customers,

    activity.churned_customers

FROM activity

INNER JOIN dim_customer c

ON activity.customer_key=c.customer_key

INNER JOIN dim_date d

ON activity.date_key=d.date_key;