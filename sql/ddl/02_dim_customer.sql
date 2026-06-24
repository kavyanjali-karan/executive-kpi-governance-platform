CREATE TABLE dim_customer (

    customer_key SERIAL PRIMARY KEY,

    customer_id VARCHAR(50) UNIQUE NOT NULL,

    customer_name VARCHAR(100),

    customer_segment VARCHAR(50),

    acquisition_channel VARCHAR(50),

    country VARCHAR(50),

    region VARCHAR(50),

    signup_date DATE,

    is_active BOOLEAN

);