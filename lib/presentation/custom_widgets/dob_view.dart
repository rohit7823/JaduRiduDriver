import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class DobView extends StatelessWidget {
  String value;
  VoidCallback onClick;
  bool isMandatory;
  DobView(
      {Key? key,
      required this.value,
      required this.onClick,
      this.isMandatory = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      borderRadius: BorderRadius.circular(12.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 0.03.sw),
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
                  fitBox(child: value.text(AppTextStyle.placerHolderStyle)),
                  fitBox(
                    child: const Icon(
                      Icons.calendar_month,
                      color: AppColors.primaryVariant,
                    ),
                  )
                ],
              ),
            ),
          ),
          if (isMandatory)
            StringProvider.thisFieldIsMandatory
                .text(AppTextStyle.mandatoryFieldStyle)
        ],
      ),
    );
  }
}
