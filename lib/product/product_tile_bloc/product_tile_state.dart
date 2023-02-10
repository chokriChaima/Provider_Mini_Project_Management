import 'package:flutter/cupertino.dart';

enum ProductTileStatus {
  added,
  removed
}
@immutable
class ProductTileState {
  final String? id ;
  final ProductTileStatus? status ;
  const ProductTileState({this.status,this.id});
}




