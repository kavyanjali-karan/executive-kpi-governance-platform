let

Source = Csv.Document(

File.Contents("activity.csv"),

[Delimiter=","]

),

Headers = Table.PromoteHeaders(Source),

Types = Table.TransformColumnTypes(

Headers,

{{"revenue",type number}}

)

in

Types
