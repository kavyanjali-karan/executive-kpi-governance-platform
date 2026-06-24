def test_revenue_positive(df):

    assert df["revenue"].sum() >= 0


def test_paid_customers(df):

    assert df["paid_customers"].sum() >= 0