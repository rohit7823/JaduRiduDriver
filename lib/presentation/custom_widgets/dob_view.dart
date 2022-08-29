import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class DobView extends StatelessWidget {
  String dateOfBirth;
  VoidCallback onClick;
  DobView({Key? key, required this.dateOfBirth, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      overlayColor:
          MaterialStateProperty.all(AppColors.primaryVariant.withOpacity(.5)),
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: 0.90.sw,
        padding: EdgeInsets.all(0.05.sw),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
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
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            fitBox(child: dateOfBirth.text(AppTextStyle.placerHolderStyle)),
            fitBox(
              child: const Icon(
                Icons.calendar_month,
                color: AppColors.primaryVariant,
              ),
            )
          ],
        ),
      ),
    );
  }
}
