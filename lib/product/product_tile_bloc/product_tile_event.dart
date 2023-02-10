abstract class ProductTileEvent {}

class ProductTileAddButtonPressed extends ProductTileEvent {
  final String id;

  ProductTileAddButtonPressed(this.id);
}

class ProductTileRemoveButtonPressed extends ProductTileEvent {
  final String id;

  ProductTileRemoveButtonPressed(this.id);
}
