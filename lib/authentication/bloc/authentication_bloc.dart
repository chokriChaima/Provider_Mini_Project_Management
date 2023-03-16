import 'dart:async';

import 'package:first_week_demo/authentication/bloc/authentication_event.dart';
import 'package:first_week_demo/authentication/bloc/authentication_state.dart';
import 'package:first_week_demo/authentication/service/facebook_service.dart';
import 'package:first_week_demo/authentication/service/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../service/google_sign_in_service.dart';

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FacebookService _facebookService;
  final UserService _userService;
  final GoogleSignInService _googleSignInService;
  Logger logger;

  AuthenticationBloc(this._userService, this._facebookService, this.logger,
      this._googleSignInService)
      : super(AuthenticationState(
            userAuthenticationStatus: UserAuthenticationStatus.loggedOut)) {
    on<SignUpEvent>(handleSignUp);
    on<GoogleLogInEvent>(handleGoogleLogIn);
    on<LogOutEvent>(handleLogOut);
    on<FacebookLogInEvent>(handleFacebookLogIn);
    on<LogInEvent>(handleLogIn);
  }

  FutureOr<void> handleSignUp(
      SignUpEvent event, Emitter<AuthenticationState> emit) async {
    bool result = await _userService.addUser(event.newUser);
    if (result) {
      emit(AuthenticationState(
          userAuthenticationStatus: UserAuthenticationStatus.signedIn));
    } else {
      emit(AuthenticationState(
          userAuthenticationStatus:
              UserAuthenticationStatus.signUpConnectionError));
    }
  }

  FutureOr<void> handleLogOut(
      LogOutEvent event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationState(
        userAuthenticationStatus: UserAuthenticationStatus.loggedOut,
        jsonToken: null));
  }

  FutureOr<void> handleFacebookLogIn(
      FacebookLogInEvent event, Emitter<AuthenticationState> emit) async {
    String? jsonToken = await _facebookService.logInAsFacebookUser();
    isJsonTokenNull(jsonToken, emit);
  }

  FutureOr<void> handleLogIn(
      LogInEvent event, Emitter<AuthenticationState> emit) async {
    String? jsonToken = await _userService.logInUser(event.user);
    isJsonTokenNull(jsonToken, emit);
  }

  void isJsonTokenNull(String? jsonToken, Emitter<AuthenticationState> emit) {
    if (jsonToken == null) {
      emit(AuthenticationState(
          userAuthenticationStatus: UserAuthenticationStatus.userNotFound));
    } else {
      emit(AuthenticationState(
          userAuthenticationStatus: UserAuthenticationStatus.authenticated,
          jsonToken: jsonToken));
    }
  }

  FutureOr<void> handleGoogleLogIn(
      GoogleLogInEvent event, Emitter<AuthenticationState> emit) async {
    logger.d("Google Log In Event Received ");
    String? jsonToken = await _googleSignInService.handleSignIn();
    isJsonTokenNull(jsonToken, emit);
  }
}
