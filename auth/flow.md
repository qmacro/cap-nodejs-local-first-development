# Flow

```bash
# Show project and Products service with two projections (srv/main.cds)
cds watch # start server and browser entitysets
# Show auth strategy kind (mocked) in server output
cds env requires.auth.users # show users for mocked auth strategy
# annotate service with @requires: 'authenticated-user'
curl -i -s localhost:4004/odata/v4/products/BasicProducts # fail with 401
curl -u alice: -i -s localhost:4004/odata/v4/products/BasicProducts # succeed with alice
curl -u alice: -i -s localhost:4004/odata/v4/products/ProductValues # also succeed
# annotate ProductValues entity with @restrict: [{to: 'finance'}]
curl -u alice: -i -s localhost:4004/odata/v4/products/ProductValues # now fail with 403
# add new user 'polly' with 'finance' role
curl -u polly: -i -s localhost:4004/odata/v4/products/ProductValues # succeed with polly




