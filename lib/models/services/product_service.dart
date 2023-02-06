import 'package:dio/dio.dart';
import 'package:first_week_demo/models/services/api_links.dart';
import 'package:http_status_code/http_status_code.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../core/product.dart';

@Injectable()
class ProductService {

  Dio dio ;
  Logger logger;

  ProductService(this.logger,this.dio);

  Future<List<Product>?> getProducts() async {
    logger.d("Getting Product Please Hold ");

    try {
      Response response = await dio.get(ApiLinks.productMain);
      if (response.statusCode == StatusCode.OK) {
        logger.d("Get Products Successful ${response.data}");
        return List<Product>.from(
            response.data.map((e) => Product.fromJson(e)));
      }
      logger.e("Get Products Failed ${response.data}");
      return null;
    } on DioError catch (e) {
      logger.e("Dio Failed $e");
      return null;
    }
  }
}
