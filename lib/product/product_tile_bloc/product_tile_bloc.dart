import 'package:first_week_demo/product/product_tile_bloc/product_tile_event.dart';
import 'package:first_week_demo/product/product_tile_bloc/product_tile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class ProductTileBloc extends Bloc<ProductTileEvent, ProductTileState> {
  final Logger logger;

  ProductTileBloc(this.logger) : super(const ProductTileState()) {
    on<ProductTileAddButtonPressed>(addEventHandler);
    on<ProductTileRemoveButtonPressed>(removeEventHandler);
  }

  Future<void> addEventHandler(
      ProductTileAddButtonPressed event, Emitter<ProductTileState> emit) async {

    emit(ProductTileState(status : ProductTileStatus.added,id : event.id));
  }

  Future<void> removeEventHandler(ProductTileRemoveButtonPressed event,
      Emitter<ProductTileState> emit) async {
    emit(ProductTileState(status : ProductTileStatus.removed,id : event.id));
  }

  // @override
  // void onChange(Change<ProductTileState> change) {
  //   super.onChange(change);
  //   logger.i(change);
  // }
}
