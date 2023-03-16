import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'app_notifications_module/app_notification.dart';

@injectable
class AppNotificationService {
  Dio dio;

  static String appNotificationsForCart=
      "/secure/payment-notifications/for-cart";
  Logger logger;

  AppNotificationService(this.logger, this.dio);

  Future<List<AppNotification>?> getAppNotificationsForCart(String jsonToken
    ) async {
    dio.options.headers["Authorization"] = "Bearer $jsonToken";
    try {
      Response response =
          await dio.get(dio.options.baseUrl + appNotificationsForCart);

      return List<AppNotification>.from(
          response.data.map((e) => AppNotification.fromJson(e)));
    } on DioError catch (e) {
      logger.e("Dio Failed $e");
      return null;
    }
  }
}
