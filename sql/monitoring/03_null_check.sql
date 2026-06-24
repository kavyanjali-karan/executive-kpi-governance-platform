SELECT

COUNT(*) missing_customer_ids

FROM dim_customer

WHERE customer_id IS NULL;