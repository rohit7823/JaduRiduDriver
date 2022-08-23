import 'package:jadu_ride_driver/core/common/alert_data.dart';


import '../common/dialog_state.dart';

abstract class MyDialog {
  Future show(AlertData data, DialogState state,
      {Function? onPositive, Function? onNegative, Function? close});
}
