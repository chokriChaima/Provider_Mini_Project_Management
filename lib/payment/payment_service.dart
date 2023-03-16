import 'package:dio/dio.dart';
import 'package:first_week_demo/payment/payment_model/payment.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class PaymentService {
  final Dio dio;

  final Logger logger;
  static String addPaymentLink = "/secure/payment/addPayment";

  PaymentService(this.logger, this.dio);

  Future<Payment?> post(Payment newPayment, String jsonToken) async {
    dio.options.headers["Authorization"] = "Bearer $jsonToken";
    try {
      Response response = await dio.post(
        dio.options.baseUrl + addPaymentLink,
        data: newPayment.toJson(),
      );

      return Payment.fromJson(response.data);
    } catch (e) {
      logger.e("Payment Post Failed with error : $e");
      return null;
    }
  }
}
