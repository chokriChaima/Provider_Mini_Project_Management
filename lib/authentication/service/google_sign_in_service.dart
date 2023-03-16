import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class GoogleSignInService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);

  final Logger logger;
  final Dio dio;

  String authenticateGoogleUserLink = "/google-users/authenticate";

  GoogleSignInService(this.logger, this.dio);

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Future<String?> handleSignIn() async {
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        GoogleSignInAuthentication googleAuth = await account.authentication;

        return _authenticateGoogleUser(googleAuth.accessToken!);
      } else {
        logger.e("account is null");
        return null;
      }
    } catch (error) {
      logger.e(error);
      return null;
    }
  }

  Future<String?> _authenticateGoogleUser(String accessToken) async {
    logger.d("Authenticating google users ");
    try {
      Response response = await dio.post(
          dio.options.baseUrl + authenticateGoogleUserLink,
          data: accessToken);
      logger.i("The json token we got is ${response.data}");
      return response.data;
    } on DioError catch (e) {
      logger.e("Dio Failed $e");
      return null;
    }
  }
}
