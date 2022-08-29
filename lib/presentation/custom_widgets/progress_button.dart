import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/stores/uploader.dart';
import 'package:jadu_ride_driver/presentation/ui/app_button_themes.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class ProgressButton extends StatelessWidget {
  bool enableBtn;
  Uploader uploader;
  VoidCallback onPress;
  ProgressButton(
      {Key? key,
      required this.enableBtn,
      required this.uploader,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ElevatedButton(
          onPressed: enableBtn ? onPress : null,
          style: enableBtn
              ? AppButtonThemes.defaultStyle
              : AppButtonThemes.cancelBtnStyle,
          child: uploader.status
              ? StreamBuilder(
                  stream: uploader.listenProgressInPercent(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return "${snapshot.data}%"
                        .text(AppTextStyle.btnTextStyleWhite);
                  },
                )
              : StringProvider.done.text(AppTextStyle.btnTextStyleWhite),
        ),
        if (uploader.status)
          StreamBuilder(
            initialData: 0.0,
            stream: uploader.listenProgress(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: SizedBox(
                  width: 392.w,
                  height: 65.h,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.transparent,
                    color: AppColors.primary.withOpacity(.5),
                    value: snapshot.data,
                  ),
                ),
              );
            },
          )
        else
          const SizedBox.shrink()
      ],
    );
  }
}
