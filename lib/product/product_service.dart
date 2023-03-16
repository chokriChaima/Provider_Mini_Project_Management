import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'product_model/product.dart';

@Injectable()
class ProductService {

  static String productMain = "/products";
  Dio dio;

  Logger logger;

  ProductService(this.logger, this.dio);

  Future<List<Product>?> getProducts() async {
    try {
      Response response = await dio.get(dio.options.baseUrl+productMain);

      return List<Product>.from(response.data.map((e) => Product.fromJson(e)));
    } on DioError catch (e) {
      logger.e("Dio Failed $e");
      return null;
    }
  }
}
