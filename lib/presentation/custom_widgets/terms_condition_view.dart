import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class TermsAndConditionView extends StatelessWidget {
  Function onClick;
  bool isSelected;
  bool? isMandatory;
  TermsAndConditionView({Key? key, required this.onClick, required this.isSelected, this.isMandatory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      overlayColor: MaterialStateProperty.all(AppColors.white.withOpacity(0.1)),
      borderRadius: BorderRadius.circular(12.r),
      child: fitBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 0.02.sw),
                  child: Container(
                    padding: EdgeInsets.all(0.01.sw),
                    width: 0.06.sw,
                    height: 0.06.sw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      border: Border.all(color: AppColors.primaryVariant)
                    ),
                    child: isSelected ? Container(
                      width: 0.03.sw,
                      height: 0.03.sw,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryVariant,
                        shape: BoxShape.circle
                      ),
                    ) : const SizedBox.shrink(),
                  ),
                ),
                StringProvider.agreeToJaduRideTermsAndCondition.text(AppTextStyle.transactionPersonStyle)
              ],
            ).padding(insets: isMandatory != null && isMandatory! ? EdgeInsets.only(bottom: 0.03.sw) : EdgeInsets.zero),
            if(isMandatory != null && isMandatory!) StringProvider.thisFieldIsMandatory.text(AppTextStyle.mandatoryFieldStyle)
          ],
        )
      ),
    );
  }
}
