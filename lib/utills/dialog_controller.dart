import 'package:flutter/widgets.dart';
import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/helpers/my_dialog.dart';
import 'package:jadu_ride_driver/helpers_impls/error_dialog_impl.dart';

class DialogController {
  MyDialog dialog;
  DialogController({required this.dialog});

  Future show(AlertData alertData, DialogState state,
      {Function(AlertAction?)? positive,
      Function(AlertAction?)? negative,
      Function? close}) async {
    await dialog.show(alertData, state,
        onPositive: positive, onNegative: negative, close: close);
  }
}
