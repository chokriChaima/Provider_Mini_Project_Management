import 'package:first_week_demo/models/core/product.dart';
import 'package:first_week_demo/providers/shopping_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_theme/app_colors.dart';
import 'app_theme/size_presets.dart';
import 'app_theme/text_style.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.product,
    required this.measures,
  });

  final SizePresets measures;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.symmetric(
            horizontal: measures.customWidth(12),
            vertical: measures.customPaddingTop(6)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50), //<-- SEE HERE
        ),
        tileColor: AppColors.mainColor.withOpacity(0.07),
        title: Padding(
          padding: EdgeInsets.only(bottom: measures.customPaddingTop(7)),
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
        trailing: IconButton(
            icon: Icon(
              Provider.of<ShoppingCartProvider>(context, listen: true)
                      .isExist(product)
                  ? Icons.remove
                  : Icons.add,
              color: AppColors.mainColor,
            ),
            onPressed: () {
              Provider.of<ShoppingCartProvider>(context, listen: false)
                  .modifyShoppingCart(
                      product: product,
                      toAdd: !Provider.of<ShoppingCartProvider>(context,
                              listen: false)
                          .isExist(product));
            }));
  }
}
