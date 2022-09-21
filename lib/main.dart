import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/common/app_language_codes.dart';
import 'package:jadu_ride_driver/core/common/app_route.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/default_nav.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/presentation/ui/translations_asset.dart';
import 'package:jadu_ride_driver/translations_generated_files/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await EasyLocalization.ensureInitialized();
  await AppModule.init();
  EasyLocalization.logger.enableLevels = [];
  runApp(JaduRideDriver());
}

class JaduRideDriver extends StatelessWidget {
  JaduRideDriver({Key? key}) : super(key: key);
  final SharedStore sharedStore = SharedStore();

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
            localizationsDelegates: context.localizationDelegates,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            onGenerateRoute:
                DefaultNav(sharedStore: sharedStore).generatedRoute,
            themeMode: ThemeMode.light,
            //initialRoute: AppRoute.welcomeJaduRide,
            initialRoute: AppRoute.splash,
          );
        },
      ),
    );
  }
}
