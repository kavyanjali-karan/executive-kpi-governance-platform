import pandas as pd
import numpy as np
from faker import Faker
from pathlib import Path

fake = Faker()
np.random.seed(42)

BASE_DIR = Path(__file__).parent

RAW_DIR = BASE_DIR / "raw"
CURATED_DIR = BASE_DIR / "curated"
WAREHOUSE_DIR = BASE_DIR / "warehouse"

for d in [RAW_DIR, CURATED_DIR, WAREHOUSE_DIR]:
    d.mkdir(parents=True, exist_ok=True)

# --------------------------------------------------
# CONFIG
# --------------------------------------------------

N_CUSTOMERS = 5000
N_PRODUCTS = 25
N_REGIONS = 12

START_DATE = "2024-01-01"
END_DATE = "2025-12-31"

# --------------------------------------------------
# CUSTOMER MASTER
# --------------------------------------------------

segments = [
    "Enterprise",
    "MidMarket",
    "SMB"
]

segment_probs = [
    0.20,
    0.35,
    0.45
]

industries = [
    "Technology",
    "Healthcare",
    "Retail",
    "Finance",
    "Manufacturing",
    "Education"
]

sizes = [
    "Small",
    "Medium",
    "Large"
]

customers = []

for i in range(1, N_CUSTOMERS + 1):

    customers.append({
        "customer_id": f"CUST{i:05}",
        "company_name": fake.company(),
        "segment": np.random.choice(
            segments,
            p=segment_probs
        ),
        "industry": np.random.choice(
            industries
        ),
        "company_size": np.random.choice(
            sizes
        ),
        "signup_date": fake.date_between(
            start_date="-5y",
            end_date="-30d"
        )
    })

customer_df = pd.DataFrame(customers)

customer_df.to_csv(
    RAW_DIR / "customer_master.csv",
    index=False
)

# --------------------------------------------------
# PRODUCT MASTER
# --------------------------------------------------

families = [
    "Analytics",
    "Data Platform",
    "Automation",
    "Governance"
]

products = []

for i in range(1, N_PRODUCTS + 1):

    family = np.random.choice(
        families
    )

    products.append({
        "product_id": f"PROD{i:03}",
        "product_family": family,
        "product_line": f"{family} Suite",
        "product_name": f"{family} Product {i}"
    })

product_df = pd.DataFrame(products)

product_df.to_csv(
    RAW_DIR / "product_master.csv",
    index=False
)

# --------------------------------------------------
# REGION MASTER
# --------------------------------------------------

regions = [
    "North America",
    "South America",
    "Europe",
    "UK",
    "Middle East",
    "India",
    "APAC",
    "Australia",
    "Japan",
    "Singapore",
    "Africa",
    "Nordics"
]

region_rows = []

for i, region in enumerate(regions, start=1):

    region_rows.append({
        "region_id": f"R{i:02}",
        "region_name": region
    })

region_df = pd.DataFrame(region_rows)

region_df.to_csv(
    RAW_DIR / "region_master.csv",
    index=False
)

# --------------------------------------------------
# CUSTOMER ACTIVITY
# --------------------------------------------------

months = pd.date_range(
    START_DATE,
    END_DATE,
    freq="MS"
)

activity_rows = []

for month in months:

    sample_customers = customer_df.sample(
        1250,
        replace=False
    )

    for _, customer in sample_customers.iterrows():

        product = product_df.sample(1).iloc[0]
        region = region_df.sample(1).iloc[0]

        if customer["segment"] == "Enterprise":
            revenue = np.random.randint(
                4000,
                25000
            )
        elif customer["segment"] == "MidMarket":
            revenue = np.random.randint(
                1500,
                9000
            )
        else:
            revenue = np.random.randint(
                300,
                3000
            )

        transactions = np.random.randint(
            1,
            25
        )

        active_flag = np.random.choice(
            [1,0],
            p=[0.93,0.07]
        )

        retained_flag = np.random.choice(
            [1,0],
            p=[0.90,0.10]
        )

        expansion_revenue = round(
            revenue *
            np.random.uniform(0,0.20),
            2
        )

        churn_revenue = round(
            revenue *
            np.random.uniform(0,0.05),
            2
        )

        activity_rows.append({
            "report_month":
                month.strftime("%Y-%m"),
            "customer_id":
                customer["customer_id"],
            "product_id":
                product["product_id"],
            "region_id":
                region["region_id"],
            "revenue":
                revenue,
            "transactions":
                transactions,
            "active_flag":
                active_flag,
            "retained_flag":
                retained_flag,
            "expansion_revenue":
                expansion_revenue,
            "churn_revenue":
                churn_revenue
        })

activity_df = pd.DataFrame(
    activity_rows
)

activity_df.to_csv(
    RAW_DIR /
    "customer_activity.csv",
    index=False
)

# --------------------------------------------------
# DATE DIMENSION
# --------------------------------------------------

dates = pd.date_range(
    START_DATE,
    END_DATE,
    freq="D"
)

dim_date = pd.DataFrame({
    "date": dates
})

dim_date["date_key"] = (
    dim_date["date"]
    .dt.strftime("%Y%m%d")
    .astype(int)
)

dim_date["year"] = (
    dim_date["date"].dt.year
)

dim_date["quarter"] = (
    dim_date["date"].dt.quarter
)

dim_date["month"] = (
    dim_date["date"].dt.month
)

dim_date["month_name"] = (
    dim_date["date"].dt.month_name()
)

dim_date.to_csv(
    CURATED_DIR /
    "dim_date.csv",
    index=False
)

# --------------------------------------------------
# DIM CUSTOMER
# --------------------------------------------------

dim_customer = customer_df.copy()

dim_customer.insert(
    0,
    "customer_key",
    range(
        1,
        len(dim_customer)+1
    )
)

dim_customer.to_csv(
    CURATED_DIR /
    "dim_customer.csv",
    index=False
)

# --------------------------------------------------
# DIM PRODUCT
# --------------------------------------------------

dim_product = product_df.copy()

dim_product.insert(
    0,
    "product_key",
    range(
        1,
        len(dim_product)+1
    )
)

dim_product.to_csv(
    CURATED_DIR /
    "dim_product.csv",
    index=False
)

# --------------------------------------------------
# DIM REGION
# --------------------------------------------------

dim_region = region_df.copy()

dim_region.insert(
    0,
    "region_key",
    range(
        1,
        len(dim_region)+1
    )
)

dim_region.to_csv(
    CURATED_DIR /
    "dim_region.csv",
    index=False
)

# --------------------------------------------------
# FACT CUSTOMER ACTIVITY
# --------------------------------------------------

customer_lookup = dict(
    zip(
        dim_customer.customer_id,
        dim_customer.customer_key
    )
)

product_lookup = dict(
    zip(
        dim_product.product_id,
        dim_product.product_key
    )
)

region_lookup = dict(
    zip(
        dim_region.region_id,
        dim_region.region_key
    )
)

fact = activity_df.copy()

fact["customer_key"] = (
    fact["customer_id"]
    .map(customer_lookup)
)

fact["product_key"] = (
    fact["product_id"]
    .map(product_lookup)
)

fact["region_key"] = (
    fact["region_id"]
    .map(region_lookup)
)

fact.insert(
    0,
    "activity_key",
    range(
        1,
        len(fact)+1
    )
)

fact.to_csv(
    CURATED_DIR /
    "fact_customer_activity.csv",
    index=False
)

# --------------------------------------------------
# KPI TARGETS
# --------------------------------------------------

targets = pd.DataFrame({
    "month":
        months.strftime("%Y-%m"),
    "revenue_target":
        np.random.randint(
            1500000,
            2500000,
            len(months)
        ),
    "retention_target":
        np.random.randint(
            88,
            95,
            len(months)
        ),
    "active_customer_target":
        np.random.randint(
            3000,
            5000,
            len(months)
        )
})

targets.to_csv(
    WAREHOUSE_DIR /
    "kpi_targets.csv",
    index=False
)

# --------------------------------------------------
# GOVERNANCE CALENDAR
# --------------------------------------------------

calendar = pd.DataFrame({
    "event_date":[
        "2024-03-31",
        "2024-06-30",
        "2024-09-30",
        "2024-12-31",
        "2025-03-31",
        "2025-06-30",
        "2025-09-30",
        "2025-12-31"
    ],
    "event_name":[
        "Q1 Review",
        "Q2 Review",
        "Q3 Review",
        "Q4 Review",
        "Q1 Review",
        "Q2 Review",
        "Q3 Review",
        "Q4 Review"
    ]
})

calendar.to_csv(
    WAREHOUSE_DIR /
    "governance_calendar.csv",
    index=False
)

# --------------------------------------------------
# METRIC DICTIONARY
# --------------------------------------------------

metric_dictionary = pd.DataFrame({
    "metric":[
        "Revenue",
        "Retention Rate",
        "Active Customers",
        "Expansion Revenue",
        "Churn Revenue"
    ],
    "definition":[
        "Monthly recurring revenue",
        "Percent retained customers",
        "Customers active during month",
        "Upsell and cross-sell revenue",
        "Revenue lost due to churn"
    ]
})

metric_dictionary.to_csv(
    WAREHOUSE_DIR /
    "metric_dictionary.csv",
    index=False
)

print("Executive KPI datasets generated successfully.")