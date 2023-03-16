abstract class AppNotificationEvent {}

class AppNotificationSet extends AppNotificationEvent {
  final String data;
  AppNotificationSet(this.data);
}
class AppNotificationReload extends AppNotificationEvent {

}

