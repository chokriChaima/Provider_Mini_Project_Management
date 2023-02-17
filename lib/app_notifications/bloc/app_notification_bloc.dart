import 'dart:async';

import 'package:first_week_demo/configuration/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../app_notifications_module/app_notification.dart';
import '../app_notifications_service.dart';
import 'app_notification_event.dart';
import 'app_notification_state.dart';

@injectable
class AppNotificationBloc
    extends Bloc<AppNotificationEvent, AppNotificationState> {
  final AppNotificationService _appNotificationService;

  AppNotificationBloc(this._appNotificationService)
      : super(const AppNotificationState(
            appNotificationStatus: AppNotificationStatus.loading)) {
    on<AppNotificationReload>(mapReloadEventToState);
    on<AppNotificationSet>(mapSetEventToState);
  }

  Future<void> mapReloadEventToState(
      AppNotificationReload event, Emitter<AppNotificationState> emit) async {
      getIt.get<Logger>().d("notification event cart_id ${state.cartID}");

      List<AppNotification>? response = await _appNotificationService
          .getAppNotificationsForCart(state.cartID!);

      getIt.get<Logger>().d("notification event result  $response");

      if (response != null) {
        emit(AppNotificationState(
            appNotificationsList: response,
            cartID: state.cartID!,
            appNotificationStatus: AppNotificationStatus.success));
      } else {
        emit(AppNotificationState(
            appNotificationsList: state.appNotificationsList,
            cartID: state.cartID!,
            appNotificationStatus: AppNotificationStatus.failure));
      }
    }

  FutureOr<void> mapSetEventToState(AppNotificationSet event, Emitter<AppNotificationState> emit) {
    emit(AppNotificationState(cartID: event.cartID, appNotificationStatus: AppNotificationStatus.loading));

    AppNotificationReload();

}
}
