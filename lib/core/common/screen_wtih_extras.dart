import 'package:jadu_ride_driver/core/common/navigation_option.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';

class ScreenWithExtras {
  Screen screen;
  Object? argument;
  NavigationOption? option;

  ScreenWithExtras({required this.screen, this.argument, this.option});
}
