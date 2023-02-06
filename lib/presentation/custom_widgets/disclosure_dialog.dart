import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../ui/app_text_style.dart';

Future showDisclosureDialog(BuildContext context, AlertData? disclosureData,
    {Function(AlertAction?, String)? onEvent}) async {
  await showDialog(
    context: context,
    useRootNavigator: true,
    barrierDismissible: (disclosureData?.data as AlertBehaviour).isDismissable,
    builder: (context) => WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AlertDialog(
        content: SizedBox.fromSize(
          size: Size(0.90.sw, 0.66.sh),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 6,
                  child: Align(
                      child: Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: disclosureData != null
                              ? FittedBox(
                                child: disclosureData.title
                                    .text(AppTextStyle.headingTextStyle)
                                    .paddings(bottom: 0.03.sw),
                              )
                              : const SizedBox.shrink()),
                      Expanded(
                          flex: 8,
                          child: disclosureData != null
                              ? disclosureData.message.text(
                                  AppTextStyle.numberInputStyle,
                                  TextOverflow.visible,
                                  TextAlign.center)
                              : const SizedBox.shrink()),
                      Expanded(
                          flex: 3,
                          child: Align(
                            child: Image.asset(ImageAssets.mapPNG),
                          ))
                    ],
                  ))),
              Expanded(
                  flex: 2,
                  child: Align(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (disclosureData?.negative != null)
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                if (disclosureData.data is AlertBehaviour) {
                                  onEvent?.call(
                                      (disclosureData.data as AlertBehaviour)
                                          .action,
                                      disclosureData.negative!);
                                }
                              },
                              child: disclosureData!.negative!
                                  .text(AppTextStyle.btnTextStyleBlack)),
                        if (disclosureData?.positive != null)
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                if (disclosureData.data is AlertBehaviour) {
                                  onEvent?.call(
                                      (disclosureData.data as AlertBehaviour)
                                          .action,
                                      disclosureData.positive!);
                                }
                              },
                              child: disclosureData!.positive!
                                  .text(AppTextStyle.btnTextStyleBlack))
                      ],
                    ).paddings(horizontal: 0.05.sw),
                  ))
            ],
          ),
        ),
      ),
    ),
  );
}
