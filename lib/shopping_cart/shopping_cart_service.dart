import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'shopping_cart_model/shopping_cart.dart';

@injectable
class ShoppingCartService {
  Dio dio;

  Logger logger;

  static String shoppingCartMain = "/secure/shopping-cart";

  static String shoppingCartAddProduct(String productID) =>
      "$shoppingCartMain/addProduct?productID=$productID";

  static String shoppingCartDecrementProduct(
         String productInfoID) =>
      "$shoppingCartMain/decrementProduct?productInfoID=$productInfoID";

  static String shoppingCartIncrementProduct(
       String productInfoID) =>
      "$shoppingCartMain/incrementProduct?productInfoID=$productInfoID";

  ShoppingCartService(this.dio, this.logger);



  Future<ShoppingCart?> addToShoppingCart(
      String productID) async {
    try {
      Response response = await dio
          .put(dio.options.baseUrl + shoppingCartAddProduct(productID));
      return ShoppingCart.fromJson(response.data);
    } catch (e) {
      logger.e("Shopping Cart Put Dio failure : $e");
      return null;
    }
  }

  Future<ShoppingCart?> decrementFromShoppingCart(
      String productInfoID) async {
    try {
      Response response = await dio.put(
        dio.options.baseUrl +
            shoppingCartDecrementProduct(productInfoID),
      );

      return ShoppingCart.fromJson(response.data);
    } catch (e) {
      logger.e("Shopping Cart Put Dio failure : $e");
      return null;
    }
  }

  Future<ShoppingCart?> incrementFromShoppingCart(
      String productInfoID) async {
    try {
      Response response = await dio.put(
        dio.options.baseUrl +
            shoppingCartIncrementProduct(productInfoID),
      );

      return ShoppingCart.fromJson(response.data);
    } catch (e) {
      logger.e("Shopping Cart Put Dio failure : $e");
      return null;
    }
  }

  Future<ShoppingCart?> closeShoppingCart(String id) async {
    try {
      Response response = await dio.put(
        "${dio.options.baseUrl + shoppingCartMain}/closeShoppingCart}/$id",
      );
      logger.d(ShoppingCart.fromJson(response.data));
      return ShoppingCart.fromJson(response.data);
    } catch (e) {
      logger.e("Shopping Cart Put Dio failure : $e");
      return null;
    }
  }

  Future<ShoppingCart?> getByJsonToken(String jsonToken) async {
    dio.options.headers["Authorization"] = "Bearer $jsonToken";

    try {

      Response response =
          await dio.get(dio.options.baseUrl + shoppingCartMain);
      logger.i("result  $response");
      return ShoppingCart.fromJson(response.data);
    } catch (e) {
      logger.e("Get Cart For User failed $e");
      return null;
    }
  }

}
