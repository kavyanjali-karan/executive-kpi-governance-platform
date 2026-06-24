import pandas as pd


def validate_customer(df: pd.DataFrame):

    assert df["customer_id"].isnull().sum() == 0

    assert df["customer_id"].duplicated().sum() == 0

    return True