import pandas as pd


def validate_revenue(df: pd.DataFrame):

    assert (df["revenue"] >= 0).all()

    return True