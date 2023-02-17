import 'dart:async';

import 'package:first_week_demo/shopping_cart/bloc/shopping_cart_event.dart';
import 'package:first_week_demo/shopping_cart/bloc/shopping_cart_state.dart';
import 'package:first_week_demo/shopping_cart/shopping_cart_model/shopping_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../shopping_cart_service.dart';

@injectable
class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  final ShoppingCartService _shoppingCartService;
  final Logger logger;

  ShoppingCartBloc(this._shoppingCartService, this.logger)
      : super(const ShoppingCartState()) {
    on<ShoppingCartRegistrationButtonPressed>(registrationEventHandler);
    on<ShoppingCartCreationButtonPressed>(creationEventHandler);
    on<ShoppingCartAddedProduct>(addedProductEventHandler);
    on<ShoppingCartDecrementedProduct>(decrementedProductEventHandler);
    on<ShoppingCartIncrementedProduct>(incrementedProductEventHandler);
    on<ShoppingCartClosed>(closedShoppingCartEventHandler);
  }

  Future<void> registrationEventHandler(
      ShoppingCartRegistrationButtonPressed event,
      Emitter<ShoppingCartState> emit) async {
    ShoppingCart? result = await _shoppingCartService.getById(event.id);
    if (result == null) {
      emit(const ShoppingCartState(status: ShoppingCartStatus.failure));
    } else {
      if (result.paid) {
        emit(const ShoppingCartState(status: ShoppingCartStatus.closed));
      } else {
        emit(ShoppingCartState(
            status: ShoppingCartStatus.success, currentShoppingCart: result));
      }
    }
  }

  Future<void> creationEventHandler(ShoppingCartCreationButtonPressed event,
      Emitter<ShoppingCartState> emit) async {
    ShoppingCart? result = await _shoppingCartService.post();
    if (result == null) {
      emit(const ShoppingCartState(status: ShoppingCartStatus.failure));
    } else {
      emit(ShoppingCartState(
          status: ShoppingCartStatus.success, currentShoppingCart: result));
    }
  }

  Future<void> addedProductEventHandler(
      ShoppingCartAddedProduct event, Emitter<ShoppingCartState> emit) async {
    ShoppingCart? result = await _shoppingCartService.addToShoppingCart(
        event.productID, state.currentShoppingCart!.id!);
    if (result == null) {
      emit(ShoppingCartState(
          status: ShoppingCartStatus.failure,
          currentShoppingCart: state.currentShoppingCart));
    } else {
      emit(ShoppingCartState(
          status: ShoppingCartStatus.success, currentShoppingCart: result));
    }
  }

  Future<void> decrementedProductEventHandler(
      ShoppingCartDecrementedProduct event, Emitter<ShoppingCartState> emit) async {
    ShoppingCart? result = await _shoppingCartService.decrementFromShoppingCart(
        event.productInfoID, state.currentShoppingCart!.id!);
    if (result == null) {
      emit(ShoppingCartState(
          status: ShoppingCartStatus.failure,
          currentShoppingCart: state.currentShoppingCart));
    } else {
      emit(ShoppingCartState(
          status: ShoppingCartStatus.success, currentShoppingCart: result));
    }
  }

  Future<void> incrementedProductEventHandler(
      ShoppingCartIncrementedProduct event, Emitter<ShoppingCartState> emit) async {
    ShoppingCart? result = await _shoppingCartService.incrementFromShoppingCart(
        event.productInfoID, state.currentShoppingCart!.id!);
    if (result == null) {
      emit(ShoppingCartState(
          status: ShoppingCartStatus.failure,
          currentShoppingCart: state.currentShoppingCart));
    } else {
      emit(ShoppingCartState(
          status: ShoppingCartStatus.success, currentShoppingCart: result));
    }
  }



  FutureOr<void> closedShoppingCartEventHandler(
      ShoppingCartClosed event, Emitter<ShoppingCartState> emit) async {
    ShoppingCart? result = await _shoppingCartService
        .closeShoppingCart(state.currentShoppingCart!.id!);
    if (result == null) {
      emit(ShoppingCartState(
          status: ShoppingCartStatus.failure,
          currentShoppingCart: state.currentShoppingCart));
    } else if (result.paid) {
      emit(const ShoppingCartState(status: ShoppingCartStatus.closed));
    }
  }
}
