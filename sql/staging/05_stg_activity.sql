/*
Purpose:
Prepare customer activity events.
*/

WITH source AS (

    SELECT *

    FROM raw_customer_activity

),

cleaned AS (

    SELECT

        activity_id,

        customer_id,

        product_id,

        event_date,

        visitors,

        signups,

        activated_users,

        trial_users,

        paid_customers,

        churned_customers

    FROM source

)

SELECT *

FROM cleaned;