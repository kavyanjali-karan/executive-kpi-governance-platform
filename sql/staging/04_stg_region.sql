/*
Purpose:
Region standardization.
*/

WITH source AS (

    SELECT *

    FROM raw_region

),

cleaned AS (

    SELECT

        UPPER(region_name)                   AS region_name,

        UPPER(country)                       AS country,

        business_unit,

        sales_owner

    FROM source

)

SELECT *

FROM cleaned;