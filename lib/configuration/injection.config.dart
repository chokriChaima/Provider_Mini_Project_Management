// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:first_week_demo/app_notifications/app_notifications_service.dart'
    as _i9;
import 'package:first_week_demo/app_notifications/bloc/app_notification_bloc.dart'
    as _i14;
import 'package:first_week_demo/authentification/facebook_login.dart' as _i10;
import 'package:first_week_demo/configuration/injection.dart' as _i15;
import 'package:first_week_demo/payment/bloc/payment_bloc.dart' as _i11;
import 'package:first_week_demo/payment/payment_service.dart' as _i5;
import 'package:first_week_demo/product/product_list_bloc/product_bloc.dart'
    as _i12;
import 'package:first_week_demo/product/product_service.dart' as _i6;
import 'package:first_week_demo/shopping_cart/bloc/shopping_cart_bloc.dart'
    as _i13;
import 'package:first_week_demo/shopping_cart/shopping_cart_service.dart'
    as _i7;
import 'package:first_week_demo/user_preferences/bloc/user_preferences_bloc.dart'
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
    gh.factory<_i7.ShoppingCartService>(() => _i7.ShoppingCartService(
          gh<_i3.Dio>(),
          gh<_i4.Logger>(),
        ));
    gh.factory<_i8.UserPreferencesBloc>(() => _i8.UserPreferencesBloc());
    gh.factory<_i9.AppNotificationService>(() => _i9.AppNotificationService(
          gh<_i4.Logger>(),
          gh<_i3.Dio>(),
        ));
    gh.factory<_i10.FacebookLogin>(() => _i10.FacebookLogin(gh<_i4.Logger>()));
    gh.factory<_i11.PaymentBloc>(() => _i11.PaymentBloc(
          gh<_i5.PaymentService>(),
          gh<_i4.Logger>(),
        ));
    gh.factory<_i12.ProductBloc>(
        () => _i12.ProductBloc(gh<_i6.ProductService>()));
    gh.factory<_i13.ShoppingCartBloc>(() => _i13.ShoppingCartBloc(
          gh<_i7.ShoppingCartService>(),
          gh<_i4.Logger>(),
        ));
    gh.factory<_i14.AppNotificationBloc>(
        () => _i14.AppNotificationBloc(gh<_i9.AppNotificationService>()));
    return this;
  }
}

class _$MyModules extends _i15.MyModules {}
