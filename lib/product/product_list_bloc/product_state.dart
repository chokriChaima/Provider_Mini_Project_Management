import 'package:first_week_demo/product/product.dart';
import 'package:flutter/cupertino.dart';

enum ProductsStates {
  success,
  loading,
  failure


}
@immutable
class ProductState {
  final ProductsStates productsState ;
  final List<Product>? products ;

  const ProductState({this.products,required this.productsState});
}

