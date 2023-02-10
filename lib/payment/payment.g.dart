// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Payment _$$_PaymentFromJson(Map<String, dynamic> json) => _$_Payment(
      paymentAmount: (json['paymentAmount'] as num).toDouble(),
      cardNumber: json['cardNumber'] as String,
      cardHolderName: json['cardHolderName'] as String,
    );

Map<String, dynamic> _$$_PaymentToJson(_$_Payment instance) =>
    <String, dynamic>{
      'paymentAmount': instance.paymentAmount,
      'cardNumber': instance.cardNumber,
      'cardHolderName': instance.cardHolderName,
    };
