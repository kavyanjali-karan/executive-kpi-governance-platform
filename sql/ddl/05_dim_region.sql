CREATE TABLE dim_region (

    region_key SERIAL PRIMARY KEY,

    region_name VARCHAR(50),

    country VARCHAR(50),

    business_unit VARCHAR(50),

    sales_owner VARCHAR(100)

);