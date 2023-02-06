import 'package:dio/dio.dart';
import 'package:first_week_demo/models/services/api_links.dart';
import 'package:http_status_code/http_status_code.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../core/product.dart';
import '../core/shopping_cart.dart';


@injectable
class ShoppingCartService {
  Dio dio ;
  Logger logger;

  ShoppingCartService(this.dio,this.logger);

  Future<List<ShoppingCart>?> getShoppingCarts() async {
    try {
      Response response = await dio.get(ApiLinks.shoppingCartMain);
      if (response.statusCode == StatusCode.OK) {
        logger.d("Get Shopping Carts Success");
        return List<ShoppingCart>.of(response.data.map((e) => e.fromJson()));
      }
      return null;
    } catch (e) {
      logger.e("Get Shopping Carts failed : $e");
      return null;
    }
  }

  Future<ShoppingCart?> modifyShoppingCart(
      Product product, bool toAdd, String id) async {
    try {
      Response response = await dio.put(
        toAdd
            ? "${ApiLinks.shoppingCartAddProduct}/$id"
            : "${ApiLinks.shoppingCartRemoveProduct}/$id",
        data: product.toJson(),

      );
      logger.i(response.data);
      if (response.statusCode == StatusCode.OK) {
        return ShoppingCart.fromJson(response.data);
      }
      logger.e("Modifying shopping cart failure ${response.data}");
      return null;
    } on DioError catch (e) {
      logger.e("Shopping Cart Put Dio failure : $e");
      return null;
    }
  }

  Future<ShoppingCart?> getById(String id) async {
    try {
      Response response = await dio.get("${ApiLinks.shoppingCartMain}/$id");
      if (response.statusCode == StatusCode.OK) {
        logger.d("Get Shopping Cart BY ID Success");
        return ShoppingCart.fromJson(response.data);
      }
      return null;
    } catch (e) {
      logger.e("Get Cart BY ID failed $e");
      return null;
    }
  }

  Future<ShoppingCart?> post(ShoppingCart shoppingCart) async {
    try {
      Response response = await dio.post(
        ApiLinks.shoppingCartMain,
        data: shoppingCart.toJson(),
      );
      if (response.statusCode == StatusCode.OK) {
        logger.d("Shopping Cart added Successfully");
        return ShoppingCart.fromJson(response.data);
      }

      return null;
    } catch (e) {
      logger.e("Shopping Cart Post Failed with error : $e");
      return null;
    }
  }
}
