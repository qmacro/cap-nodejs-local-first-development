# Flow

```bash
cds watch # run server, observe "connect to db > sqlite { url: ':memory:' } and "successfully deployed ..."
# http://localhost:4004 - the entitysets are empty
cds add data # create initial data CSV files, header only
# note new "init from db/data/northwind-XXX.csv" log records
# show contents of CSV files - just the headers, so entitysets are still empty
cds add data --records 3 --force # add actual (generated) data
# http://localhost:4004 - the entitysets now have data which is also somewhat related e.g. http://localhost:4004/northbreeze/Suppliers?$expand=Products
cp .csv/* db/data/ # replace CSV data with real northbreeze data
cds repl --run . # start REPL to run some CQL
await SELECT .from `Products[UnitsInStock = 0] { ProductName as name, Supplier.CompanyName as supplier }` # CQL with infix filter and path expression - SQLite is not a toy
http://localhost:4004/northbreeze/Products?$filter=UnitsInStock%20eq%200&$select=ProductName&$expand=Supplier($select=CompanyName) # equivalent rest/odata query
```
