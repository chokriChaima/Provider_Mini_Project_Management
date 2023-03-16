import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_week_demo/app_notifications/bloc/app_notification_bloc.dart';
import 'package:first_week_demo/app_theme/app_colors.dart';
import 'package:first_week_demo/app_theme/app_theme_data.dart';
import 'package:first_week_demo/app_theme/size_presets.dart';
import 'package:first_week_demo/authentication/bloc/authentication_bloc.dart';
import 'package:first_week_demo/configuration/injection.dart';
import 'package:first_week_demo/configuration/localNotificationConfiguration.dart';
import 'package:first_week_demo/configuration/router.dart';
import 'package:first_week_demo/payment/bloc/payment_bloc.dart';
import 'package:first_week_demo/product/product_list_bloc/product_bloc.dart';
import 'package:first_week_demo/shopping_cart/bloc/shopping_cart_bloc.dart';
import 'package:first_week_demo/user_preferences/bloc/user_preferences_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'configuration/custom_hydrated_storage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  configureDependencies();

  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  NotificationService.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  String? fcmToken = await messaging.getToken();

  HydratedBloc.storage = CustomHydratedStorage(prefs);

  Fluttertoast.showToast(msg: "", backgroundColor: AppColors.mainColor);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ProductBloc>(
        create: (_) => getIt.get<ProductBloc>(),
      ),
      BlocProvider<AuthenticationBloc>(
        create: (_) => getIt.get<AuthenticationBloc>(),
      ),
      BlocProvider<AppNotificationBloc>(
        create: (_) => getIt.get<AppNotificationBloc>(),
      ),
      BlocProvider<ShoppingCartBloc>(
          create: (_) => getIt.get<ShoppingCartBloc>()),
      BlocProvider<UserPreferencesBloc>(
          create: (_) => getIt.get<UserPreferencesBloc>()),
      BlocProvider<PaymentBloc>(create: (_) => getIt.get<PaymentBloc>())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        getIt.get<Logger>().d(message.notification!.title);
        getIt.get<Logger>().d(message.notification!.body);
        NotificationService.showNotification(message);
      } else {
        getIt.get<Logger>().d("Notification is  null");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizePresets(
      child: BlocBuilder<UserPreferencesBloc, ThemeMode>(
        builder: (_, state) => MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          theme: AppThemes.getLightTheme(),
          darkTheme: AppThemes.getDarkTheme(context),
          themeMode: state,
        ),
      ),
    );
  }
}
