import 'package:first_week_demo/providers/shopping_cart_provider.dart';
import 'package:first_week_demo/views/app_theme/app_buttons.dart';
import 'package:first_week_demo/views/app_theme/app_colors.dart';
import 'package:first_week_demo/views/app_theme/size_presets.dart';
import 'package:first_week_demo/views/product_tile.dart';
import 'package:first_week_demo/views/purchase_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_theme/text_style.dart';

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SizePresets measures = SizePresets(context: context);
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: measures.customWidth(12),
            vertical: measures.customHeight(14)),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: AppColors.mainColor,
                  ),
                ),
                SizedBox(
                  width: measures.customWidth(10),
                ),
                Text(
                  "Shopping Cart",
                  style: AppTextStyle.normalText(size: 24),
                ),
              ],
            ),
            SizedBox(
              height: measures.customPaddingTop(1),
            ),
            Expanded(child: Consumer<ShoppingCartProvider>(
                builder: (_, shoppingCartProvider, __) {
              if (shoppingCartProvider
                  .getCurrentShoppingCart()!
                  .productsInCart
                  .isEmpty) {
                return Center(
                  child: Text(
                    "No Products have been added to your cart",
                    style: AppTextStyle.normalText(),
                    textAlign: TextAlign.center,
                  ),
                );
              }
              return ListView.separated(
                separatorBuilder: (_, index) => SizedBox(
                  height: measures.customPaddingTop(2),
                ),
                itemCount: shoppingCartProvider
                    .getCurrentShoppingCart()!
                    .productsInCart
                    .length,
                itemBuilder: (_, index) => Column(
                  children: [
                    ProductTile(
                        measures: measures,
                        product: shoppingCartProvider
                            .getCurrentShoppingCart()!
                            .productsInCart
                            .elementAt(index)),
                  ],
                ),
              );
            })),

            SizedBox(
              height: measures.customPaddingTop(2),
            ),
            AppButton(
                text: "Purchase",
                heightDiv: 15,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PurchaseView()),
                  );
                })
          ],
        ),
      )
          // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }
}

//For Testing
