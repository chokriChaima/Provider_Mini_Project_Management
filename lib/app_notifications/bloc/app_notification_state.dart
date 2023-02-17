import 'package:first_week_demo/app_notifications/app_notifications_module/app_notification.dart';
import 'package:first_week_demo/product/product_model/product.dart';
import 'package:flutter/cupertino.dart';

enum AppNotificationStatus {
  success,
  loading,
  failure


}
@immutable
class AppNotificationState {
  final AppNotificationStatus appNotificationStatus ;
  final String? cartID ;
  final List<AppNotification>? appNotificationsList ;

  const AppNotificationState({this.appNotificationsList ,required this.appNotificationStatus,this.cartID});
}

