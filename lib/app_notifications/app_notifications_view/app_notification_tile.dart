import 'package:flutter/material.dart';

import '../../app_theme/app_colors.dart';
import '../../app_theme/size_presets.dart';
import '../app_notifications_module/app_notification.dart';

class AppNotificationTile extends StatelessWidget {
  const AppNotificationTile({super.key, required this.appNotification});

  final AppNotification appNotification;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
          horizontal: SizePresets.of(context).customWidth(12, context),
          vertical: SizePresets.of(context).customHeight(55, context)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), //<-- SEE HERE
      ),
      tileColor: AppColors.mainColor.withOpacity(0.1),
      title: Padding(
        padding:EdgeInsets.only(
            bottom: SizePresets.of(context).customHeight(60, context)),
        child: Text(
        appNotification.title,
        style: Theme.of(context).textTheme.headlineMedium,),
      ),
      subtitle: Text(appNotification.body,
      style: Theme.of(context).textTheme.bodyMedium,),
    );
  }
}
