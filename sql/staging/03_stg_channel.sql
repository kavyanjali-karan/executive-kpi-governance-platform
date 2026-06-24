/*
Purpose:
Marketing channel normalization.
*/

WITH source AS (

    SELECT *

    FROM raw_channel

),

cleaned AS (

    SELECT

        LOWER(channel_name)                  AS channel_name,

        LOWER(marketing_source)              AS marketing_source,

        campaign_type,

        paid_channel

    FROM source

)

SELECT *

FROM cleaned;