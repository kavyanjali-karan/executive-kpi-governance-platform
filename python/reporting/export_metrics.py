import pandas as pd


def export_metrics(df, output_path):

    df.to_excel(

        output_path,

        index=False

    )