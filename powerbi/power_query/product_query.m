let

Source = Csv.Document(

File.Contents("product.csv"),

[Delimiter=","]

),

Headers = Table.PromoteHeaders(Source)

in

Headers