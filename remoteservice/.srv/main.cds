using {northbreeze} from './external/northbreeze';

service Local {
  entity Products as projection on northbreeze.Products;
}
