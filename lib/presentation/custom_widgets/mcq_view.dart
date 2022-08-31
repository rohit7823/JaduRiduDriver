import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/common/mcq_value.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class McqView extends StatelessWidget {
  String question;
  McqValue value;
  Function(McqValue?) onClick;
  McqView(
      {Key? key,
      required this.question,
      this.value = McqValue.no,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 500),
      firstChild: fitBox(
        fit: BoxFit.fill,
        child: Padding(
          padding: EdgeInsets.only(bottom: 0.05.sw),
          child: Container(
            width: 0.90.sw,
            padding:
                EdgeInsets.symmetric(vertical: 0.03.sw, horizontal: 0.05.sw),
            decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(
                    color: AppColors.primaryVariant.withOpacity(.3),
                    width: 1.5),
                borderRadius: BorderRadius.circular(12.r)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                question
                    .text(AppTextStyle.mcqTextStyle)
                    .padding(insets: EdgeInsets.only(bottom: 0.05.sw)),
                Row(
                  children: [
                    fitBox(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: Radio(
                              value: McqValue.yes,
                              groupValue: value,
                              onChanged: onClick,
                              activeColor: AppColors.primaryVariant,
                              visualDensity:
                                  VisualDensity.adaptivePlatformDensity,
                            ).padding(
                                insets: const EdgeInsets.only(right: 0.05)),
                          ),
                          StringProvider.yes.text(AppTextStyle.mcqTextStyle)
                        ],
                      ).padding(insets: EdgeInsets.only(right: 0.05.sw)),
                    ),
                    Row(mainAxisSize: MainAxisSize.min, children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Radio(
                                value: McqValue.no,
                                groupValue: value,
                                visualDensity:
                                    VisualDensity.adaptivePlatformDensity,
                                activeColor: AppColors.primaryVariant,
                                onChanged: onClick)
                            .padding(
                                insets: const EdgeInsets.only(right: 0.05)),
                      ),
                      StringProvider.no.text(AppTextStyle.mcqTextStyle)
                    ])
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      secondChild: const SizedBox.shrink(),
      crossFadeState: value == McqValue.no
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );
  }
}
