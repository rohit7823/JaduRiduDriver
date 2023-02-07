import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../modules/app_module.dart';
import '../ui/app_button_themes.dart';
import '../ui/app_text_style.dart';

Future showDisclosureDialog(
    BuildContext buildCOntext, AlertData? disclosureData,
    {Function(AlertAction?, String)? onEvent}) async {
  await showGeneralDialog(
    context: buildCOntext,
    barrierDismissible: (disclosureData?.data as AlertBehaviour).isDismissable,
    pageBuilder: (context, animation, secondaryAnimation) => WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SizedBox.expand(
        child: Container(
          color: AppColors.White,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 8,
                  child: Align(
                      child: Column(
                        children: [
                          Expanded(
                              flex: 6,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Image.network(
                                    "${dependency<Storage>().baseUrl()}assets/images/discloserImage.jpeg"),
                              )),
                          Expanded(
                              flex: 4,
                              child: Column(
                                children: [
                                  Expanded(
                                      child: FittedBox(
                                        child: Column(
                                          children: [
                                            StringProvider.welcomeJaduRide.text(
                                                TextStyle(
                                                    fontFamily:
                                                    FontConstants.fontFamilyPoppins,
                                                    fontSize: 35.sp,
                                                    color: AppColors.Acadia,
                                                    decoration: TextDecoration.none,
                                                    fontWeight:
                                                    FontWeightManager.medium)),
                                            StringProvider.tagline.text(TextStyle(
                                                fontFamily:
                                                FontConstants.fontFamilyPoppins,
                                                fontSize: 25.sp,
                                                color: AppColors.Gray,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeightManager.regular))
                                          ],
                                        ).paddings(horizontal: 0.05.sw),
                                      )),
                                  Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          StringProvider.disclosureMsg.text(TextStyle(
                                              fontFamily:
                                              FontConstants.fontFamilyPoppins,
                                              fontSize: 15.sp,
                                              color: AppColors.Acadia,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeightManager.bold)),
                                          StringProvider.disclosureMsg2.text(
                                              TextStyle(
                                                  fontFamily:
                                                  FontConstants.fontFamilyPoppins,
                                                  fontSize: 15.sp,
                                                  color: AppColors.Gray,
                                                  decoration: TextDecoration.none,
                                                  fontWeight:
                                                  FontWeightManager.regular),
                                              TextOverflow.visible,
                                              TextAlign.center)
                                        ],
                                      ).paddings(horizontal: 0.05.sw))
                                ],
                              )),
                        ],
                      ))),
              Expanded(
                  flex: 2,
                  child: Align(
                    child: disclosureData?.positive != null
                        ? ElevatedButton(
                        style: AppButtonThemes.defaultStyle.copyWith(
                            backgroundColor: const MaterialStatePropertyAll(
                                AppColors.Acadia)),
                        onPressed: () {
                          Navigator.pop(context);
                          if (disclosureData.data is AlertBehaviour) {
                            onEvent?.call(
                                (disclosureData.data as AlertBehaviour)
                                    .action,
                                disclosureData.positive!);
                          }
                        },
                        child: disclosureData!.positive!
                            .text(AppTextStyle.btnTextStyleWhite))
                        : const SizedBox.shrink(),
                  ))
            ],
          ),
        ),
      ),
    ),
  );
}