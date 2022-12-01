import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/helpers/my_dialog.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';


class PaymentDialog implements MyDialog {
  BuildContext buildContext;

  PaymentDialog({required this.buildContext});

  @override
  Future show(AlertData data, DialogState state,
      {Function(AlertAction? p1)? onPositive,
      Function(AlertAction? p1)? onNegative,
      Function? close}) async {
    var result = await showCupertinoModalPopup(
        barrierDismissible:
            (data.data as AlertBehaviour).option == AlertOption.noDismissable
                ? false
                : true,
        context: buildContext,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: CupertinoAlertDialog(
              insetAnimationDuration: const Duration(milliseconds: 400),
              insetAnimationCurve: Curves.easeInOutCubic,
              title: data.title
                  .text(AppTextStyle.packageBtnStyle.copyWith(fontSize: 18.sp)),
              content: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Baseline(
                      baseline: 53,
                      baselineType: TextBaseline.alphabetic,
                      child: "INR: ".text(AppTextStyle.bodyTextStyle)),
                  Baseline(
                    baseline: 65,
                    baselineType: TextBaseline.alphabetic,
                    child: data.message.text(AppTextStyle.enterNumberStyle
                        .copyWith(
                            fontSize: 50.sp, color: AppColors.primaryVariant)),
                  )
                ],
              ),
              actions: [
                if (data.positive != null)
                  TextButton(
                      onPressed: () {
                        Navigator.pop(buildContext);
                        onPositive?.call((data.data as AlertBehaviour).action);
                      },
                      child: data.positive!.text(AppTextStyle.dialogBtnStyle
                          .copyWith(
                              color: AppColors.appBlack,
                              fontWeight: FontWeight.w600))),
                if (data.negative != null)
                  TextButton(
                      onPressed: () {
                        Navigator.pop(buildContext);
                        onPositive?.call((data.data as AlertBehaviour).action);
                      },
                      child: data.negative!.text(AppTextStyle.dialogBtnStyle))
              ],
            ),
          );
        });

    if (data.data is AlertBehaviour) {
      var alertOption = (data.data as AlertBehaviour).option;
      if (alertOption == AlertOption.noDismissable) {
        if (onPositive != null) {
          onPositive((data.data as AlertBehaviour).action);
        } else if (onNegative != null) {
          onNegative((data.data as AlertBehaviour).action);
        }
      }
    }

    close?.call();
  }

  @override
  Future showWithCustomData(AlertData data, DialogState state, Widget ui,
      {Function? close}) async {
    if (state == DialogState.displaying) {
      await showModalBottomSheet(
        context: buildContext,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        builder: (BuildContext context) => ui,
      );
    }

    close?.call();
  }
}
