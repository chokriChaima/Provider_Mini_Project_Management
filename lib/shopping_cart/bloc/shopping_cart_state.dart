import 'package:flutter/cupertino.dart';

import '../shopping_cart_model/shopping_cart.dart';

enum ShoppingCartStatus { success, failure, closed }

@immutable
class ShoppingCartState {
  final ShoppingCart? currentShoppingCart;
  final ShoppingCartStatus? status;

  const ShoppingCartState(
      {this.currentShoppingCart, this.status});



}
