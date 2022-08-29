import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:mobx/mobx.dart';

import '../presentation/ui/string_provider.dart';

class ImageChooserDialog {
  ImageChooserDialog._();
  static showChooseDialog(BuildContext context,
      {required Function fromCamera,
      required Function fromGallery,
      required Function onDismiss}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              StringProvider.chooseImage,
              style: AppTextStyle.numberInputStyle,
            ),
            content: Expanded(
              child: FittedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            fromCamera();
                            onDismiss();
                            Navigator.of(context).pop();
                          },
                          child: Column(children: [
                            Padding(
                                padding: EdgeInsets.only(bottom: 0.02.sw),
                                child: SvgPicture.asset(ImageAssets.camera)),
                            Text(
                              StringProvider.camera,
                              style: AppTextStyle.bankDetailsTextInputStyle,
                            )
                          ])),
                      SizedBox(
                        width: 0.10.sw,
                      ),
                      InkWell(
                          onTap: () {
                            fromGallery();
                            onDismiss();
                            Navigator.of(context).pop();
                          },
                          child: Column(children: [
                            Padding(
                                padding: EdgeInsets.only(bottom: 0.02.sw),
                                child: SvgPicture.asset(ImageAssets.gallery)),
                            Text(
                              StringProvider.gallery,
                              style: AppTextStyle.bankDetailsTextInputStyle,
                            )
                          ]))
                    ],
                  ),
                ),
              ),
            ),
          );
        }).then((value) => onDismiss());
  }
}
