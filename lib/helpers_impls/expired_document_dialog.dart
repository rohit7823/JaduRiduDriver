import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/helpers/my_dialog.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../presentation/ui/app_text_style.dart';

class ExpiredDocumentDialog implements MyDialog {
  BuildContext buildContext;

  ExpiredDocumentDialog({required this.buildContext});

  @override
  Future show(AlertData<dynamic> data, DialogState state,
      {Function(AlertAction? p1)? onPositive,
      Function(AlertAction? p1)? onNegative,
      Function? close}) async {
    await showDialog(
    context: buildContext,
    useRootNavigator: false,
    barrierDismissible: (data.data as AlertBehaviour).isDismissable,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async {
          return (data.data as AlertBehaviour).isDismissable;
        },
        child: AnimatedOpacity(
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
              if (data.negative != null && (data.data as AlertBehaviour).isDismissable)
                TextButton(
                    onPressed: () {
                      Navigator.pop(buildContext);
                      onNegative?.call((data.data as AlertBehaviour).action);
                    },
                    child: data.negative!.text(AppTextStyle.dialogBtnStyle)),
              if (data.positive != null)
                TextButton(
                    onPressed: () {
                      Navigator.pop(buildContext);
                      onPositive?.call((data.data as AlertBehaviour).action);
                    },
                    child: data.positive!.text(AppTextStyle.dialogBtnStyle)
                ),
            ],
          ),
        ),
      );
    });

    close?.call();
  }

  @override
  Future showWithCustomData(AlertData data, DialogState state, Widget ui,
      {Function? close}) {
    // TODO: implement showWithCustomData
    throw UnimplementedError();
  }
}
