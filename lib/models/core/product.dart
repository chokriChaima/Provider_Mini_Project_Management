import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  final String productName;

  final double productPrice;

  Product({required this.productName, required this.productPrice});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [productPrice, productPrice];
}
