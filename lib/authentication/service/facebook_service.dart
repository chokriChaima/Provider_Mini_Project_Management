import 'package:dio/dio.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class FacebookService {
  final Logger logger;

  final Dio dio;

  static const authenticateFacebookUserLink = "/facebook-users/authenticate";

  FacebookService(this.logger, this.dio);

  final FacebookAuth auth = FacebookAuth.instance;

  Future<LoginResult> _loginProcess() async => await auth.login();

  void logOutProcess() async => await FacebookAuth.instance.logOut();

  Future<String?> logInAsFacebookUser() async {
    LoginResult loginResult = await _loginProcess();
    if (loginResult.status == LoginStatus.success) {
      return _authenticateFacebookUser(loginResult.accessToken!.token);
    }
    //TO-DO
    //Change this to make respond with the request's response
    return null;
  }

  Future<String?> _authenticateFacebookUser(String token) async {
    try {
      Response response = await dio.post(
          dio.options.baseUrl + authenticateFacebookUserLink,
          data: token);
      return response.data;
    } on DioError catch (e) {
      logger.e("Dio Failed $e");
      return null;
    }
  }
}
