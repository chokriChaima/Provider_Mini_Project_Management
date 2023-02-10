import 'package:dio/dio.dart';
import 'package:first_week_demo/configuration/api_links.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'product.dart';

@Injectable()
class ProductService {
  Dio dio;

  Logger logger;

  ProductService(this.logger, this.dio);

  Future<List<Product>?> getProducts() async {
    try {
      Response response = await dio.get(ApiLinks.productMain);

      return List<Product>.from(response.data.map((e) => Product.fromJson(e)));
    } on DioError catch (e) {
      logger.e("Dio Failed $e");
      return null;
    }
  }
}
