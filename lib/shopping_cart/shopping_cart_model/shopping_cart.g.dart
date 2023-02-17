// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShoppingCart _$$_ShoppingCartFromJson(Map<String, dynamic> json) =>
    _$_ShoppingCart(
      id: json['id'] as String?,
      productInfoDTOList: (json['productInfoDTOList'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      paid: json['paid'] as bool,
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      totalQuantity: json['totalQuantity'] as int?,
    );

Map<String, dynamic> _$$_ShoppingCartToJson(_$_ShoppingCart instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productInfoDTOList': instance.productInfoDTOList,
      'paid': instance.paid,
      'totalPrice': instance.totalPrice,
      'totalQuantity': instance.totalQuantity,
    };
