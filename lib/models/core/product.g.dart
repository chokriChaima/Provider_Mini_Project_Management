// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productName: json['productName'] as String,
      productPrice: (json['productPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productName': instance.productName,
      'productPrice': instance.productPrice,
    };
