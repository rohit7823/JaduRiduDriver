import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class RippleWidget extends StatelessWidget {
  Widget child;
  BorderRadius radius;
  VoidCallback action;
  bool paddingAllowed;
  bool shadowAllowed;
  RippleWidget(
      {Key? key,
      required this.child,
      required this.radius,
      this.paddingAllowed = true,
      this.shadowAllowed = true,
      required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: radius,
            boxShadow: shadowAllowed ? allShadow() : []),
        child: InkWell(
            onTap: action,
            borderRadius: radius,
            child: child.paddings(all: paddingAllowed ? 0.05.sw : 0)));
  }
}
