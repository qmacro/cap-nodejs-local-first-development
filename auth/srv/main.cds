using northwind from '../db/schema';

// @requires: 'authenticated-user'
service Products {

  entity BasicProducts as
    projection on northwind.Products {
      ProductID            as ID,
      ProductName          as name,
      Supplier.CompanyName as supplier
    }

  // @restrict: [{to: 'finance'}]
  entity ProductValues as
    projection on northwind.Products {
      ProductID,
      ProductName,
      UnitPrice,
      UnitsInStock,
      UnitPrice * UnitsInStock as StockValue : Decimal(5, 2)
    }
}
