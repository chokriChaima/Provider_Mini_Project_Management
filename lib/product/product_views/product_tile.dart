import 'package:first_week_demo/product/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_theme/app_colors.dart';
import '../../app_theme/size_presets.dart';
import '../../app_theme/text_style.dart';
import '../../shopping_cart/bloc/shopping_cart_bloc.dart';
import '../../shopping_cart/bloc/shopping_cart_event.dart';
import '../../shopping_cart/bloc/shopping_cart_state.dart';
import '../product_tile_bloc/product_tile_bloc.dart';
import '../product_tile_bloc/product_tile_event.dart';
import '../product_tile_bloc/product_tile_state.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final SizePresets measures = SizePresets.of(context);
    return BlocListener<ProductTileBloc, ProductTileState>(
        listener: (context, state) {
          if (state.status == ProductTileStatus.added &&
              state.id == product.productID) {
            context
                .read<ShoppingCartBloc>()
                .add(ShoppingCartAddedProduct(product));
          }
          if (state.status == ProductTileStatus.removed &&
              state.id == product.productID) {
            context
                .read<ShoppingCartBloc>()
                .add(ShoppingCartRemovedProduct(product));
          }
        },
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
              horizontal: measures.customWidth(12, context),
              vertical: measures.customPaddingTop(6, context)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50), //<-- SEE HERE
          ),
          tileColor: AppColors.mainColor.withOpacity(0.07),
          title: Padding(
            padding:
                EdgeInsets.only(bottom: measures.customPaddingTop(7, context)),
            child: Text(product.productName, style: AppTextStyle.boldText()),
          ),
          subtitle: Row(
            children: [
              Text(product.productPrice.toString(),
                  style: AppTextStyle.normalText(color: AppColors.grey)),
              Text("  TDN",
                  style: AppTextStyle.normalText(color: AppColors.grey)),
            ],
          ),
          trailing: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
            builder: (context, state) {
              if (state.currentShoppingCart!.productsInCart.contains(product)) {
                return IconButton(
                  onPressed: () => context
                      .read<ProductTileBloc>()
                      .add(ProductTileRemoveButtonPressed(product.productID)),
                  icon: const Icon(Icons.remove),
                  color: AppColors.mainColor,
                );
              } else {
                return IconButton(
                  onPressed: () => context
                      .read<ProductTileBloc>()
                      .add(ProductTileAddButtonPressed(product.productID)),
                  icon: const Icon(Icons.add),
                  color: AppColors.mainColor,
                );
              }
            },
          ),
        ));
  }
}
