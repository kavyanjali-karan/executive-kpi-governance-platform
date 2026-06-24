import pandas as pd


def load_activity(path: str) -> pd.DataFrame:

    return pd.read_csv(path)


if __name__ == "__main__":

    activity = load_activity("data/raw/activity.csv")

    print(activity.shape)