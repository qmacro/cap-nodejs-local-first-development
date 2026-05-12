using northwind from '../db/schema';

@path: '/main'
service Main {

  @requires: 'authenticated-user'
  entity Products   as projection on northwind.Products;

  @restrict: [
    {
      grant: 'WRITE',
      to   : 'buyer-admin'
    },
    {
      grant: 'READ',
      to   : 'any'
    }
  ]
  entity Categories as projection on northwind.Categories;

}
