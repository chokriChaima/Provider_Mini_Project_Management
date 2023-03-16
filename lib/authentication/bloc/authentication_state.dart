enum UserAuthenticationStatus {
  signedIn,
  loggedIn,
  loggedOut,
  authenticated,
  signUpConnectionError,
  userNotFound,
}

class AuthenticationState {
  UserAuthenticationStatus userAuthenticationStatus;

  String? jsonToken;

  AuthenticationState({required this.userAuthenticationStatus, this.jsonToken});
}
