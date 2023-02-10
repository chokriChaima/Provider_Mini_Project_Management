import 'dart:async';

import 'package:first_week_demo/product/product.dart';
import 'package:first_week_demo/product/product_list_bloc/product_event.dart';
import 'package:first_week_demo/product/product_list_bloc/product_state.dart';
import 'package:first_week_demo/product/product_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService _productService;

  ProductBloc(this._productService)
      : super(const ProductState(productsState: ProductsStates.loading)) {
    on<ProductStarted>(mapEventToState);
  }

  Future<void> mapEventToState(
      ProductEvent event, Emitter<ProductState> emit) async {
    if (event is ProductStarted) {
      List<Product>? response = await _productService.getProducts();
      if (response != null) {
        emit(ProductState(
            products: response, productsState: ProductsStates.success));
      } else {
        emit(const ProductState(productsState: ProductsStates.failure));
      }
    }
  }
}
