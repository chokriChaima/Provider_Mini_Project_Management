import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment.g.dart' ;
part 'payment.freezed.dart';

@freezed
class Payment with _$Payment {
  factory Payment(
      {required double paymentAmount, required String shoppingCartID,required String cardNumber, required String cardHolderName}) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}