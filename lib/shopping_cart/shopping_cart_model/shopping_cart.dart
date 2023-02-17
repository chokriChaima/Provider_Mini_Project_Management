import 'package:first_week_demo/product/product_model/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_cart.freezed.dart';

part 'shopping_cart.g.dart';

@freezed
class ShoppingCart with _$ShoppingCart {
  const factory ShoppingCart(
      {String? id,
      required List<Product> productInfoDTOList,
      required bool paid,
      double? totalPrice,
      int? totalQuantity}) = _ShoppingCart;

  factory ShoppingCart.fromJson(Map<String, dynamic> json) =>
      _$ShoppingCartFromJson(json);

}
