using northwind from '../db/schema';

@path: '/main'
service Main {

  entity Products as projection on northwind.Products;

}
