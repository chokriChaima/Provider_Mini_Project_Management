import 'package:first_week_demo/shopping_cart/bloc/shopping_cart_event.dart';
import 'package:first_week_demo/user_preferences/bloc/user_preferences_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_theme/app_colors.dart';
import '../../app_theme/size_presets.dart';
import '../../product/product_model/product.dart';
import '../bloc/shopping_cart_bloc.dart';

class ShoppingCartItem extends StatelessWidget {
  const ShoppingCartItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPreferencesBloc,ThemeMode>(
        builder: (_, state) => Card(
              color: state == ThemeMode.dark
                  ? AppColors.mainColor.withOpacity(0.2)
                  : null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), //<-- SEE HERE
              ),

              elevation: 10,
              child: Column(children: [
                SizedBox(
                  height: SizePresets.of(context).customHeight(39, context),
                ),
                Text(product.productName,
                    style: Theme.of(context).textTheme.bodyLarge),
                SizedBox(
                    height: SizePresets.of(context).customHeight(60, context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(product.totalPrice.toString(),
                        style: Theme.of(context).textTheme.headlineMedium),
                    Text("  TDN",
                        style: Theme.of(context).textTheme.headlineMedium),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => context
                          .read<ShoppingCartBloc>()
                          .add(ShoppingCartIncrementedProduct(product.productInfoID!)),
                      icon: const Icon(Icons.add),
                      color: AppColors.mainColor,
                    ),
                    Text(product.quantity.toString()),
                    IconButton(
                      onPressed: () => context
                          .read<ShoppingCartBloc>()
                          .add(ShoppingCartDecrementedProduct(product.productInfoID!)),
                      icon: const Icon(Icons.remove),
                      color: AppColors.mainColor,
                    ),
                  ],
                )
              ]),
            ));
  }
}
