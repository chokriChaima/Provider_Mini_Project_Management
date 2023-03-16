abstract class ShoppingCartEvent {}

class ShoppingCartStarted extends ShoppingCartEvent {
  final String data;

  ShoppingCartStarted(this.data);
}


class ShoppingCartAddedProduct extends ShoppingCartEvent {
  final String productID;

  ShoppingCartAddedProduct(this.productID);
}

class ShoppingCartDecrementedProduct extends ShoppingCartEvent {
  final String productInfoID;

  ShoppingCartDecrementedProduct(this.productInfoID);
}

class ShoppingCartIncrementedProduct extends ShoppingCartEvent {
  final String productInfoID;

  ShoppingCartIncrementedProduct(this.productInfoID);
}

class ShoppingCartClosed extends ShoppingCartEvent {}
