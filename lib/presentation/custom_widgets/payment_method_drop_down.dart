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

class DefaultPaymentMethodView extends StatelessWidget {
  PaymentMethod current;
  DefaultPaymentMethodView(
      {Key? key,
      required this.current}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StringProvider.defaultPaymentMethod
              .text(AppTextStyle.requiredStepsStyle)
              .padding(insets: EdgeInsets.only(bottom: 0.04.sw)),
          Container(
            width: 0.90.sw,
            padding: EdgeInsets.symmetric(horizontal: 0.03.sw, vertical: 0.01.sw),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16.r),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.lightGray,
                    offset: Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: AppColors.lightGray,
                    offset: Offset(
                      -5.0,
                      -5.0,
                    ),
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                  )//BoxShadow
                ]
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                fitBox(child: SvgPicture.asset(current.image, width: 60, height: 60,)),
                fitBox(
                  child: Text(
                    current.value,
                    style: AppTextStyle.normal,
                  ).padding(insets: EdgeInsets.only(left: 0.03.sw)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
