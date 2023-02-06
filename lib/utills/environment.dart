import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jadu_ride_driver/core/common/app_constants.dart';

enum EnvFiles {
  main(".env");

  final String value;

  const EnvFiles(this.value);
}

class Environment {
  Environment();

  init() async {
    await dotenv.load(fileName: EnvFiles.main.value);
  }

  String get razorPay {
    return dotenv.env[AppConstants.razorPayKey] ?? "";
  }

  String get staticBaseUrl {
    return dotenv.env[AppConstants.baseUrlKey] ?? "";
  }

  String get apiKey {
    return dotenv.env[AppConstants.apiKey] ?? "";
  }

  String get googleApiKey {
    return dotenv.env[AppConstants.googleKey] ?? "";
  }
}
