import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';

class NavigateBack extends StatelessWidget {
  Function? onPop;
  NavigateBack({Key? key, this.onPop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (onPop != null) {
          onPop?.call();
        } else {
          Navigator.of(context).pop();
        }
      },
      icon:
          Icon(Icons.arrow_back_ios_new, size: 22.sp, color: AppColors.Acadia),
    );
  }
}
