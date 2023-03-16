import 'package:first_week_demo/app_theme/app_buttons.dart';
import 'package:first_week_demo/app_theme/app_colors.dart';
import 'package:first_week_demo/app_theme/size_presets.dart';
import 'package:first_week_demo/authentication/bloc/authentication_bloc.dart';
import 'package:first_week_demo/authentication/bloc/authentication_event.dart';
import 'package:first_week_demo/configuration/router.dart';
import 'package:first_week_demo/payment/bloc/payment_bloc.dart';
import 'package:first_week_demo/shopping_cart/bloc/shopping_cart_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import '../../../app_theme/text_field.dart';
import '../../app_notifications/bloc/app_notification_bloc.dart';
import '../../app_notifications/bloc/app_notification_event.dart';
import '../../configuration/injection.dart';
import '../../payment/bloc/payment_event.dart';
import '../../shopping_cart/bloc/shopping_cart_bloc.dart';
import '../bloc/authentication_state.dart';
import '../user_model/user.dart';

class LogInView extends StatelessWidget {
  LogInView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
         listener: (_, state) {
        if (state.userAuthenticationStatus ==
            UserAuthenticationStatus.authenticated) {
          getIt.get<Logger>().i("Calling cart bloc ");
          context
              .read<ShoppingCartBloc>()
              .add(ShoppingCartStarted(state.jsonToken!));

          context
              .read<AppNotificationBloc>()
              .add(AppNotificationSet(state.jsonToken!));

          context
              .read<PaymentBloc>()
              .add(PaymentSetTokenEvent(state.jsonToken!));

          GoRouter.of(context).go(Routes.shoppingCartView);
        }
        if (state.userAuthenticationStatus ==
            UserAuthenticationStatus.userNotFound) {
          Fluttertoast.showToast(
              msg: "Please check your information, this user does not exist");
        }
      },
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
            LogInForm(formKey: _formKey, emailController: emailController, passwordController: passwordController),
            AppButtonWithIcon(
              text: "Log in with Facebook",
              onPressed: () =>
                  context.read<AuthenticationBloc>().add(FacebookLogInEvent()),
              icon: Icons.facebook,
              color: AppColors.mainColor,
              context: context,
            ),
            SizedBox(height: SizePresets.of(context).customHeight(18, context)),
            AppButtonWithIcon(
              text: "Log in with Google",
              onPressed: () =>
                  context.read<AuthenticationBloc>().add(GoogleLogInEvent()),
              icon: Icons.g_mobiledata_sharp,
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
      ),
    ));
  }
}

class LogInForm extends StatelessWidget {
  const LogInForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.passwordController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
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
                    context.read<AuthenticationBloc>().add(LogInEvent(
                        User(
                            email: emailController.text,
                            password: passwordController.text)));
                  }
                }),
            SizedBox(
                height:
                    SizePresets.of(context).customHeight(30, context)),
          ],
        ));
  }
}
