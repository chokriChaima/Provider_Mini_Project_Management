import 'package:first_week_demo/app_theme/app_buttons.dart';
import 'package:first_week_demo/app_theme/app_colors.dart';
import 'package:first_week_demo/app_theme/size_presets.dart';
import 'package:first_week_demo/authentification/service/facebook_service.dart';
import 'package:first_week_demo/authentification/service/user_service.dart';
import 'package:first_week_demo/configuration/router.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import '../../../app_theme/text_field.dart';
import '../../configuration/injection.dart';
import '../user_model/user.dart';

class LogInView extends StatelessWidget {
  LogInView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizePresets.of(context).customPaddingTop(2, context),
            vertical: SizePresets.of(context).customPaddingTop(0.6, context)),
        child: ListView(children: [

          Text(
            "Welcome",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: SizePresets.of(context).customHeight(35, context)),

          Text(
            "Please Enter your account information",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: SizePresets.of(context).customHeight(18, context)),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  AppTextFormField(
                      context: context,
                      hintText: "Email Address",
                      icon: Icons.email,
                      controller: emailController),
                  AppTextFormField(
                      context: context,
                      hintText: "Password",
                      isLast: true,
                      icon: Icons.password,
                      controller: passwordController),
                  SizedBox(
                      height:
                          SizePresets.of(context).customHeight(20, context)),
                  AppButton(
                      text: "Log In",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          normalLogin(context, emailController.text,
                              passwordController.text);
                        }
                      }),
                  SizedBox(
                      height:
                          SizePresets.of(context).customHeight(30, context)),
                ],
              )),
          AppButtonWithIcon(
            text: "Log in with Facebook",
            onPressed: () => facebookLogin(context),
            icon: Icons.facebook,
            color: AppColors.mainColor,
            context: context,
          ),
          SizedBox(height: SizePresets.of(context).customHeight(30, context)),
          Row(
            children: [
              Text(
                "If you don't have an account",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextButton(
                  onPressed: () => GoRouter.of(context).push(Routes.signUp),
                  child: Text(
                    "Sign Up",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ))
            ],
          )
        ]),
      ),
    ));
  }

  facebookLogin(BuildContext context) async {
    getIt.get<Logger>().d("clocking");
    bool authentificationResult =
        await getIt.get<FacebookService>().logInAsFacebookUser();
    if (authentificationResult) {
      GoRouter.of(context).go(Routes.shoppingCartRegistrationPage);
    } else {
      Fluttertoast.showToast(msg: "Unknown Facebook User");
    }
  }

  normalLogin(BuildContext context, String email, String password) async {
    User? authentificationResult =
        await getIt.get<UserService>().logInUser(email, password);
    if (authentificationResult != null) {
      GoRouter.of(context).go(Routes.shoppingCartRegistrationPage);
    } else {
      Fluttertoast.showToast(
          msg: "Please check your information, this user does not exist");
    }
  }
}
