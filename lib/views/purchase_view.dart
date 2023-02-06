import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/shopping_cart_provider.dart';
import 'app_theme/app_colors.dart';
import 'app_theme/size_presets.dart';
import 'app_theme/text_style.dart';

class PurchaseView extends StatelessWidget {
  const PurchaseView({Key? key}) : super(key: key);

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
                "Purchase Information",
                style: AppTextStyle.normalText(size: 24),
              ),
            ],
          ),
          SizedBox(
            height: measures.customHeight(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: AppTextStyle.normalText(),
              ),
              const Spacer(),
              Consumer<ShoppingCartProvider>(
                  builder: (_, shoppingCartProvider, __) {
                String text;
                if (shoppingCartProvider.getCurrentShoppingCart() == null) {
                  text = "0 ";
                } else {
                  text = shoppingCartProvider
                      .getCurrentShoppingCart()!
                      .getTotal()
                      .toString();
                }
                return Text(
                  text,
                  style: AppTextStyle.boldText(
                      size: 29, color: AppColors.mainColor),
                );
              }),
              Text(
                " TDN",
                style: AppTextStyle.normalText(
                    size: 29, color: AppColors.mainColor),
              ),
            ],
          ),
          SizedBox(
            height: measures.customPaddingTop(6),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Product Number",
                style: AppTextStyle.normalText(),
              ),
              const Spacer(),
              Consumer<ShoppingCartProvider>(
                  builder: (_, shoppingCartProvider, __) {
                String text;
                if (shoppingCartProvider.getCurrentShoppingCart() == null) {
                  text = "0 ";
                } else {
                  text = shoppingCartProvider
                      .getCurrentShoppingCart()!
                      .productsInCart
                      .length
                      .toString();
                }
                return Text(
                  text,
                  style: AppTextStyle.boldText(
                      size: 26, color: AppColors.mainColor),
                );
              }),
              Text(
                " Products",
                style: AppTextStyle.normalText(
                    size: 26, color: AppColors.mainColor),
              ),
            ],
          ),
          SizedBox(
            height: measures.customPaddingTop(1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cart ID",
                style: AppTextStyle.normalText(),
              ),
              const Spacer(),
              Consumer<ShoppingCartProvider>(
                  builder: (_, shoppingCartProvider, __) {
                return
                  ConstrainedBox(constraints:
                  BoxConstraints(
                  maxWidth: measures.customWidth(2)),
                  child : Text(
                    shoppingCartProvider
                        .getCurrentShoppingCart()!
                        .shoppingCartID!,
                    style: AppTextStyle.boldText(
                        size: 26, color: AppColors.mainColor),
                  ));
              }),
            ],
          ),
        ],
      ),
    )));
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
