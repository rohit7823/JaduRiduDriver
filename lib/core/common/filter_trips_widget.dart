import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/common/month_key.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';


class FilterTripsWidget extends StatelessWidget {
  List<MonthKey> filterParams;
  Function(MonthKey?) onClick;
  MonthKey? selected;

  FilterTripsWidget(
      {Key? key,
        required this.filterParams,
        required this.onClick,
        required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 0.02.sw),
        decoration: BoxDecoration(
            color: AppColors.Gray, borderRadius: BorderRadius.circular(50.r)),
        child: DropdownButton(
          value: selected,
          iconEnabledColor: AppColors.white,
          dropdownColor: AppColors.Gray,
          items: filterParams
              .map((e) => DropdownMenuItem(
              value: e,
              child: fitBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 0.04.sw, horizontal: 0.02.sw),
                  child: Text(e.name, style: AppTextStyle.filterParamStyle),
                ),
              )))
              .toList(),
          onChanged: onClick,
          menuMaxHeight: 0.30.sh,
        ),
      ),
    );
  }
}
