abstract class AppNotificationEvent {}

class AppNotificationSet extends AppNotificationEvent {
  final String cartID;
  AppNotificationSet(this.cartID);
}
class AppNotificationReload extends AppNotificationEvent {

}

