let

Source = Csv.Document(

File.Contents("revenue.csv"),

[Delimiter=","]

),

Headers = Table.PromoteHeaders(Source),

Rounded = Table.TransformColumns(

Headers,

{{"revenue",Number.Round}}

)

in

Rounded