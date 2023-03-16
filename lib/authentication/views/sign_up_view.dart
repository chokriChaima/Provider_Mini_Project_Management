import 'package:first_week_demo/app_theme/app_buttons.dart';
import 'package:first_week_demo/app_theme/app_colors.dart';
import 'package:first_week_demo/app_theme/size_presets.dart';
import 'package:first_week_demo/authentication/bloc/authentication_bloc.dart';
import 'package:first_week_demo/authentication/bloc/authentication_event.dart';
import 'package:first_week_demo/configuration/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../../app_theme/text_field.dart';
import '../bloc/authentication_state.dart';
import '../user_model/user.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizePresets.of(context).customPaddingTop(3, context),
            vertical: SizePresets.of(context).customPaddingTop(1, context)),
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (_, state) {
            if (state.userAuthenticationStatus ==
                UserAuthenticationStatus.signedIn) {
              Fluttertoast.showToast(msg: "You Are Officially a User" );

              GoRouter.of(context).go(Routes.firstView);
            }

            if (state.userAuthenticationStatus ==
                UserAuthenticationStatus.signUpConnectionError) {
              Fluttertoast.showToast(msg: "Sign up Process Failed");
            }
          },
          child: ListView(children: [
            Padding(
              padding: EdgeInsets.only(
                  right: SizePresets.of(context).customWidth(1.4, context)),
              child: AppIconButton(
                  iconData: Icons.arrow_back,
                  bgColor: AppColors.mainColor.withOpacity(0.2),
                  iconColor: AppColors.mainColor,
                  onPressed: () => GoRouter.of(context).pop()),
            ),
            SizedBox(height: SizePresets.of(context).customHeight(15, context)),
            Text(
              "Create",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "Your Account Now",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: SizePresets.of(context).customHeight(60, context)),
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
                        hintText: "User Name",
                        icon: Icons.person,
                        controller: nameController),
                    AppTextFormField(
                        context: context,
                        hintText: "Password",
                        isLast: true,
                        icon: Icons.password,
                        controller: passwordController),
                    SizedBox(
                        height:
                            SizePresets.of(context).customHeight(30, context)),
                    AppButton(
                        text: "Sign Up",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthenticationBloc>().add(SignUpEvent(
                                User(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text)));
                          }
                        }),
                    SizedBox(
                        height:
                            SizePresets.of(context).customHeight(30, context)),
                  ],
                )),
            Row(
              children: [
                Text(
                  "If you already have an account",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextButton(
                    onPressed: () =>
                        GoRouter.of(context).push(Routes.firstView),
                    child: Text(
                      "login",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ))
              ],
            )
          ]),
        ),
      ),
    ));
  }
}
