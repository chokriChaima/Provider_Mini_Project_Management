// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingCart _$ShoppingCartFromJson(Map<String, dynamic> json) => ShoppingCart(
      shoppingCartID: json['shoppingCartID'] as String?,
      productsInCart: (json['productsInCart'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShoppingCartToJson(ShoppingCart instance) =>
    <String, dynamic>{
      'shoppingCartID': instance.shoppingCartID,
      'productsInCart': instance.productsInCart,
    };
