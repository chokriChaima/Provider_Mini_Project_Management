import '../user_model/user.dart';

abstract class AuthenticationEvent {}

class SignUpEvent extends AuthenticationEvent {
  User newUser;

  SignUpEvent(this.newUser);
}

class LogInEvent extends AuthenticationEvent {
  User user;

  LogInEvent(this.user);
}

class LogOutEvent extends AuthenticationEvent {}

class FacebookLogInEvent extends AuthenticationEvent {}

class GoogleLogInEvent extends AuthenticationEvent {}
