# Flow

```bash
rm ~/.cds-services.json # clean up any stale service provision info
watch tree -I node_modules # (w1) show starting point - just a package.json
cds watch # (w2) start empty CAP server
# Show publicly available Northbreeze service, incl metadata
./util getapidef # (w2) download metadata into EDMX file
cds import northbreeze.edmx # import as model & convert to CSN
jq . package.json # note cds.requires and new dependencies
npm install # install dependencies (SAP Cloud SDK)
# auto mocking of northbreeze service in-process by CAP server ("mocking northbreeze ...")
cds add data --filter Categories --records 3 # add generated data (CSV)
# auto import of CSV data by CAP server ("init from ...")
./util getproductsdata # can also use JSON based initial data ("init from ...")
# Stop watch tree in w1
# Stop CAP server in w2
cds mock northbreeze --port 5005 # (w1) start mocking in separate process
cds watch # (w2) restart CAP server - note no (in-process) mocking
# Note "No service definitions" in CAP server
cp .srv/* srv/ # add a service definition & implementation with projection
# Request Products entityset and note remote call made from 4004 to 5005
```
