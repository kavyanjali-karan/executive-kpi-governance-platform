CREATE TABLE dim_product (

    product_key SERIAL PRIMARY KEY,

    product_id VARCHAR(50),

    product_name VARCHAR(100),

    product_category VARCHAR(100),

    subscription_plan VARCHAR(50),

    unit_price NUMERIC(12,2),

    is_active BOOLEAN

);