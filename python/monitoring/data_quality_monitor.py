def quality_score(

    total_rows,

    invalid_rows

):

    return (

        (total_rows-invalid_rows)

        /

        total_rows

    )*100