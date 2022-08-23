import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/common/app_language_codes.dart';
import 'package:jadu_ride_driver/core/common/app_languages.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class LocaleView extends StatelessWidget {
  MapEntry<AppLanguageCode, AppLanguage> entry;
  Function(AppLanguageCode) onClick;
  bool isSelected;
  LocaleView({Key? key, required this.entry, required this.onClick, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick(entry.key);
      },
      overlayColor: MaterialStateProperty.all(AppColors.primaryVariant.withOpacity(.5)),
      borderRadius: BorderRadius.circular(16.r),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryVariant.withOpacity(0.9) : AppColors.white.withOpacity(0.9),
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
        duration: const Duration(milliseconds: 300),
        child: Center(
          child: fitBox(
              child: entry.value.value.text(isSelected ? AppTextStyle.driveDocumentNameStyle.copyWith(color: AppColors.white) : AppTextStyle.driveDocumentNameStyle)
          ),
        ),
      ),
    );
  }
}
