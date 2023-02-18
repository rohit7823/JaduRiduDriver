import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/domain/step.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class StepView extends StatelessWidget {
  DetailStep step;
  Function(DetailStep) onClick;
  StepView({Key? key, required this.step, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick(step);
      },
      borderRadius: BorderRadius.circular(16.r),
      overlayColor:
          MaterialStateProperty.all(AppColors.primaryVariant.withOpacity(.5)),
      child: fitBox(
        child: Container(
          width: 0.90.sw,
          padding: EdgeInsets.all(0.05.sw),
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: const [
              BoxShadow(
                color: AppColors.lightGray,
                offset: Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: AppColors.lightGray,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
          ),
          child: Row(
            children: [
              expand(
                  flex: 9,
                  child: step.key.toDetailStepName().text(AppTextStyle.detailsTypeItemTextStyle)),
              expand(
                  flex: 1,
                  child: step.isComplete ? Icon(
                    Icons.check_circle,
                    color: AppColors.GreenHaze,
                  ) :  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.Acadia,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
