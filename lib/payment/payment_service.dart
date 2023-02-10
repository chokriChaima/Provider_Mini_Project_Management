import 'package:dio/dio.dart';
import 'package:first_week_demo/payment/payment.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../configuration/api_links.dart';

@injectable
class PaymentService {
  final Dio dio;

  final Logger logger;

  PaymentService(this.logger, this.dio);

  Future<Payment?> post(Payment newPayment) async {
    try {
      Response response = await dio.post(
        ApiLinks.addPaymentLink,
        data: newPayment.toJson(),
      );

      return Payment.fromJson(response.data);
    } catch (e) {
      logger.e("Payment Post Failed with error : $e");
      return null;
    }
  }
}
