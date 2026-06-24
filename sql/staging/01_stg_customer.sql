/*
Purpose:
Standardize customer dimension records.

Owner:
Business Intelligence Engineering
*/

WITH source AS (

    SELECT *

    FROM raw_customer

),

cleaned AS (

    SELECT

        TRIM(customer_id)                    AS customer_id,

        INITCAP(customer_name)               AS customer_name,

        UPPER(customer_segment)              AS customer_segment,

        LOWER(acquisition_channel)           AS acquisition_channel,

        UPPER(country)                       AS country,

        UPPER(region)                        AS region,

        signup_date,

        COALESCE(is_active,TRUE)             AS is_active

    FROM source

)

SELECT *

FROM cleaned;