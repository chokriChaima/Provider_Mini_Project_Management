import 'package:first_week_demo/models/core/product.dart';
import 'package:first_week_demo/models/core/shopping_cart.dart';
import 'package:first_week_demo/models/services/shopping_cart_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class ShoppingCartProvider extends ChangeNotifier {
  Logger logger ;
  final ShoppingCartService _shoppingCartService;

  ShoppingCartProvider(this._shoppingCartService,this.logger);

  ShoppingCart? _currentShoppingCart = null;

  ShoppingCart? getCurrentShoppingCart() => _currentShoppingCart;

  void modifyShoppingCart(
      {required Product product, required bool toAdd}) async {
    ShoppingCart? updatedShoppingCart =
        await _shoppingCartService.modifyShoppingCart(
            product, toAdd, _currentShoppingCart!.shoppingCartID!);

    if (updatedShoppingCart == null) {
      return;
    }
    _currentShoppingCart = updatedShoppingCart;
    notifyListeners();

    logger.d("product added successfully to shopping cart");
  }

  //String getTotalPrice() => _totalPrice.toString();

  bool isExist(Product product) {
    if (_currentShoppingCart != null) {
      return _currentShoppingCart!.productsInCart.contains(product);
    }
    return false;
  }

  Future<bool> createShoppingCart() async {
    ShoppingCart shoppingCart = ShoppingCart(productsInCart: []);
    var response = await _shoppingCartService.post(shoppingCart);
    if (response == null) {
      return false;
    }
    _currentShoppingCart = response;
    notifyListeners();
    logger.d("current shopping cart ID $_currentShoppingCart");
    return true;
  }

  Future<bool> getShoppingCart(String id) async {
    var result = await _shoppingCartService.getById(id);
    if (result == null) {
      return false;
    }

    _currentShoppingCart = result;
    notifyListeners();
    logger.d("current shopping cart ID $_currentShoppingCart");
    return true;
  }
}
