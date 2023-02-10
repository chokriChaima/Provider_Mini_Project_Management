import 'package:first_week_demo/app_theme/app_colors.dart';
import 'package:first_week_demo/app_theme/size_presets.dart';
import 'package:first_week_demo/configuration/router.dart';
import 'package:first_week_demo/product/product_views/product_tile.dart';
import 'package:first_week_demo/shopping_cart/bloc/shopping_cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import '../../app_theme/app_buttons.dart';
import '../../app_theme/text_style.dart';
import '../bloc/shopping_cart_bloc.dart';

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0.1),
                child: Container(
                  color: AppColors.mainColor,
                  height: 0.5,
                ),
              ),
              centerTitle: true,
              title: Text(
                "Shopping Cart",
                style: AppTextStyle.boldText(
                  size: 24,
                ),
              ),
              leading: IconButton(
                onPressed: () => GoRouter.of(context)
                    .go(Routes.shoppingCartRegistrationPage),
                icon: Icon(
                  Icons.logout,
                  color: AppColors.mainColor,
                ),
              ),
            ),
            body: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizePresets.of(context).customPaddingTop(1, context),
                  ),
                child: Column(children: [

                  Expanded(
                      child: BlocConsumer<ShoppingCartBloc, ShoppingCartState>(
                          listener: (_, state) {
                    if (state.status == ShoppingCartStatus.failure) {
                      Fluttertoast.showToast(msg: "Connection Problem");
                    }
                  }, builder: (_, shoppingCartState) {

                    if (shoppingCartState
                        .currentShoppingCart!.productsInCart.isEmpty) {
                      return Center(
                        child: Text(
                          "No Products have been added to your cart",
                          style: AppTextStyle.normalText(),
                          textAlign: TextAlign.center,
                        ),
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizePresets.of(context)
                                .customWidth(12, context)),
                        child: ListView.separated(
                          separatorBuilder: (_, index) => SizedBox(
                            height: SizePresets.of(context)
                                .customHeight(35, context),
                          ),
                          itemCount: shoppingCartState
                              .currentShoppingCart!.productsInCart.length,
                          itemBuilder: (_, index) => Column(
                            children: [
                              ProductTile(
                                  product: shoppingCartState
                                      .currentShoppingCart!.productsInCart
                                      .elementAt(index)),
                            ],
                          ),
                        ),
                      );
                    }
                  })),
                  SizedBox(
                    height:
                        SizePresets.of(context).customPaddingTop(2, context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppButton(
                          text: "Done",
                          heightDiv: 15,
                          widthDiv: 5,
                          onPressed: () =>
                              GoRouter.of(context).push(Routes.purchasePage)),
                      AppButton(
                          text: "Add",
                          heightDiv: 15,
                          widthDiv: 5,
                          onPressed: () =>
                              GoRouter.of(context).push(Routes.productsPage))
                    ],
                  )
                ]))));
  }
}

//For Testing
