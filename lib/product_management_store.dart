import 'package:first_week_demo/app_notifications/app_notifications_module/app_notification.dart';
import 'package:first_week_demo/product/product_model/product.dart';
import 'package:first_week_demo/product/product_service.dart';
import 'package:first_week_demo/product_management_state.dart';
import 'package:first_week_demo/shopping_cart/shopping_cart_model/shopping_cart.dart';
import 'package:first_week_demo/shopping_cart/shopping_cart_service.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

import 'app_notifications/app_notifications_service.dart';

abstract class Store<T> {
  late final Stream<T> state;

  final BehaviorSubject<T> _state;

  Store(T initialState) : _state = BehaviorSubject<T>.seeded(initialState) {
    this.state = this._state.asBroadcastStream();
  }

  //return state value
  T get stateValue => this._state.value;

  void setState(T nextState) => this._state.add(nextState);
}

@injectable
class ProductManagementStore extends Store<ProductManagementState> {
  final ProductService productService;
  final AppNotificationService appNotificationService;
  final ShoppingCartService shoppingCartService;

  final Logger logger;

  ProductManagementStore(
      this.productService, this.logger, this.appNotificationService,this.shoppingCartService)
      : super(ProductManagementState());

  setProducts() async {
    List<Product>? products = await productService.getProducts();

    super.setState(ProductManagementState(
        products: products,
        appNotificationList: stateValue.appNotificationList));
  }

  setNotification() async {
    List<AppNotification>? appNotificationList = await appNotificationService
        .getAppNotificationsForCart(stateValue.currentShoppingCart!.id!);
    super.setState(ProductManagementState(
        products: stateValue.products,
        currentShoppingCart: stateValue.currentShoppingCart,
        appNotificationList: appNotificationList));
  }

  Future<bool> registerCart(String cartID) async {
    ShoppingCart? result = await shoppingCartService.getById(cartID);
    if(result != null){
      return true;
    }
    return false ;
  }
}
