import 'package:first_week_demo/configuration/router.dart';
import 'package:first_week_demo/user_preferences/bloc/user_preferences_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'app_colors.dart';

class BottomNavigationBarApp extends StatefulWidget {
  int currentIndex;

  BottomNavigationBarApp({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  State<BottomNavigationBarApp> createState() => _BottomNavigationBarAppState();
}

class _BottomNavigationBarAppState extends State<BottomNavigationBarApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPreferencesBloc, ThemeMode>(
      builder: (_, state) => BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: (index) => setState(() => widget.currentIndex = index),
        unselectedItemColor: state == ThemeMode.dark ? AppColors.backgroundColor: AppColors.darkColor,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.mainColor,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () =>
                    GoRouter.of(context).push(Routes.shoppingCartView)),
            // label: AppLocalizations.of(context)!.myLessons,
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () =>
                    GoRouter.of(context).push(Routes.appNotificationView)),
            label: "Notification",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                icon: const Icon(Icons.library_add_sharp),
                onPressed: () =>
                    GoRouter.of(context).push(Routes.productsPage)),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                icon: const Icon(Icons.payment),
                onPressed: () =>
                    GoRouter.of(context).push(Routes.purchasePage)),
            label: "Payment",
          ),
        ],
      ),
    );
  }
}
