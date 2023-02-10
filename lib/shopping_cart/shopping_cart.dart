import 'package:first_week_demo/product/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_cart.g.dart';
part 'shopping_cart.freezed.dart';

@freezed
class ShoppingCart with _$ShoppingCart{


  const factory ShoppingCart({String? shoppingCartID, required List<Product>  productsInCart, required double total, required bool paid}) = _ShoppingCart;


  factory ShoppingCart.fromJson(Map<String,dynamic> json) => _$ShoppingCartFromJson(json);
  const ShoppingCart._();





}