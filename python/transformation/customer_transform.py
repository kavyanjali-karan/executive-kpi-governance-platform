import pandas as pd


def transform_customer(df: pd.DataFrame) -> pd.DataFrame:

    df.columns = df.columns.str.lower()

    df["customer_id"] = df["customer_id"].str.strip()

    df["region"] = df["region"].str.upper()

    return df