CREATE TABLE dim_channel (

    channel_key SERIAL PRIMARY KEY,

    channel_name VARCHAR(50),

    marketing_source VARCHAR(100),

    campaign_type VARCHAR(50),

    paid_channel BOOLEAN

);