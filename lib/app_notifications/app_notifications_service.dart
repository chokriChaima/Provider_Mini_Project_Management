import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../configuration/api_links.dart';
import 'app_notifications_module/app_notification.dart';

@injectable
class AppNotificationService {
  Dio dio;

  Logger logger;

  AppNotificationService(this.logger, this.dio);

  Future<List<AppNotification>?> getAppNotificationsForCart(
      String cartID) async {
    try {
      Response response =
          await dio.get(ApiLinks.appNotificationForCart(cartID));

      return List<AppNotification>.from(
          response.data.map((e) => AppNotification.fromJson(e)));
    } on DioError catch (e) {
      logger.e("Dio Failed $e");
      return null;
    }
  }
}
