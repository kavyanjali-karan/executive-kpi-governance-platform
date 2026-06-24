/*
Purpose:
Growth funnel reporting.
*/

SELECT

    d.full_date,

    ch.channel_name,

    SUM(f.visitors) visitors,

    SUM(f.signups) signups,

    SUM(f.activated_users) activated_users,

    SUM(f.trial_users) trial_users,

    SUM(f.paid_customers) paid_customers

FROM fact_customer_activity f

JOIN dim_date d

ON f.date_key=d.date_key

JOIN dim_channel ch

ON f.channel_key=ch.channel_key

GROUP BY

    d.full_date,

    ch.channel_name;