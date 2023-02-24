import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/helpers/my_dialog.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../core/common/alert_behaviour.dart';

class MyDialogImpl implements MyDialog {
  BuildContext buildContext;
  MyDialogImpl({required this.buildContext});

  @override
  Future show(AlertData data, DialogState state,
      {Function(AlertAction?)? onPositive,
      Function(AlertAction?)? onNegative,
      Function? close}) async {
    await showDialog(
        context: buildContext,
        barrierDismissible: (data.data as AlertBehaviour).isDismissable,
        builder: (context) {
          return AnimatedOpacity(
            opacity: state == DialogState.displaying ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 400),
            curve: Curves.ease,
            child: AlertDialog(
              title: Row(
                children: [
                  if (data.icon != null) data.icon!,
                  data.title.text(AppTextStyle.headingTextStyle)
                ],
              ),
              content: data.message.text(AppTextStyle.bodyTextStyle),
              actions: [
                if (data.positive != null)
                  TextButton(
                      onPressed: () {
                        Navigator.pop(buildContext);
                        onPositive?.call((data.data as AlertBehaviour).action);
                      },
                      child: data.positive!.text(AppTextStyle.dialogBtnStyle)
                  ),
                if (data.negative != null)
                  TextButton(
                      onPressed: () {
                        Navigator.pop(buildContext);
                        onNegative?.call((data.data as AlertBehaviour).action);
                      },
                      child: data.negative!.text(AppTextStyle.dialogBtnStyle)),
              ],
            ),
          );
        });

    if (data.data is AlertBehaviour) {
      var alertOption = (data.data as AlertBehaviour).option;
      switch (alertOption) {
        case AlertOption.invokeOnBarrier:
          if (onPositive != null) {
            onPositive((data.data as AlertBehaviour).action);
          } else if (onNegative != null) {
            onNegative((data.data as AlertBehaviour).action);
          }
          break;
        case AlertOption.none:
          break;
      }
    }

    close?.call();
  }

  void _controlBehaviour(AlertBehaviour data, Function(AlertOption) action) {
    switch (data.action) {
      case AlertAction.welcomeJaduRideInitialData:
        action(data.option);
        break;
      case AlertAction.getDistricts:
        action(data.option);
        break;
      case AlertAction.getCities:
        action(data.option);
        break;
    }
  }

  @override
  Future showWithCustomData(AlertData data, DialogState state, Widget ui, {Function? close}) {
    // TODO: implement showWithCustomData
    throw UnimplementedError();
  }
}
