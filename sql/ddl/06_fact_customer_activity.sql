CREATE TABLE fact_customer_activity (

    activity_key BIGSERIAL PRIMARY KEY,

    date_key INTEGER,

    customer_key INTEGER,

    product_key INTEGER,

    channel_key INTEGER,

    region_key INTEGER,

    visitors INTEGER,

    signups INTEGER,

    activated_users INTEGER,

    trial_users INTEGER,

    paid_customers INTEGER,

    churned_customers INTEGER,

    revenue NUMERIC(14,2),

    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_date
        FOREIGN KEY (date_key)
        REFERENCES dim_date(date_key),

    CONSTRAINT fk_customer
        FOREIGN KEY (customer_key)
        REFERENCES dim_customer(customer_key),

    CONSTRAINT fk_product
        FOREIGN KEY (product_key)
        REFERENCES dim_product(product_key),

    CONSTRAINT fk_channel
        FOREIGN KEY (channel_key)
        REFERENCES dim_channel(channel_key),

    CONSTRAINT fk_region
        FOREIGN KEY (region_key)
        REFERENCES dim_region(region_key)

);