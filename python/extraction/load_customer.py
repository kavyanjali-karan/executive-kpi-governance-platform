import pandas as pd


def load_customer(path: str) -> pd.DataFrame:
    """Load raw customer dataset."""

    return pd.read_csv(path)


if __name__ == "__main__":

    df = load_customer("data/raw/customer.csv")

    print(df.head())