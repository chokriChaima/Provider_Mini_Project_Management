abstract class ShoppingCartEvent {}

class ShoppingCartRegistrationButtonPressed extends ShoppingCartEvent {
  final String id;

  ShoppingCartRegistrationButtonPressed(this.id);
}

class ShoppingCartCreationButtonPressed extends ShoppingCartEvent {}

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
