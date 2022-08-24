import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jadu_ride_driver/core/domain/vehicle_category.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../ui/app_text_style.dart';
import '../ui/theme.dart';

class VehicleCategoriesView extends StatelessWidget {
  List<VehicleCategory> categories;
  Function(VehicleCategory?) onSelected;
  VehicleCategory? current;
  bool loader;
  double? width;
  String? placeHolder;
  VehicleCategoriesView(
      {Key? key,
      required this.categories,
      required this.onSelected,
      this.placeHolder,
      required this.loader,
      this.width,
      required this.current})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: DropdownButtonHideUnderline(
          child: Visibility(
        visible: !loader,
        replacement: Container(
          padding: EdgeInsets.all(0.03.sw),
          decoration: BoxDecoration(
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
              ],
              color: AppColors.white),
          width: width ?? 0.90.sw,
          alignment: Alignment.center,
          child:
              const CircularProgressIndicator(color: AppColors.primaryVariant),
        ),
        child: DropdownButton2(
            buttonWidth: 0.90.sw,
            dropdownOverButton: false,
            scrollbarAlwaysShow: true,
            dropdownFullScreen: true,
            dropdownMaxHeight: 0.40.sw,
            value: current,
            onChanged: onSelected,
            alignment: Alignment.center,
            disabledHint:
                Text(placeHolder ?? "", style: AppTextStyle.placerHolderStyle),
            dropdownDecoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGray),
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
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
            icon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.03.sw),
                child: SvgPicture.asset(ImageAssets.dropDownArrow)),
            buttonPadding: EdgeInsets.all(0.02.sw),
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.white,
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
            items: categories.map((e) {
              return DropdownMenuItem(
                  value: e,
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                      child: Text(
                    e.name,
                    style: AppTextStyle.normal,
                  )));
            }).toList()),
      )),
    );
  }
}
