class ApiLinks {
  static String hostLink = "http://10.0.2.2:8080/api";

  static String productMain = "$hostLink/products";

  static String appNotificationMain = "$hostLink/payment-notifications";

  static String appNotificationForCart(String cartID) => "$hostLink/payment-notifications/shopping-cart/$cartID";

  static String shoppingCartMain = "$hostLink/shopping-cart";

  static String shoppingCartAddProduct(String cartID, String productID) =>
      "$shoppingCartMain/addProduct?cartID=$cartID&productID=$productID";

  static String shoppingCartDecrementProduct(
          String cartID, String productInfoID) =>
      "$shoppingCartMain/decrementProduct?cartID=$cartID&productInfoID=$productInfoID";

  static String shoppingCartIncrementProduct(
          String cartID, String productInfoID) =>
      "$shoppingCartMain/incrementProduct?cartID=$cartID&productInfoID=$productInfoID";

  static String paymentMain = "http://10.0.2.2:8080/api/payment";
  static String addPaymentLink = "$paymentMain/addPayment";

  static String closeShoppingCart = "$shoppingCartMain/closeShoppingCart";
}
