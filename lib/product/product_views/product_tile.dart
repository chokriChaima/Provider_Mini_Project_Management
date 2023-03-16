import 'package:first_week_demo/product/product_model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_theme/app_colors.dart';
import '../../app_theme/size_presets.dart';
import '../../shopping_cart/bloc/shopping_cart_bloc.dart';
import '../../shopping_cart/bloc/shopping_cart_event.dart';
import '../../shopping_cart/bloc/shopping_cart_state.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
          horizontal: SizePresets.of(context).customWidth(12, context),
          vertical: SizePresets.of(context).customPaddingTop(6, context)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50), //<-- SEE HERE
      ),
      tileColor: AppColors.mainColor.withOpacity(0.2),
      title: Padding(
        padding: EdgeInsets.only(
            bottom: SizePresets.of(context).customHeight(60, context)),
        child: Text(product.productName,
            style: Theme.of(context).textTheme.bodyMedium),
      ),
      subtitle: Row(
        children: [
          Text(product.productPrice.toString(),
              style: Theme.of(context).textTheme.headlineMedium),
          Text("  TDN", style: Theme.of(context).textTheme.headlineMedium),
        ],
      ),



      trailing: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
        builder: (_, state) {
          if (!state.currentShoppingCart!.productInfoDTOList
              .contains(product)) {
            return IconButton(
              onPressed: () => context
                  .read<ShoppingCartBloc>()
                  .add(ShoppingCartAddedProduct(product.productID)),
              icon: const Icon(Icons.add),
              color: AppColors.mainColor,
            );
          } else {
            return Icon(
              Icons.done,
              color: AppColors.mainColor,
            );
          }
        },
      ),
    );
  }
}
