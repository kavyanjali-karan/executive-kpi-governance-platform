/*
Purpose:
Revenue standardization.
*/

WITH source AS (

    SELECT *

    FROM raw_revenue

),

cleaned AS (

    SELECT

        revenue_id,

        customer_id,

        product_id,

        transaction_date,

        ROUND(revenue_amount,2)              AS revenue,

        currency

    FROM source

)

SELECT *

FROM cleaned;