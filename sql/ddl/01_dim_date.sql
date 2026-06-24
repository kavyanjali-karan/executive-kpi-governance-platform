CREATE TABLE dim_date (

    date_key INTEGER PRIMARY KEY,

    full_date DATE NOT NULL,

    day_of_month INTEGER,

    day_name VARCHAR(20),

    week_number INTEGER,

    month_number INTEGER,

    month_name VARCHAR(20),

    quarter_number INTEGER,

    year_number INTEGER,

    is_weekend BOOLEAN

);