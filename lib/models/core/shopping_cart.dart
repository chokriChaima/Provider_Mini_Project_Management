import 'package:first_week_demo/models/core/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shopping_cart.g.dart';

@JsonSerializable()
class ShoppingCart{
  String? shoppingCartID ;
  List<Product> productsInCart ;

  ShoppingCart({this.shoppingCartID, required this.productsInCart});

  factory ShoppingCart.fromJson(Map<String,dynamic> json) => _$ShoppingCartFromJson(json);
  Map<String,dynamic> toJson()=> _$ShoppingCartToJson(this);

  double getTotal(){
    double total =0;
    for (var element in productsInCart) {
      total+=element.productPrice;
    }
    return total;
  }



}