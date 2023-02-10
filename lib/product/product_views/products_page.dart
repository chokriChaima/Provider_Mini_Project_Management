import 'package:first_week_demo/app_theme/app_buttons.dart';
import 'package:first_week_demo/configuration/router.dart';
import 'package:first_week_demo/product/product_list_bloc/product_bloc.dart';
import 'package:first_week_demo/product/product_list_bloc/product_event.dart';
import 'package:first_week_demo/product/product_views/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../app_theme/app_colors.dart';
import '../../app_theme/size_presets.dart';
import '../../app_theme/text_style.dart';
import '../product_list_bloc/product_state.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    final SizePresets measures = SizePresets.of(context);
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: measures.customWidth(12, context),
            vertical: measures.customHeight(14, context)),
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
              height: measures.customPaddingTop(2.5, context),
            ),
            const ProductList(),
            SizedBox(
              height: measures.customPaddingTop(7, context),
            ),
            AppButton(
                text: "See Shopping Cart",
                heightDiv: 15,
                onPressed: () =>
                    GoRouter.of(context).push(Routes.shoppingCartView))
          ],
        ),
      )
          // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({
    super.key,
  });

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    context.read<ProductBloc>().add(ProductStarted());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final measures = SizePresets.of(context);
    return Expanded(
      child: BlocBuilder<ProductBloc, ProductState>(builder: (_, productState) {
        if (productState.productsState == ProductsStates.loading) {
          return const Center(
            child: SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
          );
        } else if (productState.productsState == ProductsStates.success) {
          if (productState.products!.isEmpty) {
            return Text(
              "No Products Available at The Moment",
              textAlign: TextAlign.center,
              style: AppTextStyle.normalText(),
            );
          }
          return ListView.builder(
            itemCount: productState.products!.length,
            itemBuilder: (_, index) => Column(
              children: [
                ProductTile(
                  product: productState.products!.elementAt(index),
                ),
                SizedBox(
                  height: measures.customHeight(35, context),
                )
              ],
            ),
          );
        } else {
          return Text("Connection Error",
              textAlign: TextAlign.center, style: AppTextStyle.normalText());
        }
      }),
    );
  }
}
