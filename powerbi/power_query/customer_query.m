let

Source = Csv.Document(

File.Contents("customer.csv"),

[Delimiter=",",Encoding=65001]

),

Headers = Table.PromoteHeaders(Source),

Trimmed = Table.TransformColumns(

Headers,

{{"customer_id",Text.Trim}}

),

Region = Table.TransformColumns(

Trimmed,

{{"region",Text.Upper}}

)

in

Region