import 'package:first_week_demo/models/core/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../models/services/product_service.dart';

@injectable
class ProductProvider extends ChangeNotifier {
  final ProductService _productService;

  ProductProvider(this._productService, this.logger);

  Logger logger;

  Future<List<Product>?> getProducts() async =>
      await _productService.getProducts();
}
