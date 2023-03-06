import 'package:dio/dio.dart';
import 'package:first_week_demo/authentification/user_model/user.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class UserService {
  static const String userMainLink = "/local-users";

  static const String authenticateLink = "$userMainLink/authenticate";

  Dio dio;

  Logger logger;

  UserService(this.logger, this.dio);

  Future<bool> addUser(User newUser) async {
    try {
      Response response = await dio.post(dio.options.baseUrl+userMainLink, data: newUser);

      return true;
    } on DioError catch (e) {
      logger.e("Dio Failed $e");
      return false;
    }
  }

  Future<User?> logInUser(String email, String password) async {
    try {
      Response response = await dio.get(dio.options.baseUrl+authenticateLink,
          queryParameters: {"email": email, "password": password});

      return User.fromJson(response.data);
    } on DioError catch (e) {
      logger.e("Dio Failed $e");
      return null;
    }
  }
}
