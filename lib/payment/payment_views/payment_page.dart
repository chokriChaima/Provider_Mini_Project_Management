import 'package:first_week_demo/configuration/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../app_theme/app_colors.dart';
import '../../../app_theme/size_presets.dart';
import '../../../app_theme/text_style.dart';
import '../../app_theme/app_buttons.dart';
import '../../app_theme/text_field.dart';
import '../../shopping_cart/bloc/shopping_cart_bloc.dart';
import '../../shopping_cart/bloc/shopping_cart_event.dart';
import '../../shopping_cart/bloc/shopping_cart_state.dart';
import '../bloc/payment_bloc.dart';
import '../bloc/payment_event.dart';
import '../bloc/payment_state.dart';
import '../payment.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({super.key});

  final TextEditingController cardHolderName = TextEditingController();
  final TextEditingController cardNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocListener<ShoppingCartBloc, ShoppingCartState>(
      listener: (_, state) {
        if (state.status == ShoppingCartStatus.closed) {
          GoRouter.of(context).go(Routes.shoppingCartRegistrationPage);
        }
      },
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
            "Payment",
            style: AppTextStyle.boldText(
              size: 24,
            ),
          ),
          leading: IconButton(
            onPressed: () => GoRouter.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_sharp,
              color: AppColors.mainColor,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizePresets.of(context).customHeight(10, context),
              horizontal: SizePresets.of(context).customWidth(12, context)),
          child: ListView(children: [
            Text(
              "Purchase Information ",
              style: AppTextStyle.normalText(size: 25),
            ),
            SizedBox(
              height: SizePresets.of(context).customPaddingTop(2, context),
            ),
            Text(
              "Total",
              style: AppTextStyle.normalText(),
            ),
            SizedBox(
              height: SizePresets.of(context).customPaddingTop(5, context),
            ),
            Row(
              children: [
                BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
                    builder: (_, state) => Text(
                          state.currentShoppingCart!.total.toString(),
                          style: AppTextStyle.boldText(
                              size: 29, color: AppColors.mainColor),
                        )),
                Text(
                  " TDN",
                  style: AppTextStyle.normalText(
                      size: 29, color: AppColors.mainColor),
                ),
              ],
            ),
            SizedBox(
              height: SizePresets.of(context).customPaddingTop(2, context),
            ),
            Text(
              "Quantity",
              style: AppTextStyle.normalText(),
            ),
            SizedBox(
              height: SizePresets.of(context).customPaddingTop(5, context),
            ),
            Row(
              children: [
                BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
                    builder: (_, state) => Text(
                          state.currentShoppingCart!.productsInCart.length
                              .toString(),
                          style: AppTextStyle.boldText(
                              size: 29, color: AppColors.mainColor),
                        )),
                Text(
                  " Products",
                  style: AppTextStyle.normalText(
                      size: 26, color: AppColors.mainColor),
                ),
              ],
            ),
            SizedBox(
              height: SizePresets.of(context).customPaddingTop(0.8, context),
            ),
            Text(
              "Fill The Following Fields ",
              style: AppTextStyle.normalText(size: 25),
            ),
            SizedBox(
              height: SizePresets.of(context).customPaddingTop(2, context),
            ),
            Form(
              key: _formKey,
              child: Column(children: [
                AppTextForm.getTextFormField(
                    icon: Icons.perm_identity,
                    hintText: "Enter Card Holder Name",
                    controller: cardHolderName),
                SizedBox(
                  height: SizePresets.of(context).customPaddingTop(2, context),
                ),
                AppTextForm.getTextFormField(
                    icon: Icons.add_card,
                    hintText: "Enter Card Number",
                    controller: cardNumber),
                SizedBox(
                  height: SizePresets.of(context).customPaddingTop(2, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppButton(
                        text: "Cancel",
                        heightDiv: 15,
                        widthDiv: 6,
                        onPressed: () => GoRouter.of(context).pop()),
                    BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
                      builder: (_, state) => AppButton(
                          text: "Done",
                          heightDiv: 15,
                          widthDiv: 6,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<PaymentBloc>().add(
                                  PaymentRequestSent(
                                      payment: Payment(
                                          paymentAmount:
                                              state.currentShoppingCart!.total,
                                          cardHolderName: cardHolderName.text,
                                          cardNumber: cardNumber.text)));

                              showDialog(
                                  context: context,
                                  builder: (_) => const PaymentRequestDialog());
                            }
                          }),
                    )
                  ],
                )
              ]),
            )
          ]),
        ),
      ),
    ));
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class PaymentRequestDialog extends StatelessWidget {
  const PaymentRequestDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: SizedBox(
        width: SizePresets.of(context).customPaddingTop(1, context),
        height: SizePresets.of(context).customPaddingTop(1, context),
        child: Text(
          " Your Payment Request",
          style: AppTextStyle.normalText(),
        ),
      ),
      content: BlocConsumer<PaymentBloc, PaymentState>(
        listener: (_, state) {
          if (state == PaymentState.success) {
            context.read<ShoppingCartBloc>().add(ShoppingCartClosed());
          }
        },
        builder: (_, state) {
          if (state == PaymentState.goingThrough) {
            return SizedBox(
              height: SizePresets.of(context).customPaddingTop(1, context),
              width: SizePresets.of(context).customPaddingTop(1, context),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state == PaymentState.success) {
            return const Text("Your payment has been successfully processed ");
          } else {
            return const Text(
                "Something went Wrong, your payment was not processed");
          }
        },
      ),
      actions: [
        IconButton(
            icon: const Icon(Icons.done),
            color: AppColors.mainColor,
            iconSize: 28,
            onPressed: () {
              GoRouter.of(context).pop();
            }),
      ],
    );
  }
}
