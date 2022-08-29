import 'package:alice/alice.dart';
import 'package:get_it/get_it.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/add_all_details_repository.dart';
import 'package:jadu_ride_driver/core/repository/add_vehicle_repository.dart';
import 'package:jadu_ride_driver/core/repository/batch_call_repository.dart';
import 'package:jadu_ride_driver/core/repository/change_app_language_repository.dart';
import 'package:jadu_ride_driver/core/repository/driver_license_repository.dart';
import 'package:jadu_ride_driver/core/repository/number_input_repository.dart';
import 'package:jadu_ride_driver/core/repository/profile_picture_repository.dart';
import 'package:jadu_ride_driver/core/repository/splash_repository.dart';
import 'package:jadu_ride_driver/core/repository/verify_otp_repository.dart';
import 'package:jadu_ride_driver/core/repository/welcome_jadu_ride_repository.dart';
import 'package:jadu_ride_driver/helpers_impls/storage_impl.dart';
import 'package:jadu_ride_driver/repository_impls/add_all_details_repository_impl.dart';
import 'package:jadu_ride_driver/repository_impls/add_vehicle_repository_impl.dart';
import 'package:jadu_ride_driver/repository_impls/batch_call_repository_impl.dart';
import 'package:jadu_ride_driver/repository_impls/change_app_language_repository_impl.dart';
import 'package:jadu_ride_driver/repository_impls/driver_license_repository_impl.dart';
import 'package:jadu_ride_driver/repository_impls/number_input_repository_impl.dart';
import 'package:jadu_ride_driver/repository_impls/profile_picture_repository_impl.dart';
import 'package:jadu_ride_driver/repository_impls/splash_repository_impl.dart';
import 'package:jadu_ride_driver/repository_impls/verify_otp_repository_impl.dart';
import 'package:jadu_ride_driver/repository_impls/welcome_jadu_ride_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

final dependency = GetIt.instance;

class AppModule {
  AppModule._();

  static final alice = Alice(
    showNotification: true,
    showInspectorOnShake: true,
    darkTheme: false,
  );

  static init() async {
    final sharedPrefs = await SharedPreferences.getInstance();

    dependency.registerLazySingleton<Storage>(() => StorageImpl(sharedPrefs));
    dependency
        .registerLazySingleton<SplashRepository>(() => SplashRepositoryImpl());

    dependency.registerLazySingleton<BatchCallRepository>(
        () => BatchCallRepositoryImpl());

    dependency.registerLazySingleton<NumberInputRepository>(
        () => NumberInputRepositoryImpl());

    dependency.registerLazySingleton<VerifyOtpRepository>(
        () => VerifyOtpRepositoryImpl());

    dependency.registerLazySingleton<ChangeAppLanguageRepository>(
        () => ChangeAppLanguageRepositoryImpl());

    dependency.registerLazySingleton<WelcomeJaduRideRepository>(
        () => WelcomeJaduRideRepositoryImpl());

    dependency.registerLazySingleton<AddVehicleRepository>(
        () => AddVehicleRepositoryImpl());

    dependency.registerLazySingleton<AddAllDetailsRepository>(
        () => AddAllDetailsRepositoryImpl());

    dependency.registerLazySingleton<ProfilePictureRepository>(
        () => ProfilePictureRepositoryImpl());

    dependency.registerLazySingleton<DriverLicenseRepository>(
        () => DriverLicenseRepositoryImpl());
  }
}
