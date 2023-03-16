import 'dart:async';

import 'package:first_week_demo/payment/bloc/payment_event.dart';
import 'package:first_week_demo/payment/bloc/payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../payment_service.dart';

@injectable
class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentService _paymentService;

  final Logger logger;

  PaymentBloc(this._paymentService, this.logger) : super(PaymentState()) {
    on<PaymentRequestSent>(mapEventToState);
    on<PaymentSetTokenEvent>(mapSetTokenToState);
  }

  @override
  void onChange(Change<PaymentState> change) {
    logger.i(change);
    super.onChange(change);
  }

  FutureOr<void> mapEventToState(
      PaymentRequestSent event, Emitter<PaymentState> emit) async {
    await _paymentService.post(event.payment, state.jsonToken!);
  }

  FutureOr<void> mapSetTokenToState(
      PaymentSetTokenEvent event, Emitter<PaymentState> emit) {
    emit(PaymentState(jsonToken: event.jsonToken));
  }
}
