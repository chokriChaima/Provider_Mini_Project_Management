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
  String? get shoppingCartID => throw _privateConstructorUsedError;
  List<Product> get productsInCart => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  bool get paid => throw _privateConstructorUsedError;

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
      {String? shoppingCartID,
      List<Product> productsInCart,
      double total,
      bool paid});
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
    Object? shoppingCartID = freezed,
    Object? productsInCart = null,
    Object? total = null,
    Object? paid = null,
  }) {
    return _then(_value.copyWith(
      shoppingCartID: freezed == shoppingCartID
          ? _value.shoppingCartID
          : shoppingCartID // ignore: cast_nullable_to_non_nullable
              as String?,
      productsInCart: null == productsInCart
          ? _value.productsInCart
          : productsInCart // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      paid: null == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool,
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
      {String? shoppingCartID,
      List<Product> productsInCart,
      double total,
      bool paid});
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
    Object? shoppingCartID = freezed,
    Object? productsInCart = null,
    Object? total = null,
    Object? paid = null,
  }) {
    return _then(_$_ShoppingCart(
      shoppingCartID: freezed == shoppingCartID
          ? _value.shoppingCartID
          : shoppingCartID // ignore: cast_nullable_to_non_nullable
              as String?,
      productsInCart: null == productsInCart
          ? _value._productsInCart
          : productsInCart // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      paid: null == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShoppingCart extends _ShoppingCart {
  const _$_ShoppingCart(
      {this.shoppingCartID,
      required final List<Product> productsInCart,
      required this.total,
      required this.paid})
      : _productsInCart = productsInCart,
        super._();

  factory _$_ShoppingCart.fromJson(Map<String, dynamic> json) =>
      _$$_ShoppingCartFromJson(json);

  @override
  final String? shoppingCartID;
  final List<Product> _productsInCart;
  @override
  List<Product> get productsInCart {
    if (_productsInCart is EqualUnmodifiableListView) return _productsInCart;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productsInCart);
  }

  @override
  final double total;
  @override
  final bool paid;

  @override
  String toString() {
    return 'ShoppingCart(shoppingCartID: $shoppingCartID, productsInCart: $productsInCart, total: $total, paid: $paid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShoppingCart &&
            (identical(other.shoppingCartID, shoppingCartID) ||
                other.shoppingCartID == shoppingCartID) &&
            const DeepCollectionEquality()
                .equals(other._productsInCart, _productsInCart) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.paid, paid) || other.paid == paid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, shoppingCartID,
      const DeepCollectionEquality().hash(_productsInCart), total, paid);

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

abstract class _ShoppingCart extends ShoppingCart {
  const factory _ShoppingCart(
      {final String? shoppingCartID,
      required final List<Product> productsInCart,
      required final double total,
      required final bool paid}) = _$_ShoppingCart;
  const _ShoppingCart._() : super._();

  factory _ShoppingCart.fromJson(Map<String, dynamic> json) =
      _$_ShoppingCart.fromJson;

  @override
  String? get shoppingCartID;
  @override
  List<Product> get productsInCart;
  @override
  double get total;
  @override
  bool get paid;
  @override
  @JsonKey(ignore: true)
  _$$_ShoppingCartCopyWith<_$_ShoppingCart> get copyWith =>
      throw _privateConstructorUsedError;
}
