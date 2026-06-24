SELECT

100

-

(

COUNT(*) FILTER(

WHERE customer_id IS NULL

)

*100.0

/

COUNT(*)

)

AS data_quality_score

FROM dim_customer;