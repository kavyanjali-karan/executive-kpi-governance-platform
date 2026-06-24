def test_duplicates(df):

    assert df.duplicated().sum() == 0
    