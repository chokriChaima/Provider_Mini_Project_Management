// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShoppingCart _$ShoppingCartFromJson(Map<String, dynamic> json) {
  return _ShoppingCart.fromJson(json);
}

/// @nodoc
mixin _$ShoppingCart {
  String? get id => throw _privateConstructorUsedError;
  List<Product> get productInfoDTOList => throw _privateConstructorUsedError;
  bool get paid => throw _privateConstructorUsedError;
  double? get totalPrice => throw _privateConstructorUsedError;
  int? get totalQuantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShoppingCartCopyWith<ShoppingCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingCartCopyWith<$Res> {
  factory $ShoppingCartCopyWith(
          ShoppingCart value, $Res Function(ShoppingCart) then) =
      _$ShoppingCartCopyWithImpl<$Res, ShoppingCart>;
  @useResult
  $Res call(
      {String? id,
      List<Product> productInfoDTOList,
      bool paid,
      double? totalPrice,
      int? totalQuantity});
}

/// @nodoc
class _$ShoppingCartCopyWithImpl<$Res, $Val extends ShoppingCart>
    implements $ShoppingCartCopyWith<$Res> {
  _$ShoppingCartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productInfoDTOList = null,
    Object? paid = null,
    Object? totalPrice = freezed,
    Object? totalQuantity = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      productInfoDTOList: null == productInfoDTOList
          ? _value.productInfoDTOList
          : productInfoDTOList // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      paid: null == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      totalQuantity: freezed == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShoppingCartCopyWith<$Res>
    implements $ShoppingCartCopyWith<$Res> {
  factory _$$_ShoppingCartCopyWith(
          _$_ShoppingCart value, $Res Function(_$_ShoppingCart) then) =
      __$$_ShoppingCartCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      List<Product> productInfoDTOList,
      bool paid,
      double? totalPrice,
      int? totalQuantity});
}

/// @nodoc
class __$$_ShoppingCartCopyWithImpl<$Res>
    extends _$ShoppingCartCopyWithImpl<$Res, _$_ShoppingCart>
    implements _$$_ShoppingCartCopyWith<$Res> {
  __$$_ShoppingCartCopyWithImpl(
      _$_ShoppingCart _value, $Res Function(_$_ShoppingCart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productInfoDTOList = null,
    Object? paid = null,
    Object? totalPrice = freezed,
    Object? totalQuantity = freezed,
  }) {
    return _then(_$_ShoppingCart(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      productInfoDTOList: null == productInfoDTOList
          ? _value._productInfoDTOList
          : productInfoDTOList // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      paid: null == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      totalQuantity: freezed == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShoppingCart implements _ShoppingCart {
  const _$_ShoppingCart(
      {this.id,
      required final List<Product> productInfoDTOList,
      required this.paid,
      this.totalPrice,
      this.totalQuantity})
      : _productInfoDTOList = productInfoDTOList;

  factory _$_ShoppingCart.fromJson(Map<String, dynamic> json) =>
      _$$_ShoppingCartFromJson(json);

  @override
  final String? id;
  final List<Product> _productInfoDTOList;
  @override
  List<Product> get productInfoDTOList {
    if (_productInfoDTOList is EqualUnmodifiableListView)
      return _productInfoDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productInfoDTOList);
  }

  @override
  final bool paid;
  @override
  final double? totalPrice;
  @override
  final int? totalQuantity;

  @override
  String toString() {
    return 'ShoppingCart(id: $id, productInfoDTOList: $productInfoDTOList, paid: $paid, totalPrice: $totalPrice, totalQuantity: $totalQuantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShoppingCart &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._productInfoDTOList, _productInfoDTOList) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_productInfoDTOList),
      paid,
      totalPrice,
      totalQuantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShoppingCartCopyWith<_$_ShoppingCart> get copyWith =>
      __$$_ShoppingCartCopyWithImpl<_$_ShoppingCart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShoppingCartToJson(
      this,
    );
  }
}

abstract class _ShoppingCart implements ShoppingCart {
  const factory _ShoppingCart(
      {final String? id,
      required final List<Product> productInfoDTOList,
      required final bool paid,
      final double? totalPrice,
      final int? totalQuantity}) = _$_ShoppingCart;

  factory _ShoppingCart.fromJson(Map<String, dynamic> json) =
      _$_ShoppingCart.fromJson;

  @override
  String? get id;
  @override
  List<Product> get productInfoDTOList;
  @override
  bool get paid;
  @override
  double? get totalPrice;
  @override
  int? get totalQuantity;
  @override
  @JsonKey(ignore: true)
  _$$_ShoppingCartCopyWith<_$_ShoppingCart> get copyWith =>
      throw _privateConstructorUsedError;
}
