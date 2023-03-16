import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();

@module
abstract class MyModules {
  Logger get logger => Logger();

  // Dio get dio => Dio(BaseOptions(baseUrl: "http://10.0.2.2:8080/api"));
  Dio get dio => Dio(BaseOptions(baseUrl: "http://192.168.43.24:8080/api"));
}
