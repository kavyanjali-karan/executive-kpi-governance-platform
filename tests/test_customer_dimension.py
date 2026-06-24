def test_customer_id_unique(df):

    assert df["customer_id"].duplicated().sum() == 0
    