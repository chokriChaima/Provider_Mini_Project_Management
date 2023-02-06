import 'package:first_week_demo/providers/shopping_cart_provider.dart';
import 'package:first_week_demo/views/app_theme/app_buttons.dart';
import 'package:first_week_demo/views/app_theme/size_presets.dart';
import 'package:first_week_demo/views/app_theme/text_style.dart';
import 'package:first_week_demo/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'app_theme/text_field.dart';

class ShoppingCartRegistrationPage extends StatelessWidget {
   ShoppingCartRegistrationPage({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();
  final Logger logger = Logger();
  @override
  Widget build(BuildContext context) {

    final SizePresets measures = SizePresets(context: context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: measures.customWidth(8),
              vertical: measures.customPaddingTop(0.5)),
          child: ListView(
            children: [
              Text(
                "Welcome To Demo App",
                textAlign: TextAlign.center,
                style: AppTextStyle.boldText(size: 29),
              ),
              SizedBox(height: measures.customPaddingTop(1)),
              Text(
                "Please Enter your shopping Cart ID",
                textAlign: TextAlign.center,
                style: AppTextStyle.normalText(size: 20),
              ),
              SizedBox(height: measures.customPaddingTop(2)),
              AppTextForm.getTextField(
                  hintText: "Cart ID",
                  controller: controller,
                  onSubmitted: (value) =>
                    controller.text = value!
                  ),
              AppButton(
                  text: "Enter App",
                  onPressed: () {
                    logger.d("controller text ${controller.text}");
                    checkShoppingCartExistence(context, controller.text,logger);
                  })
                      ,
              SizedBox(height: measures.customPaddingTop(0.55)),
              Text(
                "If you don't have a shopping cart create one",
                textAlign: TextAlign.center,
                style: AppTextStyle.normalText(size: 20),
              ),
              SizedBox(height: measures.customPaddingTop(5)),
              AppButton(
                  text: "Create", onPressed: () => createShoppingCart(context)),
              SizedBox(height: measures.customPaddingTop(1)),
              Text(
                "Happy Fake Shopping",
                textAlign: TextAlign.center,
                style: AppTextStyle.boldText(size: 29),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createShoppingCart(BuildContext context) async {
    bool result =
        await Provider.of<ShoppingCartProvider>(context, listen: false)
            .createShoppingCart();
    if (result) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
    }
  }
}

checkShoppingCartExistence(BuildContext context, String id,Logger logger) async {

  bool result = await Provider.of<ShoppingCartProvider>(context, listen: false)
      .getShoppingCart(id);
  if (result) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const HomePage()));
  }
  logger.i("Shopping Cart Does not exist");
}
