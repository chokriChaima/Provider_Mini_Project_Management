import 'package:first_week_demo/product/product.dart';

abstract class ShoppingCartEvent {}

class ShoppingCartRegistrationButtonPressed extends ShoppingCartEvent {
  final String id;

  ShoppingCartRegistrationButtonPressed(this.id);
}

class ShoppingCartCreationButtonPressed extends ShoppingCartEvent {}

class ShoppingCartAddedProduct extends ShoppingCartEvent {
       final Product product;
       ShoppingCartAddedProduct(this.product);

}

class ShoppingCartRemovedProduct extends ShoppingCartEvent{
  final Product product;
  ShoppingCartRemovedProduct(this.product);
}

class ShoppingCartClosed extends ShoppingCartEvent{

}
