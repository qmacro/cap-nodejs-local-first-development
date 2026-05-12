using {northbreeze} from './external/northbreeze';

service Main {
  entity Products as projection on northbreeze.Products;
}
