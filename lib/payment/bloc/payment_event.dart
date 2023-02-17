import '../payment_model/payment.dart';

abstract class PaymentEvent {

}
class PaymentRequestSent extends PaymentEvent{
  final Payment payment ;
  PaymentRequestSent({required this.payment});

}