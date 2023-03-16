import 'package:first_week_demo/app_notifications/app_notifications_view/app_notification_list.dart';
import 'package:first_week_demo/authentication/views/login_view.dart';
import 'package:first_week_demo/authentication/views/sign_up_view.dart';
import 'package:go_router/go_router.dart';

import '../payment/payment_views/payment_page.dart';
import '../product/product_views/products_page.dart';
import '../shopping_cart/shopping_cart_view/shopping_cart_view.dart';

class Routes {
  static const firstView = "/";
  static const productsPage = "/productsPage";
  static const shoppingCartView = "/shoppingCartView";
  static const purchasePage = "/paymentPage";
  static const appNotificationView = "/appNotificationView";
  static const signUp ="/signUp";
}

final router = GoRouter(routes: [


  GoRoute(
      path: Routes.signUp,
      builder: (context, state) => SignUpView()),

  GoRoute(
      path: Routes.firstView,
      builder: (context, state) => LogInView()),
  GoRoute(
      path: Routes.productsPage,
      builder: (context, state) => const ProductsPage()),
  GoRoute(
      path: Routes.shoppingCartView,
      builder: (context, state) => const ShoppingCartView()),
  GoRoute(
      path: Routes.purchasePage, builder: (context, state) => PaymentPage()),
  GoRoute(
      path: Routes.appNotificationView,
      builder: (context, state) => AppNotificationList()),
  // )
]);
