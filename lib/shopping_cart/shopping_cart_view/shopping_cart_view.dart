import 'package:first_week_demo/app_theme/app_colors.dart';
import 'package:first_week_demo/app_theme/bottom_navigation_bar.dart';
import 'package:first_week_demo/app_theme/size_presets.dart';
import 'package:first_week_demo/authentication/bloc/authentication_bloc.dart';
import 'package:first_week_demo/authentication/bloc/authentication_event.dart';
import 'package:first_week_demo/configuration/router.dart';
import 'package:first_week_demo/shopping_cart/bloc/shopping_cart_state.dart';
import 'package:first_week_demo/shopping_cart/shopping_cart_view/shopping_cart_item.dart';
import 'package:first_week_demo/user_preferences/bloc/user_preferences_bloc.dart';
import 'package:first_week_demo/user_preferences/bloc/user_preferences_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../app_notifications/bloc/app_notification_bloc.dart';
import '../../app_notifications/bloc/app_notification_event.dart';
import '../../authentication/bloc/authentication_state.dart';
import '../bloc/shopping_cart_bloc.dart';

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (_, state) {
            if (state.userAuthenticationStatus ==
                UserAuthenticationStatus.loggedOut) {
              GoRouter.of(context).go(Routes.firstView);
            }

          },
          child: Scaffold(
            appBar: AppBar(
              actions: [
                BlocBuilder<UserPreferencesBloc, ThemeMode>(
                  builder: (_, state) => Switch(
                    value: state == ThemeMode.dark,
                    activeColor: AppColors.mainColor,
                    onChanged: (value) {
                      value
                          ? context
                              .read<UserPreferencesBloc>()
                              .add(UserPreferencesDarkThemeEnabled())
                          : context
                              .read<UserPreferencesBloc>()
                              .add(UserPreferencesLightThemeEnabled());
                    },
                  ),
                )
              ],
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
              title: Text("Shopping Cart",
                  style: Theme.of(context).textTheme.titleMedium),
              leading: IconButton(
                onPressed: () =>
                    context.read<AuthenticationBloc>().add(LogOutEvent()),
                icon: Icon(
                  Icons.logout,
                  color: AppColors.mainColor,
                ),
              ),
            ),
            body: Padding(
                padding: EdgeInsets.symmetric(
                  vertical:
                      SizePresets.of(context).customPaddingTop(1, context),
                ),
                child: Column(children: [
                  Expanded(
                      child: BlocConsumer<ShoppingCartBloc, ShoppingCartState>(
                          listener: (_, state) {
                    if (state.status == ShoppingCartStatus.failure) {
                      Fluttertoast.showToast(msg: "Connection Problem");
                    }

                  }, builder: (_, shoppingCartState) {
                    if (shoppingCartState.status ==
                        ShoppingCartStatus.success) {
                      if (shoppingCartState
                          .currentShoppingCart!.productInfoDTOList.isEmpty) {
                        return Center(
                          child: Text(
                            "No Products have been added to your cart",
                            style: Theme.of(context).textTheme.bodyMedium,
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
                                .currentShoppingCart!.productInfoDTOList.length,
                            itemBuilder: (_, index) => Column(
                              children: [
                                ShoppingCartItem(
                                    product: shoppingCartState
                                        .currentShoppingCart!.productInfoDTOList
                                        .elementAt(index)),
                              ],
                            ),
                          ),
                        );
                      }
                    } else {
                      return const Center(
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  })),
                  SizedBox(
                    height:
                        SizePresets.of(context).customPaddingTop(2, context),
                  ),
                ])),
            bottomNavigationBar: BottomNavigationBarApp(
              currentIndex: 0,
            ),
          )),
    );
  }
}

//For Testing
