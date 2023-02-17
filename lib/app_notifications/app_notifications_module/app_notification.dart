import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_notification.g.dart' ;
part 'app_notification.freezed.dart' ;

@freezed
class AppNotification with _$AppNotification {
  const factory AppNotification({
    required String id,
    required String body,
    required String title,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json)=>
      _$AppNotificationFromJson(json);


}