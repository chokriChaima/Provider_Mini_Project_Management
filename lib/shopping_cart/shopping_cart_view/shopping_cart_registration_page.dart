import 'package:first_week_demo/app_theme/app_buttons.dart';
import 'package:first_week_demo/app_theme/size_presets.dart';
import 'package:first_week_demo/app_theme/text_style.dart';
import 'package:first_week_demo/configuration/router.dart';
import 'package:first_week_demo/shopping_cart/bloc/shopping_cart_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../app_theme/text_field.dart';
import '../bloc/shopping_cart_bloc.dart';
import '../bloc/shopping_cart_state.dart';

class ShoppingCartRegistrationPage extends StatelessWidget {
  ShoppingCartRegistrationPage({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizePresets.of(context).customPaddingTop(1, context),
              vertical: SizePresets.of(context).customPaddingTop(0.6, context)),
          child: BlocListener<ShoppingCartBloc, ShoppingCartState>(
              listener: (_, shoppingCartState) {
                if (shoppingCartState.status == ShoppingCartStatus.failure) {
                  controller.clear();
                  Fluttertoast.showToast(
                    msg: "Shopping Cart Doses not Exist",
                  );
                }
                if (shoppingCartState.status == ShoppingCartStatus.success) {
                  GoRouter.of(context).push(Routes.shoppingCartView);
                }
                if (shoppingCartState.status == ShoppingCartStatus.closed) {
                  controller.clear();
                  Fluttertoast.showToast(
                    msg: "This Shopping Cart is Closed, Please create Another",
                  );
                }
              },
              child: ListView(
                children: [
                  Text(
                    "Welcome To Demo App",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.boldText(size: 29),
                  ),
                  SizedBox(
                      height:
                          SizePresets.of(context).customHeight(10, context)),
                  Text(
                    "Please Enter your shopping Cart ID",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.normalText(size: 20),
                  ),
                  SizedBox(
                      height:
                          SizePresets.of(context).customHeight(50, context)),
                  AppTextForm.getTextField(
                      hintText: "Cart ID",
                      controller: controller,
                      onSubmitted: (value) {
                        controller.text = value!;
                      }),
                  AppButton(
                      text: "Enter App",
                      onPressed: () {
                        context.read<ShoppingCartBloc>().add(
                            ShoppingCartRegistrationButtonPressed(
                                controller.text));
                      }),
                  SizedBox(
                      height:
                          SizePresets.of(context).customHeight(10, context)),
                  Text(
                    "If you don't have a shopping cart create one",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.normalText(size: 20),
                  ),
                  SizedBox(
                      height:
                          SizePresets.of(context).customHeight(55, context)),
                  AppButton(
                      text: "Create",
                      onPressed: () => context
                          .read<ShoppingCartBloc>()
                          .add(ShoppingCartCreationButtonPressed())),
                  SizedBox(
                      height:
                          SizePresets.of(context).customHeight(10, context)),
                  Text(
                    "Happy Fake Shopping",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.boldText(size: 29),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
