import 'package:dio/dio.dart';
import 'package:first_week_demo/configuration/api_links.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../product/product.dart';
import 'shopping_cart.dart';

@injectable
class ShoppingCartService {
  Dio dio;

  Logger logger;

  ShoppingCartService(this.dio, this.logger);

  Future<List<ShoppingCart>?> getShoppingCarts() async {
    try {
      Response response = await dio.get(ApiLinks.shoppingCartMain);

      return List<ShoppingCart>.of(response.data.map((e) => e.fromJson()));
    } catch (e) {
      logger.e("Get Shopping Carts failed : $e");
      return null;
    }
  }

  Future<ShoppingCart?> addToShoppingCart(Product product, String id) async {
    try {
      Response response = await dio.put(
        "${ApiLinks.shoppingCartAddProduct}/$id",
        data: product.toJson(),
      );
      return ShoppingCart.fromJson(response.data);
    } catch (e) {
      logger.e("Shopping Cart Put Dio failure : $e");
      return null;
    }
  }

  Future<ShoppingCart?> removeFromShoppingCart(
      Product product, String id) async {
    try {
      Response response = await dio.put(
        "${ApiLinks.shoppingCartRemoveProduct}/$id",
        data: product.toJson(),
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
        "${ApiLinks.closeShoppingCart}/$id",
      );
logger.d(ShoppingCart.fromJson(response.data));
      return ShoppingCart.fromJson(response.data);
    } catch (e) {
      logger.e("Shopping Cart Put Dio failure : $e");
      return null;
    }
  }

  Future<ShoppingCart?> getById(String id) async {
    try {
      Response response = await dio.get("${ApiLinks.shoppingCartMain}/$id");

      return ShoppingCart.fromJson(response.data);
    } catch (e) {
      logger.e("Get Cart BY ID failed $e");
      return null;
    }
  }

  Future<ShoppingCart?> post() async {
    try {
      Response response = await dio.post(
        ApiLinks.shoppingCartMain,
        data: {},
      );

      return ShoppingCart.fromJson(response.data);
    } catch (e) {
      logger.e("Shopping Cart Post Failed with error : $e");
      return null;
    }
  }
}
