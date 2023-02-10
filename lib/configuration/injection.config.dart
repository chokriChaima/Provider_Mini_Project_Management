// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:first_week_demo/configuration/injection.dart' as _i12;
import 'package:first_week_demo/payment/bloc/payment_bloc.dart' as _i9;
import 'package:first_week_demo/payment/payment_service.dart' as _i5;
import 'package:first_week_demo/product/product_list_bloc/product_bloc.dart'
    as _i10;
import 'package:first_week_demo/product/product_service.dart' as _i6;
import 'package:first_week_demo/product/product_tile_bloc/product_tile_bloc.dart'
    as _i7;
import 'package:first_week_demo/shopping_cart/bloc/shopping_cart_bloc.dart'
    as _i11;
import 'package:first_week_demo/shopping_cart/shopping_cart_service.dart'
    as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i4;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final myModules = _$MyModules();
    gh.factory<_i3.Dio>(() => myModules.dio);
    gh.factory<_i4.Logger>(() => myModules.logger);
    gh.factory<_i5.PaymentService>(() => _i5.PaymentService(
          gh<_i4.Logger>(),
          gh<_i3.Dio>(),
        ));
    gh.factory<_i6.ProductService>(() => _i6.ProductService(
          gh<_i4.Logger>(),
          gh<_i3.Dio>(),
        ));
    gh.factory<_i7.ProductTileBloc>(
        () => _i7.ProductTileBloc(gh<_i4.Logger>()));
    gh.factory<_i8.ShoppingCartService>(() => _i8.ShoppingCartService(
          gh<_i3.Dio>(),
          gh<_i4.Logger>(),
        ));
    gh.factory<_i9.PaymentBloc>(() => _i9.PaymentBloc(
          gh<_i5.PaymentService>(),
          gh<_i4.Logger>(),
        ));
    gh.factory<_i10.ProductBloc>(
        () => _i10.ProductBloc(gh<_i6.ProductService>()));
    gh.factory<_i11.ShoppingCartBloc>(() => _i11.ShoppingCartBloc(
          gh<_i8.ShoppingCartService>(),
          gh<_i4.Logger>(),
        ));
    return this;
  }
}

class _$MyModules extends _i12.MyModules {}
