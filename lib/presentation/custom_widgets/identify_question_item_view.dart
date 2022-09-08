import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/domain/question_option.dart';
import 'package:jadu_ride_driver/presentation/stores/identify_question_item.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class IdentifyQuestionItemView extends StatelessWidget {
  IdentifyQuestionItem item;
  Function(QuestionOption?) onSelect;
  IdentifyQuestionItemView(
      {Key? key, required this.item, required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return AnimatedCrossFade(
          crossFadeState: item.loadingStatus
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          alignment: Alignment.center,
          sizeCurve: Curves.easeInSine,
          firstChild: Container(
            padding:
                EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.03.sw),
            height: 0.20.sh,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: AppColors.primary, width: 3)),
            child: Center(
              child: SizedBox(
                width: 0.20.sw,
                height: 0.20.sw,
                child: const CircularProgressIndicator(
                  color: AppColors.primaryVariant,
                ),
              ),
            ),
          ),
          duration: const Duration(milliseconds: 500),
          secondChild: Container(
            padding:
                EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.03.sw),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                    color: AppColors.primary.withOpacity(.5), width: 3)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                item.data.question
                    .text(AppTextStyle.mcqTextStyle)
                    .padding(insets: EdgeInsets.only(bottom: 0.03.sw)),
                ListView(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  children: item.data.options.map((opt) {
                    return Row(
                      children: [
                        Transform.scale(
                          scale: 1.5,
                          child: Observer(
                            builder: (BuildContext context) {
                              return Radio(
                                value: opt,
                                groupValue: item.selectedOption,
                                onChanged: onSelect,
                                activeColor: AppColors.primaryVariant,
                                visualDensity:
                                    VisualDensity.adaptivePlatformDensity,
                              ).padding(
                                  insets: const EdgeInsets.only(right: 0.03));
                            },
                          ),
                        ),
                        opt.option
                            .text(AppTextStyle.mcqTextStyle)
                            .padding(insets: EdgeInsets.only(right: 0.01.sw))
                      ],
                    );
                  }).toList(),
                ),
                if (item.data.isMandatory)
                  fitBox(
                      child: StringProvider.thisQuestionIsMandatory
                          .text(AppTextStyle.mandatoryFieldStyle)),
              ],
            ),
          ),
        );
      },
    );
  }
}
