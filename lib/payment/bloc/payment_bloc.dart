import 'dart:async';

import 'package:first_week_demo/payment/bloc/payment_event.dart';
import 'package:first_week_demo/payment/bloc/payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../payment.dart';
import '../payment_service.dart';

@injectable
class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentService _paymentService;

  final Logger logger;

  PaymentBloc(this._paymentService, this.logger)
      : super(PaymentState.initial) {
    on<PaymentRequestSent>(mapEventToState);
  }

  @override
  void onChange(Change<PaymentState> change) {
    logger.i(change);
    super.onChange(change);
  }

  FutureOr<void> mapEventToState(
      PaymentRequestSent event, Emitter<PaymentState> emit) async {
    Payment? payment = await _paymentService.post(event.payment);
    if (payment == null) {
      emit(PaymentState.failure);
    } else {
      emit(PaymentState.success);
    }
  }
}
