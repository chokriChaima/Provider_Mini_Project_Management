import 'package:first_week_demo/app_theme/size_presets.dart';
import 'package:first_week_demo/shopping_cart/bloc/shopping_cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import '../../app_theme/app_colors.dart';
import '../../app_theme/bottom_navigation_bar.dart';
import '../../configuration/injection.dart';
import '../../shopping_cart/bloc/shopping_cart_bloc.dart';
import '../bloc/app_notification_bloc.dart';
import '../bloc/app_notification_event.dart';
import '../bloc/app_notification_state.dart';
import 'app_notification_tile.dart';

class AppNotificationList extends StatefulWidget {
  const AppNotificationList({super.key}) ;

  @override
  State<AppNotificationList> createState() => _AppNotificationListState();
}

class _AppNotificationListState extends State<AppNotificationList> {

  @override
  void initState() {

    context.read<AppNotificationBloc>().add(AppNotificationReload());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Payment Notifications",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        leading: IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_sharp,
            color: AppColors.mainColor,
          ),
        ),
      ),
      body: BlocBuilder<AppNotificationBloc, AppNotificationState>(
          builder: (_, appNotificationState) {
        if (appNotificationState.appNotificationStatus ==
            AppNotificationStatus.loading) {
          return const Center(
            child: SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
          );
        } else if (appNotificationState.appNotificationStatus ==
            AppNotificationStatus.success) {
          if (appNotificationState.appNotificationsList!.isEmpty) {
            return Center(
              child: Text(
                "You don't have any notifications",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(
             vertical: SizePresets.of(context).customHeight(25, context),
             horizontal: SizePresets.of(context).customHeight(55, context),
            ),
            child: ListView.builder(
              itemCount: appNotificationState.appNotificationsList!.length,
              itemBuilder: (_, index) => Column(
                children: [
                  AppNotificationTile(
                    appNotification: appNotificationState.appNotificationsList!
                        .elementAt(index),
                  ),
                  SizedBox(
                    height: SizePresets.of(context).customHeight(35, context),
                  )
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: Text("Connection Error",
                style: Theme.of(context).textTheme.bodyMedium),
          );
        }
      }),
      bottomNavigationBar: BottomNavigationBarApp(
        currentIndex: 1,
      ),
    );
  }
}
