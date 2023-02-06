import 'package:first_week_demo/configuration/injection.dart';
import 'package:first_week_demo/providers/product_provider.dart';
import 'package:first_week_demo/providers/shopping_cart_provider.dart';
import 'package:first_week_demo/views/app_theme/app_colors.dart';
import 'package:first_week_demo/views/shopping_cart_registration_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  configureDependencies();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => getIt.get<ProductProvider>()),
      ChangeNotifierProvider(create: (_) => getIt.get<ShoppingCartProvider>())
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.light(
            primary: AppColors.mainColor,
          ),
          scaffoldBackgroundColor: AppColors.backgroundColor),
      home: ShoppingCartRegistrationPage(),
    );
  }
}
