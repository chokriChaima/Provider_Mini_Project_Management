import 'package:first_week_demo/app_notifications/app_notifications_module/app_notification.dart';
import 'package:first_week_demo/product/product_model/product.dart';
import 'package:first_week_demo/shopping_cart/shopping_cart_model/shopping_cart.dart';

class ProductManagementState {
  final List<Product>? products;

  final ShoppingCart? currentShoppingCart;

  final List<AppNotification>? appNotificationList;

  ProductManagementState(
      {this.products, this.currentShoppingCart, this.appNotificationList});


}
