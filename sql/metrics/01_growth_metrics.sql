SELECT

SUM(signups) signup_count,

SUM(visitors) visitor_count,

ROUND(

SUM(signups)::numeric/

NULLIF(SUM(visitors),0),

4

) signup_rate

FROM growth_mart;