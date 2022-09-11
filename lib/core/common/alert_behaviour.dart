import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';

class AlertBehaviour {
  AlertOption option;
  AlertAction action;
  bool isDismissable;

  AlertBehaviour({required this.option, required this.action, this.isDismissable = true});
}
