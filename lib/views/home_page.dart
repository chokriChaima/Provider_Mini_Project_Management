import 'package:first_week_demo/providers/product_provider.dart';
import 'package:first_week_demo/views/app_theme/app_buttons.dart';
import 'package:first_week_demo/views/product_tile.dart';
import 'package:first_week_demo/views/shopping_cart_view.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../models/core/product.dart';
import 'app_theme/app_colors.dart';
import 'app_theme/loading_widget.dart';
import 'app_theme/size_presets.dart';
import 'app_theme/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    SizePresets measures = SizePresets(context: context);
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: measures.customWidth(12),
            vertical: measures.customHeight(14)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Product ",
                  style: AppTextStyle.normalText(size: 40),
                ),
                Text(
                  "List",
                  style: AppTextStyle.boldText(
                      size: 40, color: AppColors.mainColor.withOpacity(0.6)),
                ),
              ],
            ),
            SizedBox(
              height: measures.customPaddingTop(2.5),
            ),
            buildProductListConsumer(measures),
            SizedBox(
              height: measures.customPaddingTop(7),
            ),
            AppButton(
                text: "See Shopping Cart",
                heightDiv: 15,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShoppingCartView()),
                  );
                })
          ],
        ),
      )
          // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }

  Consumer<ProductProvider> buildProductListConsumer(SizePresets measures) {
    return Consumer<ProductProvider>(builder: (_, productProvider, __) {
      return Expanded(
        child: FutureBuilder(
            future: productProvider.getProducts(),
            builder: (_, AsyncSnapshot<List<Product>?> result) {
              var logger = Logger();
              logger.d(result.data);
              if (result.hasData) {
                if (result.data!.isEmpty) {
                  return Text(
                    "No Products Available at The Moment",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.normalText(),
                  );
                }
                return

                  ListView.builder(
                  itemCount: result.data!.length,
                  itemBuilder: (_, index) => Column(
                    children: [
                      ProductTile(
                        measures: measures,
                        product: result.data!.elementAt(index),
                      ),
                      SizedBox(
                        height: measures.customPaddingTop(2),
                      )
                    ],
                  ),
                );
              } else if (result.connectionState == ConnectionState.waiting) {
                return const LoadingWidget();
              } else {
                return const Center(child: Text("Error"));
              }
            }),
      );
    });
  }
}

