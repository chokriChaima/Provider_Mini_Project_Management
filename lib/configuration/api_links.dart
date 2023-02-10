class ApiLinks {
  static String hostLink = "http://10.0.2.2:8080/api";

  static String productMain = "$hostLink/product";

  static String shoppingCartMain = "$hostLink/shopping-cart";

  static String shoppingCartAddProduct = "$shoppingCartMain/addProduct";

  static String shoppingCartRemoveProduct = "$shoppingCartMain/removeProduct";

  static String paymentMain = "http://10.0.2.2:8080/api/payment";
  static String addPaymentLink = "$paymentMain/addPayment";

  static String closeShoppingCart = "$shoppingCartMain/closeShoppingCart";
}
