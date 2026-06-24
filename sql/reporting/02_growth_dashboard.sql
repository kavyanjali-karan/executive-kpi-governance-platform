SELECT

channel_name,

SUM(visitors) visitors,

SUM(signups) signups,

SUM(activated_users) activated_users,

SUM(trial_users) trial_users,

SUM(paid_customers) paid_customers

FROM growth_mart

GROUP BY

channel_name

ORDER BY

SUM(revenue) DESC NULLS LAST;