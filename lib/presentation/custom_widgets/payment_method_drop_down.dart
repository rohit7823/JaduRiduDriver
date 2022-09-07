import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jadu_ride_driver/core/common/payment_method.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../ui/app_text_style.dart';
import '../ui/theme.dart';

class PaymentMethodDropDown extends StatelessWidget {
  List<PaymentMethod> methods;
  Function(PaymentMethod?) onSelected;
  PaymentMethod? current;
  bool loader;
  double? width;
  String? placeHolder;
  PaymentMethodDropDown(
      {Key? key,
      required this.methods,
      required this.onSelected,
      required this.current,
      this.loader = false,
      this.width,
      this.placeHolder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StringProvider.selectPaymentMethod
              .text(AppTextStyle.requiredStepsStyle)
              .padding(insets: EdgeInsets.only(bottom: 0.04.sw)),
          DropdownButtonHideUnderline(
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
              child: const CircularProgressIndicator(
                  color: AppColors.primaryVariant),
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
                disabledHint: Text(placeHolder ?? "",
                    style: AppTextStyle.placerHolderStyle),
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
                icon: const Icon(Icons.keyboard_arrow_down),
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
                items: methods.map((e) {
                  return DropdownMenuItem(
                      value: e,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          fitBox(child: SvgPicture.asset(e.image)),
                          fitBox(
                            child: Text(
                              e.value,
                              style: AppTextStyle.normal,
                            ).padding(insets: EdgeInsets.only(left: 0.03.sw)),
                          ),
                        ],
                      ));
                }).toList()),
          )),
        ],
      ),
    );
  }
}
