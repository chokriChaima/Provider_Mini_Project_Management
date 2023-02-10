// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShoppingCart _$$_ShoppingCartFromJson(Map<String, dynamic> json) =>
    _$_ShoppingCart(
      shoppingCartID: json['shoppingCartID'] as String?,
      productsInCart: (json['productsInCart'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toDouble(),
      paid: json['paid'] as bool,
    );

Map<String, dynamic> _$$_ShoppingCartToJson(_$_ShoppingCart instance) =>
    <String, dynamic>{
      'shoppingCartID': instance.shoppingCartID,
      'productsInCart': instance.productsInCart,
      'total': instance.total,
      'paid': instance.paid,
    };
