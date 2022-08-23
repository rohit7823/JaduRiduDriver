import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/helpers/my_dialog.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class ErrorDialogImpl implements MyDialog {
  BuildContext buildContext;
  ErrorDialogImpl({required this.buildContext});

  @override
  Future show(AlertData data, DialogState state,
      {Function? onPositive, Function? onNegative, Function? close}) async {
    await showDialog(
        context: buildContext,
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
                        onPositive?.call();
                      },
                      child: data.positive!.text(AppTextStyle.dialogBtnStyle)),
                if (data.negative != null)
                  TextButton(
                      onPressed: () {
                        Navigator.pop(buildContext);
                        onNegative?.call();
                      },
                      child: data.negative!.text(AppTextStyle.dialogBtnStyle)),
              ],
            ),
          );
        });

    if (data.data is AlertOption) {
      switch (data.data) {
        case AlertOption.invokeOnBarrier:
          if (onPositive != null) {
            onPositive();
          } else if (onNegative != null) {
            onNegative();
          }
          break;
      }
    }

    close?.call();
  }
}
