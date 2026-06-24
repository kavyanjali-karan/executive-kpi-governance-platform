def test_negative_revenue(df):

    assert (df["revenue"] >= 0).all()