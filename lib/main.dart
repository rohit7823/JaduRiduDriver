import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/common/app_language_codes.dart';
import 'package:jadu_ride_driver/core/common/app_route.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/helpers_impls/app_location_service.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/default_nav.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/app_overlay_widget.dart';
import 'package:jadu_ride_driver/presentation/service/task_handlers/destination_task_handler.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/presentation/ui/translations_asset.dart';
import 'package:jadu_ride_driver/translations_generated_files/codegen_loader.g.dart';
import 'package:jadu_ride_driver/utills/directions.dart' as google;
import 'package:jadu_ride_driver/utills/environment.dart';
import 'package:jadu_ride_driver/utills/firebase_module.dart';
import 'package:jadu_ride_driver/utills/notification_api.dart';
import 'package:mobx/mobx.dart';

import 'core/helpers/push_notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await EasyLocalization.ensureInitialized();
  await GoogleFirebase.init();
  await NotificationApi.initNotification(appIcon: '@drawable/app_name');
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);
  await AppModule.init();
  runApp(const MyApp());
}

@pragma('vm:entry-point')
void overlayMain() {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: AppOverlayWidget()));
}

@pragma('vm:entry-point')
void startCallback() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  var env = Environment();
  await env.init();
  FlutterForegroundTask.setTaskHandler(DestinationTaskHandler(
      google.Directions(env.googleApiKey),
      AppLocationService(),
      ScreenWithExtras(screen: Screen.rideNavigation)));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final SharedStore sharedStore;
  late final List<ReactionDisposer> _disposers;

  @override
  void initState() {
    sharedStore = SharedStore();
    super.initState();
  }

  @override
  void dispose() {
    for (var element in _disposers) {
      element();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: List.generate(AppLanguageCode.values.length,
          (index) => Locale(AppLanguageCode.values[index].value)),
      path: TranslationAsset.path,
      fallbackLocale: Locale(AppLanguageCode.english.value),
      assetLoader: const CodegenLoader(),
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: false,
        designSize: const Size(428, 926),
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              //navigatorKey: AppModule.alice.getNavigatorKey(),
              localizationsDelegates: context.localizationDelegates,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              onGenerateRoute:
                  DefaultNav(sharedStore: sharedStore).generatedRoute,
              themeMode: ThemeMode.light,
              //initialRoute: AppRoute.welcomeJaduRide,
              //initialRoute: AppRoute.allDetails
              initialRoute: AppRoute.splash
              //initialRoute: AppRoute.profilePicture,
              );
        },
      ),
    );
  }
}

Future<void> _backgroundMessageHandler(RemoteMessage message) async {
  debugPrint(message.toString());
  PushNotification.backgroundMessage.add(message);
}
