
import 'package:jadu_ride_driver/modules/app_module.dart';

import 'environment.dart';

class RazorPayOption {
  RazorPayOption._();
  static var defaultOption = {
    'key': dependency<Environment>().razorPay,
  };
}
