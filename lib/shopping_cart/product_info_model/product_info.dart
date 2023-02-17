import 'package:first_week_demo/product/product_model/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_info.freezed.dart';

part 'product_info.g.dart';

@freezed
class ProductInfo with _$ProductInfo {
  const factory ProductInfo(
      {String? productInfoID,
      required Product product,
      required int quantity}) = _ProductInfo;

  factory ProductInfo.fromJson(Map<String, dynamic> json) =>
      _$ProductInfoFromJson(json);

  const ProductInfo._();
}
