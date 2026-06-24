/*
Purpose:
Standardize product catalog.
*/

WITH source AS (

    SELECT *

    FROM raw_product

),

cleaned AS (

    SELECT

        TRIM(product_id)                     AS product_id,

        product_name,

        UPPER(product_category)              AS product_category,

        subscription_plan,

        unit_price,

        COALESCE(is_active,TRUE)             AS is_active

    FROM source

)

SELECT *

FROM cleaned;