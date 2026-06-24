import pandas as pd


def transform_revenue(df: pd.DataFrame) -> pd.DataFrame:

    df["revenue"] = df["revenue"].round(2)

    return df