// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:first_week_demo/configuration/injection.dart' as _i9;
import 'package:first_week_demo/models/services/product_service.dart' as _i5;
import 'package:first_week_demo/models/services/shopping_cart_service.dart'
    as _i6;
import 'package:first_week_demo/providers/product_provider.dart' as _i7;
import 'package:first_week_demo/providers/shopping_cart_provider.dart' as _i8;
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
    gh.factory<_i5.ProductService>(() => _i5.ProductService(
          gh<_i4.Logger>(),
          gh<_i3.Dio>(),
        ));
    gh.factory<_i6.ShoppingCartService>(() => _i6.ShoppingCartService(
          gh<_i3.Dio>(),
          gh<_i4.Logger>(),
        ));
    gh.factory<_i7.ProductProvider>(() => _i7.ProductProvider(
          gh<_i5.ProductService>(),
          gh<_i4.Logger>(),
        ));
    gh.factory<_i8.ShoppingCartProvider>(() => _i8.ShoppingCartProvider(
          gh<_i6.ShoppingCartService>(),
          gh<_i4.Logger>(),
        ));
    return this;
  }
}

class _$MyModules extends _i9.MyModules {}
