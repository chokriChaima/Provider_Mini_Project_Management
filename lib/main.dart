import 'package:first_week_demo/app_theme/app_colors.dart';
import 'package:first_week_demo/app_theme/size_presets.dart';
import 'package:first_week_demo/configuration/injection.dart';
import 'package:first_week_demo/configuration/router.dart';
import 'package:first_week_demo/payment/bloc/payment_bloc.dart';
import 'package:first_week_demo/product/product_list_bloc/product_bloc.dart';
import 'package:first_week_demo/product/product_tile_bloc/product_tile_bloc.dart';
import 'package:first_week_demo/shopping_cart/bloc/shopping_cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  configureDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ProductBloc>(
        create: (_) => getIt.get<ProductBloc>(),
      ),
      BlocProvider<ShoppingCartBloc>(
          create: (_) => getIt.get<ShoppingCartBloc>()),
      BlocProvider<ProductTileBloc>(
          create: (_) => getIt.get<ProductTileBloc>()),
      BlocProvider<PaymentBloc>(create: (_) => getIt.get<PaymentBloc>())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SizePresets(
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.light(
              primary: AppColors.mainColor,
            ),
            scaffoldBackgroundColor: AppColors.backgroundColor),
      ),
    );
  }
}
