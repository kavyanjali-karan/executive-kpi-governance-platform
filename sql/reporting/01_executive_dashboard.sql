/*
Purpose:
Executive Command Center Dataset

Grain:
One row per reporting date.
*/

SELECT

    d.full_date,

    SUM(f.revenue)                           AS revenue,

    SUM(f.visitors)                          AS visitors,

    SUM(f.signups)                           AS signups,

    SUM(f.activated_users)                   AS activated_users,

    SUM(f.trial_users)                       AS trial_users,

    SUM(f.paid_customers)                    AS paid_customers,

    SUM(f.churned_customers)                 AS churned_customers,

    ROUND(

        SUM(f.revenue) /

        NULLIF(SUM(f.paid_customers),0),

        2

    ) AS revenue_per_customer

FROM fact_customer_activity f

JOIN dim_date d

ON f.date_key=d.date_key

GROUP BY

d.full_date

ORDER BY

d.full_date;